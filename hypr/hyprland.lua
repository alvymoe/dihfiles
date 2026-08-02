package.path = package.path .. ";../?.lua;../?/init.lua"

require("style")
require("behavior")
require("autostart")

local username = os.getenv("USER")

-- do keybinds per user
if pcall(require, "binds." .. username) then
    require("binds." .. username)
else
    require("binds.default")
end

-- do monitors and stuff per hostname
local function get_hostname()
    local handle = io.popen("cat /etc/hostname")
    if not handle then return "" end
    local result = handle:read("*a") or ""
    handle:close()
    return result:gsub("%s+", "") -- removes trailing newlines and spaces
end

local hostname = get_hostname()

if pcall(require, "machines." .. hostname) then
    require("machines." .. hostname)
else
	-- default settings are evil
end