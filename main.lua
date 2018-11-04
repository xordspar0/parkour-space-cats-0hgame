local block = require('block')

block_delay = 0.5

function love.load()
	blocks = {}
	block_timer = 0

	stripy = love.graphics.newImage('img/gray-stripey.cat')
	slate = love.graphics.newImage('img/slate-gray.cat')

	cat1 = love.math.random() * love.graphics.getHeight()
	cat2 = love.math.random() * love.graphics.getHeight()
end

function love.update(dt)
	block_timer = block_timer + dt
	if block_timer >= block_delay then
		block_timer = block_timer - block_delay
		local length = love.math.random() * 30 + 40
		local y = love.math.random() * love.graphics.getHeight()
		local newblock = block.create(love.graphics.getWidth() + length, y, length)
		table.insert(blocks, newblock)
	end

	for i, block in ipairs(blocks) do
		block.x = block.x - 1
	end
end

function love.draw()
	for i, block in ipairs(blocks) do
		block:draw()
	end

	love.graphics.draw(stripy, 10, cat1)
	love.graphics.draw(slate, 10, cat2)
end
