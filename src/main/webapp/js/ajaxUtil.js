/**
 * 
 */
function getXHR(){
	if(window.XMLHttpRequest){ // ie7 이상, ie 이외의 브라우저
		return new XMLHttpRequest();
	}else{
		// ie6이하
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function replace(str1,str2,str3) {
	
	var ch='';
	var str='';
	for(var i=0;i<str1.length;i++){
		ch=str1.charAt(i);
		if(ch==str2){
			str += str3;
		}else{
			str += ch;
		}
	}
	
	return str;
}