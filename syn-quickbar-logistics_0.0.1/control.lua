local events = {
  defines.events.on_player_quickbar_inventory_changed,
  defines.events.on_built_entity
}
script.on_event(events, function(event) test(event) end)


function test(event)


  local filtered_items = {}
  local itemcount

  --game.players[1].print("quickbar inventory changed")

  local player = game.players[1]

  local quickbar = player.get_quickbar()
  --player.print("is the inventory empty: " .. tostring(quickbar.is_empty()))


  local i = 1

  for name,number in pairs(quickbar.get_contents()) do

    --print("name =" .. name)
    --print("& number = " .. number)
    --print("stack size = " .. game.item_prototypes[name].stack_size)



    if quickbar.get_filter(i) ~= nil then
      --print("filter " .. quickbar.get_filter(i))
      --print("the max elements in the table is " .. tablelength(filtered_items))
      local qbmax = table.maxn(filtered_items)

      --table.insert(filtered_items, tablelength(filtered_items)+1, quickbar.get_filter(i))
      filtered_items [#filtered_items + 1] = quickbar.get_filter(i)


    end



    i=i+1
  end
  --end for loop






  for x=1,#filtered_items,1 do
    --print("-------------------------------")
    --print("filtered items are = " .. filtered_items[x])
    --if quickbar.get_item_count(filtered_items[x]) < game.item_prototypes[filtered_items[x]].stack_size then
      --print("request " .. tostring(quickbar.get_item_count(filtered_items[x]) - game.item_prototypes[filtered_items[x]].stack_size))
      --end
      if filtered_items[x] ~= "" or nil then
        --print("character slots = "..tostring(player.force.character_logistic_slot_count))
        local total_logistic_slots = player.force.character_logistic_slot_count
        --local logistic_slot = getLogisticSlot()
        local contents = quickbar.get_contents()
        

        if contents[filtered_items[x]] ~= nil then

          --print("attempting to get item count on" .. filtered_items[x])
          --print("filtered item isnt nil")
          itemcount = contents[filtered_items[x]]
          --print("item attempting to stacksize: " .. filtered_items[x])
          local stacksize = game.item_prototypes[filtered_items[x]].stack_size

          --print("itemcount"..itemcount)
          --print("stacksize"..tostring(stacksize))

          if itemcount < (stacksize) then
            --print("itemcount is less than stack size")
            if stacksize-itemcount ~= 0 then
                if isRequested(filtered_items[x]) then 
                  game.players[event.player_index].character.set_request_slot({name = filtered_items[x], count = stacksize - itemcount}, findLogisticSlot(filtered_items[x]))
                else 
                  game.players[event.player_index].character.set_request_slot({name = filtered_items[x], count = stacksize - itemcount}, getEmptyLogisticSlot())
                end
            end --end for not = 0
            elseif itemcount >= stacksize then
              --print("itemcount is more than stack size")
              if findLogisticSlot(filtered_items[x]) ~= nil then
                  player.character.clear_request_slot(findLogisticSlot(filtered_items[x]))
              end
              end --end itemcount<stacksize if
             
              
              end --end ~= nil if



            end
            --end if
          end
          --end x loop

          -- end test function
        end


        function print(string)
          game.players[1].print(string)
        end


        function getEmptyLogisticSlot()
          for z = 1, game.players[1].force.character_logistic_slot_count, 1 do
            if game.players[1].character.get_request_slot(z) == nil then
                return z
            end
          end
          return nil
        end

        function findLogisticSlot(item) 
        --print("finding logistic slot: " .. item)
          for z = 1, game.players[1].force.character_logistic_slot_count, 1 do
              if game.players[1].character.get_request_slot(z) ~= nil then
              --print("get request slot z = " .. game.players[1].character.get_request_slot(z).name )
                if game.players[1].character.get_request_slot(z).name == item then
                    return z
                end
              end
          end
          return nil
        end

        function isRequested(item)
        local slots = {}
          for l = 1, game.players[1].force.character_logistic_slot_count, 1 do
                  if game.players[1].character.get_request_slot(l) ~= nil or game.players[1].character.get_request_slot(l) ~= 0 then
                    slots[#slots + 1] = game.players[1].character.get_request_slot(l)
                  end
          end
          for name,number in pairs(slots) do
           --print("name" .. tostring(number.name).." count = " .. number.count)
           if number.name == item then
            return true
           end
          end
          return false
        end




        function tablelength(T)
          local count = 0
          for _ in pairs(T) do count = count + 1 end
          return count
        end




 --if game.players[i].character.get_request_slot(l).name == item then
   --                 return true
     --           end