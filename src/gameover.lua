gameover = {}

function gameover.load()
	if state == "gameover" then
		gui.buttons = {}
		gui.newButton("Ressurect!", 100, 200, "ressurect")
		gui.newButton("Back to menu", 360, 200, "menu")
	end
end

function gameover.draw()
  	love.graphics.printf("Oh whale, you've been krilled!\n\n", 0, 150, 800, "center")
	
	if state == "gameover" then
		gui.buttonDraw()
	end
end

function gameover.update(dt)
  	--[[ swingers.update()
	if swingers.checkGesture() then
		gesture = swingers.getExtGesture()
  	end
   	if gesture[1] == "n" then
    	state = "title"
    	game.load()
   	end
	swingers.checkError()
	]]

	-- TODO: A resurrect and a back to menu button.
	gui.buttonHover()
end
