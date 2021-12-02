# CFSuControl

This script is designed to control CFsound units efficiently using any controller with a serial interface.

# Supported devices

The following list shows the models that have been tested with this script, but it will surely work on another model in the same series as well. 
  
|Model|Serial Port Type|Firmware|BASIC|
|---|---|---|---|
|CFSound III |Onboard DE9 RS-232|2.35|1.22|
|CFSound IV |Onboard DE9 RS-232|||
  
# Install

Simply add this [script](cfsound/cfsound.bas) and your content to the flash card and you can send the list of commands below to control playback.

# Commands Supported

The commands are case sensitive. 

|command (chars)|argument|
|---|---|
|PLAY|FILE|
|STOP|none|
|VOLUME|INT (0-60)|
|PTT|ON:1 OFF:0|

Command Syntax: ```<STX><command><space><argument><ETX>```

|command example|description|
|---|---|
|```PLAY AUDIO.WAV```|Play audio file called "audio.wav" in root directory|
|```VOLUME 50```|Set the volume to 50 percent of normal|
|```STOP```|Stop the currently playing media and clears the screen|
|```PTT 1```|Turn ON PPT Relay|

# BS Response

The response start with STX (02h) followed by the status byte and lastly an ETX (03h). 
  
```<STX><STATUS><ETX>```
  
When the unit starts up and has the script installed, the status **online** (02h) is sent.

```02h 02h 03h```
  
Unit responds automatically with **media_ended** (08h) when a file has finished playing:
  
```02h 08h 03h```

# DE9 RS-232
The RS-232 interface is a male DE9 connector. The following table illustrates the pinout.

|Pin|Description|Pin|Description|
|---|---|---|---|
|1|NC|2|Receive data into the device|
|3|Transmit data out of the device|4|Available 5V @ 500mA|
|5|Ground|6|NC|
|7|RTS|8|CTS|
|9|NC|||

Here is the DA15 male as viewed from the front of the CFSound units.

<img src=https://raw.githubusercontent.com/zarpli/BSuControl/main/images/DA-15_male.png width="300">

# Signaling Settings

The following are the default serial settings for a BrightSign player. They can be changed in the script.
|Default serial settings|
|---|
|Baud rate: 115200|
|Data: 8 bit|
|Parity: None|
|Stop: 1 bit|

The following diagram illustrates the behavior of the TX and RX signal:

<img src=https://raw.githubusercontent.com/zarpli/BSuControl/main/images/bit_diagram.png width="500">

# Use with Docklight

[Docklight](https://docklight.de/) is a testing, analysis and simulation tool for serial communication protocols.

Use the following project to use BrightSign unit connected to a PC running Windows OS.

[CFSuControl.ptp](docklight/CFSuControl.ptp)

<img src=https://raw.githubusercontent.com/zarpli/BSuControl/main/images/docklight.png width="800">

# Use with Arduino

[CFSound](https://github.com/zarpli/CFSound) is a library for Arduino.

# Media Files for Testing

[Media](https://github.com/zarpli/Media)

# YouTube

<a href="http://www.youtube.com/watch?feature=player_embedded&v=v_Xolq-GvfM" target="_blank"><img src="http://img.youtube.com/vi/v_Xolq-GvfM/0.jpg" alt="YouTube" width="400" border="10"/></a>
