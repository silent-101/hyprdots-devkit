-- Apply a layer rule to all windows in the "island" namespace
hl.layer_rule({
    match = {
        namespace = "island"
    },
    blur = true,
    ignore_alpha = 0.3
})
