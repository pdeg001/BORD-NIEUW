package b4j.example;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;

public class classcheckconfig extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    public static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.classcheckconfig", this);
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            ba.htSubs = htSubs;
             
        }
        if (BA.isShellModeRuntimeCheck(ba))
                this.getClass().getMethod("_class_globals", b4j.example.classcheckconfig.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4j.objects.JFX _fx = null;
public anywheresoftware.b4a.objects.Timer _tmr = null;
public String _apppath = "";
public long _cfgtimestamp = 0L;
public long _cfgcurrtimestamp = 0L;
public b4j.example.dateutils _dateutils = null;
public b4j.example.cssutils _cssutils = null;
public b4j.example.main _main = null;
public b4j.example.scorebord _scorebord = null;
public b4j.example.nieuwe_partij _nieuwe_partij = null;
public b4j.example.func _func = null;
public b4j.example.funcinet _funcinet = null;
public b4j.example.getnode _getnode = null;
public b4j.example.parseconfig _parseconfig = null;
public b4j.example.httputils2service _httputils2service = null;
public String  _chkconfig_tick() throws Exception{
 //BA.debugLineNum = 20;BA.debugLine="Sub chkConfig_Tick";
 //BA.debugLineNum = 21;BA.debugLine="cfgCurrTimeStamp = File.LastModified(appPath, \"\")";
_cfgcurrtimestamp = __c.File.LastModified(_apppath,"");
 //BA.debugLineNum = 23;BA.debugLine="If cfgCurrTimeStamp <> cfgTimeStamp Then";
if (_cfgcurrtimestamp!=_cfgtimestamp) { 
 //BA.debugLineNum = 24;BA.debugLine="parseConfig.pullConfig";
_parseconfig._pullconfig /*String*/ ();
 //BA.debugLineNum = 26;BA.debugLine="cfgTimeStamp = cfgCurrTimeStamp";
_cfgtimestamp = _cfgcurrtimestamp;
 //BA.debugLineNum = 27;BA.debugLine="CallSub(scorebord, \"updateCfg\")";
__c.CallSubNew(ba,(Object)(_scorebord.getObject()),"updateCfg");
 //BA.debugLineNum = 29;BA.debugLine="CallSub2(scorebord, \"useDigitalFont\", parseConfi";
__c.CallSubNew2(ba,(Object)(_scorebord.getObject()),"useDigitalFont",(Object)(_parseconfig._usedigitalfont /*boolean*/ ));
 };
 //BA.debugLineNum = 33;BA.debugLine="End Sub";
return "";
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 1;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 2;BA.debugLine="Private fx As JFX";
_fx = new anywheresoftware.b4j.objects.JFX();
 //BA.debugLineNum = 3;BA.debugLine="Dim tmr As Timer";
_tmr = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 4;BA.debugLine="Dim appPath As String";
_apppath = "";
 //BA.debugLineNum = 5;BA.debugLine="Dim cfgTimeStamp, cfgCurrTimeStamp As Long";
_cfgtimestamp = 0L;
_cfgcurrtimestamp = 0L;
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 9;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 10;BA.debugLine="appPath = parseConfig.getAppPath";
_apppath = _parseconfig._getapppath /*String*/ ();
 //BA.debugLineNum = 11;BA.debugLine="cfgTimeStamp = File.LastModified(appPath, \"\")";
_cfgtimestamp = __c.File.LastModified(_apppath,"");
 //BA.debugLineNum = 15;BA.debugLine="tmr.Initialize(\"chkConfig\", 5000)";
_tmr.Initialize(ba,"chkConfig",(long) (5000));
 //BA.debugLineNum = 16;BA.debugLine="tmr.Enabled = True";
_tmr.setEnabled(__c.True);
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
