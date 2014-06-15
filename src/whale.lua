whale = {}

function whale.load()
   	whale.isHurt = false
   	whale.hurtRemaining = 0
   	whale.x = 400
   	whale.y = 300
   	whale.dir = 0
   	whale.speed = 50
   	whale.hunger = 100
   	whale.health = 100
   	local whale_sprite = love.graphics.newImage("assets/textures/whale.png")
   	--whale_sprite:setFilter("nearest", "nearest")
	--whale_anim = newAnimation(whale_sprite, 32, 64, 1, 3)
end

function whale.draw()
   	if whale.isHurt then
   	   love.graphics.setColor(255, 0, 0)
   	else
   	   love.graphics.setColor(255, 255, 255)
   	end
	
	local whaleImage = love.graphics.newImage("assets/textures/simple_whale.png")
	
	if debug == true then
		love.graphics.print("atan2: "..tostring(angle), 10, 40)
		love.graphics.print("MouseX: "..tostring(mouseX), 10, 60)
		love.graphics.print("MouseY: "..tostring(mouseY), 10, 80)
		love.graphics.print("WhaleX: "..tostring(whale.x), 10, 100)
		love.graphics.print("WhaleY: "..tostring(whale.y), 10, 120)
		love.graphics.print("Distance: "..tostring(distance), 10, 140)
		love.graphics.print(game.getTimer(), 10, 160)
	end

	--love.graphics.draw(whaleImage, whale.x, whale.y, angle+1, 1, 1, 16, 32)
	love.graphics.draw(whaleImage, whale.x, whale.y, angle, 1, 1, 16, 0)
end

function whale.update(dt)
	--whale_anim:update(dt)
	
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	
	angle = math.atan2(mouseY-whale.y, mouseX-whale.x) 

	-- finding the distance between the mouse and the whale
	distance = dist(whale.x, mouseX, whale.y, mouseY)
	
	local whaleToMouse = {
		x = mouseX - whale.x,
		y = mouseY - whale.y
	}

	local fraction = 1/100
	
	whale.x = whale.x + (whaleToMouse.x * fraction)
	whale.y = whale.y + (whaleToMouse.y * fraction)

	if whale.x < 0 then
		whale.x = 800
	elseif whale.x > 800 then
		whale.x = 0
	end
	
	if whale.y < 0 then
	   whale.y = 600
	elseif whale.y > 600 then
	   whale.y = 0
	end
	
	if whale.hunger > 50 then
	   whale.hunger = whale.hunger - 1*dt
	   if whale.health < 100 then
	      whale.health = whale.health + 0.5*dt
	   end
	elseif whale.hunger > 0 then
	   whale.hunger = whale.hunger - 1*dt 
	else
	   whale.health = whale.health - 2*dt
	end
	
	if whale.health < 0 then
	   state = "gameover"
	end
	
	if whale.isHurt then
	   whale.hurtRemaining = whale.hurtRemaining - dt
	      if whale.hurtRemaining <= 0 then
	         whale.isHurt = false
	      end
	end
end

function dist(x1, x2, y1, y2)
	deltaX = x2 - x1
	deltaY = y2 - y1
	return math.sqrt(((deltaX)^2)+((deltaY)^2))
end
