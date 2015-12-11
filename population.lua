local p = {}

local function countNeighbours(cells, x, y)
  local count = 0

  for dx = x - 1, x + 1 do
    for dy = y - 1, y + 1 do
      if cells[dx] and cells[dx][dy] and (dx ~= x or dy ~= y) then
        count = count + 1
      end
    end
  end

  return count
end

function p.build(size)
  local pop = {}
  local cells = {}
  local nextCells = {}
  local neighbourCounts = {}
  for x = 1, size do
    cells[x] = {}
    nextCells[x] = {}
    for y = 1, size do
      cells[x][y] = (math.random() < 0.1)
      nextCells[x][y] = false
    end
  end

  local function evolve()
    for x = 1, size do
      for y = 1, size do
        local c = countNeighbours(pop.cells, x, y)
        nextCells[x][y] = (c == 3) or (c == 2 and pop.cells[x][y])
      end
    end
    pop.cells, nextCells = nextCells, pop.cells
  end

  pop.cells = cells
  pop.evolve = evolve
  return pop
end

return p
