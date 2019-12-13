﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8
@EndOfDesignText@
'Static code module
Sub Process_Globals
	
	
	Private fx As JFX
	
	Private Dialog As B4XDialog
	Private Base As B4XView
'	Dim nh As NativeHook
	Private XUI As XUI
	Private frm As Form
	Private inactivecls As inactiveClass
	Private clsCheckCfg As classCheckConfig
	Private clsToast As clXToastMessage
	Private clsUpdate As classUpdate
	
	Private pn_promote_top, pn_promote_left As Double
	Private promoteRunning As Boolean = False
	Private pNieuwePartij As B4XView 
	Private pNieuwePartijDialog As B4XDialog
	'Dim ftp As Ftp
	
	
'	Private MainForm As Form
'	Private lbl_player_one As B4XView
'	Private lbl_player_two As B4XView
	Private lbl_innings As Label
	
'	Private lbl_player_one_1000 As B4XView
'	Private lbl_player_one_active As B4XView
	Private lbl_player_one_moyenne As Label
	Private lbl_player_two_moyenne As Label
'	Private lbl_player_two_1000 As B4XView
	Private lbl_player_two_100 As Label
	Private lbl_player_two_10 As Label
	Private lbl_player_two_1 As Label
	Private btn_exit As B4XView
	Private lbl_player_one_name As B4XView
	Private lbl_player_two_name As B4XView
	Private lbl_player_one_perc As Label
	Private lbl_player_one_make_100 As Label
	Private lbl_player_one_make_10 As Label
	Private lbl_player_one_make_1 As Label
	Private lbl_player_two_make_100 As Label
	Private lbl_player_two_make_10 As Label
	Private lbl_player_two_make_1 As Label
	Private lbl_player_two_perc As Label
'	Private cmb_game As ComboBox
	Private lbl_reset As B4XView
	Private jxui As XUI
	Private lbl_player_one_hs As Label
	Private lbl_player_two_hs As Label
	Private lbl_clock As B4XView
	Private clsTmr As timerClass
'	Private lbl_logo As B4XView
	
	
	Private Label7 As Label
'	Private lbl_logo_top As B4XView
	Private edt_speler_a As TextField
	Private edt_temaken_a As TextField
	Private edt_speler_b As TextField
	Private edt_temaken_b As TextField
	Private btn_a_begint As Button
	Private btn_b_begint As Button
'	Private lbl_p1_temaken As B4XView
'	Private lbl_p1_perc As Label
'	Private ProgressBar1 As ProgressBar
	
	Private B4XProgressBarP1 As B4XProgressBar
	Private B4XProgressBarP2 As B4XProgressBar
	
	Private btn_nieuwe_partij As Button
	Private btn_annuleer_nieuwe_partij As Button
'	Private lbl_player_one_test As Label
'	Private lbl_player_one_1_xx As B4XView
'	Private lbl_player_one_1xx As B4XView
	Private Label6 As Label
	Private lbl_close As B4XView
	Private chk_add_player As CheckBox
	Private img_random As ImageView
'	Private Label8 As Label
'	Private Button1 As Button
	Private pn_p1_carom As Pane
'	Private Label2 As Label
	Private pn_promote As Pane
	Private lbl_config_update As Label
	
	
	Private lbl_player_one_1 As Label
	Private lbl_player_one_10 As Label
	Private lbl_player_one_100 As Label
	
	
	Private lbl_message_1 As Label
	Private lbl_message_2 As Label
	Private lbl_message_3 As Label
	Private lbl_message_4 As Label
	Private lbl_message_5 As Label
	Private btn_test As Button
	Private lbl_version As Label
	Private pn_sponsore As Pane
End Sub


