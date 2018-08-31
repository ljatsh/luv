
local luv = require('luv')

local con

local main =  luv.fiber.create(function()
  print('main started')

  cond = luv.cond.create()
  print(cond)

  local second = luv.fiber.create(function()
    print('second started')
    print(cond)
  
    luv.sleep(1)
    print('second waked up')
  
    cond:signal('hello', {}, false, 1)
    print('second exit')
  end, cond)
  second:ready()

  print('waiting condition')
  print('wait result: ', cond:wait(main))

  print('main sleeping...')

  luv.sleep(2)

  print('main waked')

  print('main ended')
end)

print('joining....')
main:join()

