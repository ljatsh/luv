local luv  = require("luv")
local host = luv.net.getaddrinfo("www.baidu.com")
local sock = luv.net.tcp()
print("conn:", sock:connect(host, 80))
print("write:", sock:write("GET / HTTP/1.0\r\nHost: www.baidu.com\r\n\r\n"))
repeat
  local count, data = sock:read()

  if not count then
    print(data)
    break
  end

  print(count, data)
until false
