/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.FileUpload");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 
dojo.require("dojox.form.FileUploader");
dojo.require("dijit.form.Button"); 
dojo.require("dijit.form.TextBox"); 
dojo.require("dojo.parser");
dojo.require("dojox.uuid.generateRandomUuid");

/**
 * Declare a widget to provide client side AJAX file upload function, contains:
 * 	1. Text Box
 *  2. Browse Button
 *  3. Upload Button
 *  4. Cancel Button
 *  5. Upload Status
 *  6. Error Message
 * 
 * Basic Function:
 * 		User can use Browse Button to select a file from local file system, then click Upload Button to upload it to server side, 
 * 		or click Cancel Button to clear the selection.
 * 		During the upload process, user can click Cancel button to terminate the upload process.
 * 		When file successfully uploaded, user can delete the uploaded file using Cancel Button.
 * 
 * Implement based on dojox.form.FileUpload, extends it to enable Cancel function.
 * 
 */
dojo.declare("com.ibm.btt.dijit.FileUpload",
	[dijit._Widget, dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin],{
	
	templateString: dojo.cache("com.ibm.btt.dijit","templates/FileUpload.html"),
	
	state : "Incomplete", //Normal, Incomplete, or Error
	
	/**
	 * UI properties: visibility, disable, required, width
	 * 		tabIndex = -1, user can not access a file upload widget using tab
	 */
	required : false,
	disabled: false,
	_visibilityHolder: [],
	_isDisabled_uploadButton : false,
	tabIndex : "-1",
	width : "",
	_browse_width: null,
	
	/**
	 * contained dijit: Text Box, Browse Button, Upload Button, Cancel Button
	 */
	inputText : null,
	f0 : null,
	uploadButton: null,
	cancelButton: null,
	
	//name: "uploadFile",
	/**
	 * _state: validation checking: 
	 * 		none - no file uploaded, 
	 * 		done - file uploaded successfully, 
	 * 		uploading - file is uploading
	 * 		error - error occurs during uploading
	 * 		canceling - file upload progress is cancelling
	 * 		uploading and error state will prevent form submit
	 */
	_state : "none",
	
	/**
	 * Uploaded file name, can load from context in jsp tag
	 * If value isn't null, render the widget as "done" state
	 */
	value : "",
	currentFileInfo : null,
	
	/**
	 * Functional properties: 
	 * 		fileExtension: user can define their file extension limitation
	 * 		fileSize: user can define the max size of file allow to upload, change to configure in server side
	 */
	fileExtension : "",
	//fileSize : null,
	
	/**
	 * Internal properties: 
	 * 		uploadUrl: the server side location to handle file upload request
	 * 		storeDataName: the bound context data to store the file info
	 * 		bttParams: BTT params generated from JSP tag, used to get session ID and processor ID
	 * 		_bundle: NLS support i18n
	 * 		error message for file size&mask limitation, showed as dojo hint
	 */
	uploadUrl: "",
	storeDataName: "",
	bttParams: "",
	_bttParamJSON : null,
	_accessByKey : false,
	
	_bundle : new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "FileUpload"),
	
	/**
	 * Create widget UE:
	 * 		0. parse BTT params
	 * 		1. create inner dijit
	 * 		2. render inner dijit
	 * 		3. connect events
	 * 		4. fire onShow event to make dojox.form.FileUploader create a form inner node
	 */
	postCreate: function(){
		//parse the bttParam as json
		this._bttParamJSON = dojo.fromJson(this.bttParams);
		//create inner dijit
		this.createInsideWidgets();
		//render inner dijit
		this.renderItems();
		
		//connect events 
		this.connectEvents();

		//fire onShow event to make dojox.form.FileUploader create a form inner node.
		this.onShow();
		
		this._tabSupport(true);
		
		this.inherited(arguments);
	},
	
	/**
	 * Create inner dijit in the right DOM node
	 */
	createInsideWidgets : function(){
		//create input box: set as readOnly
		this.inputText = new dijit.form.TextBox({}, this.inputBox);
		dojo.addClass(this.inputText.domNode, "inputBox");
		this.setReadOnly(this.inputText, true);
		
		//hack: remove reset method of input text in order to prevent value reset when file uploading.
		this.inputText.reset = null;
		
		//create upload button
		this.uploadButton = new dijit.form.Button({label: this._bundle.getMessage("UPLOAD_BUTTON_LABEL")}, this.uploadBtn);
		
		//create cancel button
		this.cancelButton = new dijit.form.Button({label: this._bundle.getMessage("CANCEL_BUTTON_LABEL")}, this.clearBtn);
		
		//create browse button
		this.browseBtn.innerHTML = this._bundle.getMessage("BROWSE_BUTTON_LABEL");
		
		//format the POST URL format, parameters: processId, sessionId, dataName, filesize
		var parameters = this._buildParameter();
//		if(this.fileSize){
//			//if fileSize is null, use server side default size limitation
//			parameters+="&filesize="+this.fileSize*1024;
//		};
		
		//create a file uploader
		//ajust IE style problem
		var styleClasses;
		if(dojo.isIE){
			dojo.addClass(this.uploadButton.domNode, "commonButton");
			dojo.addClass(this.cancelButton.domNode, "commonButton");	
		}
		this.f0 = new com.ibm.btt.dijit.FileUploader(dojo.mixin({
				force:"html",
				uploadUrl:this.uploadUrl+parameters,
				showProgress:false,
				selectMultipleFiles:false,
				uploadOnChange:false,
				tabIndex: -1
			}, styleClasses), this.browseBtn);
		
		//hack for alignment problem: set the width of f0.insideNode in order to don't let the label of the browse button move out
		dojo.style(this.f0.insideNode, {
			"width":"0px"
		});
		//calculate a suitable width for the widget
		this._calculateWidth();
	},
	
	_buildParameter : function(){
		var parameters = "?dataName="+this.storeDataName;
		if(this._bttParamJSON.dse_processorId){
			parameters+="&processId="+this._bttParamJSON.dse_processorId;
		}
		if(this._bttParamJSON.dse_sessionId){
			parameters+="&sessionId="+this._bttParamJSON.dse_sessionId;
		}
		return parameters;
	},
	
	/**
	 * adjust the width of the file upload widget:
	 *	//	1. if the width is larger than min width, set to domNode, and adjust the width of input box, and 
	 *	//		all the button display align right.
	 *	//	2. if the width is set smaller than min width, ignore it, since file upload widget will break into two lines. 
	 *	//	3. default min width is set in CSS file based on different theme.	
	 *
	 */
	_calculateWidth : function(){
		//adjust the width of the file upload widget:
		//	1. if the width is larger than min width, set to domNode, and adjust the width of input box, and 
		//		all the button display align right.
		//	2. if the width is set smaller than min width, ignore it, since file upload widget will break into two lines. 
		//	3. default min width is set in CSS file based on different theme.
		var input_width = dojo.style(this.inputText.domNode, "width");
		var upload_button_width = dojo.style(this.uploadButton.domNode, "width");
		var browse_button_width = dojo.style(this.f0.domNode, "width");
		var cancel_button_width = dojo.style(this.cancelButton.domNode, "width");
		var blank = 35;
		var button_width = upload_button_width + browse_button_width + cancel_button_width + blank;
		var minWidth = input_width + button_width;
		if(this.width){
			//console.debug("this.width", this.width);
			var assignedWidth = this.width.substr(0, this.width.lastIndexOf("px")); 
			//console.debug("assignedWidth", assignedWidth);
			if(assignedWidth && assignedWidth > minWidth){
				if(this.width && assignedWidth > minWidth){
					dojo.style(this.fileuploader, "width", this.width);
					dojo.style(this.inputText.domNode, "width", (assignedWidth - button_width)+"px");
				} else {
					dojo.style(this.fileuploader, "width", minWidth+"px");
				}
			}
		}
		
		
		
		//get default width of browse button
		this._browse_width = dojo.style(this.f0.domNode, "width");
	},
	
	/**
	 * Control whether this widget will support tab access. 
	 * Default is "false": this._tabSupport(false) is called in createInsideWidgets
	 * 		
	 * @value boolean value, true for support, false for not support 
	 */
	_tabSupport : function(value){
		if(value){
			this.inputText.set('tabIndex', "-1");
			//wairole="presentation" role="presentation"
			this.f0.domNode.setAttribute('wairole','presentation');
			this.f0.domNode.setAttribute('role','presentation');
			this.f0.insideNode.setAttribute('wairole','presentation');
			this.f0.insideNode.setAttribute('role','presentation');
//			dojo.style(this.f0._fileInput, {
//				opacity:0
//			});
//			if(dojo.isIE){
				this.f0.domNode.setAttribute("tabIndex", "0");
				this.f0._fileInput.setAttribute('tabIndex', "-1");
				dojo.connect(this.f0.domNode, "onkeyup", dojo.hitch(this, function(e){
					if (e.keyCode == dojo.keys.ENTER || e.keyCode == dojo.keys.SPACE){
						this.f0._fileInput.click(e);
						dojo.stopEvent(e);
					}
				}));
//			}else{
//				this.f0.domNode.setAttribute('tabIndex', "-1");	
//				this.f0._fileInput.setAttribute('tabIndex', "0");
//			}
		}
	},
	
	/**
	 * Render inner dijit based on the value of the widget
	 * 		
	 */
	renderItems : function(){
		console.debug("this.value", this.value)
		if(this.value){
			//file context have data, render widget as "done" state
			this._state = "done";
			this._set("state","");
			
			try{
				this.currentFileInfo = dojo.fromJson(this.value);
			} catch (e) {
				//invalid file info
				console.debug("error occurs", e);
				this._state = "none";
				if(this.required){
					this._set("state", "Incomplete");
				}else{
					this._set("state", "");
				}
				this.value = "";
			}
			
		} else {
			//file context have no data, render widget as "none" state
			this._state = "none";
			if(this.required){
				this._set("state", "Incomplete");
			}else{
				this._set("state", "");
			}
		}
		//init inner widget visibility
		this._initRenderItems();
		//init inner widget properties 
		this._initUIProperties();
	},
	
	/**
	 * Init inner widget visibility
	 * 		
	 */
	_initRenderItems : function(){
		//reset the input text value
		this.inputText.set("value", "");
		//clear message and error
		this._clearMessage();
		//if the state is done, file is successfully uploaded
		if(this._state == "done"){
			console.debug("this.currentFileInfo", this.currentFileInfo);
			//hide input textbox, browse, upload button
			dojo.style(this.f0.domNode, "visibility", "hidden");
			dojo.style(this.f0.insideNode, "visibility", "inherit");
			dojo.style(this.f0.domNode, "width", "0px");
			this.setVisibility(this.inputText.domNode, false, true);
			this.setVisibility(this.uploadButton.domNode, false, true);
			//show cancel button
			this.setVisibility(this.cancelButton.domNode, true);
			//show file name in message section
			this.statusMessage.innerHTML = this.currentFileInfo.name;
		} else {
			//the state isn't "done", reset the UE as "none"
			//show input textbox, browse button
			dojo.style(this.f0.domNode, "visibility", "visible");
			dojo.style(this.f0.insideNode, "visibility", "inherit");
			dojo.style(this.f0.domNode, "width", this._browse_width+"px");
			dojo.fadeIn({ node: this.f0.domNode, duration:275 }).play(); 
			this.setVisibility(this.inputText.domNode, true);
			
			//hide upload button, cancelButton
			this.setVisibility(this.uploadButton.domNode, false, false);
			this.setVisibility(this.cancelButton.domNode, false, false);
		}
		
	},
	
	/**
	 * Init inner widget properties: visibility
	 * 		
	 */
	_initUIProperties : function(){
		this._visibilityHolder = [];
		//if the widget is set as "hidden" or "gone", store the properties and hide it
		if(this.visibility == "hidden" || this.visibility == "gone"){
			if(this._state == "none"){
				this._visibilityHolder.push({dijit: this.inputText.domNode, visibility: "visible"});
				this._visibilityHolder.push({dijit: this.f0.domNode, visibility: "visible"});
				this._visibilityHolder.push({dijit: this.f0.insideNode, visibility: "inherit"});
				this.setVisibility(this.inputText.domNode, false, false);
				dojo.style(this.f0.domNode, "visibility", "hidden");
				dojo.style(this.f0.insideNode, "visibility", "inherit");
			} else {
				this._visibilityHolder.push({dijit: this.cancelButton.domNode, visibility: "visible"});
				this.setVisibility(this.cancelButton.domNode, false, true);
				this._visibilityHolder.push({dijit: this.statusMessage, visibility: "visible"});
				dojo.style(this.statusMessage, "visibility", "hidden");
			}
		}
		
		//this._setDisabledAttr(this.disabled); 
	},
	
	/**
	 * Clear the message sections: uploading message, file info, and error message.
	 * 		
	 */
	_clearMessage : function(){
		//clear message and error
		this.statusMessage.innerHTML = "";
		this.errorMessage.innerHTML = "";
		dojo.style(this.errorMessage, "display", "none");
		this._showErrorInputBox(false);
	},
	
	/**
	 * Connect all the event to perform the basic function of FileUpload
	 */
	connectEvents: function(){
		//when user select a file
		dojo.connect(this.f0, "onChange", this, this._handleSelect);
		
		//when user click upload button, upload file to server side
		dojo.connect(this.uploadButton, "onClick", this, this._handleUpload);
		
		//when upload process complete
		dojo.connect(this.f0, "onComplete", this, function(dataArray){
			//check response json object: name, errorcode		
			var response = dataArray[0];
			console.debug("response", response);
			var message = response.name;
			var errorCode = response.errorCode;
			//here add a "TypeError" check, since parse error in iframe will not call onError
			if(message == "TypeError" || errorCode){  
				this.handleError(errorCode);
			} else {
				this.handleSuccess(response);
			}
		});
		
		//when user click browse, but don't select one file
		dojo.connect(this.f0, "onCancel", this, function(){
			//if the field is required, and currently no file uploaded and no file selected, 
			//give a error hint: change the color of input text as yellow
			if(this.required){
				if(this._state == "none" && (!this.f0._fileInput.value)){
					this._showErrorInputBox(true);	
					this.displayMessage(this._bundle.getMessage("UPLOAD_REQUIRED"));
				}
			}
		});
		
		//when upload process complete
		dojo.connect(this.f0, "onError", this, function(){
			console.debug("onError", this._state);
			if(this._state == "canceling"){
				//the error fired by cancel should not be plaude.
			}else{
				this.handleError();
			}
		});
		
		//handle cancel during uploading 
		dojo.connect(this.cancelButton, "onClick", this, function(){
			this.reset();
		});
	},
	
	/**
	 * Handle user select one file
	 * 	@data: the info of user selected file, contains: name and size (size is not supported here)
	 */
	_handleSelect : function(data){
		//show clear button 
		this.setVisibility(this.cancelButton.domNode, true);
		//show upload button and disable it
		this.setVisibility(this.uploadButton.domNode, true);
		this._clearMessage();
		//get file info
		var fileinfo = data[0];
		//show file name in input text.
		this.inputText.set("value", fileinfo.name);

		//check file mask
		var mask = fileinfo.name.substr(fileinfo.name.lastIndexOf(".") + 1).toLowerCase(); 
		if(this.fileExtension != "" && this.fileExtension.indexOf(mask) == -1){
			//error file mask
			//disable upload button
			this.setDisabled(this.uploadButton, true);
			this._isDisabled_uploadButton = true;
			//show error dojo hint and error input box
			this.displayMessage(this._bundle.getMessage("UPLOAD_ERRORFILEMASK", {value:this.fileExtension}));
			this._showErrorInputBox(true);
			//change state into error and prevent form submit
			this._state = "error";
			this._set("state","Error");
			this.validate();
			
		} else {
			//acceptable file mask
			//enable upload button
			this.setDisabled(this.uploadButton, false);
			this._isDisabled_uploadButton = false;
			//change state into none and fire form submit check
			this._state = "none";
			if(this.required){
				this._set("state", "Incomplete");
			}else{
				this._set("state", "");
			}
			this.validate();
		}
	},
	
	/**
	 * Handle file upload action when user click upload button
	 */
	_handleUpload : function(){
		//change the widget state to uploading, block form submit.
		this._state = "uploading";
		this._set("state", "Incomplete");
		//hide browse and upload button
		this.setVisibility(this.uploadButton.domNode, false, true);
		dojo.style(this.f0.domNode, "visibility", "hidden");
		dojo.style(this.f0.domNode, "width", "0px");
		dojo.fadeOut({ node: this.f0.domNode, duration:275 }).play(); 
		
//		//show clear button - not supported in this iteration 
		this.setVisibility(this.cancelButton.domNode, true);
		
		//show upload status message
		this.statusMessage.innerHTML = "";
		var uploadingImages = document.createElement("img");
		var imgPath = dojo.moduleUrl("com.ibm.btt.dijit", "images/loading.gif");
		uploadingImages.setAttribute("src", imgPath.path);
		this.statusMessage.appendChild(uploadingImages);
		var uploadingMsg = document.createElement("span");
		uploadingMsg.innerHTML = "  " + this._bundle.getMessage("UPLOAD_UPLOADING");
		this.statusMessage.appendChild(uploadingMsg);
		
		console.debug("before f0.upload");
		var uuid = this.getUUID();
		this.f0.fileUploadUUID = uuid;
		//upload the file
		this.f0.upload();
		console.debug("after f0.upload");
		setTimeout(dojo.hitch(this, this._queryFileSizeFromServer),3000); 	
		//fire onUpload event;
		this.onUpload();
		
		
	},
	
	getUUID : function() {
		return dojox.uuid.generateRandomUuid();
	},
	
	_queryFileSizeFromServer: function() {
		
		if(this._state == "uploading" && this.f0.fileUploadUUID) {
			var xhrArgs = {
				url: this.f0.uploadUrl + "&uuid=" + this.f0.fileUploadUUID + "&fileUpLoadAction=querySize",
				handleAs: "json",
				load: dojo.hitch(this, function(data){
					if(data && this._state == "uploading") {
						if(data.errorCode == "7") {
							this.f0.cancel();
						}
					}
				} ),
				error: dojo.hitch(this, function(error){
					if(this._state == "uploading") {
						this.reset();	
					}
				} )
		    };
			dojo.xhrGet(xhrArgs);
		}
		
	},
	
	_clearFizeSizePendingOnServer : function() {
		if(this.f0.fileUploadUUID) {
			var xhrArgs = {
				url: this.f0.uploadUrl + "&uuid=" + this.f0.fileUploadUUID + "&fileUpLoadAction=cancelPending",
				handleAs: "json",
				load: dojo.hitch(this, function(data){
					console.debug("Cancel the file uploading pending on server successfully");
				} ),
				error: dojo.hitch(this, function(error){
					console.debug("Error when canceling the file uploading pending on server");
				} )
		    };
			dojo.xhrGet(xhrArgs);
		}
	},
	
	
	
	/**
	 * Reset the widget's value to what it was at initialization time
	 * 	  when the state is "done", delete upload files
	 * 	  when the state is not done, cancel the upload
	 */
	reset: function(){
		if(this._state == "done"){
			this._handleDelete();
		} else {
			this._handleCancel();
		}
	},
	
	/**
	 * Handle user's cancel action in uploading process or in "none" or "error"
	 */
	_handleCancel : function(){
		if(this._state == "none" || this._state == "error"){
			//user didn't click upload button, just clear user's selection
			this._resetUIforCancel();
			//fire onCancel event
			this.onCancel();
		} else if(this._state == "uploading"){
			this._state = "canceling";
			this._set("state", "Incomplete");
			//cancel the upload
			this.f0.cancel();
			
			//FIXME: HACK FOR SERVER SIDE INTEGRATION
			this._resetUIforCancel();
			//hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
			this.setDisabled(this.f0, false);
			//fire onCancel event
			this.onCancel();
			
			//call DELETE API to clear context and delete files if already saved in server side
			var successCallback = function(response,args){
				this._resetUIforCancel();
				//hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
				this.setDisabled(this.f0, false);
				//fire onCancel event
				this.onCancel();
			};
			var errorCallback = function(response,args){
				//show error message when error occurs during canceling
				this.displayMessage(this._bundle.getMessage("CANCEL_FAILSURE_MESSAGE"));
				this._state = "error";
				this._set("state", "Error");
			};
			this._clearFizeSizePendingOnServer();
			this._deleteFile(successCallback, errorCallback);
		}
	},
	/**
	 * Reset UI when user click Cancel button
	 */
	_resetUIforCancel : function(){
		//change the widget state to none, no file uploaded
		this._state = "none";
		if(this.required){
			this._set("state", "Incomplete");
		}else{
			this._set("state", "");
		}

		//clean user's previous selection
		this.f0._clearUserSelection();
		
		//show the init style of file upload widget
		this._initRenderItems();
		
		
	},
	/**
	 * Handle user's cancel action in 
	 */
	_handleDelete : function(){
		//change state into none, no file uploaded
		this._state = "none";
		if(this.required){
			this._set("state", "Incomplete");
		}else{
			this._set("state", "");
		}
		//show the init style of file upload widget
		this._initRenderItems();
		
		//call DELETE API to clear context and delete files already saved in server side
		var successCallback = function(response,args){
			console.debug("sucess delete");
			//change state into none, no file uploaded
			this._state = "none";
			if(this.required){
				this._set("state", "Incomplete");
			}else{
				this._set("state", "");
			}
			//show the init style of file upload widget
			this._initRenderItems();
			//fire onDelete event
			this.onDelete();
		};
		var errorCallback = function(response,args){
			console.debug("error delete")
			//show error message when error occurs during delete file
			this.displayMessage(this._bundle.getMessage("DELETE_FAILSURE_MESSAGE"));
			this._state = "error";
			this._set("state","Error");
		};
		
		this._deleteFile(successCallback, errorCallback);
	},
	/**
	 * Handle error occurs in uploading
	 * 	@errorcode: the error code responsed from server side.
	 */
	handleError : function(errorcode){
		//change state into error.
		this._state = "error";
		this._set("state","Error");
		//hide uploading message
		this.statusMessage.innerHTML = "";
		//show input text, browse button, upload button and cancel button
		this.setVisibility(this.inputText.domNode, true);
		this._showErrorInputBox(true);
		dojo.style(this.f0.domNode, "visibility", "visible");
		dojo.style(this.f0.domNode, "width", this._browse_width+"px");
		dojo.fadeIn({ node: this.f0.domNode, duration:275 }).play(); 
		this.setVisibility(this.uploadButton.domNode, true);
		//hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
		this.setDisabled(this.f0, false);	
		//disable upload button
		this.setDisabled(this.uploadButton, true);
		this._isDisabled_uploadButton = true;
		//show clear button 
		this.setVisibility(this.cancelButton.domNode, true);
		//check error message
		if(errorcode == "7"){
			//if the file size too large
			//show file size error
			this.displayMessage(this._bundle.getMessage("UPLOAD_FAILSURE_MESSAGE_FILESIZE"));	
		} else {
			//create server error message 
			this.displayMessage(this._bundle.getMessage("UPLOAD_FAILSURE_MESSAGE"));	
		}
		//fire onError event
		this._clearFizeSizePendingOnServer();
		this.onError();
	},
	/**
	 * Handle success for file upload widget
	 * 	@fileinfo: the file info responsed from server side.
	 */
	handleSuccess : function(fileinfo){
		//change state into done, file is uploaded successfully
		this._state = "done";
		this._set("state", "");
		//show file name in message section
		this.statusMessage.innerHTML = fileinfo.name;
		this.value = fileinfo.name;
		this.currentFileInfo = fileinfo;
		console.debug("currentFileInfo", this.currentFileInfo);
		//hide input text box
		this.setVisibility(this.inputText.domNode, false, true);

		//fire onComplete event
		this.onComplete();
	},
	
	/**
	 * Set the style of input box: normal or error
	 * 		@isError: if show as error style
	 */
	_showErrorInputBox : function(/*Boolean*/ isError){
		if(isError){
			dojo.removeClass(this.inputText.domNode, "inputBox");
			dojo.addClass(this.inputText.domNode, "errInputBox");
		} else {
			dojo.removeClass(this.inputText.domNode, "errInputBox");
			dojo.addClass(this.inputText.domNode, "inputBox");
		}
	},
	
	_deleteFile: function(successCallback, errorCallback){
		if(this._bttParamJSON && this.currentFileInfo){
			console.debug("currentFileInfo", this.currentFileInfo)
			var parameters = this._buildParameter();
			parameters+="&fileId="+this.currentFileInfo.fileId;
			dojo.xhrDelete({ 
	            url: this.uploadUrl+parameters,
	            preventCache: true,
	            error: dojo.hitch(this, function(response, args) {
//					console.debug("response", response);
//					console.debug("args", args);
//				 	console.debug("Error occurs when delete file");
				 	dojo.hitch(this, errorCallback)(response, args);
	            }),
	            load: dojo.hitch(this, function(response, args) {
//	            	console.debug("response", response);
//	            	console.debug("args", args);
//	            	console.debug("File is successfully deleted");
	            	if(response.errorCode){
						dojo.hitch(this, errorCallback)(response, args);
					} else {
						this.currentFileInfo = null;
						dojo.hitch(this, successCallback)(response, args);
					}
	            })          
			});
		}
	},
	
	/*************************
	 *	   Public Events	 *
	 *************************/
	
	/**
	 * The following events are inherited from _Widget and still may be connected:
	 * 		onClick
	 * onMouseUp
	 * onMouseDown
	 * onMouseOver
	 * onMouseOut
	 */
	
	/**
	 * stub to connect: Fires when user click upload button.
	 */
	onUpload: function(){
		// trigger form validation test
		this.validate();
	},
	
	/**
	 * stub to connect: Fires when file is uploaded.
	 */
	onComplete: function(){
		// trigger form validation test
		this.validate();
	},
	
	/**
	 * stub to connect: Fires when user cancel the upload process.
	 */
	onCancel: function(){
		// trigger form validation test
		this.validate();	 
	},
	
	/**
	 * stub to connect: Fires when upload process occurs some error.
	 */
	onError: function(){
		// trigger form validation test
		this.validate();
	},
	
	/**
	 * stub to connect: Fires when user delete current uploaded file and want to reupload files.
	 */
	onDelete: function(){
		// trigger form validation test
		this.validate();
	},
	
	validate: function(){

	},
	
	/*************************
	 *	   Public Functions	 *
	 *************************/
	getFileInfo : function(){
		return this.currentFileInfo;
	},
	
	reload : function(){
		this.value = "";
		this.currentFileInfo = null;
		this._resetUIforCancel();
	},
	
	/**
	 * enable set visibility properties.
	 * 	@value: String variable: gone, hidden and visible
	 */
	_setVisibilityAttr : function(value){
		this.visibility = value;
		//need handle contained dijits.
		if (value == "gone") {
			this._allDisappear();
			dojo.style(this.domNode, "visibility", "hidden");
			dojo.style(this.domNode, "display", "none");
		} else if (value == "hidden") {
			this._allDisappear();
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");	
		} else {
			this._allShowUp();
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "visible");
		}
	},
	
	/**
	 * when set visibility is visible, recover the old state
	 */
	_allShowUp : function(){
		//old state is saved in this._visibilityHolder
		dojo.forEach(this._visibilityHolder, function(v){
			dojo.style(v.dijit, "visibility", v.visibility);
		});
		//clear the old states
		this._visibilityHolder = [];
	},
	
	/**
	 * hold the visibility states util method
	 * 	@domNode: the domNode which visibility state need to store
	 */
	_holdVisibilityFeatures : function(/*DomNode*/domNode){
		this._visibilityHolder.push({dijit: domNode, visibility: "visible"});
	},
	
	/**
	 * when set visibility is hidden or gone, 
	 * save the current state (only visibile dijit) and set visibility as hidden
	 */
	_allDisappear : function(){
		if(this.inputText){
			if(this.isVisible(this.inputText.domNode)){
				this._holdVisibilityFeatures(this.inputText.domNode);
			}
			dojo.style(this.inputText.domNode, "visibility", "hidden");
		}
		if(this.f0){
			if(this.isVisible(this.f0.domNode)){
				this._visibilityHolder.push({dijit: this.f0.domNode, visibility: "visible"});
				this._visibilityHolder.push({dijit: this.f0.insideNode, visibility: "inherit"});
			}
			dojo.style(this.f0.domNode, "visibility", "hidden");
			dojo.style(this.f0.insideNode, "visibility", "inherit");
		}
		if(this.uploadButton){
			if(this.isVisible(this.uploadButton.domNode)){
				this._holdVisibilityFeatures(this.uploadButton.domNode);
			}
			dojo.style(this.uploadButton.domNode, "visibility", "hidden");
		} 
		if(this.cancelButton){
			if(this.isVisible(this.cancelButton.domNode)){
				this._holdVisibilityFeatures(this.cancelButton.domNode);
			}
			dojo.style(this.cancelButton.domNode, "visibility", "hidden");
			//dijit.hideTooltip(this.cancelButton.domNode);
		}
	},
	
	
	/**
	 * show dojo hint
	 * 	
	 */
	displayMessage: function(message){
		dojo.style(this.errorMessage, "display", "");
		if(message){
			this.errorMessage.innerHTML = message;
		}
	},
	
	/**
	 * set visibility of dom node
	 * 	@domNode: the domNode which visibility need to be set
	 *  @visibility: boolean variable, false for hidden, true for visible
	 *  @isHidden: boolean variable, false for display="", true for display="none"
	 */
	setVisibility : function(/*DomNode*/ domNode, /*Boolean*/ visibility, isHidden){
		if(visibility){
			dojo.style(domNode, "visibility", "visible");
			dojo.style(domNode, "display", "");
			//dojo.fadeIn({ node: domNode, duration:275 }).play(); 
		} else {
			dojo.style(domNode, "visibility", "hidden");
			//dojo.fadeOut({ node: domNode, duration:275 }).play(); 
			if(isHidden){
				dojo.style(domNode, "display", "none");
			}
		}
		
	},
	
	/**
	 * check the dom node is visible or hidden
	 * 	@domNode: the domNode which visibility need to be checked
	 */
	isVisible : function(/*DomNode*/ domNode){
		var visibility = dojo.style(domNode, "visibility");
		if( visibility == "visible"){
			return true;
		} else if(visibility == "inherit" && dojo.style(this.domNode, "visibility") == "visible"){
			//hack IE problem, in IE, visibility maybe inherit parent node.
			return true;
		}else {
			return false;
		}
	},
	
	/**
	 * set disable of the dijit
	 * 	@dijit: the dijit which will be disable
	 * 	@value: boolean value: true for disabled, false for undisabled.
	 */
	setDisabled : function(/*Dijit*/ dijit, /*Boolean*/ value){
		if(dijit){
			dijit.set('disabled', value);
		}
	},
	
	/**
	 * set readOnly of the dijit
	 * 	@dijit: the dijit which readOnly will be set 
	 * 	@value: boolean value: true for readOnly, false for non-readOnly.
	 */
	setReadOnly : function(/*Dijit*/ dijit, /*Boolean*/ value){
		if(dijit){
			dijit.set('readOnly', value);
		}
	},
	
	/**
	 * action need perform when form submit
	 * 	hack form submit with "uploadedfile" input in dojox.form.FileUploader, 
	 * 	destory inner form node when form submit
	 */
	onFormSubmit : function(){
		//hack form submit with "uploadedfile" input in dojox.form.FileUploader, destory inner form node when form submit
		if(dojo.isIE){
			this.f0._formNode.innerHTML = "";
		}
	},
	
	/**
	 * enable disabled properties
	 * 	@value: boolean value: true for disabled, false for undisabled. 
	 */
	_setDisabledAttr : function(value){
		this.disabled = value;
		this.inherited(arguments);
		this.setDisabled(this.f0, value);
		//handle upload button seperately, upload button will be disabled when error occurs, 
		//it should not be set to enable when enable the widget
		if(!value){
			this.setDisabled(this.uploadButton, this._isDisabled_uploadButton);
		} else {
			this.setDisabled(this.uploadButton, value);
		}
		
		this.setDisabled(this.cancelButton, value);
	}
});

