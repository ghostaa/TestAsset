package com.ibm.btt.application.op.Q002;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/20 16:45:20
 */
public class PaginationDataOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
	private int rowsPerPage=10;
	private int total=100;
	private int pageNumber;
	private int pageSize;
	private  Context context ;
	
  public void execute() throws Exception {
	  context = this.getContext();
	  context.getValueAt("paginationData.pageNumber");
	  paginationDataCalculate();
	  getData();
	 
  }
  
  
  private void getData() throws Exception{
	
	  for(int i=0 ;i<10 ;i++){
		  context.setValueAt("table_List."+i+".filed1","a"+(i+(this.pageNumber-1)*10));
		  context.setValueAt("table_List."+i+".filed2","b"+(i+(this.pageNumber-1)*10));
		  context.setValueAt("table_List."+i+".filed3","c"+(i+(this.pageNumber-1)*10));
	  }
  }


  private void paginationDataCalculate() throws Exception{
		pageNumber = (Integer) context.getValueAt("paginationData.pageNumber");

		pageSize = total / rowsPerPage;
		if (total % rowsPerPage > 0)
		{
			pageSize++;
		}

	
		context.setValueAt("paginationData.totalRowNumber", total);
		context.setValueAt("paginationData.pageNumber", pageNumber);

		if (pageNumber <= 1)
		{
			context.setValueAt("paginationData.enableNext", "true");
			context.setValueAt("paginationData.enablePrevious", "false");
		}
		else if (pageNumber == pageSize)
		{
			context.setValueAt("paginationData.enableNext", "false");
			context.setValueAt("paginationData.enablePrevious", "true");
		}
		else
		{
			context.setValueAt("paginationData.enableNext", "true");
			context.setValueAt("paginationData.enablePrevious", "true");
		}
  }
}
