#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import math
from pcbnew import *

pcb = GetBoard()

ToUnits = ToMM
FromUnits = FromMM

Radius = 150.0/2.0
NumLEDs = 256
NumDrivers = math.ceil(NumLEDs / 16)
HalfAngle = 170.0
CompHeight = 2.8
DriverRadius = Radius - 15
CapAngle = 3.5
CapRadius = Radius - 27
CenterX = 108.50626
CenterY = 99.62642

#Chips = ["32", "28", "31", "27", "26", "30", "25", "29", "24", "20", "23", "19", "18", "22", "17", "21", "16", "12", "15", "11", "10", "14", "09", "13", "08", "04", "07", "03", "02", "06", "01", "05"]
Sheets = ["5", "6", "7", "8", "9", "10", "11", "12"]

allComponents = pcb.GetModules()

def rotate(angle):
    for comp in allComponents:
        if comp.Reference().IsSelected():
            comp.Reference().ClearSelected()


    Refresh()

def place():
    cnt = 0
    #place LEDs
    for sheet in Sheets:
        for chip in range(32):
            LED = "DP" + sheet + '{:02d}'.format(chip+1)
            positionLED(cnt, LED)
            cnt = cnt + 1

    #place LED drivers
    cnt = 0
    for sheet in Sheets:
        positionDriver(cnt, "U" + sheet + "01");
        positionDriver(cnt+1, "U" + sheet + "02");
        cnt += 2

    #place big caps
    cnt = 0
    for sheet in Sheets:
        positionCap(cnt, sheet)
        positionCap(cnt+1, sheet)
        cnt += 2

    Refresh()

def getDriverAngle(idx):
    if(idx < NumDrivers/2):
        angle = 90.0 + HalfAngle / (NumDrivers/2.0) * idx + HalfAngle / (NumDrivers/2.0) / 2
    else:
        #angle = 90.0 - HalfAngle / (NumDrivers/2.0) * (idx - NumDrivers/2.0 + 1) + HalfAngle / (NumDrivers/2.0) / 2 - (HalfAngle / (NumLEDs/2.0) )
        angle = 90.0 - HalfAngle / (NumDrivers/2.0) * (idx - NumDrivers/2.0 + 1) + HalfAngle / (NumDrivers/2.0) / 2  - (HalfAngle / (NumLEDs/2.0)/2 )
    return angle

def positionCap(idx, sheetName):
    angle = getDriverAngle(idx)

    if(idx % 2):
        part1 = pcb.FindModuleByReference("C" + sheetName + "06")
        part2 = pcb.FindModuleByReference("C" + sheetName + "10")
    else:
        part1 = pcb.FindModuleByReference("C" + sheetName + "01")
        part2 = pcb.FindModuleByReference("C" + sheetName + "05")

    x1 = math.cos(math.radians(angle-CapAngle)) * CapRadius + CenterX
    y1 = -math.sin(math.radians(angle-CapAngle)) * CapRadius + CenterY
    part1.SetPosition(wxPoint(FromUnits(x1), FromUnits(y1)))
    part1.SetOrientation((angle+180) * 10.0)
    part1.SetLocked(True)

    x2 = math.cos(math.radians(angle+CapAngle)) * CapRadius + CenterX
    y2 = -math.sin(math.radians(angle+CapAngle)) * CapRadius + CenterY
    part2.SetPosition(wxPoint(FromUnits(x2), FromUnits(y2)))
    part2.SetOrientation((angle+180) * 10.0)
    part2.SetLocked(True)

def positionDriver(idx, partName):
    
    part = pcb.FindModuleByReference(partName)
    angle = getDriverAngle(idx)

    if(idx < NumDrivers/2):
        part.SetOrientation((angle+90.0)*10.0)
    else:
        part.SetOrientation((angle+90.0) *10.0)

    
    angleRad = math.radians(angle)

    x = math.cos(angleRad) * DriverRadius + CenterX
    y = -math.sin(angleRad) * DriverRadius + CenterY

    
    part.SetPosition(wxPoint(FromUnits(x), FromUnits(y)))
    part.SetLocked(True)
    

def positionLED(idx, partName):
    if idx < NumLEDs/2:
        angle =  90.0 + HalfAngle / (NumLEDs/2.0) * idx
    else:
        angle = 90.0 - HalfAngle / (NumLEDs/2.0) * (((math.floor(idx/16)+1)*16 - idx % 16) - NumLEDs/2.0) - (HalfAngle / (NumLEDs/2.0) / 2 )

    angleRad = math.radians(angle)

    x = math.cos(angleRad) * Radius + CenterX
    y = -math.sin(angleRad) * Radius + CenterY

    part = pcb.FindModuleByReference(partName)
    part.SetPosition(wxPoint(FromUnits(x), FromUnits(y)))
    part.SetOrientation((angle-90.0)*10.0)
    part.SetLocked(True)

    ref = part.Reference()
    ref.SetKeepUpright(False)
    ref.SetTextAngle(900)

    xr = math.cos(angleRad) * (Radius - CompHeight) + CenterX
    yr = -math.sin(angleRad) * (Radius - CompHeight) + CenterY
    ref.SetPosition(wxPoint(FromUnits(xr), FromUnits(yr))) 

    ref.SetTextHeight(FromUnits(0.6))
    ref.SetTextWidth(FromUnits(0.6))

    #print "> Part %d: %f %s at %s"%(idx, angle, part.GetReference(),part.GetPosition())









