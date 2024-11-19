-- this is an example script by sxlent404

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/sxlent404/ModdedOrion/refs/heads/main/orion.lua'))()

local Window = OrionLib:MakeWindow({
    Name = "Modded Orion Example",
    HidePremium = false, 
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroEnabled = true,
    IntroText = "Modded Orion",
    IntroIcon = "rbxassetid://74112517454380",
    Icon = "rbxassetid://74112517454380"
})

local BasicTab = Window:MakeTab({
    Name = "Basic Features",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = false
})

BasicTab:AddSection({
    Name = "Basic Controls"
})

BasicTab:AddButton({
    Name = "Simple Button",
    Callback = function()
        print("Button pressed!")
    end
})

local toggle = BasicTab:AddToggle({
    Name = "Toggle Feature",
    Default = false,
    Save = true,
    Flag = "myToggle",
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})

local slider = BasicTab:AddSlider({
    Name = "Speed Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Speed",
    Save = true,
    Flag = "speedSlider",
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})

local InteractiveTab = Window:MakeTab({
    Name = "Interactive",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = false
})

InteractiveTab:AddSection({
    Name = "Interactive Elements"
})

local colorpicker = InteractiveTab:AddColorpicker({
    Name = "Color Picker",
    Default = Color3.fromRGB(255, 0, 0),
    Save = true,
    Flag = "colorPicker",
    Callback = function(Value)
        print("Color picked:", Value)
    end
})

local dropdown = InteractiveTab:AddDropdown({
    Name = "Options",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3", "Option 4"},
    Save = true,
    Flag = "dropdownOption",
    Callback = function(Value)
        print("Selected:", Value)
    end
})

InteractiveTab:AddTextbox({
    Name = "Input Text",
    Default = "Type here...",
    TextDisappear = true,
    Callback = function(Value)
        print("Input text:", Value)
    end
})

local bind = InteractiveTab:AddBind({
    Name = "Shortcut Key",
    Default = Enum.KeyCode.E,
    Hold = false,
    Save = true,
    Flag = "shortcutBind",
    Callback = function()
        print("Keybind triggered!")
    end
})

local InfoTab = Window:MakeTab({
    Name = "Information",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = false
})

InfoTab:AddSection({
    Name = "Information Display"
})

InfoTab:AddLabel("This is a simple label")

InfoTab:AddParagraph("Title", "This is a paragraph with more detailed information that can span multiple lines if needed.")

local PremiumTab = Window:MakeTab({
    Name = "Premium",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = true
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://74112517454380",
    PremiumOnly = false
})

SettingsTab:AddSection({
    Name = "UI Settings"
})

SettingsTab:AddButton({
    Name = "Print All Flags",
    Callback = function()
        for flagName, flagData in pairs(OrionLib.Flags) do
            print(flagName, "=", flagData.Value)
        end
    end
})

SettingsTab:AddButton({
    Name = "Destroy UI",
    Callback = function()
        OrionLib:Destroy()
    end
})

OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "The UI has been loaded successfully",
    Image = "rbxassetid://74112517454380",
    Time = 5
})

OrionLib:Init()
