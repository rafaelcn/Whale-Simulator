gameover = {}

function gameover.load()
	if state == "gameover" then
		gui.newButton("Ressurect!", 100, 200, "ressurect")
		gui.newButton("Back to menu", 360, 200, "menu")
	end
end

function gameover.draw()
	love.graphics.setBackgroundColor(128, 171, 212)
  	love.graphics.printf("Oh whale, you've been krilled!\n\n", 0, 150, 800, "center")
	
	if state == "gameover" then
		gui.buttonDraw()
	end
end

function gameover.update(dt)

	-- TODO: A resurrect and a back to menu button.
	if state == "gameover" then
		gui.buttonHover()
	end
end
