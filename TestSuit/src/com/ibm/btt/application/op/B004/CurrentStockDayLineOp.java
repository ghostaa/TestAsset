package com.ibm.btt.application.op.B004;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.w3c.dom.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/11/06 17:42:53
 */
public class CurrentStockDayLineOp extends BTTServerOperation {
  private final String defaultStockID="0000001"; //上证指数
  private enum stockExchange{SZ,SH}; //SZ深市,SH沪市
  private String stockWholeName;
  private String[] stockInfoArrays = new String[]{
		  "%nls.svt/stockID",
		  "%nls.svt/stockName",
		  "%nls.svt/stockTime",
		  "%nls.svt/stockLatestPrices",
		  "%nls.svt/stockYesterdayClosed",
		  "%nls.svt/stockOpeningPrice",
		  "%nls.svt/stockChangeAmount",
		  "%nls.svt/stockLowest",
		  "%nls.svt/stockHighest",
		  "%nls.svt/stockPriceChangeRatio",
		  "%nls.svt/stockTradingVolume",
		  "%nls.svt/stockVolumeOfBusiness",
		  "%nls.svt/stockBid",
		  "%nls.svt/stockCompetitivePrice",
		  "%nls.svt/stockTheCommittee",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  "",
		  ""
		  };
  private String[] buys = new String[]{"%nls.svt/buy1","%nls.svt/buy2","%nls.svt/buy3","%nls.svt/buy4","%nls.svt/buy5"};
  private String[] sales = new String[]{"%nls.svt/sale5","%nls.svt/sale4","%nls.svt/sale3","%nls.svt/sale2","%nls.svt/sale1"};
  public void execute() throws Exception {
	 
	  try{
		  
		  Context context =this.getContext();
		  String stockID=context.getValueAt("stockID").toString();
		  if("".equals(stockID)){
			  stockID=defaultStockID;
		  }
		  List<Map<String,String>> stockList =new ArrayList<Map<String,String>>();
		  for(stockExchange type:stockExchange.values()){
			  String allStockString = sendGet(handleURL(stockID,type));
			  
			  if(hasStock(allStockString)){
				  stockWholeName=type+stockID;
				  stockList=getStockList(allStockString);
				  break;
			  }
		  }
		  if(0!=stockList.size()){
			  stockList=getStockListLastNumber(stockList,(Integer)context.getValueAt("stockNumber"));
			  Iterator<Map<String,String>> it=stockList.iterator();
			  IndexedCollection currentStockDayLineList=(IndexedCollection) context.getElementAt("CurrentStockDayLineList");
			  currentStockDayLineList.removeAll();
			  while(it.hasNext()){
				  KeyedCollection currentStockDayLine=(KeyedCollection) currentStockDayLineList.createElement(false);
				  Map<String,String> currentStockDayLineMap=it.next();
				  //System.out.println(currentStockDayLineMap.get("date"));
				  currentStockDayLine.setValueAt("Date", currentStockDayLineMap.get("date"));
				  currentStockDayLine.setValueAt("open", currentStockDayLineMap.get("open"));
				  currentStockDayLine.setValueAt("high", currentStockDayLineMap.get("high"));
				  currentStockDayLine.setValueAt("low", currentStockDayLineMap.get("low"));
				  currentStockDayLine.setValueAt("close", currentStockDayLineMap.get("close"));
				  currentStockDayLine.setValueAt("mid", (new Float(currentStockDayLineMap.get("high"))+new Float(currentStockDayLineMap.get("low")))/2+"");
				  currentStockDayLineList.addElement(currentStockDayLine);
			  }
			  String result=sendGet(handleStockInforURL(stockWholeName));
			  result=new String(result.getBytes(),"UTF-8");
			  System.out.println(result);
			  List<String[]> stockInfoList=getStockInfoList(result);
			  
			  //up or down
			  int upOrDonw;
			  Float newPrice=new Float(stockInfoList.get(3)[0]);
			  Float yesterdayPrice=new Float(stockInfoList.get(4)[0]);
			  if(newPrice>yesterdayPrice){
				  upOrDonw=1;
			  }else{
				  upOrDonw=2;
			  }
			  
			  for(int i=0;i<stockInfoList.size();i++){
				  context.setValueAt("CurrentStockInfoList."+i+".key", stockInfoArrays[i]);
				  context.setValueAt("CurrentStockInfoList."+i+".value", stockInfoList.get(i)[0]);
				  context.setValueAt("CurrentStockInfoList."+i+".upOrDonw", upOrDonw);
			  }
			  for(int i=0;i<5;i++){
				  context.setValueAt("CurrentStockBuy."+i+".buyType", buys[i]);
				  if(stockInfoList.size()>=15&stockInfoList.size()<=25){
					  context.setValueAt("CurrentStockBuy."+i+".buyPrice", stockInfoList.get(i+15)[0]);
					  context.setValueAt("CurrentStockBuy."+i+".buyAmount", stockInfoList.get(i+15)[1]);
				  }
				  context.setValueAt("CurrentStockBuy."+i+".upOrDonw", upOrDonw);
			  }
			  for(int i=0;i<5;i++){
				  context.setValueAt("CurrentStockSale."+i+".saleType", sales[i]);
				  if(stockInfoList.size()>=20&stockInfoList.size()<=25){
					  context.setValueAt("CurrentStockSale."+i+".salePrice", stockInfoList.get(24-i)[0]);
					  context.setValueAt("CurrentStockSale."+i+".saleAmount", stockInfoList.get(24-i)[1]);
				  }
				  context.setValueAt("CurrentStockSale."+i+".upOrDonw", upOrDonw);
			  }
		  }else{
			  //error or return a message 
		  }
		  this.fireExitEvent("returnStock");
	  }catch(Exception e){
		  fireExitEvent("error");
	  }
  }
  	private boolean hasStock(String allStockString){
  	  if("]".equals(allStockString.substring((allStockString.indexOf("[")+1), (allStockString.indexOf("[")+2)))){
  		  return false;
  	  }
	  return true;
  	}
  	private String handleURL(String stockID,stockExchange stockExchangeType){
  		//http://hqdata.compass.cn/test/kline.py/data.znzDo?from=www.znz888.com&cmd=SHHQ600220|2013,|0.6464183013007316&crossdomain=1383727499418381&from=yahoo.compass.cn
  		//http://hqdata.compass.cn/test/kline.py/data.znzDo?from=www.znz888.com&cmd=SZHQ002340|2013,|0.6464183013007316&crossdomain=1383727499418381&from=yahoo.compass.cn
  		String url = "http://hqdata.compass.cn/test/kline.py/data.znzDo?from=www.znz888.com&cmd="+stockExchangeType+"HQ"+stockID+"|2013,|0.6464183013007316&crossdomain=1383727499418381&from=yahoo.compass.cn";
  		
  		return url;
  	}
  	private String handleStockInforURL(String stockTypeID){
  		//http://www.webxml.com.cn/WebServices/ChinaStockWebService.asmx/getStockInfoByCode?theStockCode=SH600220
  		String url = "http://www.webxml.com.cn/WebServices/ChinaStockWebService.asmx/getStockInfoByCode?theStockCode="+ stockTypeID;
  		
  		return url;
  	}
	private List<Map<String,String>> getStockListLastNumber(List<Map<String,String>> stockList,int number){
		stockList=stockList.subList(stockList.size()-number, stockList.size());
		return stockList;
	}
	private List<String[]> getStockInfoList(String resultString){
		
		List<String[]> stockInfoList=new ArrayList<String[]>();
		resultString=resultString.substring(resultString.indexOf("<string>"), resultString.lastIndexOf("</string>")+9);
		System.out.println(resultString);
		String []resultStringArrays=resultString.split("/n");
		for(String result:resultStringArrays){
			result=result.substring(result.indexOf("<string>")+8, result.lastIndexOf("</string>"));
			System.out.println(result);
			stockInfoList.add(result.split("/"));
		}
		return stockInfoList;
	}
	private List<Map<String,String>> getStockList(String resultString){
		resultString=resultString.substring(resultString.indexOf("\"")+1,resultString.lastIndexOf("\""));
		resultString=resultString.substring(resultString.indexOf("[[")+2,resultString.lastIndexOf("]]"));
		resultString=resultString.substring(resultString.indexOf("[[")+2,resultString.lastIndexOf("]]"));
		
		//System.out.println(resultString);
		String[] everyDayPrice=resultString.split("\\],\\[");
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		for(String temp:everyDayPrice){
			//System.out.println(temp);
			String[] oneStock=splitStockString(temp);
			Map<String,String> map=new HashMap<String,String>();
			map.put("date", oneStock[0]);
			map.put("open", oneStock[1]);
			map.put("high", oneStock[2]);
			map.put("low", oneStock[3]);
			map.put("close", oneStock[4]);
			list.add(map);
		}
		return list;
	}
	
	private String[] splitStockString(String stockString){
		return stockString.split(",");
	}
	private String sendGet(String url) {
		String result = "";
		BufferedReader in = null;
		try {
			String urlName = url ;
			URL realUrl = new URL(urlName);
			URLConnection conn = realUrl.openConnection();
			//conn.setRequestProperty("accept", "*/*");
			//conn.setRequestProperty("connection", "Keep-Alive");
			//conn.setRequestProperty("user-agent",
			//		"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)");
			conn.connect();
			Map<String, List<String>> map = conn.getHeaderFields();
			for (String key : map.keySet()) {
				//System.out.println(key + "--->" + map.get(key));
			}
			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += "/n" + line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
	
}
