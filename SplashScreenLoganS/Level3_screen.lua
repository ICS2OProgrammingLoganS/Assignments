-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3

-- background image with width and height
--local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- logo image with width and height
local logo = display.newImageRect("Images/CompanyLogoLoganS@2x-Recovered.png", 200, 200)

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
	logo.x = logo.x + scrollSpeed
	logo.y = logo.y + scrollSpeed

	-- change the transparency of the logo every time it moves so fast that it fades out
	logo.alpha = logo.alpha + 0.01
end

-- Movelogo will be called over and over again
Runtime:addEventListener("enterFrame", MoveLogo)