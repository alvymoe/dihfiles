package.path = package.path .. ";../?.lua;../?/init.lua"
local hs = require("hyprsplit")
local actions = require("actions")

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "vicinae toggle"

local mainMod = "SUPER"

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hs.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hs.dsp.window.move({ workspace = i, follow = false }))
end

-- groups
hl.bind(mainMod .. " + g", hl.dsp.group.toggle())
hl.bind(mainMod .. " + l", hl.dsp.group.lock_active({ action = "toggle" }))
hl.bind(mainMod .. " + tab", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.group.prev())

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- screenshot
hl.bind("print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker | wl-copy"))

-- zen bih
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("vivaldi"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("helium-browser"))

-- switch wallpaper for monitor
hl.bind(mainMod .. " + K", actions.pick_wallpaper_monitor)
-- switch wallpaper for all monitors
hl.bind(mainMod .. " + SHIFT + K", actions.pick_wallpaper)
-- toggle bar
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("quickshell ipc call dihshell toggleBar"))


-- the keychron k0 max is a real device that exists
hl.bind("F24", function ()
    hl.notification.create({
        text = "pressed",
        timeout = 3000,          -- Time in milliseconds (e.g., 3000ms = 3s)
    })
end)

-- https://wiki.hypr.land/Configuring/Variables/#input

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = -0.5, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
    -- See https://wiki.hypr.land/Configuring/Gestures
})
