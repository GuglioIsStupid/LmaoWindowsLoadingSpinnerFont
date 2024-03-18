local utf8 = require "utf8"
local chars = ""
local pause = 0
function love.load()
    font = love.graphics.newFont("segoe_slboot.ttf", 32)
    love.graphics.setFont(font)
    time = 0
end

function love.update(dt)
    time = time + dt*3.5
    if pause > 0 then
        pause = pause - dt
        if pause <= 0 then
            time = 0
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" then
        time = 0
    end
end

function love.draw()
    local currentChar = math.floor(time * 10) % utf8.len(chars) + 2
    if currentChar > utf8.len(chars) then
        currentChar = 1
        pause = 0.35
    end
    if pause > 0 then return end
    love.graphics.print(string.sub(chars, utf8.offset(chars, currentChar), utf8.offset(chars, currentChar + 1) - 1), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, font:getWidth("") / 2, font:getHeight() / 2)
end