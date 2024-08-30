-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

gears.wallpaper.set("#282828")

--------------------------------------------------------------------------------
--- config ---------------------------------------------------------------------
--------------------------------------------------------------------------------

beautiful.gap_single_client = false

require("main.error-handling")
require("main.signals")

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/theme.lua")
beautiful.border_single_client = false

local main = {
	layouts = require("main.layouts"),
	rules = require("main.rules"),
	tags = require("main.tags"),
	-- menu = require("main.menu"),
}

RC = {} -- global namespace
RC.layouts = main.layouts()
RC.tags = main.tags()
RC.vars = require("main.user-variables")

awful.layout.layouts = RC.layouts

awful.screen.connect_for_each_screen(function(s)
	s.tags[2]:view_only()
end)

--------------------------------------------------------------------------------
--- bindings -------------------------------------------------------------------
--------------------------------------------------------------------------------

local binding = {
	globalbuttons = require("binding.globalbuttons"),
	clientbuttons = require("binding.clientbuttons"),
	globalkeys = require("binding.globalkeys"),
	bindtotags = require("binding.bindtotags"),
	clientkeys = require("binding.clientkeys"),
}

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

--------------------------------------------------------------------------------
--- theme ----------------------------------------------------------------------
--------------------------------------------------------------------------------

--  󰎚 󱓻
--

beautiful.border_width = dpi(2)

local function update_borders()
	local t = awful.screen.focused().selected_tag
	local clients = t:clients()
	if #clients == 1 then
		clients[1].border_width = 0
	else
		for _, c in pairs(clients) do
			if c.maximized then
				c.border_width = 0
			else
				c.border_width = beautiful.border_width
			end
		end
	end
end

client.connect_signal("manage", update_borders)
client.connect_signal("unmanage", update_borders)
client.connect_signal("property::maximized", update_borders)
-- client.connect_signal("property::fullscreen", update_borders)
awful.tag.attached_connect_signal(nil, "property::layout", update_borders)
