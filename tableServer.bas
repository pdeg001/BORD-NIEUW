﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
Sub Class_Globals
'	Private fx As JFX
	Private broker1 As MqttBroker
	Private client As MqttClient
	Private const port As Int = 51042
	Private serializator As B4XSerializator
	Public connected As Boolean
	Public brokerStarted As Boolean
	Public isServer As Boolean
	Private users As List
	Private fx As JFX
	Private currentName As String
	Private host As String = "127.0.0.1"
	Private name As String = "SomeTable"
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	broker1.Initialize("", port) 'first parameter is the event name. It is currently not used.
	broker1.DebugLog = False
	users.Initialize
'	isServer = True
End Sub

Public Sub ConnectTo()
	currentName = name
	isServer = host = "127.0.0.1"
	If isServer Then
		If brokerStarted = False Then
			broker1.Start
			brokerStarted = True
			
		End If
		users.Clear
		host = "127.0.0.1"
	End If
	If connected Then client.Close
	client.Initialize("client", $"tcp://${host}:${port}"$, "android" & Rnd(1, 10000000))
	Dim mo As MqttConnectOptions
	mo.Initialize("", "")
	'this message will be sent if the client is disconnected unexpectedly.
	mo.SetLastWill("all/disconnect", serializator.ConvertObjectToBytes(currentName), 0, False)
	client.Connect2(mo)
End Sub

Private Sub client_Connected (Success As Boolean)
	Log($"Connected: ${Success}"$)
	If Success Then
		connected = True
		client.Subscribe("all/#", 0)
		client.Publish2("all/connect", serializator.ConvertObjectToBytes(currentName), 0, False)
	Else
		Log("Error connecting: " & LastException)
	End If
End Sub

Private Sub client_MessageArrived (Topic As String, Payload() As Byte)
	Dim receivedObject As Object = serializator.ConvertBytesToObject(Payload)
	If Topic = "all/connect" Or Topic = "all/disconnect" Then
		'new client has connected or disconnected
		Dim newUser As String = receivedObject
		If isServer Then
			Log($"${Topic}: ${newUser}"$)
			Dim index As Int = users.IndexOf(newUser)
			If Topic.EndsWith("connect") And index = -1 Then users.Add(newUser)
			If Topic.EndsWith("disconnect") And index >= 0 Then users.RemoveAt(index)
			client.Publish2("all/users", serializator.ConvertObjectToBytes(users), 0, False)
		End If
	Else if Topic = "all/users" Then
'		Dim newUsers As List = receivedObject
		'CallSubDelayed2(Chat, "NewUsers", newUsers) 'this will start the chat activity if it wasn't started yet.
	Else
		Dim m As Message = receivedObject
		Log($"NEW MESSAGE : ${m}"$)
		'CallSub2(Chat, "NewMessage", m)
	End If
		
End Sub

Public Sub SendMessage(Body As String)
	If connected Then
		client.Publish2("all", CreateMessage(Body), 0, False)
	End If
End Sub

Private Sub CreateMessage(Body As String) As Byte()
	Dim m As Message
	m.Initialize
	m.Body = Body
	m.From = currentName
	Return serializator.ConvertObjectToBytes(m)
End Sub