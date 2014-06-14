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
		love.graphics.print("atan2: ", 10, 40)
		love.graphics.print(angle, 100, 40)
		love.graphics.print("MouseX: ", 10, 60)
		love.graphics.print(mouseX, 100, 60)
		love.graphics.print("MouseY: ", 10, 80)
		love.graphics.print(mouseY, 100, 80)
	end

	love.graphics.draw(whaleImage, whale.x, whale.y, angle, 1, 1, 16, 32)
	
end

function whale.update(dt)
	--whale_anim:update(dt)
	
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()

	angle = math.atan2(mouseY-whale.y, mouseX-whale.x)

	

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
