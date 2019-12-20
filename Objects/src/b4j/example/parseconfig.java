package b4j.example;


import anywheresoftware.b4a.BA;

public class parseconfig extends Object{
public static parseconfig mostCurrent = new parseconfig();

public static BA ba;
static {
		ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.parseconfig", null);
		ba.loadHtSubs(parseconfig.class);
        if (ba.getClass().getName().endsWith("ShellBA")) {
			
			ba.raiseEvent2(null, true, "SHELL", false);
			ba.raiseEvent2(null, true, "CREATE", true, "b4j.example.parseconfig", ba);
		}
	}
    public static Class<?> getObject() {
		return parseconfig.class;
	}

 public static anywheresoftware.b4a.keywords.Common __c = null;
public static anywheresoftware.b4j.objects.JFX _fx = null;
public static int _timeout = 0;
public static boolean _timeoutactive = false;
public static boolean _usedigitalfont = false;
public static String _apppath = "";
public static String _cnf = "";
public static anywheresoftware.b4j.objects.collections.JSONParser _parser = null;
public static b4j.example.dateutils _dateutils = null;
public static b4j.example.cssutils _cssutils = null;
public static b4j.example.main _main = null;
public static b4j.example.scorebord _scorebord = null;
public static b4j.example.nieuwe_partij _nieuwe_partij = null;
public static b4j.example.func _func = null;
public static b4j.example.funcinet _funcinet = null;
public static b4j.example.getnode _getnode = null;
public static b4j.example.httputils2service _httputils2service = null;
public static String  _detectos() throws Exception{
String _os = "";
 //BA.debugLineNum = 90;BA.debugLine="Sub DetectOS As String";
 //BA.debugLineNum = 91;BA.debugLine="Dim os As String = GetSystemProperty(\"os.name\", \"";
_os = anywheresoftware.b4a.keywords.Common.GetSystemProperty("os.name","").toLowerCase();
 //BA.debugLineNum = 92;BA.debugLine="If os.Contains(\"win\") Then";
if (_os.contains("win")) { 
 //BA.debugLineNum = 93;BA.debugLine="Return \"windows\"";
if (true) return "windows";
 }else if(_os.contains("mac")) { 
 //BA.debugLineNum = 95;BA.debugLine="Return \"mac\"";
if (true) return "mac";
 }else {
 //BA.debugLineNum = 97;BA.debugLine="Return \"linux\"";
if (true) return "linux";
 };
 //BA.debugLineNum = 99;BA.debugLine="End Sub";
return "";
}
public static String  _getapppath() throws Exception{
String _os = "";
 //BA.debugLineNum = 14;BA.debugLine="Sub getAppPath As String";
 //BA.debugLineNum = 15;BA.debugLine="Dim os As String = DetectOS";
_os = _detectos();
 //BA.debugLineNum = 17;BA.debugLine="Select os";
switch (BA.switchObjectToInt(_os,"windows","linux")) {
case 0: {
 //BA.debugLineNum = 19;BA.debugLine="appPath = File.DirApp&\"\\44\\cnf.44\"";
_apppath = anywheresoftware.b4a.keywords.Common.File.getDirApp()+"\\44\\cnf.44";
 break; }
case 1: {
 //BA.debugLineNum = 21;BA.debugLine="appPath = File.DirApp&\"/44/cnf.44\"";
_apppath = anywheresoftware.b4a.keywords.Common.File.getDirApp()+"/44/cnf.44";
 break; }
}
;
 //BA.debugLineNum = 24;BA.debugLine="Return appPath";
if (true) return _apppath;
 //BA.debugLineNum = 25;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private fx As JFX";
_fx = new anywheresoftware.b4j.objects.JFX();
 //BA.debugLineNum = 5;BA.debugLine="Public timeOut As Int";
_timeout = 0;
 //BA.debugLineNum = 6;BA.debugLine="Public timeOutActive As Boolean";
_timeoutactive = false;
 //BA.debugLineNum = 7;BA.debugLine="Public useDigitalFont As Boolean";
_usedigitalfont = false;
 //BA.debugLineNum = 8;BA.debugLine="Private appPath As String";
_apppath = "";
 //BA.debugLineNum = 9;BA.debugLine="Private cnf As String";
_cnf = "";
 //BA.debugLineNum = 10;BA.debugLine="Private parser As JSONParser";
_parser = new anywheresoftware.b4j.objects.collections.JSONParser();
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return "";
}
public static String  _pullconfig() throws Exception{
anywheresoftware.b4a.objects.collections.List _msglist = null;
anywheresoftware.b4a.objects.collections.Map _root = null;
anywheresoftware.b4a.objects.collections.Map _fontcolor = null;
String _coloryellow = "";
anywheresoftware.b4a.objects.collections.Map _message = null;
String _line_1 = "";
String _line_2 = "";
String _line_5 = "";
String _line_3 = "";
String _line_4 = "";
anywheresoftware.b4a.objects.collections.Map _sponsor = null;
String _sponsoractive = "";
anywheresoftware.b4a.objects.collections.Map _showpromote = null;
anywheresoftware.b4a.objects.collections.Map _digitalfont = null;
String _digitalactive = "";
 //BA.debugLineNum = 28;BA.debugLine="Sub pullConfig";
 //BA.debugLineNum = 29;BA.debugLine="Dim msgList As List";
_msglist = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 31;BA.debugLine="useDigitalFont = False";
_usedigitalfont = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 32;BA.debugLine="cnf = File.ReadString(appPath, \"\")";
_cnf = anywheresoftware.b4a.keywords.Common.File.ReadString(_apppath,"");
 //BA.debugLineNum = 33;BA.debugLine="parser.Initialize(cnf)";
_parser.Initialize(_cnf);
 //BA.debugLineNum = 34;BA.debugLine="msgList.Initialize";
_msglist.Initialize();
 //BA.debugLineNum = 37;BA.debugLine="Dim root As Map' = parser.NextObject";
_root = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 38;BA.debugLine="root.Initialize";
_root.Initialize();
 //BA.debugLineNum = 39;BA.debugLine="root= parser.NextObject";
_root = _parser.NextObject();
 //BA.debugLineNum = 40;BA.debugLine="Dim fontColor As Map = root.Get(\"fontColor\")";
_fontcolor = new anywheresoftware.b4a.objects.collections.Map();
_fontcolor.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("fontColor"))));
 //BA.debugLineNum = 41;BA.debugLine="Dim colorYellow As String = fontColor.Get(\"colorY";
