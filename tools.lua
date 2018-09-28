local admin_axe_priv = minetest.settings:get("admin_axe_privs") or server

minetest.register_tool("admin_tools:axe_admin", {
	description = S("Admin Pickaxe"),
	range = 12,
	inventory_image = "xitems_axe_admin.png",
	groups = {not_in_creative_inventory = 1},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 3,
		groupcaps= {
			unbreakable = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			fleshy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			choppy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			bendy =       {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			cracky =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			crumbly =     {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			snappy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
		},
		damage_groups = {fleshy = 1000},
	},
})

minetest.register_on_punchnode(function(pos, node, puncher)
  local get_privs = minetest.get_player_privs(puncher:get_player_name())
	if puncher:get_wielded_item():get_name() == "admin_tools:axe_admin"
	and minetest.get_node(pos).name ~= "air" then
        else
    if get_privs.admin_axe_priv then
		minetest.remove_node(pos) -- The node is removed directly, which means it even works on non-empty containers and group-less nodes.
		minetest.check_for_falling(pos) -- Run node update actions like falling nodes.
    else
    return false, "You can't delete this block (missing privileges: "..admin_axe_priv.." )"
	end
end)

minetest.register_alias("adminaxe", "admin_tools:axe_admin")
minetest.register_alias("default:axe_admin", "admin_tools:axe_admin")
