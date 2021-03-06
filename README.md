# CFSuControl

This script is designed to control CFSound units efficiently using any controller with a serial interface.

# Supported devices

The following list shows the models that have been tested with this script, but it will surely work on another model in the same series as well. 
  
|Model|REV|SDRAM|Firmware|BASIC|
|---|---|---|---|---|
|CFSound III|3A|[4.20](firmware/CFSound3_Rev3_Firmware_v4_20_SDRAM.zip)|2.35|1.22|
|CFSound III|4A|[4.39](firmware/CFSound3_Rev4_Firmware_v4_39_SDRAM.zip)|2.35|1.34|
|CFSound IV|||3.3.2|
  
# Install

Simply add this [script](cfsound/cfsound.bas) and your content to the flash card and you can send the list of commands below to control playback.

# Commands Supported

The commands are case sensitive. 

|command (chars)|argument|
|---|---|
|PLAY|FILE|
|STOP|none|
|VOLUME|INT (0-100)|
|PTT|ON: 1 OFF: 0|

Command Syntax: ```<STX><command><argument><ETX>```

|command example|description|
|---|---|
|```PLAY audio.wav```|Play audio file called "audio.wav" in root directory|
|```VOLUME 50```|Set the volume to 50%|
|```STOP```|Stop the currently playing media|
|```PTT 1```|Turn ON PPT Relay|

# CFS Response

The response start with STX (02h) followed by the status byte and lastly an ETX (03h). 
  
```<STX><STATUS><ETX>```
  
When the unit starts up and has the script installed, the status **online** (02h) is sent.

```02h 02h 03h```
  
Unit responds automatically with **media_ended** (08h) when a file has finished playing:
  
```02h 08h 03h```

# Time between commands

In some versions of CF Sound units is need a time between commands.

```C++
...
// set volume 10%
volume(10)
// delay 2 milliseconds
delay(2)
// play audio.wav
play(audio.wav)
// delay 2 milliseconds
delay(2)
// turn on built-in ptt relay
ptt(1)
// delay 2 milliseconds
delay(2)
...
```

# DE9 RS-232
The RS-232 interface is a male DE-09 connector. The following table illustrates the pinout.

|Pin|Description|Pin|Description|
|---|---|---|---|
|1||2|Receive data into the device|
|3|Transmit data out of the device|4||
|5|Ground|6||
|7||8||
|9||||

Here is the DE-09 male as viewed from the front of the CFSound units.

<img src=https://raw.githubusercontent.com/zarpli/BSuControl/main/images/DE-09-M.png width="300">

The configuration of jumper block JB2 on the CFSound-III controls whether the serial port looks like a 
Modem (DCE) or a Terminal (DTE). As shipped, the CFSound-III is configured to be DCE.

|Pin|JB2 = DCE|JB2 = DTE|
|---|---|---|
|2|TX (from unit)|RX (to unit)|
|3|RX (to unit)|TX (from unit)|
|5|Ground(GND)|Ground(GND)|

<img src=https://raw.githubusercontent.com/zarpli/CFSuControl/main/images/CFSound_JB2.jpg width="500">

# Signaling Settings

The following are the serial settings, they can be changed in the script.
|Serial settings|
|---|
|Baud rate: 115200|
|Data: 8 bit|
|Parity: None|
|Stop: 1 bit|

The following diagram illustrates the behavior of the TX and RX signal:

<img src=https://raw.githubusercontent.com/zarpli/BSuControl/main/images/bit_diagram.png width="500">

# Use with Docklight

[Docklight](https://docklight.de/) is a testing, analysis and simulation tool for serial communication protocols.

Use the following project to use CFSound unit connected to a PC running Windows OS.

[CFSuControl.ptp](docklight/CFSuControl.ptp)

<img src=https://raw.githubusercontent.com/zarpli/CFSuControl/main/images/docklight.png width="800">

# Use with Arduino

[CFSound](https://github.com/zarpli/CFSound) is a library for Arduino.

# Media Files for Testing

[Media](https://github.com/zarpli/Media)

# YouTube

<a href="http://www.youtube.com/watch?feature=player_embedded&v=j8EwE3pnMcg" target="_blank"><img src="http://img.youtube.com/vi/j8EwE3pnMcg/0.jpg" alt="YouTube" width="400" border="10"/></a>
