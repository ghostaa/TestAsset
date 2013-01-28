package com.ibm.btt.application.op;

import java.util.Random;

//import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.omg.CORBA.PRIVATE_MEMBER;
//import org.omg.Security.Public;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.KCollConverter;
import com.ibm.btt.sample.operation.FireExitEvent;
//import com.ibm.ejs.j2c.util.dopriv.GetContextClassLoaderPrivileged;

public class TableInputData extends BTTServerOperation{
	public void execute() throws Exception{
//		Random rand=new Random();
//		String img[]={"img/Bomb1.jpg","img/Bomb2.jpg","img/Bomb12.jpg","img/Bomb17.jpg"};
//		KeyedCollection KColl=this.getContext().getKeyedCollection();
//		//this.getContext().getKeyedCollection().setDynamic(true);
//		IndexedCollection TableDataList=(IndexedCollection)KColl.getElementAt("TableDataList");
//		for(int i=0;i<TableDataList.size();i++)
//		{
//			TableDataList.setValueAt(i+".FirstColumn", rand.nextInt(i+1));
//			TableDataList.setValueAt(i+".SecondColumn", rand.nextBoolean()?"True":"Flase");
//			TableDataList.setValueAt(i+".ThirdColumn", img[rand.nextInt(4)]);
//		}
//		fireExitEvent("opEvt");
		Random rand=new Random();
		String img[]={"img/Bomb1.jpg","img/Bomb2.jpg","img/Bomb12.jpg","img/Bomb17.jpg"};
		KeyedCollection KColl=this.getContext().getKeyedCollection();
		IndexedCollection Table=(IndexedCollection)KColl.getElementAt("TableDataList");
		for(int i=0;i<Table.size();i++)
		{
			Table.setValueAt(i+".FirstColumn", rand.nextInt(i+1));
			Table.setValueAt(i+".SecondColumn", rand.nextBoolean()?"This is True":"This is False");
			Table.setValueAt(i+".ThirdColumn", img[rand.nextInt(4)]);
		}
		fireExitEvent("opEvt");
	}
	
	
}
