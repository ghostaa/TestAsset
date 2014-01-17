package com.ibm.btt.application.op;
import java.util.*;
import com.ibm.btt.*;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.*;
	public class MeiPaginationTable extends BTTServerOperation {
		private int rowsPerPage;
		private int total;
		private int pageNumber;
		private int pageSize;
		private boolean pagination;
		Random ran=new Random();
	
	public void execute() throws Exception{
		KeyedCollection opData=this.getContext().getKeyedCollection();
		KeyedCollection paginationData=(KeyedCollection)opData.getElementAt("PaginationTable");
		if(paginationData==null)
			this.pagination=false;
		else 
			this.pagination=true;
		if(pagination){
			rowsPerPage=(Integer)paginationData.getValueAt("RowsPerPage");
			pageNumber=(Integer)paginationData.getValueAt("PageNumber");
			total=(Integer)paginationData.getValueAt("TotalRowNumber");
			
			pageSize=total/rowsPerPage;
			if(total%rowsPerPage>0){
				pageSize++;
			}
			paginationData.setValueAt("TotalRowNumber",total);
			paginationData.setValueAt("PageNumber", pageNumber);
			
			if(pageNumber<=1){
				paginationData.setValueAt("EnableNext","true");
				paginationData.setValueAt("EnablePrevious","false");
			}
			else if(pageNumber==pageSize){
				paginationData.setValueAt("EnableNext", "false");
				paginationData.setValueAt("EnablePrevious", "true");
			}
			else{
				paginationData.setValueAt("EnableNext","true");
				paginationData.setValueAt("EnablePrevious", "true");
			}
		}
		IndexedCollection aList=(IndexedCollection)opData.getElementAt("TableList");
		for(int i=0;i<aList.size();i++){
			aList.setValueAt(i+".FirstColumn", ran.nextBoolean());
			aList.setValueAt(i+".ThirdColumn", ran.nextBoolean()?"Yes":"No");
		}
		fireExitEvent("ok");
		
	}
	}		
	

