local renderer = {}

local function drawCell(x, y, state)
  if state == 1 then
    love.graphics.setColor(255, 255, 255)
  else
    love.graphics.setColor(0, 0, 0)
  end
  love.graphics.rectangle("fill", x * FACTOR, y * FACTOR, FACTOR, FACTOR)
end

renderer.render = function(population)
  for x, row in ipairs(population.cells) do
    for y, cell in ipairs(row) do
      drawCell(x, y, cell)
    end
  end
end

return renderer
