local p = {}

local function valueAt(cells, x, y)
  if cells[x] and cells[x][y] then
    return 1
  end

  return 0
end

local function countNeighbours(cells, x, y)
  return  valueAt(cells, x - 1, y - 1) +
          valueAt(cells, x, y - 1) +
          valueAt(cells, x + 1, y - 1) +
          valueAt(cells, x - 1, y) +
          valueAt(cells, x + 1, y) +
          valueAt(cells, x - 1, y + 1) +
          valueAt(cells, x, y + 1) +
          valueAt(cells, x + 1, y + 1)
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
