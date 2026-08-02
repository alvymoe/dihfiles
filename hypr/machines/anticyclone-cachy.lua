package.path = package.path .. ";../?.lua;../?/init.lua"
local hs = require("hyprsplit")

-- 5070 ti setup
hs.monitor_priority( { "DP-6" , "DP-5" , "HDMI-A-5", "DP-3" } )

-- main monitor
hl.monitor({
    output = "DP-6",
    mode = "3440x1440@144",
    position = "0x0",
    scale = "1",
})

-- left monitor
hl.monitor({
    output = "DP-5",
    mode = "2560x1440",
    position = "-2560x0",
    scale = "1",
})

-- random ass dell monitor
hl.monitor({
    output = "HDMI-A-5",
    mode = "1680x1050",
    position = "3440x0",
    scale = "1",
})

-- gaomon tablet
hl.monitor({
    output = "DP-3",
    mode = "1920x1080",
    position = "3440x1050",
    scale = "1",
})
hl.device({
    name = "gaomon-gaomon-tablet-pen",
    output = "DP-3",
})



-- igpu tv
hl.monitor({
    output = "HDMI-A-1",
    mode = "3840x2160@60",
    position = "760x-1080",
    scale = "2",
})

-- virtual
hl.monitor({
    output = "vir1080",
    mode = "1920x1080",
    position = "5360x360",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hl.device({
    name = "weylus-stylus",
    output = "DP-3",
})

hl.device({
    name = "weylus-touch",
    output = "DP-3",
})

hl.config({
    -- nvidia is a bitch
    cursor = {
        no_hardware_cursors = false,
    },
})

