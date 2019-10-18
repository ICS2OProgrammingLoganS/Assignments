display.setStatusBar (display.HiddenStatusBar)

local triangleVerticies = {-120, 50, 120, 50, 0, -80 }
local Triangle =  display.newPolygon(510 ,375, triangleVerticies)

display.setDefault ("background", 0/255, 255/255, 0/255)

local paralellogramVerticies = {40, 70, 90, 40, 110, -80, 80, -70}
local paralellogram = display.newPolygon(700, 600, paralellogramVerticies)