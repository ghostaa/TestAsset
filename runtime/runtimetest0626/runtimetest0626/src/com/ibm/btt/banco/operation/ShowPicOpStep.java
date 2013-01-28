package com.ibm.btt.banco.operation;

import com.ibm.btt.base.OperationStep;

public class ShowPicOpStep extends OperationStep {

	@Override
	public int execute() throws Exception {
		if((getContext().getValueAt("hobbies.0.name")).equals("false")){ 
			getContext().setValueAt("hobbies.0.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.0.pic", getContext().getValueAt("basic.smilelocation"));
		}
		if((getContext().getValueAt("hobbies.1.name")).equals("false")){ 
			getContext().setValueAt("hobbies.1.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.1.pic", getContext().getValueAt("basic.smilelocation"));
		}
		if((getContext().getValueAt("hobbies.2.name")).equals("false")){ 
			getContext().setValueAt("hobbies.2.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.2.pic", getContext().getValueAt("basic.smilelocation"));
		}
		if((getContext().getValueAt("hobbies.3.name")).equals("false")){ 
			getContext().setValueAt("hobbies.3.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.3.pic", getContext().getValueAt("basic.smilelocation"));
		}
		if((getContext().getValueAt("hobbies.4.name")).equals("false")){ 
			getContext().setValueAt("hobbies.4.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.4.pic", getContext().getValueAt("basic.smilelocation"));
		}
		if((getContext().getValueAt("hobbies.5.name")).equals("false")){ 
			getContext().setValueAt("hobbies.5.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.5.pic", getContext().getValueAt("basic.smilelocation"));
		}
		System.out.println(getContext().getValueAt("hobbies.6.name"));
		if((getContext().getValueAt("hobbies.6.name")).equals("false")){ 
			getContext().setValueAt("hobbies.6.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.6.pic", getContext().getValueAt("basic.smilelocation"));
		}
		System.out.println(getContext().getValueAt("hobbies.7.name"));
		if((getContext().getValueAt("hobbies.7.name")).equals("false")){ 
			getContext().setValueAt("hobbies.7.pic", getContext().getValueAt("basic.crylocation"));
		}
		else{
			getContext().setValueAt("hobbies.7.pic", getContext().getValueAt("basic.smilelocation"));
		}
		try{
			String pictureName = (String)getContext().getValueAt("basic.fileupload1.file.name");

			getContext().setValueAt("basic.fileLocationInURL", "upload/"+getContext().getValueAt("dse_sessionId")+"/"+pictureName);
			System.out.println("upload/"+getContext().getValueAt("dse_sessionId")+"/"+pictureName);
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("ShowPicOpStep is Done");
		return RC_OK;
	}

}
