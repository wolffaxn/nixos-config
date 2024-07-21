-- reload config automatically
local configFileWatcher
function reloadConfig()
    configFileWatcher:stop()
    configFileWatcher = nil
    hs.reload()
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig)
configFileWatcher:start()

local hotkey = require("hs.hotkey")

-- hyper key
local hyper = { "cmd", "alt", "ctrl", "shift" }

-- disable animations
hs.window.animationDuration = 0

-- reload configuration
hotkey.bind(hyper, "r", function()
    hs.reload()
end)
hs.alert.show("Config reloaded")

-- open browser
hs.hotkey.bind(hyper, "b", function()
    hs.application.launchOrFocus("Google Chrome")
end)

-- open editor
hs.hotkey.bind(hyper, "e", function()
    hs.application.launchOrFocus("VSCodium")
end)

-- open finder
hs.hotkey.bind(hyper, "f", function()
    hs.application.launchOrFocus("Finder")
end)

-- open music
hs.hotkey.bind(hyper, "m", function()
    hs.application.launchOrFocus("Spotify")
end)

-- open terminal
hs.hotkey.bind(hyper, "t", function()
    hs.application.launchOrFocus("Alacritty")
end)
