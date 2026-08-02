-- 5070 ti setup
local hs = require("hyprsplit")
hs.monitor_priority( { "DP-1" , "HDMI-A-1" , "HDMI-A-2" } )

-- main
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@240",
    position = "0x0",
    scale = "1",
})

-- left
hl.monitor({
    output = "HDMI-A-2",
    mode = "1920x1080@120",
    position = "-1920x-180",
    scale = "1",
})

-- right
hl.monitor({
    output = "HDMI-A-1",
    mode = "2560x1440@120",
    position = "2560x0",
    scale = "1",
})

-- virtual
hl.monitor({
    output = "amadeus",
    mode = "1440x1080",
    position = "5120x0",
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
    output = "amadeus",
})

hl.device({
    name = "weylus-touch",
    output = "amadeus",
})
