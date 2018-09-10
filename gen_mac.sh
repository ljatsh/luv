
gyp -f xcode --generator-output=build --depth=. lua/lua.gyp

xcodebuild -ARCHS="x86_64" -project build/lua/lua.xcodeproj -configuration Release -target All