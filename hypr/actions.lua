package.path = package.path .. ";../?.lua;../?/init.lua"
local hs = require("hyprsplit")

local res = {}

res.pick_wallpaper = function()
    hl.dsp.exec_cmd("awww img $(find ~/Pictures/Wallpapers -type f | vicinae dmenu -p 'Pick a wallpaper...')")
end
res.pick_wallpaper_monitor = function()
    hl.dispatch(hl.dsp.exec_cmd("awww img --outputs ".. hl.get_monitor_at_cursor().name .. " $(find ~/Pictures/Wallpapers -type f | vicinae dmenu -p 'Pick a wallpaper...')"))
end

return res