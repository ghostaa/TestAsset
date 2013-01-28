/**
 * 
 */
[{
	name:'alt',
	keys:{
		keyCode:dojo.keys.F2,
		altKey: false,
		ctrlKey:false,
		shiftKey:true,
		metaKey:false,
		defaultPrevented:true
	},
	onKeyDown: function(evt){
		this._debugKeyState(evt);
		//return false;
	}
}
]
