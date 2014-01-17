[{
	name : 'disable F5',
	keys : {
				keyCode: dojo.keys.F5,	// this field is mandatory
//				ctrlKeymetaKey : false,	// doesn't check the status of ctrl(on Win) or meta(on Mac) Key if it is undefined
//				altKey : false,			// doesn't check the status of alt Key if it is undefined
//				shiftKey : false,		// doesn't check the status of shift Key if it is undefined
				defaultPrevented : true	// prevent the default behavior of browser on F5 if it is true
			},
			
	onKeyDown : function(evt){
		console.log("disable F5");		// the customer function on keys
	}
},

{
	name : 'disable BACKSPACE',
	keys : {
				keyCode: dojo.keys.BACKSPACE,
//				ctrlKeymetaKey : false,	// doesn't check the status of ctrl(on Win) or meta(on Mac) Key if it is undefined
//				altKey : false,			// doesn't check the status of alt Key if it is undefined
//				shiftKey : false,		// doesn't check the status of shift Key if it is undefined
				defaultPrevented : true // prevent the default behavior of browser on BACKSPACE
			},
			
	onKeyDown : function(evt){
		console.log("disable BACKSPACE");
	}
},

{
	name : 'disable ctrl+R',
	keys : {
				keyCode: 82,			// the keyCode of R
				ctrlKeymetaKey : true,	// check the status of ctrl(on Win) or meta(on Mac) Key if it is defined
				altKey : false,			// check the status of alt Key if it is defined
				shiftKey : false,		// check the status of shift Key if it is defined
				defaultPrevented : true // prevent the default behavior of browser on ctrl+R if it is true
			},
			
	onKeyDown : function(evt){
		console.log("disable ctrl+R");
	}
}]

/**
the keyCode: 
	0-9 : 48-57
	A-Z : 65-90 
dojo.keys = {
	BACKSPACE: 8,
	TAB: 9,
	CLEAR: 12,
	ENTER: 13,
	SHIFT: 16,
	CTRL: 17,
	ALT: 18,
	META: dojo.isSafari ? 91 : 224,		// the apple key on macs
	PAUSE: 19,
	CAPS_LOCK: 20,
	ESCAPE: 27,
	SPACE: 32,
	PAGE_UP: 33,
	PAGE_DOWN: 34,
	END: 35,
	HOME: 36,
	LEFT_ARROW: 37,
	UP_ARROW: 38,
	RIGHT_ARROW: 39,
	DOWN_ARROW: 40,
	INSERT: 45,
	DELETE: 46,
	HELP: 47,
	LEFT_WINDOW: 91,
	RIGHT_WINDOW: 92,
	SELECT: 93,
	NUMPAD_0: 96,
	NUMPAD_1: 97,
	NUMPAD_2: 98,
	NUMPAD_3: 99,
	NUMPAD_4: 100,
	NUMPAD_5: 101,
	NUMPAD_6: 102,
	NUMPAD_7: 103,
	NUMPAD_8: 104,
	NUMPAD_9: 105,
	NUMPAD_MULTIPLY: 106,
	NUMPAD_PLUS: 107,
	NUMPAD_ENTER: 108,
	NUMPAD_MINUS: 109,
	NUMPAD_PERIOD: 110,
	NUMPAD_DIVIDE: 111,
	F1: 112,
	F2: 113,
	F3: 114,
	F4: 115,
	F5: 116,
	F6: 117,
	F7: 118,
	F8: 119,
	F9: 120,
	F10: 121,
	F11: 122,
	F12: 123,
	F13: 124,
	F14: 125,
	F15: 126,
	NUM_LOCK: 144,
	SCROLL_LOCK: 145,
	// virtual key mapping
	copyKey: dojo.isMac && !dojo.isAIR ? (dojo.isSafari ? 91 : 224 ) : 17
};
**/