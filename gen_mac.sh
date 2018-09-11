
# gyp -f xcode -Goutput_dir=build --generator-output=build --depth=. lua/lua.gyp

# xcodebuild -ARCHS="x86_64" -project build/lua/lua.xcodeproj -configuration Release -target liblua

# gyp -f xcode -Goutput_dir=build --generator-output=build --depth=. -Dtarget_arch=x86_64 -Dhost_arch=x86_64 -Duv_library=static_library  -Ilibuv/common.gypi  libuv/uv.gyp

# xcodebuild -ARCHS="x86_64" -project build/libuv/uv.xcodeproj -configuration Release -target libuv

gyp -f xcode -Goutput_dir=build --generator-output=build --depth=. -Dtarget_arch=x86_64 -Dhost_arch=x86_64 -Duv_library=static_library  -Ilibuv/common.gypi  test/mac/test.gyp

#xcodebuild -ARCHS="x86_64" -project build/src/luv.xcodeproj -configuration Release -target libluv