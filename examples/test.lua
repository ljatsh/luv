
local luv = require('luv')

local idle = luv.idle.create()
idle:start()

-- local idle_count = 0
-- local f1 = luv.fiber.create(function()
--    while true do
--       idle:wait()
--       idle_count = idle_count + 1
--    end
-- end)

-- f1:ready()

local looptimes = 0
local main = luv.fiber.create(function()
  for i=1, 3 do print(luv.fiber.yield(i)) end

  local count = 1
  local last_count = 0
  repeat
    luv.sleep(0.033333)
    --print('waked up at time ', count, ' ; idle count ', idle_count, ' delta ', idle_count - last_count)
    print('waked up at time ', count, ' loop times ', looptimes)
    --print(string.format('waked %d, looptimes %d', count, looptimes))
    count = count + 1
    last_count = idle_count
  until false
end)

-- main:ready()
-- while true do
-- --main:runonce()
-- idle:wait()
-- looptimes = looptimes + 1
-- end

-- main:join()