Public Sub show
	
	frm.Initialize("frm", 1920, 1080)
	frm.RootPane.LoadLayout("scorebord")
	setFontSize
	frm.Stylesheets.Add(File.GetUri(File.DirAssets, "n205.css"))
	parseConfig.pullConfig
	#if debug
	frm.SetFormStyle("UTILITY")
	#Else
		frm.SetFormStyle("UNDECORATED")
		frm.Resizable = False
	#End If
	
	frm.Show
	MouseOver(frm.RootPane)
	
	Base = frm.RootPane
	Dialog.Initialize (Base)
	
	'func.SetFormCursor(frm, "mouse.png")
	func.SetCustomCursor1(File.DirAssets, "mouse.png", 370, 370, frm.RootPane)
	
	
	clsTmr.Initialize(lbl_clock)
	inactivecls.Initialize
	clsCheckCfg.Initialize
	clsToast.Initialize(frm.RootPane)
	clsUpdate.Initialize
	lbl_version.Text = func.getVersion

	func.lblInnings = lbl_innings
	func.lbl_player_one_hs = lbl_player_one_hs
	func.lbl_player_two_hs = lbl_player_two_hs
	
	func.setP1CaromLables(lstPlayerOneScoreLbl)
	func.setP2CaromLables(lstPlayerTwoScoreLbl)

	Wait For (funcInet.testInet) Complete (result As Boolean)
	If result Then
		func.hasInternetAccess = True
		clsUpdate.checkUpdate
	Else
		func.hasInternetAccess = False
	End If
	
	
	initPanels
	
	
End Sub


Sub initPanels
	pNieuwePartijDialog.Initialize (Base)
	pNieuwePartij = XUI.CreatePanel("")
	pNieuwePartij.SetLayoutAnimated(0, 100dip, 0, 1000dip, 800dip)
	pNieuwePartij.LoadLayout("nieuwe_partij")
	pNieuwePartijDialog.Title = "Nieuwe Partij"
	pNieuwePartijDialog.PutAtTop = False 'put the dialog at the top of the screen
	
	pn_promote_top = 1130 'pn_promote.Top
	pn_promote_left = 20 'pn_promote.Left
	
	
	inactivecls.frm = frm
	inactivecls.pn_promote = pn_promote
	inactivecls.pnlWidth = pn_promote.Width
	inactivecls.pnlHeight = pn_promote.Height
End Sub


Sub getRandomImage
'	funcInet.newRandomImage("https://www.b4x.com/images3/android.png", img_random)
	
End Sub

'Sub setRandomImage(img As Image)
'	img_random.SetImage(img)
'	
'End Sub

Sub setFontSize
	func.caromLabelCss(lbl_innings, "labelCarom")

	func.caromLabelCss(lbl_player_one_hs, "labelWhite")
	func.caromLabelCss(lbl_player_one_moyenne, "labelWhite")
	func.caromLabelCss(lbl_player_one_perc, "labelWhite")
	
	
	func.caromLabelCss(lbl_player_one_100, "labelCarom")
	func.caromLabelCss(lbl_player_one_10, "labelCarom")
	func.caromLabelCss(lbl_player_one_1, "labelCarom")

	
	func.caromLabelCss(lbl_player_one_make_100, "labelCarom")
	func.caromLabelCss(lbl_player_one_make_10, "labelCarom")
	func.caromLabelCss(lbl_player_one_make_1, "labelCarom")
	
	func.caromLabelCss(lbl_player_two_hs, "labelWhite")
	func.caromLabelCss(lbl_player_two_moyenne, "labelWhite")
	func.caromLabelCss(lbl_player_two_perc, "labelWhite")
		
	func.caromLabelCss(lbl_player_two_100, "labelCarom")
	func.caromLabelCss(lbl_player_two_10, "labelCarom")
	func.caromLabelCss(lbl_player_two_1, "labelCarom")
	
	func.caromLabelCss(lbl_player_two_make_100, "labelCarom")
	func.caromLabelCss(lbl_player_two_make_10, "labelCarom")
	func.caromLabelCss(lbl_player_two_make_1, "labelCarom")
	
	
	resetBoard(False)
	
End Sub

'Return true to allow the default exceptions handler to handle the uncaught exception.
Sub Application_Error (Error As Exception, StackTrace As String) As Boolean
	Return True
End Sub


Sub lbl_player_two_MouseReleased (EventData As MouseEvent)
'	CSSUtils.SetBorder(lbl_player_one, 0, fx.Colors.From32Bit(0xFFFFFFFF), 4)
'	CSSUtils.SetBorder(lbl_player_two, 1, fx.Colors.From32Bit(0xFFFFFFFF), 4)

End Sub

