-- ============================================
--  Look & Feel / hl.config()
-- ============================================

local matugen = require("colors")

local function rgba(color)
    return "rgba(" .. color:sub(5) .. "ee)"
end

hl.config({
    general = {
        -- Clean gaps for a modern aestheticd
        gaps_in          = 3,
        gaps_out         = 2,
        border_size      = 1,

        col = {
            -- A vibrant modern gradient for the active window
            active_border   = { colors = { rgba(matugen.primary), rgba(matugen.secondary) }, angle = 45 },
            -- A subtle, dark border for background windows
            inactive_border ={ colors = { rgba(matugen.secondary), rgba(matugen.primary) }, angle = 90 }
        },

        -- Quality of life fixes
        resize_on_border = true, -- Easier to resize windows with the mouse
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        -- Smooth, modern corner rounding
        rounding        = 5,
        rounding_power   = 20, -- Default circular curve

        -- Keep active windows prominent, let background windows fade softly
        active_opacity   = 0.95,
        inactive_opacity = 0.85,

        -- Luxury Premium Blur Effect (Kawase Method)
        blur = {
            enabled = true,
            size = 5,                 -- Slightly higher size gives smoother blur
            passes = 4,                 -- More passes = much higher quality glass effect
            new_optimizations = true,
            
            -- The Secret Sauce to fix the "awful" look:
            vibrancy = 0.25,            -- Saturates colors bleeding through from wallpaper
            vibrancy_darkness = 0.1,    -- Keeps dark accents looking deep
            contrast = 1.3,             -- Boosts color differences
            brightness = 1.1,           -- Keeps the window background from feeling dim
            noise = 0.02,               -- Adds a premium fine-grain frosted texture
            
            popups = true,
            popups_ignorealpha = 0.5,
        }
    },

    -- Master switch for responsive performance
    animations = {
        enabled = false,
    },

    -- Input Tweaks for Snappy Desktop Navigation
    input = {
        kb_layout        = "us",
        follow_mouse     = 1,       -- Window focus strictly follows your cursor position
        sensitivity      = 0.0,     -- Raw mouse input
        accel_profile    = "flat",  -- Removes mouse acceleration for precise muscle memory

        touchpad = {
            natural_scroll = true,  -- Scrolling down moves content up (macOS style)
            tap_to_click   = true,
        },
    },

    -- Extra Layout & Misc Cleanup
    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,     -- Disables the default anime background
        disable_hyprland_logo   = true,  -- Disables the logo splash screen
        vrr                     = 1,     -- Enables Adaptive Sync/G-Sync if your monitor supports it
    },
})
