var client=function(){
	var engine={
		ie:0,
		gecko:0,
		webket:0,
		khtml:0,
		opera:0,
		ver:null
};
	var browser={
		ie:0,
		firefox:0,
		konq:0,
		opera:0,
		chrome:0,
		safari:0,
		ver:null
};
	var system={
			win:false,
			mac:false,
			xll:false,
			iphone:false,
			ipod:false,
			nokiaN:false,
			winMobile:false,
			macMobile:false,
			wii:false,
			ps:false
	};
	var us=navigator.userAgent;
	if(window.opera){
		engine.ver=browser.ver=window.opera.version();
		engine.opera=browser.opera=parseFloat(engine.ver);
	}else if (/AppleWebKit\/(\S+)/.test(ua){
		engine.ver=RegExp["$1"];
		engine.webkit=parseFloat(engine.ver);
		if(/Chrome\/(\S+)/.test(ua){
			browser.ver=RegExp["$1"];
			browser.chrome=parseFloat(browser.ver);
		}
		else if(/Version\/(\S+)/.test(ua){
			browser.ver=RegExp["$1"];
			browser.safari=parseFloat(browser.ver);	
		}
		else{
			var safariVersion=1//will continue P201
		}
	}
	
}