_coloryellow = BA.ObjectToString(_fontcolor.Get((Object)("colorYellow")));
 //BA.debugLineNum = 44;BA.debugLine="Dim message As Map = root.Get(\"message\")";
_message = new anywheresoftware.b4a.objects.collections.Map();
_message.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("message"))));
 //BA.debugLineNum = 45;BA.debugLine="Dim line_1 As String = message.Get(\"line_1\")";
_line_1 = BA.ObjectToString(_message.Get((Object)("line_1")));
 //BA.debugLineNum = 46;BA.debugLine="Dim line_2 As String = message.Get(\"line_2\")";
_line_2 = BA.ObjectToString(_message.Get((Object)("line_2")));
 //BA.debugLineNum = 47;BA.debugLine="Dim line_5 As String = message.Get(\"line_5\")";
_line_5 = BA.ObjectToString(_message.Get((Object)("line_5")));
 //BA.debugLineNum = 48;BA.debugLine="Dim line_3 As String = message.Get(\"line_3\")";
_line_3 = BA.ObjectToString(_message.Get((Object)("line_3")));
 //BA.debugLineNum = 49;BA.debugLine="Dim line_4 As String = message.Get(\"line_4\")";
_line_4 = BA.ObjectToString(_message.Get((Object)("line_4")));
 //BA.debugLineNum = 50;BA.debugLine="Dim fontColor As Map = root.Get(\"fontColor\")";
