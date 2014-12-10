function PPCcheck() {
	var iimg = '<img src="http://monitor.vericlix.com/iframe-production.asp?refinfo=' + escape(document.URL) + '&dref=' +  escape(document.referrer) + '" border=0 width=1 height=1>';
 	document.writeln(iimg);
}

var myString=document.URL;
x=(myString.indexOf("vc"));
y=(myString.indexOf("source"));
if (x != '-1' || y != '-1') {
PPCcheck();
}
