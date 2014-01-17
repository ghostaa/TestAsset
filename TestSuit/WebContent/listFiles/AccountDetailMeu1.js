//top.SelectLNB("110", "예금/펀드", "AccountDetailListFlow", "");

// Param 구성  : ViewName_ECABridgeIDName_par1~3
console.log(AllAccountList_AccDetailMenu1_par1,
		AllAccountList_AccDetailMenu1_par2, AllAccountList_AccDetailMenu1_par3);

if(AllAccountList_AccDetailMenu1_par1 ){
	// menu item clicked
	top.SelectLNB("110", "예금/펀드", "AccountDetailListFlow", "", AllAccountList_AccDetailMenu1_par2);  // Account NO
}
