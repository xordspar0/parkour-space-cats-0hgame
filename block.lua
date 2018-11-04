local block = {}
block.__index = block

block.h = 30

function block.create(x, y, l)
	local self = {}
	setmetatable(self, block)

	self.x = x
	self.y = y
	self.l = l

	return self
end

function block:draw()
	love.graphics.rectangle('fill', self.x, self.y, self.l, self.h)
end

return block
