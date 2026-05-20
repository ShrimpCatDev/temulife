local blorp={}

function blorp:init()
    self.img=lg.newImage("assets/sprites/blorp.png")
    self.w,self.h=8,8
    self.quads={}
    for i=0,2 do
        table.insert(self.quads,lg.newQuad(self.w*i,0,self.w,self.h,self.img:getWidth(),self.img:getHeight()))
    end
    self.blorps={}
    self.gravity=480
end

function blorp:new(x,y,bodyColor,eyeColor,cheekColor)
    table.insert(self.blorps,{x=x,y=y,z=0,w=self.w,h=self.h,colors={bodyColor,eyeColor,cheekColor},vx=0,vy=0,vz=0,moving=false,flip=false})
end

function blorp:update(dt)
    for k,v in pairs(self.blorps) do
        v.vz=v.vz+self.gravity*dt
        v.z=v.z+v.vz*dt
        if v.z>=0 then
            if v.moving then v.vz=-50 else v.vz=0 end
            local rnd=10
            if love.math.random(0,rnd)==rnd-1 then
               v.moving=not v.moving 
               if v.moving then
                    local s=20
                    v.vx=math.random(-s,s)
                    v.vy=math.random(-s,s)
                    if v.vx>0 then
                        v.flip=false
                    elseif v.vx<0 then
                        v.flip=true
                    end
               else
                    v.vx,v.vy=0,0
               end
            end
            v.z=0
        end
        v.x=v.x+v.vx*dt
        v.y=v.y+v.vy*dt
        v.x=clamp(v.x,0,conf.gW-v.w)
        v.y=clamp(v.y,0,conf.gH-v.h)
    end
end

function blorp:draw()
    beginDraw()
        for k,v in pairs(self.blorps) do
            for i=1,#self.quads do
                lg.setColor(v.colors[i])
                if not v.flip then
                    lg.draw(self.img,self.quads[i],v.x,v.y+v.z)
                else
                    lg.draw(self.img,self.quads[i],v.x+v.w,v.y+v.z,0,-1,1)
                end
            end
        end
    endDraw()
end

return blorp