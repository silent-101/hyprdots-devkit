-- Apply a layer rule to all windows in the "island" namespace
hl.layer_rule({
    match = {
        namespace = "island"
    },
    blur = true,
    ignore_alpha = 0.3
})

-- Blur all layer namespaces
hl.layer_rule({
    match = { namespace = "^(.*)$" },
    blur = true,
    ignore_alpha = 0.3 -- Prevents transparent pixel glitching
})