Sub lstPlayerOneScoreLbl As List
	Dim List As List
	List.Initialize
	List.AddAll(Array As Object(lbl_player_one_1, lbl_player_one_10, lbl_player_one_100, lbl_player_one_moyenne, B4XProgressBarP1))
	Return List
End Sub

Sub lstPlayerTwoScoreLbl As List
	Dim List As List
	List.Initialize
	List.AddAll(Array As Object(lbl_player_two_1, lbl_player_two_10, lbl_player_two_100, lbl_player_two_moyenne, B4XProgressBarP2))
	Return List
End Sub

'	CSSUtils.SetBorder(lbl_player_one, 1, fx.Colors.From32Bit(0xFFFFFFFF), 4)


Sub lastClick
	inactivecls.lastClick = DateTime.Now
End Sub

Sub lbl_player_one_1_MouseReleased (EventData As MouseEvent)
	setP1Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayerOne(1)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayerOne(-1)
	End If
End Sub


Sub lbl_player_one_10_MouseReleased (EventData As MouseEvent)
	setP1Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayerOne(10)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayerOne(-10)
	End If
End Sub
Sub lbl_player_one_100_MouseReleased (EventData As MouseEvent)
	setP1Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayerOne(100)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayerOne(-100)
	End If
End Sub

Sub lbl_player_two_1_MouseReleased (EventData As MouseEvent)
	setP2Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayertwo(1)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayertwo(-1)
	End If
End Sub
Sub lbl_player_two_10_MouseReleased (EventData As MouseEvent)
	setP2Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayertwo(10)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayertwo(-10)
	End If
End Sub
Sub lbl_player_two_100_MouseReleased (EventData As MouseEvent)
	setP2Name
	If EventData.PrimaryButtonPressed Then
		func.calcScorePlayertwo(100)
	Else If EventData.SecondaryButtonPressed Then
		func.calcScorePlayertwo(-100)
	End If
End Sub

Sub lbl_player_one_active_MouseReleased (EventData As MouseEvent)
'	lbl_player_one_active.Color = 0xFF33BB02
	
End Sub

Sub lbl_innings_MouseReleased (EventData As MouseEvent)
	Dim points As Int = lbl_innings.Text
	If EventData.PrimaryButtonPressed Then
		points = points + 1
	Else
		points = points - 1
	End If
	If points = -1 Then
		Return
	End If
	
	func.innigs = points
	lbl_innings.Text = func.padString(points, "0", 0, 3)
	func.calcMoyenne(lbl_player_one_moyenne, lbl_player_two_moyenne)
	func.processHs("all")
	func.inngSet = 1
	
End Sub





Sub btn_exit_MouseReleased (EventData As MouseEvent)
	ExitApplication
End Sub


Sub lbl_player_one_1_MouseEntered (EventData As MouseEvent)
'	lbl_player_one_1.Color = 0xFF69D79A
	'func.setNumberCss(lbl_player_one_1)
End Sub

Sub lbl_player_two_1_MouseEntered (EventData As MouseEvent)
'	lbl_player_two_1.Color = 0xFF69D79A
	'CSSUtils.SetStyleProperty(lbl_player_two_1, "-fx-background-color",  "linear-gradient(to bottom,  #cfe7fa 0%,#6393c1 100%)")
	'CSSUtils.SetStyleProperty(lbl_player_two_1, "-fx-background-radius", "3,2,1")
'	func.setNumberCss(lbl_player_two_1)
End Sub

Sub lbl_player_two_1_MouseExited (EventData As MouseEvent)
	'lbl_player_two_1.Color = 0xFF00008B
'	CSSUtils.SetStyleProperty(lbl_player_two_1, "-fx-background-color",  "#00008B;")
	
End Sub

Sub lbl_player_one_name_MouseReleased (EventData As MouseEvent)
	setP1Name
	func.processHs("all")
	
End Sub

Sub lbl_player_two_name_MouseReleased (EventData As MouseEvent)
	setP2Name
	func.processHs("all")
	func.inngSet = 0
End Sub

Sub lbl_player_one_make_100_MouseReleased (EventData As MouseEvent)
	setP1Name
	func.playerOneMake(lbl_player_one_make_100, lbl_player_one_make_10, lbl_player_one_make_1, EventData.PrimaryButtonPressed, 100)
End Sub

