--with-cc-opt="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic"

--with-cc-opt="-m64 -mtune=native -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-c++11-extensions -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion"

--with-cc-opt="-static -static-libgcc" --with-ld-opt="-static" --with-cpu-opt=generic

--with-ld-opt="-lrt -ljemalloc -Wl,-z,relro"

# Build Lua Object File.
# --with-ld-opt="-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-rpath,/home/ubuntu/luajit/lib /home/ubuntu/todaylib.o"
# --with-ld-opt="/home/ubuntu/addlib.o /home/ubuntu/sublib.o /home/ubuntu/mullib.o /home/ubuntu/divlib.o" 

# aRCHIVE all oBJECT files (eg. addlib.o, sublib.o, mullib.o and divlib.o)
ar rcus libcalc.a *.o

# if we specify the lib directory path then,
# no need of lib prefix for calc archive.
--with-ld-opt="-L/home/ubuntu/liblua -Wl,--whole-archive -lcalc -Wl,--no-whole-archive"

# compile lua module files to .o object files,
# containing the exported bytecode data.
luajit -b -g todaylib.lua todaylib.o

# Test Today Lua.
luajit test_today.lua

# Compiling LuaJit Byte Code in to lualib.
luajit -bg todaylib.lua $HOME/nginx/lualib/todaylib.ljbc
