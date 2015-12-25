local Population = {}

function Population:new(size)
  o = {}
  setmetatable(o, self)
  self.__index = self

  self.size = size or 100
  self.cells = {}
  self.nextCells = {}
  self.neighbourCounts = {}

  self:initCells(self.cells, self.nextCells, self.size)

  return o
end

function Population:initCells()
  for x = 1, self.size do
    self.cells[x] = {}
    self.nextCells[x] = {}
    for y = 1, self.size do
      if (math.random() < 0.1) then
        self.cells[x][y] = 1
      else
        self.cells[x][y] = 0
      end

      self.nextCells[x][y] = 0
    end
  end
end

function Population:evolve()
  for x = 1, self.size do
    for y = 1, self.size do
      local c = self:countNeighbours(x, y)
      if (c == 3) or (c == 2 and self.cells[x][y] == 1) then
        self.nextCells[x][y] = 1
      else
        self.nextCells[x][y] = 0
      end
    end
  end
  self.cells, self.nextCells = self.nextCells, self.cells
end

function Population:countNeighbours(x, y)
  return  self:valueAt(x - 1, y - 1) +
          self:valueAt(x, y - 1) +
          self:valueAt(x + 1, y - 1) +
          self:valueAt(x - 1, y) +
          self:valueAt(x + 1, y) +
          self:valueAt(x - 1, y + 1) +
          self:valueAt(x, y + 1) +
          self:valueAt(x + 1, y + 1)
end

function Population:valueAt(x, y)
  if self.cells[x] then
    return self.cells[x][y] or 0
  end

  return 0
end

return Population
