require("whale")
require("krill")
require("boat")
require("ui")

game = {}

function game.load()
   krill.load()
   whale.load()
   boat.load()
   
   seabed_spr = love.graphics.newImage("assets/seabed.png")
   
   local waves_spr = love.graphics.newImage("assets/waves.png")
   waves_anim = newAnimation(waves_spr, 100, 100, 2, 3)
   
   game.score = 0
   game.round = 1
end

function game.draw()
	for i = 0,7 do
		for j = -1,6 do
		   love.graphics.setColor(35, 98, 145)
			love.graphics.draw(seabed_spr, i*100, j*100)
			love.graphics.setColor(255, 255, 255)
		end
	end
	krill.draw()
	whale.draw()
	for i = 0,7 do
		for j = -1,6 do	   
	      waves_anim:draw(i*100,j*100)
		end
	end
	boat.draw()
	ui.draw()
end

function game.update(dt)
   krill.update(dt)
   whale.update(dt)
   boat.update(dt)
   waves_anim:update(dt)
   if game.dist(boatCur.x, boatCur.y, boatDest.x, boatDest.y) then
      boat.destChoice()
   end
   
   for ei,ev in ipairs(krill.swarms) do
		if game.dist(whale.x, whale.y, ev.x, ev.y) < (16+16) then
			table.remove(krill.swarms,ei)
			game.score = game.score + 10
			whale.hunger = whale.hunger + 10
			if whale.hunger > 100 then
	         whale.hunger = 100
	      end
		end
	end
end

function game.dist(x1,y1,x2,y2)
	return math.sqrt( (x1 - x2)^2 + (y1 - y2)^2 )
end