Sub lbl_player_one_make_10_MouseReleased (EventData As MouseEvent)
	setP1Name
	func.playerOneMake(lbl_player_one_make_100, lbl_player_one_make_10, lbl_player_one_make_1, EventData.PrimaryButtonPressed, 10)
	
End Sub

Sub lbl_player_one_make_1_MouseReleased (EventData As MouseEvent)
	setP1Name
	func.playerOneMake(lbl_player_one_make_100, lbl_player_one_make_10, lbl_player_one_make_1, EventData.PrimaryButtonPressed, 1)
End Sub

Sub playerOnePerc(perc As String)
	lbl_player_one_perc.Text = perc
End Sub

Sub playerTwoPerc(perc As String)
	lbl_player_two_perc.Text = perc
End Sub

Sub lbl_player_two_make_100_MouseReleased (EventData As MouseEvent)
	
	func.playertwoMake(lbl_player_two_make_100, lbl_player_two_make_10, lbl_player_two_make_1, EventData.PrimaryButtonPressed, 100)
End Sub

Sub lbl_player_two_make_10_MouseReleased (EventData As MouseEvent)
	func.playertwoMake(lbl_player_two_make_100, lbl_player_two_make_10, lbl_player_two_make_1, EventData.PrimaryButtonPressed, 10)
End Sub

Sub lbl_player_two_make_1_MouseReleased (EventData As MouseEvent)
	func.playertwoMake(lbl_player_two_make_100, lbl_player_two_make_10, lbl_player_two_make_1, EventData.PrimaryButtonPressed, 1)
End Sub

Sub setCaromNumber(v As B4XView, value As String)
'	func.setVisibleAnimated(v, 200, False)
'	Sleep(200)
	v.Color = 0x00FFFFFF
	v.Text = value
'	func.setVisibleAnimated(v, 200, True)
	
End Sub

Sub resetBoard(bordStart As Boolean)
	If bordStart Then
	
		Dim sf As Object = jxui.Msgbox2Async("Bord resetten?", "", "Ja", "", "Nee", Null)
		Wait For (sf) Msgbox_Result (Result As Int)
		If Result = jxui.DialogResponse_Negative Then
			Return
		End If
	End If
	
'	lbl_player_one_1000.Text = "0"
	

	setCaromNumber(lbl_player_one_1, "0")
'	Sleep(200)
	setCaromNumber(lbl_player_one_10, "0")
'	Sleep(200)
	setCaromNumber(lbl_player_one_100, "0")
'	Sleep(200)
	
	lbl_player_one_1.Text = "0"
	lbl_player_one_make_100.Text = "0"
	lbl_player_one_make_10.Text = "0"
	lbl_player_one_make_1.Text = "0"
	lbl_player_one_moyenne.Text = "0.000"
	lbl_player_one_perc.Text = "0.00%"
	
	lbl_innings.Text = "000"
	
'	lbl_player_two_1000.Text = "0"
	lbl_player_two_100.Text = "0"
	lbl_player_two_10.Text = "0"
	lbl_player_two_1.Text = "0"
	lbl_player_two_make_100.Text = "0"
	lbl_player_two_make_10.Text = "0"
	lbl_player_two_make_1.Text = "0"
	lbl_player_two_perc.Text = "0.00%"
	lbl_player_two_moyenne.Text = "0.000"
	lbl_player_one_hs.Text = "000"
	lbl_player_two_hs.Text = "000"
	
	func.inngSet = 0
	func.innigs = 0
	func.scorePlayerOne = 0
	func.scorePlayerTwo = 0
	func.playerOneToMake = 0
	func.playertwoToMake = 0
	func.playerOneHs = 0
	func.playerTwoHs = 0
	func.p1HsTemp = 0
	func.p2HsTemp = 0
	B4XProgressBarP1.Progress = 0
	B4XProgressBarP2.Progress = 0
	setP1Name
	
End Sub


Sub setP1Name
	lbl_player_one_name.Color = 0xff3455db'0xFF69D79A
	lbl_player_two_name.Color = 0xFF001A01
End Sub

Sub setP2Name
	lbl_player_two_name.Color = 0xff3455db'0xFF69D79A
	lbl_player_one_name.Color = 0xFF001A01
End Sub




