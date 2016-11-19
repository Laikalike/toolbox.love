local ASM = {}

function ASM:load()
  self.assets = {unassigned={}}
end

function ASM:add_asset(asset,id,c)
  local a = {asset = asset,id = id}
  if self.assets.c then
    table.insert(self.assets.c,a)
  else
    table.insert(self.assets.unassigned, a)
  end
end

function ASM:remove_asset(id,c)
  if self.assets.c then
    for i,a in ipairs(self.assets.c) do
      if a.id == id then
        table.remove(a.asset)
      end
    end
  else
    for i,a in ipairs(self.assets.unassigned) do
      if a.id == id then
        table.remove(a.asset)
      end
    end
  end
end

function ASM:add_category(c)
  local c = {}
  table.insert(self.assets, c)
end

function ASM:get(id, c)
  if self.assets.c then
    for i,a in ipairs(self.assets.c) do
      if a.id == id then
        return a.asset
      end
    end
  else
    for i,a in ipairs(self.assets.unassigned) do
      if a.id == id then
        return a.asset
      end
    end
  end
end

return ASM
