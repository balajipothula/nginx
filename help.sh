# Build Lua Object File.
luajit -b -g todaylib.lua todaylib.o

# Test Today Lua.
luajit test_today.lua