Sub checkMatchWonP1
	Dim caroms, make As Int
	
	caroms = lbl_player_one_100.Text&lbl_player_one_10.Text&lbl_player_one_1.Text
	make = lbl_player_one_make_100.text&lbl_player_one_make_10.text&lbl_player_one_make_1.text
	
	If caroms >= make Then
'		Log($"Speler 1 wint, nabeurt voor speler 2"$)
	End If
End Sub

Sub checkMatchWonP2
	Dim caroms, make As Int
	
	caroms = lbl_player_two_100.Text&lbl_player_two_10.Text&lbl_player_two_1.Text
	make = lbl_player_two_make_100.text&lbl_player_two_make_10.text&lbl_player_two_make_1.text
	
	If caroms >= make Then
'		Log($"Speler 2 wint, geen nabeurt voor speler 1"$)
	End If
End Sub




Sub iets
	Dim dlg As B4XDialog
	dlg.Initialize (Base)
	Dim p As B4XView = XUI.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0, 600dip, 600dip)
	p.LoadLayout("players")
	dlg.Title = "Spelers Invoer"
	dlg.PutAtTop = True 'put the dialog at the top of the screen
	Wait For (dlg.ShowCustom(p, "OK", "", "CANCEL")) Complete (Result As Int)
	If Result = XUI.DialogResponse_Positive Then
		
	End If
End Sub


Sub nieuwePartij
	Wait For (pNieuwePartijDialog.ShowCustom(pNieuwePartij, "", "", "")) Complete (Result As Int)
	If Result = XUI.DialogResponse_Positive Then
		'Dialog.Show("PETER" & " " & "PAN", "OK", "", "")
	End If
	
	
End Sub


Sub btn_a_begint_MouseReleased (EventData As MouseEvent)
	
End Sub

Sub btn_b_begint_MouseReleased (EventData As MouseEvent)
	
End Sub

Sub edt_temaken_a_TextChanged (Old As String, New As String)
	edt_temaken_a.Text =  func.testNumber(Old, New)
	edt_temaken_a.SetSelection(edt_temaken_a.Text.Length, edt_temaken_a.Text.Length)
		
End Sub

Sub edt_temaken_b_TextChanged (Old As String, New As String)
	edt_temaken_b.Text =  func.testNumber(Old, New)
	edt_temaken_b.SetSelection(edt_temaken_b.Text.Length, edt_temaken_b.Text.Length)
End Sub


Sub lbl_reset_MouseEntered (EventData As MouseEvent)
	lbl_reset.Color =  0xFF69D79A
	lbl_reset.TextColor = 0xFFFFFF00
End Sub

Sub lbl_reset_MouseExited (EventData As MouseEvent)
	lbl_reset.Color = 0xFFFF0000
	lbl_reset.TextColor = 0xFFFFFFFF
End Sub

Sub lbl_reset_MouseReleased (EventData As MouseEvent)
	inactivecls.lastClick = DateTime.Now
	nieuwePartij
	'iets
	'resetBoard(True)
End Sub



Sub btn_nieuwe_partij_MouseReleased (EventData As MouseEvent)
	pNieuwePartijDialog.Close(XUI.DialogResponse_Positive)
	
	resetBoard(False)
	If chk_add_player.Checked Then
		iets
	End If
End Sub

Sub btn_annuleer_nieuwe_partij_MouseReleased (EventData As MouseEvent)
	pNieuwePartijDialog.Close(XUI.DialogResponse_Cancel)
	
End Sub



Sub lbl_close_MouseReleased (EventData As MouseEvent)
	ExitApplication
End Sub


Sub showPromote
	pn_promote.SetLayoutAnimated(0, 50dip, 50dip, pn_promote.Width, pn_promote.Height)
End Sub

Sub drawPromote(x As Double, y As Double)
	pn_promote.SetLayoutAnimated(0, x, y, pn_promote.Width, pn_promote.Height)
	Sleep(0)
	
End Sub

Sub pn_promote_MouseReleased (EventData As MouseEvent)
	pn_promote.Top = pn_promote_top
	pn_promote.left = pn_promote_left
	
	inactivecls.lastClick = DateTime.Now
	inactivecls.enableTime(True)
	inactivecls.enablePromote(False)
End Sub

Sub setPromoteRunning(running As Boolean)
	promoteRunning = running
