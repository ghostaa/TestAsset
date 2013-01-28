/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.sample;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEException;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.ajax.fileupload.AbstractFileHandler;
import com.ibm.btt.cs.ajax.fileupload.FileUploadUtil;
import com.ibm.btt.sm.BTTSMException;

/**
 * <p>
 * This class extends HttpServlet class used to handle file updload scenario.
 * It will save the uploaded file in file system or configured DB
 *  
 * @copyright(c) Copyright IBM Corporation 2010
 */
public class SampleFileHandler extends AbstractFileHandler{
	
	private static final BTTLog LOG = BTTLogFactory.getLog(SampleFileHandler.class.getName());
	
	/**
	 * name of paramters that will be configured in btt.xml file for this file handler
	 * make sure the name are exactly the same with the ones in btt.xml file
	 */
	public static final String PARAM_CACHE_PATH ="cachePath";	
	public static final String PARAM_FILE_PATH = "filepath";
	public static final String PARAM_MEM_CACHE = "memCacheSize";
	public static final String PARAM_TIME_OUT = "timeout";
	public static final String PARAM_MAX_SIZE = "maxSize";
	
	/**
	 * cache size, if file is bigger than the size, it will be saved in file system
	 * or else if will be hold in memory. 
	 */
	protected int memCacheSize = 1024 * 4;
	/**
	 * real system cache folder path
	 */
	protected String cachePath = null;
	/**
	 * real system upload file folder 
	 */
	protected String filePath = null; 
	/**
	 * maximum allowed size of a file 
	 */
	protected long maxSize = 1024 * 1024 * 4;
	/**
	 * fileId maybe a encryped, meaning-less string, maybe a key to 
	 * real file system path of the uploaded file or a key by which the file
	 * can be accessed from DB. 
	 * In this sample, it just use the file fullpath as the id 
	 */
	private String fileId = null;
	/**
	 * record the current tmp file, it will be used to remove the tmp file 
	 * if the session expired. 
	 */
	private FileItem tmpfile = null;
	/**
	 * name of the file with ext. 
	 */
	private String filename = null;
	/**
	 * initial parameters, this method should be customized based on the handler's implementaion
	 * 
	 */
	@Override
	public void initConfig(KeyedCollection config) throws DSEException {
		Enumeration keys = config.getElements().keys();
		while(keys.hasMoreElements()){
			String key = (String)keys.nextElement();
			Object value = config.getValueAt(key);
			if(PARAM_CACHE_PATH.equals(key)){
				cachePath = value.toString();
			}else if(PARAM_FILE_PATH.equals(key)){
				filePath = value.toString();
			}else if(PARAM_MEM_CACHE.equals(key)){
				memCacheSize = Integer.parseInt(value.toString());
			}else if(PARAM_TIME_OUT.equals(key)){
				this.setTimeout(Long.parseLong(value.toString()));
			}else if(PARAM_MAX_SIZE.equals(key)){
				maxSize = Long.parseLong(value.toString());
				maxSize = maxSize<0 ? -1 : maxSize ;
			}
		}
		// formate file path based on OS, DOS or unix.  
		this.cachePath = formatFilePath(this.cachePath);
		this.filePath = formatFilePath(this.filePath);
		
		StringBuilder sb = new StringBuilder();
		if(cachePath==null || cachePath.trim().length()<1){
			 sb.append("SampleFileHandler : Error, cachePath is null. \n");
		}
		if(filePath==null || filePath.trim().length()<1){
			sb.append("SampleFileHandler : Error, filePath is null. \n");
		}
		if(memCacheSize<0){
			sb.append("SampleFileHandler : Error, memory cache size must bigger than 0 \n");
		}
		if(getTimeout()<0){
			sb.append("SampleFileHandler : Error, timeout value must bigger than 0 \n");
		}
		if(sb.length()>0){
			throw new DSEException(sb.toString());
		}
		// create relative folders if not existed 
		initFolders();
	}
	/**
	 * Just handle one file upload in this handler, developer can extend to support 
	 * multi-files upload 
	 */
	@Override
	public int saveFile(HttpServletRequest request) {			
		int code = SAVE_FAILED ;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);		
		if (isMultipart) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//config the memory cache, if above the cache, the file data will be 
			// saved on cache folder 
			factory.setSizeThreshold(memCacheSize);
			// set up cache folder, when uploading, the tmp file 
			// will be saved in cache folder with a internal managed name. 
			factory.setRepository(new File(cachePath));
			
			ServletFileUpload upload = new ServletFileUpload(factory);			
			// max size of a file 
	        upload.setSizeMax(maxSize);
	        
