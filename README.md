
# Custom Blips for FiveM

This resource allows you to easily add custom blips to the map in your FiveM server. You can configure the coordinates, names, icons (sprites), and colors of each blip to fit your needs.

## Configuration:

The blips are defined in the `client.lua` file. Here are the key elements you can modify:

### 1. **Coordinates (`x`, `y`, `z`)**:
- The `x`, `y`, and `z` values represent the **location** of the blip on the map.
- Change these values to set the position where you want the blip to appear.

Example:
```lua
{x = 200.0, y = 200.0, z = 200.0, name = "Location 1", sprite = 1, color = 2}
```
- **`x = 200.0`**: The X-axis coordinate (East/West).
- **`y = 200.0`**: The Y-axis coordinate (North/South).
- **`z = 200.0`**: The Z-axis coordinate (Height/Altitude). (Use `z = 0` for ground-level positions.)

### 2. **Name**:
- The `name` is the **label** that will appear when you hover over the blip on the map.
- You can change this to any text you'd like to label the blip.

Example:
```lua
name = "Location 1"  -- Change this to any name you'd like
```

### 3. **Sprite (Icon)**:
- The `sprite` defines the **icon** for the blip. You can change this number to use different icons.
- [Check the FiveM Blip Sprite List](https://wiki.fivem.net/wiki/Blips) for available options.

Example:
```lua
sprite = 1  -- This is the icon for the blip. Change to other numbers for different icons.
```

### 4. **Color**:
- The `color` controls the **color** of the blip.
- [Check the FiveM Blip Color List](https://wiki.fivem.net/wiki/Blips#Colors) for all the available color options.

Example:
```lua
color = 2  -- Green color. Change to a different number for other colors.
```

---

### Example Configuration:

Here’s how a complete blip configuration might look:

```lua
Citizen.CreateThread(function()
    -- Define a list of blips with easy-to-edit properties
    local blips = {
        -- Example blip 1
        {x = 200.0, y = 200.0, z = 200.0, name = "Location 1", sprite = 1, color = 2},  
        
        -- Example blip 2
        {x = 300.0, y = 300.0, z = 200.0, name = "Location 2", sprite = 2, color = 3},  
        
        -- Example blip 3
        {x = 400.0, y = 400.0, z = 200.0, name = "Location 3", sprite = 3, color = 5},  
        
        -- Example blip 4
        {x = 500.0, y = 500.0, z = 200.0, name = "Location 4", sprite = 4, color = 1}
    }

    -- Iterate over the blips table and create the blips
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
```

### Adding New Blips:
To **add new blips**, simply copy and paste one of the existing lines in the `blips` table, and modify the following properties:
- **`x`, `y`, `z`**: Update the coordinates to position the blip where you want.
- **`name`**: Change the label that appears when you hover over the blip on the map.
- **`sprite`**: Change the icon by using a different sprite number. Refer to the FiveM Blip Sprite List for available icons.
- **`color`**: Set the color by changing the number. Refer to the FiveM Blip Color List for all color options.

---

## References:
- [FiveM Blip Sprite List](https://wiki.fivem.net/wiki/Blips)
- [FiveM Blip Color List](https://wiki.fivem.net/wiki/Blips#Colors)
