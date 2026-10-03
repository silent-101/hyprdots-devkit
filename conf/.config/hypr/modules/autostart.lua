-- ============================================
--  Autostart
-- ============================================
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--

hl.on("hyprland.start", function ()
    hl.exec_cmd("matugen image ~/.config/matugen/wallpapers/wallp1.png -m dark --source-color-index 0 --quiet && hyprpaper -c ~/.config/hypr/hyprpaper.conf")
end
)
