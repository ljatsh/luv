
#include <lua.h>
#include <lauxlib.h>
#include <stdio.h>
#include "test.h"

int luaopen_luv(lua_State *L);

static const luaL_Reg luv[] = {
  {"luv", luaopen_luv},
  {NULL, NULL}
};

void luaopen_extenstion(lua_State *L)
{
    // load extensions
    const luaL_Reg *lib = luv;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);
}

int run_test(const char* res_path) {
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  luaopen_extenstion(L);

  lua_getglobal(L, "package");                                      /* L: package */
  lua_getfield(L, 1, "path");                                       /* get package.path, L: package path */
  const char* cur_path =  lua_tostring(L, -1);
  if (cur_path != NULL) {
    lua_pushfstring(L, "%s;%s/?.lua", cur_path, res_path);          /* L: package path newpath */
  }
  else {
    lua_pushfstring(L, "%s/?.lua", res_path);                       /* L: package path newpath */
  }
  lua_setfield(L, -3, "path");                                      /* package.path = newpath, L: package path */
  lua_pop(L, 2);                                                    /* L: - */

  int ret = luaL_dostring(L, "require('main')");
  if (ret) {
    fprintf(stdout,  "%s\n", lua_tostring(L, -1));
  }
  else {
    fprintf(stdout, "finished\n");
  }

  fprintf(stdout, "finished...\n");

  lua_close(L);
  return ret;
}