_fontcolor = new anywheresoftware.b4a.objects.collections.Map();
_fontcolor.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("fontColor"))));
 //BA.debugLineNum = 52;BA.debugLine="Dim sponsor As Map = root.Get(\"reclame\")";
_sponsor = new anywheresoftware.b4a.objects.collections.Map();
_sponsor.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("reclame"))));
 //BA.debugLineNum = 53;BA.debugLine="Dim sponsorActive As String = sponsor.Get(\"active";
_sponsoractive = BA.ObjectToString(_sponsor.Get((Object)("active")));
 //BA.debugLineNum = 55;BA.debugLine="Dim showPromote As Map = root.Get(\"showPromote\")";
_showpromote = new anywheresoftware.b4a.objects.collections.Map();
_showpromote.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("showPromote"))));
 //BA.debugLineNum = 56;BA.debugLine="If showPromote.Get(\"active\") = \"1\" Then";
if ((_showpromote.Get((Object)("active"))).equals((Object)("1"))) { 
 //BA.debugLineNum = 57;BA.debugLine="timeOutActive = True";
_timeoutactive = anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 59;BA.debugLine="timeOutActive = False";
_timeoutactive = anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 61;BA.debugLine="timeOut = showPromote.Get(\"timeOut\")";
_timeout = (int)(BA.ObjectToNumber(_showpromote.Get((Object)("timeOut"))));
 //BA.debugLineNum = 63;BA.debugLine="Dim digitalFont As Map = root.Get(\"digitalFont\")";
_digitalfont = new anywheresoftware.b4a.objects.collections.Map();
_digitalfont.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_root.Get((Object)("digitalFont"))));
 //BA.debugLineNum = 64;BA.debugLine="Dim digitalActive As String = digitalFont.Get(\"ac";
_digitalactive = BA.ObjectToString(_digitalfont.Get((Object)("active")));
 //BA.debugLineNum = 66;BA.debugLine="If digitalActive  = \"1\" Then";
if ((_digitalactive).equals("1")) { 
 //BA.debugLineNum = 67;BA.debugLine="useDigitalFont = True";
_usedigitalfont = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 68;BA.debugLine="CallSub2(scorebord, \"useDigitalFont\", True)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"useDigitalFont",(Object)(anywheresoftware.b4a.keywords.Common.True));
 }else {
 //BA.debugLineNum = 70;BA.debugLine="CallSub2(scorebord, \"useDigitalFont\", False)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"useDigitalFont",(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 73;BA.debugLine="If colorYellow = \"1\"  Then";
if ((_coloryellow).equals("1")) { 
 //BA.debugLineNum = 74;BA.debugLine="CallSub2(scorebord, \"useFontYellow\", True)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"useFontYellow",(Object)(anywheresoftware.b4a.keywords.Common.True));
 }else {
 //BA.debugLineNum = 76;BA.debugLine="CallSub2(scorebord, \"useFontYellow\", False)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"useFontYellow",(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 79;BA.debugLine="msgList.AddAll(Array As String(line_1, line_2, li";
_msglist.AddAll(anywheresoftware.b4a.keywords.Common.ArrayToList(new String[]{_line_1,_line_2,_line_3,_line_4,_line_5}));
 //BA.debugLineNum = 80;BA.debugLine="CallSub2(scorebord, \"setMessage\", msgList)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"setMessage",(Object)(_msglist));
 //BA.debugLineNum = 82;BA.debugLine="If sponsorActive = \"1\" Then";
if ((_sponsoractive).equals("1")) { 
 //BA.debugLineNum = 83;BA.debugLine="CallSub2(scorebord, \"showSponor\", True)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"showSponor",(Object)(anywheresoftware.b4a.keywords.Common.True));
 }else {
 //BA.debugLineNum = 85;BA.debugLine="CallSub2(scorebord, \"showSponor\", False)";
anywheresoftware.b4a.keywords.Common.CallSubNew2(ba,(Object)(_scorebord.getObject()),"showSponor",(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 88;BA.debugLine="End Sub";
return "";
}
}
