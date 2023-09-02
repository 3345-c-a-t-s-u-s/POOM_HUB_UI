# POOM_HUB_UI

# [SOURCE LINK](https://raw.githubusercontent.com/3345-c-a-t-s-u-s/POOM_HUB_UI/main/source.lua)

## On RGB
![Screenshot 2023-09-02 174417](https://github.com/3345-c-a-t-s-u-s/POOM_HUB_UI/assets/117000269/86765ef0-fed2-41cf-a554-bcdd46c83d74)

## No RGB

# Source to use
![Screenshot 2023-09-02 174441](https://github.com/3345-c-a-t-s-u-s/POOM_HUB_UI/assets/117000269/c300e966-4c05-4091-a20b-f44bb9af6d8b)

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
