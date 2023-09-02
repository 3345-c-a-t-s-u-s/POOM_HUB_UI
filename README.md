# POOM_HUB_UI

# [SOURCE LINK](https://raw.githubusercontent.com/3345-c-a-t-s-u-s/POOM_HUB_UI/main/source.lua)https://raw.githubusercontent.com/3345-c-a-t-s-u-s/POOM_HUB_UI/main/source.lua

# Source to use

```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/POOM_HUB_UI/main/source.lua"))()

local window = UI:NewWindow("NAME")
local tab = window:NewTab("Tab")

tab:NewTitle(tab.Right,"Function")

tab:NewButton(tab.Right,"Kill all",function()
	print('killed')
end)

tab:NewToggle(tab.Left,"Fly",false,function()
	
end):Set(true)

tab:NewKeybind(tab.Left,"Bind to Noclip",Enum.KeyCode.N,function()
	
end)

tab:NewSlider(tab.Right,"Speed",1,100,function()
	
end)

tab:NewDropdown(tab.Right,"Tragets",{1,2,3},function()
	
end)

window:RGB(0.1)
```
