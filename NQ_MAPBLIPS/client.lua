Citizen.CreateThread(function()
    -- Define a list of coordinates for your custom blips
    local blips = {
        {x = 200.0, y = 200.0, z = 200.0, name = "Location 1", sprite = 1, color = 2},  -- Example blip 1
        {x = 300.0, y = 300.0, z = 200.0, name = "Location 2", sprite = 2, color = 3},  -- Example blip 2
        {x = 400.0, y = 400.0, z = 200.0, name = "Location 3", sprite = 3, color = 5},  -- Example blip 3
        {x = 500.0, y = 500.0, z = 200.0, name = "Location 4", sprite = 4, color = 1}   -- Example blip 4
    }

    -- Iterate over the list of blips and create them on the map
    for _, blipInfo in pairs(blips) do
        -- Create the blip at the specified coordinates
        local blip = AddBlipForCoord(blipInfo.x, blipInfo.y, blipInfo.z)

        -- Set the blip's properties
        SetBlipSprite(blip, blipInfo.sprite)  -- Set the icon (use a different number for other icons)
        SetBlipDisplay(blip, 4)  -- Display the blip always on the map
        SetBlipScale(blip, 1.0)  -- Set the size of the blip
        SetBlipColour(blip, blipInfo.color)  -- Set the color (2 = green, change to other values for different colors)
        SetBlipAsShortRange(blip, true)  -- Makes the blip visible only when near it

        -- Set the name of the blip (it will show on the map)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(blipInfo.name)  -- Set the name for each blip
        EndTextCommandSetBlipName(blip)
    end
end)