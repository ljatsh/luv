
#include <lua.h>
#include <lauxlib.h>
#include <stdio.h>
#include "test.h"

int run_test() {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaopen_luv(L);

  int ret = LUA_ERRERR;
  const char *s = "print(_VERSION)";

  ret = luaL_dostring(L, s);
  if (!ret) {
    fprintf(stderr,  "%s\n", lua_tostring(L, -1));
  }

  lua_close(L);
  return ret;
}
