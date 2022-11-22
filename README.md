# SaltyNUI

## What does it do?
It opens a UI which tells the player, that he is not connected with TeamSpeak.
On connect, the UI will disappear - on disconnect, the UI will appear.

## Installation
### Step 1
> Download GitHub Repository
### Step 2
> Extract the files and upload them to your server
### Step 3
> Open your server.cfg and add "start SaltyNUI". Make sure it starts after the SaltyChat Plugin.
### Step 4
### SaltyChat Version 1.x.x
> Open the SaltyChat C# solution in Visual Studio
> Open SaltyClient/VoiceManager.cs
> Go to Line ~560 and add the following under "if (pluginCommand.TryGetPayload(out PluginState pluginState))":
`if(pluginState.IsReady){
   BaseScript.TriggerEvent("SaltyNUI:TsActive");
 }else{
   BaseScript.TriggerEvent("SaltyNUI:TsNotActive");
 } `
 > Go to Line ~500 and add the following to the OnDisconnected Event:
 `BaseScript.TriggerEvent("SaltyNUI:TsNotActive")`
 > Compile SaltyChat
 > Reupload SaltyChat to your server
