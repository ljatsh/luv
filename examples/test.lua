
local luv = require('luv')

local main = luv.fiber.create(function()
  print('main started')

  local cond = luv.cond.create()
  print(cond)
  print('waiting condition')
  local second = luv.fiber.create(function()
    print(cond)
    print('second started')

    luv.sleep(1)
    print('second waked up')
    cond:signal(1)
    print('second exit')
  end, cond)
  second:ready()

  cond:wait()
end)

main:join()

