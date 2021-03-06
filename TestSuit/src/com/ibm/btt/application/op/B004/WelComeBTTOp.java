package com.ibm.btt.application.op.B004;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/11/07 16:35:42
 */
public class WelComeBTTOp extends BTTServerOperation {
	private double bigR=12.5;
	private double smallR=8.5;
	private double step=4;
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  Context context = this.getContext();
	  
	  //big area
	 for(int i=0;i<=50;i++){
		 	double x;
		 	if(i<25){
		 		x=i;
		 	}else{
		 		x=i-bigR*2;
		 	}
		 	context.setValueAt("ForAreaBig."+i+".x", (double)circleY(x,bigR));
	 }
	//small area
	 for(int i=0;i<=50;i++){
		 double x=-1;
		 if(i>=4&&i<=21){
			 x=i;
		 }else if(i>=29&&i<=46){
			 x=i-25;
		 }
		 context.setValueAt("ForAreaSmall."+i+".x", (double)circleY(x,smallR,step));
	 }
	 //T
	 context.setValueAt("ForAreaBig.20.high", 45);
	 context.setValueAt("ForAreaBig.38.high", 45);
	 //head
	 context.setValueAt("ForAreaBig.45.head", 48);
	 //hidden head
	 context.setValueAt("ForAreaBig.45.hiddenHead", 12);
	 //BBK
	 int point=10;
	 for(int i=10;i<=50;i++){
		 if((i/5)%2==0){
			 context.setValueAt("ForAreaBig."+i+".BBK", point--);
		 }else{
			 context.setValueAt("ForAreaBig."+i+".BBK", point+=3);
		 }
			 
			
	 }
	 
  }
  private double circleY(double x,double r,double step){
	  if(x==-1){
		  return 0;
	  }
	  double y;
	  if(r*r>(x-(r+step))*(x-(r+step))){
		   y=Math.sqrt(r*r-(x-(r+step))*(x-(r+step)));
	  }else{
		  y=Math.sqrt((x-(r+step))*(x-(r+step))-r*r);
		  
	  }
	  return y;
  }
  private double circleY(double x,double r){
	  double y;
	  if(r*r>(x-r)*(x-r)){
		   y=Math.sqrt(r*r-(x-r)*(x-r));
	  }else{
		  y=Math.sqrt((x-r)*(x-r)-r*r);
		  
	  }
	  return y;
  }
}
