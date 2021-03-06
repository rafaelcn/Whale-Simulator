--[[

]]

require("libs/AnAL")
require("title")
require("credits")
require("game")
require("facts")

gui = require "libs/GUI"

debug = true

function love.load()
   	state = "game"   
 
   	game.load()
   	title.load()
   	credits.load()
   	facts.load()
   
   	defaultFont = love.graphics.setNewFont("assets/fonts/OpenSans-Regular.ttf", 30)
end

function love.draw()
   if state == "title" then
      title.draw()
   elseif state == "game" then
      game.draw()
   elseif state == "credits" then
      credits.draw()
   elseif state == "gameover" then
      gameover.draw()
   elseif state == "facts" then
      facts.draw()
   end
	if debug then
		love.graphics.print(love.timer.getFPS(), 10, 10)
	end
end

function love.update(dt)
   if state == "title" then
      title.update(dt)
   elseif state == "game" then
      game.update(dt)
   elseif state == "credits" then
      credits.update(dt)
   elseif state == "gameover" then
      gameover.update(dt)
   elseif state == "facts" then
      facts.update(dt)
   end
end

function love.keypressed(key)
   if key == "`" then
      debug = not debug
   elseif key == "escape" then
      if state == "game" then
         love.load()
         whale.dir = nil
      elseif state == "title" then
         love.event.quit()
      end
   end   
end
