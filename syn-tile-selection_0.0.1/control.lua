local events = {
  defines.events.on_player_selected_area,
  defines.events.on_player_alt_selected_area
}
script.on_event(events, function(event) test(event) end)

function test(event) 
    print("selected area")

    print(event.tiles)

end



function print(s)
    game.players[1].print(s)
end