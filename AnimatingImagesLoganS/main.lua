-- Title: Animating Images
-- Name: Logan S
-- Course: ICS2O/3C

-- This program animates images to move in all different directions and not leave the screen 

display.setStatusBar(display.HiddenStatusBar)

scrollSpeed = 3

local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

local mario = display.newImageRect("mario.gif", 200, 200)

mario.alpha = 0

mario.x = 0
mario.y = display.contentHeight/3

local squidward = display.newImageRect("squidward.png", 200, 200)

squidward.alpha = 0

squidward.x = display.contentHeight/3
squidward.y = 0


local function MoveSquidward(event)

squidward.y = squidward.y + scrollSpeed
squidward.x = squidward.x +scrollSpeed


squidward.alpha = squidward.alpha + 0.02
end


Runtime:addEventListener("enterFrame", MoveSquidward)


local function MoveMario(event)

mario.x = mario.x + scrollSpeed
mario.y = mario.y + scrollSpeed

mario.alpha = mario.alpha + 0.02
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveMario)

local wall1 = display.newImage ("ground.png")
local wall2 = display.newImage ("ground.png")
local ceiling = display.newImage("ground.png")
local grpund = display.newImage("ground.png")

wall1.x = display.contentWidth
wall1.y = display.contentHeight

ceiling.x = display.contentWidth
ceiling.y = display.contentHeight

wall2.x = display.contentWidth
wall2.y = display.contentHeight
