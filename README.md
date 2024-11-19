# Modded Orion Library Documentation
Complete documentation for the Modded Orion Library.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Window Creation](#window-creation)
3. [Elements](#elements)
4. [Configuration System](#configuration-system)
5. [Themes](#themes)
6. [Utilities](#utilities)

## Getting Started

### Initializing the Library
```lua
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/sxlent404/ModdedOrion/refs/heads/main/orion.lua'))()
```

### Basic Setup
```lua
-- Create window
local Window = OrionLib:MakeWindow({
    Name = "My Interface",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionConfig"
})

-- Initialize library
OrionLib:Init()
```

## Window Creation

### Complete Window Configuration
```lua
local Window = OrionLib:MakeWindow({
    Name = "Window Title",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionConfig",
    IntroEnabled = true,
    IntroText = "Orion Library",
    IntroIcon = "rbxassetid://74112517454380",
    Icon = "rbxassetid://74112517454380",
    CloseCallback = function() end
})
```

### Window Parameters
| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| Name | string | Window title | "Orion Library" |
| HidePremium | boolean | Hide premium status | false |
| SaveConfig | boolean | Enable config saving | false |
| ConfigFolder | string | Config save location | "OrionConfig" |
| IntroEnabled | boolean | Show intro animation | true |
| IntroText | string | Intro text | "Orion Library" |
| IntroIcon | string | Intro icon asset ID | "rbxassetid://74112517454380" |
| Icon | string | Window icon asset ID | "rbxassetid://74112517454380" |
| CloseCallback | function | Window close handler | function() end |

## Elements

### Tabs
```lua
local Tab = Window:MakeTab({
    Name = "Tab Name",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = false
})
```

### Sections
```lua
local Section = Tab:AddSection({
    Name = "Section Name"
})
```

### Button
```lua
Tab:AddButton({
    Name = "Button Name",
    Callback = function()
        print("Button clicked")
    end
})
```

### Toggle
```lua
local Toggle = Tab:AddToggle({
    Name = "Toggle Name",
    Default = false,
    Save = false,
    Flag = "toggleFlag",
    Callback = function(Value)
        print("Toggle:", Value)
    end
})

-- Methods
Toggle:Set(true) -- Set toggle state
```

### Slider
```lua
local Slider = Tab:AddSlider({
    Name = "Slider Name",
    Min = 0,
    Max = 100,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "units",
    Save = false,
    Flag = "sliderFlag",
    Callback = function(Value)
        print("Slider:", Value)
    end
})

-- Methods
Slider:Set(75) -- Set slider value
```

### Dropdown
```lua
local Dropdown = Tab:AddDropdown({
    Name = "Dropdown Name",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3"},
    Save = false,
    Flag = "dropdownFlag",
    Callback = function(Value)
        print("Selected:", Value)
    end
})

-- Methods
Dropdown:Refresh({"New Option 1", "New Option 2"}, true) -- Update options
Dropdown:Set("New Option 1") -- Set selected option
```

### Colorpicker
```lua
local Colorpicker = Tab:AddColorpicker({
    Name = "Color Picker",
    Default = Color3.fromRGB(255, 255, 255),
    Save = false,
    Flag = "colorFlag",
    Callback = function(Value)
        print("Color:", Value)
    end
})

-- Methods
Colorpicker:Set(Color3.fromRGB(255, 0, 0)) -- Set color
```

### Textbox
```lua
Tab:AddTextbox({
    Name = "Text Input",
    Default = "Default Text",
    TextDisappear = false,
    Callback = function(Value)
        print("Input:", Value)
    end
})
```

### Keybind
```lua
local Bind = Tab:AddBind({
    Name = "Key Bind",
    Default = Enum.KeyCode.E,
    Hold = false,
    Save = false,
    Flag = "bindFlag",
    Callback = function()
        print("Key Pressed")
    end
})

-- Methods
Bind:Set(Enum.KeyCode.R) -- Set new keybind
```

### Label
```lua
local Label = Tab:AddLabel("Label Text")

-- Methods
Label:Set("New Label Text") -- Update label
```

### Paragraph
```lua
local Paragraph = Tab:AddParagraph("Title", "Content")

-- Methods
Paragraph:Set("New Title", "New Content") -- Update paragraph
```

### Notifications
```lua
OrionLib:MakeNotification({
    Name = "Notification Title",
    Content = "Notification message",
    Image = "rbxassetid://74112517454380",
    Time = 5
})
```

## Configuration System

### Using Flags
```lua
-- Create element with flag
Tab:AddToggle({
    Name = "Saved Toggle",
    Default = false,
    Save = true,
    Flag = "myToggleFlag"
})

-- Access value anywhere
local value = OrionLib.Flags["myToggleFlag"].Value
```

### Save Requirements
- Window must have `SaveConfig = true`
- Element must have:
  - `Save = true`
  - `Flag = "uniqueFlag"`

## Themes
```lua
OrionLib.Themes = {
    Default = {
        Main = Color3.fromRGB(25, 25, 25),
        Second = Color3.fromRGB(32, 32, 32),
        Stroke = Color3.fromRGB(60, 60, 60),
        Divider = Color3.fromRGB(60, 60, 60),
        Text = Color3.fromRGB(240, 240, 240),
        TextDark = Color3.fromRGB(150, 150, 150)
    }
}
```

## Utilities

### Cleanup
```lua
OrionLib:Destroy() -- Remove UI
```

### Error Handling
```lua
-- Check if library is running
if OrionLib:IsRunning() then
    -- Do something
end
```

### Required Initialization
```lua
-- Must be called at end of script
OrionLib:Init()
```
