player = {}

function player.load()
player.x = 480
player.y = 96
player.xvel = 0
player.yvel = 0
player.px = 15
player.py = 3
fall = true
end

function player.update(dt)
player.phys(dt)
player.move()
player.xcollide()
player.ycollide(dt)
end

function player.draw()
love.graphics.setColor(255,0,0)
love.graphics.rectangle("fill",player.x,player.y,20,32)
end

function player.phys(dt)
player.x = player.x + player.xvel * dt
player.y = player.y + player.yvel * dt
end

function player.move()
if love.keyboard.isDown("a") then
player.xvel = -100
elseif love.keyboard.isDown("d") then
player.xvel = 100
else
player.xvel = 0
end
if love.keyboard.isDown("w") and fall == false then
player.y = player.y - 10
player.yvel = -200
fall = true
end
end

function player.xcollide()

if player.xvel > 0 then
player.px = math.ceil((player.x + 20)/32)
elseif player.xvel < 0 then
player.px = math.ceil(player.x/32) 
else
player.prex = 0
end

if TileTable[player.py][player.px] ~= 3 and TileTable[player.py][player.px] ~= 6 then
player.xvel = 0
end

end

function player.ycollide(dt)
player.py = math.ceil(player.y/32)
if (TileTable[player.py + 1][math.ceil(player.x/32)] == 3 and TileTable[player.py + 1][math.ceil((player.x + 20)/32)] == 3) or (TileTable[player.py + 1][math.ceil(player.x/32)] == 6 and TileTable[player.py + 1][math.ceil((player.x + 20)/32)] == 6) then
player.yvel = player.yvel + 300 * dt
else
player.yvel = 0
fall = false
end
end

