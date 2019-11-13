-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3
local logo

-- logo image with width and height
logo = display.newImageRect("Images/squidward.png", 200, 200)

-- set logo to be transparent
logo.alpha = 0

--set the x and y position of logo
logo.x = display.contentHeight/3
logo.y = 0

-- Function: Movelogo
-- Input: this function accepts an event listener
-- Output: none
-- Desciption: This function adds the scroll speed to the y-value of the logo
local function MoveLogo(event)
-- add the scroll speed to the x-value of the ship
logo.y = logo.y + scrollSpeed
logo.x = logo.x + scrollSpeed

-- change the transparency of the ship every time it moves so fast that it fades out
logo.alpha = logo.alpha + 0.01
end

-- Movelogo will be called over and over again
Runtime:addEventListener("enterFrame", MoveLogo)