dojo.declare("com.ibm.btt.dijit.FileUploader",
		[dojox.form.FileUploader],{
	/**
	 * the Defered object created by iframe.send, 
	 * it will be canceled when user cancel the upload process
	 */
	dfd : null,
	//templateString:'<div dojoAttachPoint="containerNode"><div dojoAttachPoint="progNode"><div dojoAttachPoint="progTextNode"></div></div><div dojoAttachPoint="insideNode" class="uploaderInsideNode"></div></div>',
	trueFocus : false,
	isShowDialog : false,
	fileUploadUUID : "",
	/**
	 * cancel the upload process
	 * 	1. cancel the Deferred object
	 *  2. abort the request
	 */
	cancel: function(){
			if(this.dfd){
				//cancel the Deferred object
				this.dfd.cancel();
				if(dojo.isIE){
					//reset the iframe location
					dojo.io.iframe._frame.contentWindow.document.location.replace("about:blank");
				} else {
					//stop the iframe window
					dojo.io.iframe._frame.contentWindow.stop();
				}
				
			}
	},
	
	/**
	 * override the uploadHTML method of dojox.form.FileUploader
	 * save the iframe.send method created Defered object as the object attribute
	 */
	uploadHTML: function(){
		if(this.selectMultipleFiles){
			dojo.destroy(this._fileInput);
		}
		this._setHtmlPostData();
		if(this.showProgress){
			this._animateProgress();
		}
		if(this.dfd){
			dojo.destroy(this.dfd);
		}
		
		//save the iframe.send method created Defered object as the object attribute
		this.dfd = dojo.io.iframe.send({
			url: this.fileUploadUUID ? (this.uploadUrl + "&uuid=" + this.fileUploadUUID) : this.uploadUrl,
			form: this._formNode,
			handleAs: "json",
			error: dojo.hitch(this, function(err){
				console.debug("error", err.message);
				this._error("HTML Upload Error:" + err.message);
			}),
			load: dojo.hitch(this, function(data, ioArgs, widgetRef){
				this._complete(data);
			})
		});
		
		console.debug("dfd", this.dfd);
	},
	

	
	_clearUserSelection : function(){
		this.fileInputs = [];
		if(dojo.isIE){
			//value of input(type=file) is readOnly, need rebuild the input.
			if(this._fileInput){
				this._disconnect();
				this._formNode.removeChild(this._fileInput);
			}
			this._fileInput = document.createElement('input');
			this.fileInputs.push(this._fileInput);
			var nm = this.htmlFieldName;
			var _id = this.id;
			if(this.selectMultipleFiles){
				nm += this.fileCount;
				_id += this.fileCount;
				this.fileCount++;
			}
			dojo.attr(this._fileInput, {
				id:this.id,
				name:nm,
				type:"file",
				onKeyPress: function (){
					return !(window.event && window.event.keyCode == 13);
				}()
			});
			dojo.addClass(this._fileInput, "dijitFileInputReal");
			this._formNode.appendChild(this._fileInput);
			var real = dojo.marginBox(this._fileInput);
			dojo.style(this._fileInput, {
				position:"relative",
				left:(this.fhtml.nr.w - real.w) + "px",
				opacity:0
			});
			this._connectInput();
		} else {
			this._fileInput.value = "";
		}
		
	},
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
		tabIndex: "insideNode"
	}),
	
	onFocusOnInputText : function(){
		
	},
	
	_connectInput: function(){
		//this.inherited(arguments);
		//When migrate to dojo1.6.1, this part of code can be removed.
		this._disconnect();
		this._cons.push(dojo.connect(this._fileInput, "mouseover", this, function(evt){
			dojo.addClass(this.domNode, this.hoverClass);
			this.onMouseOver(evt);
		}));
		this._cons.push(dojo.connect(this._fileInput, "mouseout", this, function(evt){
			
			setTimeout(dojo.hitch(this, function(){
				dojo.removeClass(this.domNode, this.activeClass);
				dojo.removeClass(this.domNode, this.hoverClass);
				this.onMouseOut(evt);
				this._checkHtmlCancel("off");
			}), 0);
		}));
		this._cons.push(dojo.connect(this._fileInput, "mousedown", this, function(evt){
			dojo.addClass(this.domNode, this.activeClass);
			dojo.removeClass(this.domNode, this.hoverClass);
			this.onMouseDown(evt);
		}));
		this._cons.push(dojo.connect(this._fileInput, "mouseup", this, function(evt){
			dojo.removeClass(this.domNode, this.activeClass);
			this.onMouseUp(evt);
			this.onClick(evt);
			this._checkHtmlCancel("up");
		}));
		this._cons.push(dojo.connect(this._fileInput, "change", this, function(){
			this._checkHtmlCancel("change");
			this._change([{
				name: this._fileInput.value,
				type: "",
				size: 0
			}]);
		}));
		if(this.tabIndex>=0){
			dojo.attr(this.domNode, "tabIndex", this.tabIndex);
		}
		//
		
		this._cons.push(dojo.connect(this._fileInput, "focus", this, function(){
			//console.debug("focus on fileInput");
			if(!dojo.isIE){
				dojo.addClass(this.domNode, this.activeClass);
			} else {
				this.trueFocus = true;	
			}
			if(this.dialogIsOpen){
				if(dojo.isIE){
					dojo.addClass(this.domNode, this.activeClass);
				}
				this.onCancel();
			}
			this.dialogIsOpen = false;
		}));
		
		if(dojo.isIE){
			this._cons.push(dojo.connect(this._fileInput, "keypress", this, function(evt){
				//console.debug("keypress on fileInput", evt.keyCode)
				//console.debug("trueFocus", this.trueFocus)
				if(evt.keyCode==dojo.keys.TAB && this.trueFocus){
//					console.debug("press TAB");
					dojo.addClass(this.domNode, this.activeClass);
				} else if(evt.charCode==dojo.keys.SPACE && this.trueFocus){
					//console.debug("press SPACE");
					this.dialogIsOpen = true;
				} else if (evt.keyCode == dojo.keys.ENTER){
					dojo.stopEvent(evt);
				}
			}));
		} else {
			this._cons.push(dojo.connect(this._fileInput, "keypress", this, function(evt){
				//console.debug("keypress on fileInput", evt)
				//SPACE: charCode=32, keyCode=0
				if(evt.charCode==dojo.keys.SPACE){
					//console.debug("press SPACE");
					this.dialogIsOpen = true;
				}
			}));
		}
		
		
		this._cons.push(dojo.connect(this._fileInput, "blur", this, function(evt){
			//console.debug("lose focus on fileInput", evt)
			dojo.removeClass(this.domNode, this.activeClass);
			if(dojo.isIE){
				this.trueFocus = false;
			}
		}));
		
	},
	
	applyAccessKey : function(){
		if(this.f0._fileInput && this.accessKey){
			this.f0._fileInput.setAttribute('accessKey', this.accessKey);
		}
	}
});
