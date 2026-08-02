require("style")
require("behavior")
require("autostart")

-- do keybinds per user
if pcall(require, "binds." .. os.getenv("USER")) then
    require("binds." .. os.getenv("USER"))
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

if pcall(require, "machines." .. get_hostname()) == false then
	-- ill make default monitors eventually
end