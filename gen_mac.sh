
gyp -f xcode --generator-output=build --depth=. lua/lua.gyp

#xcodebuild -ARCHS="x86_64" -project build/lua/lua.xcodeproj -configuration Release -target All

gyp -f xcode --generator-output=build --depth=. -Duv_library=static_library  -Ilibuv/common.gypi  libuv/uv.gyp

xcodebuild -ARCHS="x86_64" -project build/libuv/uv.xcodeproj -configuration Release -target All