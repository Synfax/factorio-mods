data:extend( {

{
    type = "item-with-entity-data",
    name = "electric-locomotive",
    icon = "__base__/graphics/icons/diesel-locomotive.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-f[diesel-locomotive]",
    place_result = "electric-locomotive",
    stack_size = 1
  },

  {
    type = "item",
    name = "locomotive-accumulator",
    icon = "__base__/graphics/icons/accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[accumulator]",
    place_result = "locomotive-accumulator",
    stack_size = 50
  }

})