			try {
				if(isExpired()){
					return REQ_TIMEOUT ;
				}
				List<FileItem> fileItems = upload.parseRequest(request);
	            // save file from request 
            	code = uploadFilesFromReq(request, fileItems);
	        }catch(SizeLimitExceededException e){
	        	code = FILE_SIZE_EXCEED ;
	        } catch (FileUploadException e) {	        	
	        	if(LOG.doDebug()){
	            	LOG.debug("SampleFileHandler:saveFile() -- upload file stream was been cancelled", e);
	            }
	        } 
		}
		return code;
	}
	/**
	 * 
	 * @param request
	 * @param fileItems
	 * @throws IOException
	 */
	private int uploadFilesFromReq(HttpServletRequest request,
			List<FileItem> fileItems){
		int code = SAVE_FAILED ;
		// get the first file item 
		FileItem fileItem = getTheFileItem(request,fileItems);	
		this.tmpfile = fileItem ;
		String sessionId = request.getParameter("sessionId");
		if(fileItem == null || sessionId == null){
			return SAVE_FAILED ;
		}
		// save file and remove the temp file in cache folder 
		try {			
			code = writeFiles(fileItem, request,sessionId);
			
			// remove temp file			
			fileItem.delete();
			this.tmpfile = null;
		} catch (IOException e) {
			return SAVE_FAILED ;
		}
		// NOTES: just handle the firest file in the request, and save the first file 
		// in the file system. developer can extend to support multi-files upload 
		return code;		
	}
	/**
	 * NOTES: In this sample, we just handle the first file item in the upload request. 
	 * 
	 * @param request
	 * @param fileItems upload file items
	 * @return the first file item or null if errors 
	 */
	private FileItem getTheFileItem(HttpServletRequest request,List<FileItem> fileItems) {
		String name="";
		for (FileItem fileItem : fileItems) {
			//common form item name
		    name = fileItem.getFieldName();
			if (fileItem.isFormField()) {	                    
		        // common form item value 
		        String value = fileItem.getString();	                   
		        if(LOG.doDebug()){
		        	LOG.debug(new StringBuilder().append("Request item -- ").append(name).append(": ").append(value).toString());
		        }
		    } else {
		    	if (name == null || "".equals(name.trim())) {
					continue;
				}	                
		    	return fileItem ;
		    }
		}
		return null; 
	}
	/** 
     * write the files into file sytem. upload files are seperated by sessionId on the 
     * server side. 
     * notes that for performance, here we do not use the FileItem.get() method. 
     * 
	 * @param fileItem
	 * @param request
	 * @param sessionId
	 * @return whether save file success. 
	 * @throws IOException
	 */
    private int writeFiles(FileItem fileItem, HttpServletRequest request,String sessionId)
            throws IOException {
        // get the target file folder where to save the uploaded file 
        // Here use the sessionId to seperate each request files. 	
    	StringBuilder spath = new StringBuilder();
    	spath.append(filePath).append("\\").append(sessionId);		
		File sFolder = new File(spath.toString()); 
		
		if (!sFolder.isDirectory()) {
			boolean r1 = sFolder.mkdir();
			if(r1==false && LOG.doError()){
				LOG.error(new StringBuilder().append("Create folder error: ").append(spath).toString());
				throw new IOException(new StringBuilder().append("FileUploadServelet: session folder create error").toString());
			}
		}
    	
    	// handle the file path for various browsers 
        String fileNameString = fileItem.getName();
        int start = fileNameString.lastIndexOf("\\");
        this.filename = fileNameString.substring(start + 1);
        // save file 
        File file = new File(spath.toString(), filename);
        byte[] buffer = new byte[1024];
        int length = 0;
        InputStream is = fileItem.getInputStream();        
        FileOutputStream fos = new FileOutputStream(file);

        while ((length = is.read(buffer)) > 0 && !isExpired()) {
            fos.write(buffer, 0, length);
        }
        // colse stream 
        fos.close();
        is.close();
        
        // remove file if request expired. 
        if(isExpired() ){
        	if(file.exists()){
        		file.delete();	
        	}
        	return REQ_TIMEOUT ;
		}
        return SAVE_SUCCESS ;
    }	
	@Override
	public int deleteFile(String fileId) {
		if(fileId==null || fileId.length()==0){
			return DELETE_SUCCESS ;
		}
		if(isExpired()){
			return REQ_TIMEOUT ;
		}
		File file = retrieveFile(fileId);
		boolean r = false; 
		if(file!=null && file.exists()){
			r = file.delete();
			this.filename = null ;
		}		
		// clean file Id 
		this.fileId = null ;
		
		return r ? DELETE_SUCCESS: DELETE_FAILED;
	}

	@Override
	public File retrieveFile(String fileId) {
		if(fileId==null || fileId.length()==0 || isExpired()){
			return null ;
		}
		File folder = new File(filePath+"\\"+getSessionId());
		if(folder.exists() && folder.isDirectory()){
			int value = Integer.parseInt(fileId);
			File[] files = folder.listFiles();
			for(int i=0; i<files.length; i++){
				File file = files[i];
				if(value==file.getName().hashCode()){
					return file ;
				}
			}
		}
		return null;
	}

	@Override
	public String getFileId() {
		if(fileId==null && filename!=null){
			fileId = new Integer(filename.hashCode()).toString();
		}
		
		return fileId ;
	}

	@Override
	public String getFileName(String fileId) {
		return this.filename;
	}

	@Override
	public int upldateContext(String fileId) {		
		if(isExpired()){
			return REQ_TIMEOUT ;
		}
		Context ctx = null;
		try {
			ctx = FileUploadUtil.getProperContext(getSessionId(), getProcessorId(),getDataname());
		} catch (BTTSMException e) {
			if(LOG.doError()){
				LOG.error("SampleFileHandler : updateContext() -- ", e);
			}
		}
		return doUpdateContext(ctx,fileId);		
	}
	
	private int doUpdateContext(Context ctx, String fileId) {
		int code = UPDATE_CTX_FAILED ; 
		if(ctx!=null){
			try {
				KeyedCollection kcoll = (KeyedCollection)ctx.tryGetElementAt(getDataname());
				// note that the a kcoll with id=file is mandatory for file upload 
				// 
				KeyedCollection fkc = (KeyedCollection)kcoll.tryGetElementAt(FILE);
				if(fkc!=null){
					//upldated the new file info with the file kcoll. 
					fkc.setValueAt(FILE_ID, fileId);
					fkc.setValueAt(FILE_NAME, this.filename);
					File file = this.retrieveFile(fileId);
					long size = file == null ? 0 : file.length();
					fkc.setValueAt("size", size);
					
					code = UPDATE_CTX_SUCCESS ;
					
					//TODO this can be extend for multi-file upload scenario with a single fileupload
					// widget. 
					// developer can add the existed file info into the iColl with 
					// id=receivedFiles. and then update the file kcoll with the latest
					// uploaded file info					
				}
			} catch (DSEInvalidArgumentException e) {
				if(LOG.doError()){
					LOG.error("SampleFileHandler: update context error",e);
				}
			} catch (DSEObjectNotFoundException e) {
				if(LOG.doError()){
					LOG.error("SampleFileHandler: update context error",e);
				}
			}
		}
		return code ;
	}
	@Override
	public int cleanContext() {
		return upldateContext("");
	}

	@Override
	protected int doRequestValidation(HttpServletRequest request) {		
		int size = request.getContentLength();
		// notifiy the browser the file size is exceeded. 
		if(size>maxSize){
			return FILE_SIZE_EXCEED ;
		}
		return REQ_VALID;
	}
	@Override
	public String getFileInfo(int code){
		StringBuilder sb = new StringBuilder();
		String fId = getFileId();
		fId = fId == null ? "": fId ;
		
		String fname = getFileName(fId);
		fname = fname == null ? "":fname ;
		
		sb.append("{\"").append(FILE_NAME).append("\":\"")
				.append(fname).append("\",\"")
				.append(FILE_ID).append("\":\"").append(fId);
		if(code!=UPDATE_CTX_SUCCESS){
			sb.append("\",\"errorCode\":\"").append(code).append("\"}");
		}else{
			sb.append("\"}");
		}			

		return sb.toString();
	}
	/**
	 * create cache file folders and real file folders 
	 * 
	 */
	private void initFolders() {
		File fFolder = new File(filePath);
		File tFolder = new File(cachePath);
		boolean r1 = true ;
		boolean r2 = true ;
		if (!fFolder.isDirectory()) {
			r1 = fFolder.mkdirs();
			if(r1==false && LOG.doError()){
				LOG.error(new StringBuilder().append("Create folder error: ").append(filePath).toString());
			}
		}
		if(!tFolder.isDirectory()){
			r2 = tFolder.mkdirs();
			if(r2==false && LOG.doError()){
				LOG.error(new StringBuilder().append("Create folder error: ").append(cachePath).toString());
			}
		}				
	}	
	/**
	 * format the file path associated with the OS 
	 * @param path
	 * @return file path associated with the os
	 */
	private String formatFilePath(String path){
		// We test if the entitiesPath is a complete adress for a directory (ex: "d:\er\wee" for DOS, or "/d/er/wee" for UNIX)
		char sep = System.getProperty("file.separator").charAt(0);
		String p = path.replace('/', sep);
		p = path.replace('\\', sep);
		if ((p.startsWith(System.getProperty("file.separator")))
			|| ((p.length() > 1) && (p.charAt(1) == ':'))) {
			return p ;
		}
		return null;
	}
	@Override
	public AbstractFileHandler clone() {
		AbstractFileHandler handler = new SampleFileHandler();
		handler.setConfig(getConfig());
		handler.setDataname(this.getDataname());
		handler.setProcessorId(this.getProcessorId());
		handler.setSessionId(this.getSessionId());
		try {
			handler.initConfig(this.getConfig());
		} catch (DSEException e) {
			return null ;
		}
		return handler;
	}
	/**
	 * 
	 */
	@Override
	public void onRequestExpired(String fileId) {
		// delte tmp file if have 
		if(this.tmpfile!=null){
			this.tmpfile.delete();
			this.tmpfile = null; 
		}
		// delete file if have 
		this.deleteFile(getFileId());
		// clean ctx if have 
		this.cleanContext();	
	}
}
