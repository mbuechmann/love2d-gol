population = require "population"

SIZE = 300
FACTOR = 2

pop = population.build(SIZE)

function drawCell(x, y, alive)
  if alive then
    love.graphics.setColor(255, 255, 255)
  else
    love.graphics.setColor(0, 0, 0)
  end
  love.graphics.rectangle("fill", x * FACTOR, y * FACTOR, FACTOR, FACTOR)
end
function drawPopulation(p)
  for x, row in ipairs(p.cells) do
    for y, cell in ipairs(row) do
      drawCell(x, y, cell)
    end
  end
end

function love.load()
  love.window.setMode(SIZE * FACTOR, SIZE * FACTOR)
end

function love.draw()
  love.graphics.clear()
  drawPopulation(pop)
end

function love.update(dt)
  pop.evolve()
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
