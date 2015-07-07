require "player"
require "mapcontrol"

function love.load()
map.load()
player.load()
end

function love.update(dt)
map.update()
player.update(dt)
end

function love.draw()
map.draw()
player.draw()
end
