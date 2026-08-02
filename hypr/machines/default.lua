package.path = package.path .. ";../?.lua;../?/init.lua"
hl.notification.create({
    text = "evil dumbass using dumbass monitor layout",
    timeout = 3000,          -- Time in milliseconds (e.g., 3000ms = 3s)
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})