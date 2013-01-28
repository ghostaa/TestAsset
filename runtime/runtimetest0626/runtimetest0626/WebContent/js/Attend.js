function log(message){
	var console=document.getElementById("debug.info");
	if(console===null){
		console=document.createElement("div");
		console.id="debuginfo";
		console.style.background="#dedede";
		console.style.borader="lpx solid silver";
		console.style.padding="5px";
		console.style.width="t400px";
		console.style.position="absolute";
		console.style.right="0px";
		console.style.top="0px";
		document.body.appendChild(console);
	}
	console.innerHTML+="<p>"+message+"</p>";
}