--[[
	Author: Rafael C. Nunes(ranu)

	A simple library to generate buttons and other GUI stuff.
]]

button = {}
local F = {}

function F.newButton(text, x, y, id)
	table.insert(button, {text = text, x = x, y = y, id = id, mouseOver = false})
end

-- This function draw all the buttons of the button table onto the screen
function F.buttonDraw()
	for key,value in ipairs(button) do
		if value.mouseOver == false then
			love.graphics.setColor(242, 242, 242)
		elseif value.mouseOver == true then
			love.graphics.setColor(0, 0, 0)
		end	
		love.graphics.setFont(openSans)
		love.graphics.printf(value.text, value.x, value.y, 250, 'center')
	end
end

function F.buttonClick(x, y)
	for key, value in ipairs(button) do
		if x > value.x and x < value.x + openSans:getWidth(value.text) and
		y > value.y and y < value.y + openSans:getWidth(value.text) then
			if value.id == "start" then
				state = "game"
			end
			
			if value.id == "credits" then
				state = "credits"
			end

			if value.id == "options" then
				state = "options"
			end

			if value.id == "quit" then
				love.event.push("quit")
			end
			
			if value.id == "menu" then
				state = "title"
			end

			if value.id == "ressurect" then
				state = "game"
			end
		end
	end
end

function F.buttonHover()
	for key, value in ipairs(button) do
		if mouseX > value.x 
		and mouseX < value.x + openSans:getWidth(value.text)
		and mouseY > value.y 
		and mouseY < value.y + openSans:getHeight(value.text) then
			value.mouseOver = true
		else
			value.mouseOver = false
		end
	end
end

return F
