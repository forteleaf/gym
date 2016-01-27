function replace(str1,str2,str3){
	var ch='';
	var str='';
	for(var i=0;i<str1.length;i++){
		ch=str1.charAt(i);
		if(ch==str2){
			str += str3;
		}else{
			str+=ch;
		}
	}
	return str;
}