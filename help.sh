# Build Lua Object File.
# --with-ld-opt="-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-rpath,/home/ubuntu/luajit/lib /home/ubuntu/todaylib.o"
# --with-ld-opt="/home/ubuntu/addlib.o /home/ubuntu/sublib.o /home/ubuntu/mullib.o /home/ubuntu/divlib.o"

# aRCHIVE all oBJECT files (eg. addlib.o, sublib.o, mullib.o and divlib.o)
ar rcus libcalc.a *.o

# compile lua module files to .o object files,
# containing the exported bytecode data.
luajit -b -g todaylib.lua todaylib.o

# Test Today Lua.
luajit test_today.lua

# Compiling LuaJit Byte Code in to lualib.
luajit -bg todaylib.lua $HOME/nginx/lualib/todaylib.ljbc
