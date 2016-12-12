#Persistent
#SingleInstance, Force
#NoEnv
Menu, tray, icon, %A_ScriptDir%\SetBrightness.ico
Bright := 100

ShowBanner(Bright)
{
	SysGet, MonPrimary, MonitorPrimary
	SysGet, Mon, Monitor, %MonPrimary%
	x = %MonLeft%
	y = % (MonBottom / 2) - 100
	w = %MonRight%
	xtext = % (MonRight / 2) - 450
	Gui, 1:Destroy
	Gui, 1:+AlwaysOnTop -Caption +Owner +LastFound +E0x20
	Gui, 1:Margin, 0, 0
	Gui, 1:Color, Black
	Gui, 1:Font, cWhite s50 bold, Arial
	Gui, 1:Add, Text, x%xtext% y60, Setting Brightness at %Bright%`%
	WinSet, Transparent, 200
	Gui, 1:Show, NoActivate x%x% y%y% h200 w%w%
	SetTimer, HideBanner, -1500
}

HideBanner()
{
	Gui, 1:Destroy
}

ChangeBrightness(Bright)
{
	if (Bright == 0) {
		Transparency := 200
	} else if (Bright == 10) {
		Transparency := 180
	} else if (Bright == 20) {
		Transparency := 160
	} else if (Bright == 30) {
		Transparency := 140
	} else if (Bright == 40) {
		Transparency := 120
	} else if (Bright == 50) {
		Transparency := 100
	} else if (Bright == 60) {
		Transparency := 80
	} else if (Bright == 70) {
		Transparency := 60
	} else if (Bright == 80) {
		Transparency := 40
	} else if (Bright == 90) {
		Transparency := 20
	} else if (Bright == 100) {
		Transparency := 0
	}
	SysGet, MonCount, MonitorCount
	Loop, %MonCount%
	{
		SysGet, Mon, Monitor, %A_Index%
		Gui, 2:+AlwaysOnTop -Caption +Owner +LastFound +E0x20
		Gui, 2:Margin, 0, 0
		Gui, 2:Color, Black
		WinSet, Transparent, %Transparency%
		Gui, 2:Show, NoActivate x0 y0 h%MonBottom% w%MonRight%
	}
}

!+Up::
	Bright := Bright + 10
	If (Bright > 100) {
		Bright = 100
	}
	ShowBanner(Bright)
	ChangeBrightness(Bright)
Return

!+Down::
	Bright := Bright - 10
	If (Bright < 0) {
		Bright = 0
	}
	ShowBanner(Bright)
	ChangeBrightness(Bright)
Return
