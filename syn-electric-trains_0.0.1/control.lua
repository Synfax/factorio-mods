local events = {
  defines.events.on_tick
}
script.on_event(events, function(event) test(event) end)

function test(event) 
  local player = game.players[1]

    local x = player.position.x
    local y = player.position.y
    --print(tostring(x))
    --print(tostring(y))
    if(player.character.direction) then
    

    end
    --if player.surface.can_place_entity({name = 'locomotive-accumulator', position = {(x + 1), (y + 1)}}) == true then
      --player.surface.create_entity({name = "locomotive-accumulator", position = {(x + 1),(y + 1)}, force = player.force})

      --else
      --print("cant place entity")

    --end


end


function print(s)
    game.players[1].print(s)
end