End Sub

private Sub mouseIn_Event(m As String,args() As Object)
	If promoteRunning = True Then
		pn_promote.Top = pn_promote_top
		pn_promote.left = pn_promote_left
		Sleep(0)
		inactivecls.lastClick = DateTime.Now
		inactivecls.enableTime(True)
		inactivecls.enablePromote(False)
		promoteRunning = False
		Sleep(300)
	End If
End Sub

private Sub MouseOver(n1 As Node)
	setHandler(n1,"setOnMouseMoved","mouseIn")
	setHandler(n1,"setOnMouseExited","mouseOut")
End Sub

private Sub setHandler(ob As JavaObject,eventName As String,handlerName As String)
	ob.RunMethod(eventName, Array(ob.CreateEventFromUI("javafx.event.EventHandler",handlerName,True)))
End Sub

Private Sub asJO(o As JavaObject) As JavaObject
	Return o
End Sub

Sub MainForm_MouseClicked (EventData As MouseEvent)
	If inactivecls.tmr_draw_promote.Enabled = True Then
		pn_promote.Top = pn_promote_top
		pn_promote_left = pn_promote_left
	
		inactivecls.lastClick = DateTime.Now
		inactivecls.enableTime(True)
		inactivecls.enablePromote(False)
	End If
End Sub

Sub updateCfg
	inactivecls.updatePromote
	lbl_config_update.Visible = True
	Sleep(5000)
	lbl_config_update.Visible = False
End Sub

Sub useDigitalFont(useDigital As Boolean)
	Dim fsCarom, fsMake, fsInnings As Int
	
	If useDigital Then
		fsCarom = 350
		fsMake = 225
		fsInnings = 300
	Else 
		fsCarom = 225
		fsMake = 150
		fsInnings = 200	
	End If
	
	func.setFont(lbl_player_one_1, fsCarom, useDigital)
	func.setFont(lbl_player_one_10, fsCarom, useDigital)
	func.setFont(lbl_player_one_100, fsCarom, useDigital)
	func.setFont(lbl_player_two_1, fsCarom, useDigital)
	func.setFont(lbl_player_two_10, fsCarom, useDigital)
	func.setFont(lbl_player_two_100, fsCarom, useDigital)
	func.setFont(lbl_innings, fsInnings, useDigital)
	func.setFont(lbl_player_one_make_100, fsMake, useDigital)
	func.setFont(lbl_player_one_make_10, fsMake, useDigital)
	func.setFont(lbl_player_one_make_1, fsMake, useDigital)
	func.setFont(lbl_player_two_make_100,fsMake, useDigital)
	func.setFont(lbl_player_two_make_10,fsMake, useDigital)
	func.setFont(lbl_player_two_make_1,fsMake, useDigital)
	
End Sub

Sub useFontYellow(useYellow As Boolean)
	
	func.setFontColor(lbl_innings, useYellow)
		
	func.setFontColor(lbl_player_one_1, useYellow)
	func.setFontColor(lbl_player_one_10, useYellow)
	func.setFontColor(lbl_player_one_100, useYellow)
	
	func.setFontColor(lbl_player_two_1, useYellow)
	func.setFontColor(lbl_player_two_10, useYellow)
	func.setFontColor(lbl_player_two_100, useYellow)
	
	func.setFontColor(lbl_player_one_make_100, useYellow)
	func.setFontColor(lbl_player_one_make_10, useYellow)
	func.setFontColor(lbl_player_one_make_1, useYellow)
	
	func.setFontColor(lbl_player_two_make_100, useYellow)
	func.setFontColor(lbl_player_two_make_10, useYellow)
	func.setFontColor(lbl_player_two_make_1, useYellow)
End Sub

Sub showSponor(enabled As Boolean)
	pn_sponsore.Visible = enabled
End Sub


Sub setMessage(msgList As List)
	lbl_message_1.Text = msgList.get(0)
	lbl_message_2.Text = msgList.get(1)
	lbl_message_3.Text = msgList.get(2)
	lbl_message_4.Text = msgList.get(3)
	lbl_message_5.Text = msgList.Get(4)
	
End Sub


Sub btn_test_MouseReleased (EventData As MouseEvent)
	clsUpdate.restartApp
End Sub