-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question on the screen and asks the user to answer in a numeric textfield.

--hide status bar
display.setStatusBar (display.HiddenStatusBar)

display.setDefault("background", 121/255, 199/255, 124/255)

----------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer = 0
local incorrectObject
local points = 0
local pointsText
local randomOperator

----------------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------------

audio.play (backgroundMusic, {loops = -1})
local incorrectSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")
local incorrectSoundChannel
local correctSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")
local correctSoundChannel

----------------------------------------------------------------------------
--FUNCTIONS
----------------------------------------------------------------------------

local function AskQuestion()
	randomOperator = math.random (1,4)


	if (randomOperator == 1) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	
	elseif (randomOperator == 3) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
		
	elseif (randomOperator == 4) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 / randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " ÷ " .. randomNumber2 .. " = "
	end
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)
	-- User begins editing "numericfield"
	if (event.phase == "began") then

		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		--when the answer is submitted (enter key pressed) set user input to user's answer
		userAnswer = tonumber (event.target.text)

		--if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- give a point if user gets right answer.
			points = points + 1
			--update it in the display object
			pointsText.text = "Points: " .. points
			correctObject.isVisible = true
			correctSoundChannel = audio.play (correctSound)
			timer.performWithDelay (2000, HideCorrect)
		else
			incorrectObject.text = "You got it wrong! The correct answer was " .. correctAnswer .." !"
			incorrectSoundChannel = audio.play (incorrectSound)
			incorrectObject.isVisible = true
			timer.performWithDelay (2000, HideIncorrect)
		end
	end
end

----------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------

--displays a question and sets the color
questionObject = display.newText ("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (255/255, 198/255, 155/255)

--create the correct text object and make it invisible
correctObject = display.newText ("Correct! You are so smart! Nice One!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor (255/255, 0/255, 0/255)
correctObject.isVisible = false

--create numeric field 
numericField = native.newTextField (display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener ("userInput", NumericFieldListener)

--create incorrect object - make it invisible
incorrectObject = display.newText ("You got it wrong! The correct answer was" .. correctAnswer .."!" , display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor (0/255, 0/255, 255/255)
incorrectObject.isVisible = false

-- display the amount of points as a text object
pointsText = display.newText ("Points: " .. points, display.contentWidth/3, display.contentHeight/3, nil, 50)

----------------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion ()