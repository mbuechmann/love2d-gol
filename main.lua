Population = require "population"
local renderer = require "renderer"
local pop

function love.load()
  SIZE = 500
  FACTOR = 2

  pop = Population:new(SIZE)

  love.window.setMode(SIZE * FACTOR, SIZE * FACTOR)
end

function love.draw()
  love.graphics.clear()
  renderer.render(pop)
end

function love.update(dt)
  pop:evolve()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
