local luv  = require("luv")
local host = luv.net.getaddrinfo("www.google.com")
local sock = luv.net.tcp()
print("conn:", sock:connect(host, 80))
print("write:", sock:write("GET / HTTP/1.0\r\nHost: www.google.com\r\n\r\n"))
repeat 
  local count, data = sock:read()

  if count == false then
    print(data)
    break
  end

  print(count, data)

  if count == 0 then
    break
  end
until false
