local planet={}

function planet:enter()
    self.blorps=require("tool/blorp")
    self.blorps:init()

    for i=0,50 do
        self.blorps:new(love.math.random(0,conf.gW-8),love.math.random(0,conf.gH-8),{1,1,1},{0.1,0.5,1},{1,0.8,0.75})
    end
end

function planet:update(dt)
    self.blorps:update(dt)
end

function planet:draw()
    self.blorps:draw()
end

return planet