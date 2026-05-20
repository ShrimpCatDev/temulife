require("init")

function love.load()
    gs=require("lib/hump/gamestate")
    gs.registerEvents()

    state={
        planet=require("state/planet")
    }
    gs.switch(state.planet)

    font = lg.newFont("assets/font/Able 5.ttf",9)--require("assets/font/skull")
    lg.setFont(font)
    shove.createLayer("game")
end

function love.update(dt)
    input:update()
end 

function love.draw()
    beginDraw()
        
    endDraw()
end
