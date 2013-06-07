require("swingers")
require("AnAL")
require("title")
require("credits")
require("game")
debug = false

function love.load()
   state = "title"
   
   swingers.start()
   gesture = {}
   
   game.load()
   title.load()
   
   silkscreen = love.graphics.newFont("assets/slkscre.ttf", 20)
   love.graphics.setFont(silkscreen)
end

function love.draw()
   if state == "title" then
      title.draw()
   elseif state == "game" then
      game.draw()
   elseif state == "credits" then
      credits.draw()
   end
   if debug then
	   love.graphics.print(love.timer.getFPS(), 100, 100)
	end
end

function love.update(dt)
   if state == "title" then
      title.update(dt)
   elseif state == "game" then
      game.update(dt)
   elseif state == "credits" then
      credits.load()
      credits.update(dt)
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