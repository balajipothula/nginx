# Build Lua Object File.
luajit -b -g todaylib.lua todaylib.o

# Test Today Lua.
luajit test_today.lua

# Compiling LuaJit Byte Code in to lualib.
luajit -bg todaylib.lua $HOME/nginx/lualib/todaylib.ljbc
