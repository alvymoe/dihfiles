package.path = package.path .. ";../?.lua;../?/init.lua"

-- laptop screen
hl.monitor({
    output = "eDP-1",
    mode = "1366x768@60",
    position = "0x0",
    scale = "1",
})

-- hotplug
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

hs.monitor_priority( { "eDP-1" , "HDMI-A-1" } )
