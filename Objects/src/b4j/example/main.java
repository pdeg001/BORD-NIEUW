package b4j.example;


import anywheresoftware.b4a.BA;

public class main extends javafx.application.Application{
public static main mostCurrent = new main();

public static BA ba;
static {
		ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.main", null);
		ba.loadHtSubs(main.class);
        if (ba.getClass().getName().endsWith("ShellBA")) {
			
			ba.raiseEvent2(null, true, "SHELL", false);
			ba.raiseEvent2(null, true, "CREATE", true, "b4j.example.main", ba);
		}
	}
    public static Class<?> getObject() {
		return main.class;
	}

 
    public static void main(String[] args) {
    	launch(args);
    }
    public void start (javafx.stage.Stage stage) {
        try {
            if (!false)
                System.setProperty("prism.lcdtext", "false");
            anywheresoftware.b4j.objects.FxBA.application = this;
		    anywheresoftware.b4a.keywords.Common.setDensity(javafx.stage.Screen.getPrimary().getDpi());
            anywheresoftware.b4a.keywords.Common.LogDebug("Program started.");
            initializeProcessGlobals();
            anywheresoftware.b4j.objects.Form frm = new anywheresoftware.b4j.objects.Form();
            frm.initWithStage(ba, stage, 1920, 1080);
            ba.raiseEvent(null, "appstart", frm, (String[])getParameters().getRaw().toArray(new String[0]));
        } catch (Throwable t) {
            BA.printException(t, true);
            System.exit(1);
        }
    }
public static anywheresoftware.b4a.keywords.Common __c = null;
public static anywheresoftware.b4j.objects.JFX _fx = null;
public static anywheresoftware.b4j.objects.Form _mainform = null;
public static b4j.example.dateutils _dateutils = null;
public static b4j.example.cssutils _cssutils = null;
public static b4j.example.scorebord _scorebord = null;
public static b4j.example.nieuwe_partij _nieuwe_partij = null;
public static b4j.example.func _func = null;
public static b4j.example.funcinet _funcinet = null;
public static b4j.example.getnode _getnode = null;
public static b4j.example.parseconfig _parseconfig = null;
public static b4j.example.httputils2service _httputils2service = null;
public static boolean  _application_error(anywheresoftware.b4a.objects.B4AException _error,String _stacktrace) throws Exception{
 //BA.debugLineNum = 44;BA.debugLine="Sub Application_Error (Error As Exception, StackTr";
 //BA.debugLineNum = 45;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return false;
}
public static String  _appstart(anywheresoftware.b4j.objects.Form _form1,String[] _args) throws Exception{
String _apppath = "";
String _os = "";
String _appfolder = "";
 //BA.debugLineNum = 13;BA.debugLine="Sub AppStart (Form1 As Form, Args() As String)";
 //BA.debugLineNum = 15;BA.debugLine="Dim appPath As String = parseConfig.getAppPath";
_apppath = _parseconfig._getapppath /*String*/ ();
 //BA.debugLineNum = 16;BA.debugLine="Dim os As String = parseConfig.DetectOS";
_os = _parseconfig._detectos /*String*/ ();
 //BA.debugLineNum = 17;BA.debugLine="Dim appFolder As String";
_appfolder = "";
 //BA.debugLineNum = 19;BA.debugLine="Select os";
switch (BA.switchObjectToInt(_os,"windows","linux")) {
case 0: {
 //BA.debugLineNum = 21;BA.debugLine="appFolder = File.DirApp&\"\\44\\\"";
_appfolder = anywheresoftware.b4a.keywords.Common.File.getDirApp()+"\\44\\";
 break; }
case 1: {
 //BA.debugLineNum = 23;BA.debugLine="appFolder = File.DirApp&\"/44/\"";
_appfolder = anywheresoftware.b4a.keywords.Common.File.getDirApp()+"/44/";
 break; }
}
;
 //BA.debugLineNum = 28;BA.debugLine="If File.Exists(appPath, \"\") = False Then";
if (anywheresoftware.b4a.keywords.Common.File.Exists(_apppath,"")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 29;BA.debugLine="File.Copy(File.DirAssets, \"cnf.44\", appPath, \"\")";
anywheresoftware.b4a.keywords.Common.File.Copy(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"cnf.44",_apppath,"");
 };
 //BA.debugLineNum = 31;BA.debugLine="If File.IsDirectory(appFolder, \"media\") = False T";
if (anywheresoftware.b4a.keywords.Common.File.IsDirectory(_appfolder,"media")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 32;BA.debugLine="File.MakeDir(appFolder, \"media\")";
anywheresoftware.b4a.keywords.Common.File.MakeDir(_appfolder,"media");
 };
 //BA.debugLineNum = 35;BA.debugLine="MainForm = Form1";
_mainform = _form1;
 //BA.debugLineNum = 39;BA.debugLine="scorebord.Show";
_scorebord._show /*void*/ ();
 //BA.debugLineNum = 40;BA.debugLine="MainForm.Close";
_mainform.Close();
 //BA.debugLineNum = 41;BA.debugLine="End Sub";
return "";
}

private static boolean processGlobalsRun;
public static void initializeProcessGlobals() {
    
    if (main.processGlobalsRun == false) {
	    main.processGlobalsRun = true;
		try {
		        b4j.example.dateutils._process_globals();
b4j.example.cssutils._process_globals();
main._process_globals();
scorebord._process_globals();
nieuwe_partij._process_globals();
func._process_globals();
funcinet._process_globals();
getnode._process_globals();
parseconfig._process_globals();
httputils2service._process_globals();
		
        } catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
}public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 8;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 9;BA.debugLine="Private fx As JFX";
_fx = new anywheresoftware.b4j.objects.JFX();
 //BA.debugLineNum = 10;BA.debugLine="Private MainForm As Form";
_mainform = new anywheresoftware.b4j.objects.Form();
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return "";
}
}
