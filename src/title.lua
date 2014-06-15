--[[

]]

title = {}

local menu = {newGame = "NEW GAME", credits="CREDITS", options = "OPTIONS", exit = "QUIT"}

function title.load()
	openSansSmall = love.graphics.newFont("assets/fonts/OpenSans-Regular.ttf", 20)
	openSans = love.graphics.newFont("assets/fonts/OpenSans-Regular.ttf", 30)
	openSansBold = love.graphics.newFont("assets/fonts/OpenSans-Bold.ttf", 30);
   	
	love.graphics.setFont(openSansBold)

	gui.newButton(menu.newGame, 200, 300, "start") 
	gui.newButton(menu.options, 200, 340, "options")
	gui.newButton(menu.credits, 200, 380, "credits")
	gui.newButton(menu.exit, 200, 420, "quit")
end

function title.draw()
	love.graphics.setFont(openSansBold)
   	love.graphics.setBackgroundColor(128, 171, 212)
   	love.graphics.printf("Whale Simulator", 0, 80, 300, "center")

	-- One call, and everything will be drawn :P
	gui.buttonDraw()
end

function title.update(dt)
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()

	-- check for button hover
	if state == "title" then
		gui.buttonHover()
	end
end

function love.mousepressed(x, y)
	if state == "title" then
		gui.buttonClick(x, y)
	end

	if state == "credits" then
		gui.buttonClick(x, y)
	end
end
