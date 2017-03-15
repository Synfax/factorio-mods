local events = {
  defines.events.on_tick
}
script.on_event(events, function(event) test(event) end)

function test(event) 
    local equipments = {}
    local player = game.players[1]
    
    local radius = 5
    local area = {{player.position.x - radius, player.position.y - radius}, {player.position.x + radius, player.position.y + radius}}
    local entities = player.surface.find_entities(area)


    local armorbar = player.get_inventory(defines.inventory.player_armor)
    
   
    local egrid = player.get_inventory(defines.inventory.player_armor)[1]

    for _, equipment in pairs(egrid.grid.equipment) do
        if equipment.name == "auto-deconstruct-equipment" then
             for i=1, #entities, 1 do
                local entity = entities[i]
            if(entity.type == "tree" or entity.type == "stone-rock") then
                
                entity.order_deconstruction(player.force)
            end
        end
    end

    

       
    

    end
    
    
end

    





function print(s)
    game.players[1].print(s)
end

function setContains(set, key)
    return set[key] ~= nil
end