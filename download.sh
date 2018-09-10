
#!/bin/bash

#* lua51: curl -fSL http://www.lua.org/ftp/lua-5.1.5.tar.gz -o lua51/lua-5.1.5.tar.gz --progress
#* lua51: gyp -f xcode --generator-output=build --depth=. -Dbuild_type=Release  lua51/lua51.gyp

# libuv: curl -fSL https://github.com/ljatsh/libuv/archive/v1.23.0.zip -o libuv.zip --progress
# libuv: 'build_type%' : 'Release'
# libuv: gyp -f xcode --generator-output=build --depth=. -Dbuild_type=Release -Duv_library=static_library  -Ilibuv/common.gypi  libuv/uv.gyp

# luv: 