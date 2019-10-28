display.setStatusBar (display.HiddenStatusBar)

local triangleVerticies = {-120, 50, 120, 50, 0, -80 }
local Triangle =  display.newPolygon(510 ,375, triangleVerticies)

display.setDefault ("background", 0/255, 255/255, 0/255)

local quadrilateralVerticies = {40, 70, 90, 40, 110, -80, 80, -70}
local quadrilateral = display.newPolygon(700, 600, quadrilateralVerticies)

local HexagonVerticies = {-60, 50, -120, 150, -60, 240, 60, 240, 120, 150, 60, 50}
local hexagon = display.newPolygon(300, 100, HexagonVerticies)