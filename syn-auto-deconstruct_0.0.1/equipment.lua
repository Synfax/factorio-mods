data:extend({


{
    type = "roboport-equipment",
    name = "auto-deconstruct-equipment",
    take_result = "auto-deconstruct-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1MJ",
      input_flow_limit = "1W",
      usage_priority = "secondary-input"
    },
    charging_energy = "1kW",
    energy_consumption = "1kW",

    robot_limit = 0,
    construction_radius = 0,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 2.6,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 2,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  }

})


