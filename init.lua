admin_tools = {}
admin_tools.version = "0.1"
admin_tools.path = minetest.get_modpath("admin_tools")

dofile(admin_tool.path .. "/tools.lua")

printf("[Mod] Admin tools ["..admin_tools.version.."] loaded")
