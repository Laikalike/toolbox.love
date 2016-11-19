local Vec = {}

function Vec:new(x,y)
  local v = {}
  v.x,v.y = x or 0,y or 0
  return v
end

function Vec:clone(i)
  return Vec:new(i.x,i.y)
end

function Vec:op(t,i,j)
  if t == "add" then
    return Vec:new(i.x+j.x, i.y+j.y)
  elseif t == "sub" then
    return Vec:new(i.x-j.x, i.y-j.y)
  elseif t == "mul" then
    return Vec:new(i.x*j.x, i.y*j.y)
  elseif t == "div" then
    return Vec:new(i.x/j.x, i.y/j.y)
  else
    error("Vec:math argument 1 not given in form of add, sub, mul or div, check traceback.")
  end
end

function Vec:distance(i,j)
  local distx, disty = i.x - j.x, i.y - j.y
  return math.sqrt(distx * distx + disty * disty)
end

function Vec:invert(i)
  return Vec:new(-i.x,-i.y)
end

function Vec:unpack(i)
  return i.x, i.y
end

return Vec
