//----------DHTML Menu Created using AllWebMenus PRO ver 4.2-#628---------------
//\\Leonardo\marketing\Web Sites\AUX files\Likno.com AUX\Likno Site Menu\likno_side_menu.awm
var awmMenuName='menu_side';
var awmLibraryBuild=628;
var awmLibraryPath='/awmdata';
var awmImagesPath='/awmdata';
var awmSupported=(navigator.appName + navigator.appVersion.substring(0,1)=="Netscape5" || document.all || document.layers || navigator.userAgent.indexOf('Opera')>-1 || navigator.userAgent.indexOf('Konqueror')>-1)?1:0;
if (awmAltUrl!='' && !awmSupported) window.location.replace(awmAltUrl);
if (awmSupported){
var nua=navigator.userAgent,scriptNo=(nua.indexOf('Safari')>-1)?7:(nua.indexOf('Gecko')>-1)?2:((document.layers)?3:((nua.indexOf('Opera')>-1)?4:((nua.indexOf('Mac')>-1)?5:1)));
var mpi=document.location,xt="";
var mpi=mpi.protocol+"//"+mpi.host+mpi.pathname;
while (mpi.search(/\\/)>-1) mpi=mpi.replace("\\","/");
mpi=mpi.substring(0,mpi.lastIndexOf("/")+1);
var e=document.getElementsByTagName("SCRIPT");
for (var i=0;i<e.length;i++){if (e[i].src){if (e[i].src.indexOf(awmMenuName+".js")!=-1){xt=e[i].src.split("/");if (xt[xt.length-1]==awmMenuName+".js"){xt=e[i].src.substring(0,e[i].src.length-awmMenuName.length-3);if (e[i].src.indexOf("://")!=-1){mpi=xt;}else{mpi+=xt;}}}}}
var awmMenuPath=mpi.substring(0,mpi.length-1);
while (awmMenuPath.search("'")>-1) {awmMenuPath=awmMenuPath.replace("'","&#39;");}
document.write("<SCRIPT SRC='"+awmMenuPath+awmLibraryPath+"/awmlib"+scriptNo+".js'><\/SCRIPT>");
var n=null;
awmzindex=999;
}

var awmSubmenusFrame='';
var awmSubmenusFrameOffset;
var awmOptimize=0;
var awmUseTrs=0;
var awmSepr=["0","","",""];
function awmBuildMenu(){
if (awmSupported){
awmImagesColl=["sm_opener.png",21,100,"sm_openerOver.png",21,100,"sm_main-button-tile.gif",16,25,"sm_main-buttonOver-tile.gif",16,25,"sm_main-button-left.gif",6,25,"sm_main-buttonOver-left.gif",6,25,"sm_main-button-right.gif",6,25,"sm_main-buttonOver-right.gif",6,25,"sm_sub-button-tile.gif",16,38,"sm_sub-buttonOver-tile.gif",16,38,"sm_sub-button-left.gif",6,38,"sm_sub-buttonOver-left.gif",6,38,"sm_sub-button-right.gif",6,38,"sm_sub-buttonOver-right.gif",6,38,"sm_awmlogo.gif",111,38];
awmCreateCSS(0,1,0,n,n,n,n,n,'none',0,'#000000',0,0);
awmCreateCSS(1,2,1,'#FFFFFF',n,n,'bold 11px Tahoma',n,'none',0,'#000000','0px 0px 0px 0',0);
awmCreateCSS(0,2,1,'#FFFFFF',n,n,'bold 11px Tahoma',n,'none',0,'#000000','0px 0px 0px 0',0);
awmCreateCSS(1,2,1,'#FFFFFF',n,2,'bold 10px Tahoma',n,'none',0,'#000000','0px 10px 0px 10',1);
awmCreateCSS(0,2,1,'#FFFFFF',n,3,'bold 10px Tahoma',n,'none',0,'#000000','0px 10px 0px 10',1);
awmCreateCSS(1,2,1,'#FFFFFF',n,2,'bold 10px Tahoma',n,'none',0,'#000000','0px 0px 0px 0',0);
awmCreateCSS(0,2,1,'#FFFFFF',n,3,'bold 10px Tahoma',n,'none',0,'#000000','0px 0px 0px 0',0);
awmCreateCSS(0,1,0,n,'#FFFFFF',n,n,n,'none',0,'#000000',0,0);
awmCreateCSS(1,2,1,'#FFFFFF',n,8,'bold 10px Tahoma',n,'none',0,'#000000','0px 10px 0px 10',1);
awmCreateCSS(0,2,1,'#FFFFFF',n,9,'bold 10px Tahoma',n,'none',0,'#000000','0px 10px 0px 10',1);
var s0=awmCreateMenu(0,0,0,0,1,0,1,5,1,0,0,0,0,0,1,1,0,n,n,100,1,0,0,0);
it=s0.addItemWithImages(1,2,2,"","","","This side menu exists in a few major pages only, serving as a demo of the AllWebMenus capabilities.",0,1,1,3,3,3,n,n,n,"",n,n,n,n,n,0,0,2,n,n,n,n,n,n,0,0,0,0);
var s1=it.addSubmenu(0,0,1,0,0,1,2,0,1,1,0,n,n,100,0,1);
it=s1.addItemWithImages(3,4,4,"Features",n,n,"",n,n,n,3,3,3,n,n,n,"",n,n,n,"allwebmenusinfo.html?source=side",n,0,0,2,4,5,5,6,7,7,1,1,1,0);
it=s1.addItemWithImages(3,4,4,"Download",n,n,"",n,n,n,3,3,3,n,n,n,"",n,n,n,"download.html?source=side",n,0,0,2,4,5,5,6,7,7,1,1,1,0);
var s2=it.addSubmenu(0,0,1,0,0,0,2,7,1,1,0,n,n,100,0,2);
it=s2.addItemWithImages(8,9,9,"Download<br>AllWebMenus",n,n,"",n,n,n,3,3,3,n,n,n,"",n,n,n,"download.html?source=side",n,0,0,2,10,11,11,12,13,13,1,1,1,0);
it=s2.addItemWithImages(8,9,9,"Download this<BR>menu project",n,n,"This side menu exists in a few major pages only, serving as a demo of the AllWebMenus capabilities.",n,n,n,3,3,3,n,n,n,"",n,n,n,"downldd/menu_side.zip",n,0,0,2,10,11,11,12,13,13,1,1,1,0);
it=s1.addItemWithImages(3,4,4,"Examples",n,n,"",n,n,n,3,3,3,n,n,n,"",n,n,n,"examples.html?source=side",n,0,0,2,4,5,5,6,7,7,1,1,1,0);
it=s1.addItemWithImages(3,4,4,"Purchase",n,n,"",n,n,n,3,3,3,n,n,n,"",n,n,n,"awmregister.php?source=side",n,0,0,2,4,5,5,6,7,7,1,1,1,0);
it=s1.addItemWithImages(5,6,6,"","","","This side menu exists in a few major pages only, serving as a demo of the AllWebMenus capabilities.",14,14,14,3,3,3,n,n,n,"",n,n,n,n,n,0,0,2,4,5,5,6,7,7,1,1,1,0);
s0.pm.buildMenu();
}}
