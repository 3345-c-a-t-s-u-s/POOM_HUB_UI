local PH_HUB = {}
local Mouse = game:GetService('Players').LocalPlayer:GetMouse()
local UIS = game:GetService('UserInputService')
local TWEEN_SERVICE = game:GetService('TweenService')
local RGB_CODE = Instance.new('Color3Value')
local RGB_SPEED = 0.1

coroutine.wrap(function()
	local colorx = 0

	while true do task.wait(RGB_SPEED)

		TWEEN_SERVICE:Create(RGB_CODE,TweenInfo.new(RGB_SPEED * 1.1),{Value = Color3.fromHSV(colorx,1,1)}):Play()

		colorx = colorx + 2/255 
		if colorx >= 1 then
			colorx = 0
		end
	end
end)()

local function CalculateDistance<Info...>(pointA, pointB)
	return math.sqrt(((pointB.X - pointA.X) ^ 2) + ((pointB.Y - pointA.Y) ^ 2))
end

function Create_Ripple<Effect...>(Parent : Frame, ___)
	Parent.ClipsDescendants = true
	local ripple = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	ripple.Active = false
	ripple.Name = "ripple"
	ripple.Parent = Parent
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.ZIndex = Parent.ZIndex + 1 or 7
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Size = UDim2.new(0,0,0,0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0.25, 0)
	UICorner.Parent = ripple

	local buttonAbsoluteSize = Parent.AbsoluteSize
	local buttonAbsolutePosition = Parent.AbsolutePosition

	local mouseAbsolutePosition = Vector2.new(Mouse.X, Mouse.Y)
	local mouseRelativePosition = (mouseAbsolutePosition - buttonAbsolutePosition)

	ripple.BackgroundTransparency = 0.84
	ripple.Position = UDim2.new(0, mouseRelativePosition.X, 0, mouseRelativePosition.Y)
	ripple.Parent = Parent

	local topLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, 0))
	local topRight = CalculateDistance(mouseRelativePosition, Vector2.new(buttonAbsoluteSize.X, 0))
	local bottomRight = CalculateDistance(mouseRelativePosition, buttonAbsoluteSize)
	local bottomLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, buttonAbsoluteSize.Y))

	local Size_UP = UDim2.new(50,0,50,0)

	if (___) ~= nil then
		Size_UP = Parent.Size
	end

	TWEEN_SERVICE:Create(ripple,TweenInfo.new(2),{Size = Size_UP,BackgroundTransparency = 1}):Play()

	if (___) ~= nil then
		TWEEN_SERVICE:Create(ripple,TweenInfo.new(0.2),{Position =UDim2.new(0.5,0,0.5,0)}):Play()
	end
	game:GetService('Debris'):AddItem(ripple,2.2)
end

function PH_HUB:NewWindow(NAME)
	NAME = NAME or "POOM HUB | "..tostring(game.Name)
	local screen = {
		Toggle = Enum.KeyCode.X
	}
	local ui_val = true
	local toggleEvent = Instance.new'BindableEvent'
	local TAB_CONNECT_TABLE = {}
	
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local DropShadow = Instance.new("ImageLabel")
	local Header = Instance.new("Frame")
	local DropShadow_2 = Instance.new("ImageLabel")
	local TitleLabel = Instance.new("TextLabel")
	local TabScroll = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Tab_Collection = Instance.new("Frame")
	local DropShadow_3 = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	
	toggleEvent.Event:Connect(function(val)
		ScreenGui.Enabled = val
	end)
	
	ScreenGui.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer.PlayerGui
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	
	Frame.Parent = ScreenGui
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0.439999998, 0, 0.469999999, 5)
	Frame.ZIndex = 2

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Frame

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Frame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = -2
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Header.Name = "Header"
	Header.Parent = Frame
	Header.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Header.BorderSizePixel = 0
	Header.Size = UDim2.new(1, 0, 0.100000001, 0)
	Header.ZIndex = 4

	DropShadow_2.Name = "DropShadow"
	DropShadow_2.Parent = Header
	DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow_2.BackgroundTransparency = 1.000
	DropShadow_2.BorderSizePixel = 0
	DropShadow_2.Position = UDim2.new(0.501185715, 0, 0.61360532, 0)
	DropShadow_2.Size = UDim2.new(0.931230128, 47, 0.166893736, 47)
	DropShadow_2.ZIndex = 3
	DropShadow_2.Image = "rbxassetid://6014261993"
	DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow_2.ImageTransparency = 0.500
	DropShadow_2.ScaleType = Enum.ScaleType.Slice
	DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

	TitleLabel.Name = "TitleLabel"
	TitleLabel.Parent = Header
	TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.BackgroundTransparency = 1.000
	TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleLabel.BorderSizePixel = 0
	TitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TitleLabel.Size = UDim2.new(0.899999976, 0, 0.699999988, 0)
	TitleLabel.ZIndex = 5
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.Text = "POOM HUB UI | MAKE BY CAT_SUS"
	TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.TextScaled = true
	TitleLabel.TextSize = 14.000
	TitleLabel.TextWrapped = true

	TabScroll.Name = "TabScroll"
	TabScroll.Parent = Frame
	TabScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabScroll.BackgroundTransparency = 1.000
	TabScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabScroll.BorderSizePixel = 0
	TabScroll.ClipsDescendants = true
	TabScroll.Position = UDim2.new(0, 0, 0.12000002, 0)
	TabScroll.Size = UDim2.new(1.00000012, 0, 0.115147389, 0)
	TabScroll.ZIndex = 3

	ScrollingFrame.Parent = TabScroll
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ClipsDescendants = false
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)
	ScrollingFrame.ZIndex = 4
	ScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 4)
	
	UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.new(0,UIListLayout.AbsoluteContentSize.X,0,0)
	end)
	
	Tab_Collection.Name = "Tab_Collection"
	Tab_Collection.Parent = Frame
	Tab_Collection.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Tab_Collection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab_Collection.BorderSizePixel = 0
	Tab_Collection.Position = UDim2.new(0.0497989058, 0, 0.255820811, 0)
	Tab_Collection.Size = UDim2.new(0.899999976, 0, 0.699439883, 0)
	Tab_Collection.ZIndex = 5

	DropShadow_3.Name = "DropShadow"
	DropShadow_3.Parent = Tab_Collection
	DropShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow_3.BackgroundTransparency = 1.000
	DropShadow_3.BorderSizePixel = 0
	DropShadow_3.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow_3.Size = UDim2.new(1, 47, 1, 47)
	DropShadow_3.ZIndex = 4
	DropShadow_3.Image = "rbxassetid://6014261993"
	DropShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow_3.ImageTransparency = 0.500
	DropShadow_3.ScaleType = Enum.ScaleType.Slice
	DropShadow_3.SliceCenter = Rect.new(49, 49, 450, 450)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Tab_Collection
	
	function screen:NewTab(NAMEtab)
		NAMEtab = NAMEtab or "Tab"
		local tba_assets = {}
		
		local Button = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local DropShadow = Instance.new("ImageLabel")
		local Title = Instance.new("TextLabel")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke_Effect = Instance.new("UIStroke")
		local Button_2 = Instance.new("ImageButton")

		Button.Name = "Button"
		Button.Parent = ScrollingFrame
		Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, 0, 0.5, 0)
		Button.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Button.ZIndex = 7

		UIAspectRatioConstraint.Parent = Button
		UIAspectRatioConstraint.AspectRatio = 3.000
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		UICorner.CornerRadius = UDim.new(0.5, 0)
		UICorner.Parent = Button

		DropShadow.Name = "DropShadow"
		DropShadow.Parent = Button
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 17, 1, 17)
		DropShadow.ZIndex = 6
		DropShadow.Image = "rbxassetid://6014261993"
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.500
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

		Title.Name = "Title"
		Title.Parent = Button
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.ClipsDescendants = true
		Title.Size = UDim2.new(1, 0, 1, 0)
		Title.ZIndex = 8
		Title.Font = Enum.Font.Unknown
		Title.Text = NAMEtab or "Tab"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true

		UICorner_2.CornerRadius = UDim.new(0.5, 0)
		UICorner_2.Parent = Title

		UIStroke_Effect.Transparency = 1.000
		UIStroke_Effect.Color = Color3.fromRGB(255, 255, 255)
		UIStroke_Effect.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke_Effect.Parent = Button

		Button_2.Name = "Button"
		Button_2.Parent = Button
		Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_2.BackgroundTransparency = 1.000
		Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_2.BorderSizePixel = 0
		Button_2.Size = UDim2.new(1, 0, 1, 0)
		Button_2.ZIndex = 9
		Button_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
		Button_2.ImageTransparency = 1.000
		
		local TAB = Instance.new("Frame")
		local Log1_Right = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local Log2_Left = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		
		UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			Log2_Left.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y)
		end)
		
		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			Log1_Right.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
		end)
		
		TAB.Name = "TAB"
		TAB.Parent =Tab_Collection
		TAB.AnchorPoint = Vector2.new(0.5, 0.5)
		TAB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TAB.BackgroundTransparency = 1.000
		TAB.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TAB.BorderSizePixel = 0
		TAB.Position = UDim2.new(0.5, 0, 0.5, 0)
		TAB.Size = UDim2.new(0.980000019, 0, 0.980000019, 0)
		TAB.ZIndex = 6

		Log1_Right.Name = "Log1_Right"
		Log1_Right.Parent = TAB
		Log1_Right.Active = true
		Log1_Right.AnchorPoint = Vector2.new(0.5, 0.5)
		Log1_Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Log1_Right.BackgroundTransparency = 1.000
		Log1_Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Log1_Right.BorderSizePixel = 0
		Log1_Right.Position = UDim2.new(0.239574969, 0, 0.50000006, 0)
		Log1_Right.Size = UDim2.new(0.5, 0, 0.980000019, 0)
		Log1_Right.ZIndex = 6
		Log1_Right.ScrollBarThickness = 0

		UIListLayout.Parent = Log1_Right
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)

		Log2_Left.Name = "Log2_Left"
		Log2_Left.Parent = TAB
		Log2_Left.Active = true
		Log2_Left.AnchorPoint = Vector2.new(0.5, 0.5)
		Log2_Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Log2_Left.BackgroundTransparency = 1.000
		Log2_Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Log2_Left.BorderSizePixel = 0
		Log2_Left.Position = UDim2.new(0.739288568, 0, 0.500000179, 0)
		Log2_Left.Size = UDim2.new(0.5, 0, 0.980000019, 0)
		Log2_Left.ZIndex = 6
		Log2_Left.ScrollBarThickness = 0
		Log2_Left.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

		UIListLayout_2.Parent = Log2_Left
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 2)
		
		local function TOGGLE_TAB(val)
			if val then
				TAB.Visible = true
				TWEEN_SERVICE:Create(UIStroke_Effect,TweenInfo.new(0.3),{Transparency = 0.1}):Play()
				TWEEN_SERVICE:Create(DropShadow,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			else
				TWEEN_SERVICE:Create(UIStroke_Effect,TweenInfo.new(0.3),{Transparency = 1}):Play()
				TWEEN_SERVICE:Create(DropShadow,TweenInfo.new(0.3),{ImageColor3 = Color3.fromRGB(0, 0, 0)}):Play()
				TAB.Visible = false
			end
		end
		
		if #TAB_CONNECT_TABLE==0 then
			TOGGLE_TAB(true)
		else
			TOGGLE_TAB(false)
		end
		
		local myevent = Instance.new('BindableEvent',TAB)
		
		table.insert(TAB_CONNECT_TABLE,{
			TAB,
			myevent
		})
		
		myevent.Event:Connect(function(val)
			TOGGLE_TAB(val)
		end)
		
		Button_2.MouseButton1Click:Connect(function()
			Create_Ripple(Button_2)
			for i,v in ipairs(TAB_CONNECT_TABLE) do
				if v[1] == TAB then
					v[2]:Fire(true)
				else
					v[2]:Fire(false)
				end
			end
		end)
		
		tba_assets.Right = Log1_Right
		tba_assets.Left = Log2_Left
		
		function tba_assets:NewTitle(LOG,String)
			local Title = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local DropShadow = Instance.new("ImageLabel")
			local TextLabel = Instance.new("TextLabel")

			Title.Name = "Title"
			Title.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Title.ZIndex = 8

			UIAspectRatioConstraint.Parent = Title
			UIAspectRatioConstraint.AspectRatio = 6.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Title

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Title
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 37, 1, 37)
			DropShadow.ZIndex = 7
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			TextLabel.Parent = Title
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(1, 0, 0.699999988, 0)
			TextLabel.ZIndex = 9
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = String or "Title"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
		end
		
		function tba_assets:NewButton(LOG,String,Callback)
			Callback = Callback or function() end
			String = String or "Button"
			
			local Button = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local DropShadow = Instance.new("ImageLabel")
			local Igone = Instance.new("ImageLabel")
			local Button_2 = Instance.new("TextButton")

			Button.Name = "Button"
			Button.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Button.ZIndex = 8

			UIAspectRatioConstraint.Parent = Button
			UIAspectRatioConstraint.AspectRatio = 6.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Button

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Button
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 37, 1, 37)
			DropShadow.ZIndex = 7
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			Igone.Name = "Igone"
			Igone.Parent = Button
			Igone.AnchorPoint = Vector2.new(0.5, 0.5)
			Igone.BackgroundTransparency = 1.000
			Igone.BorderSizePixel = 0
			Igone.Position = UDim2.new(0.5, 0, 0.5, 0)
			Igone.Size = UDim2.new(1, 0, 1, 0)
			Igone.ZIndex = 10
			Igone.Image = "rbxassetid://10924531821"
			Igone.ImageColor3 = Color3.fromRGB(129, 129, 129)
			Igone.ImageTransparency = 0.500
			Igone.SliceCenter = Rect.new(49, 49, 450, 450)

			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.BackgroundTransparency = 1.030
			Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button_2.BorderSizePixel = 0
			Button_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button_2.Size = UDim2.new(1, 0, 0.899999976, 0)
			Button_2.ZIndex = 9
			Button_2.Font = Enum.Font.SourceSansBold
			Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.TextScaled = true
			Button_2.TextSize = 14.000
			Button_2.TextWrapped = true
			
			Button_2.MouseButton1Click:Connect(function()
				Create_Ripple(Button_2)
				Callback()
			end)
		end
		
		function tba_assets:NewToggle(LOG,String,info,Callback)
			Callback = Callback or function() end
			String = String or "Toggle"
			info = info or false
			
			local Toggle = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local DropShadow = Instance.new("ImageLabel")
			local Igone = Instance.new("ImageLabel")
			local Button = Instance.new("TextButton")
			local Effects = Instance.new("Frame")
			local DropShadow_2 = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Toggle_Inside = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local Label = Instance.new("TextLabel")
			local create_effect_frame = Instance.new('Frame')
			
			create_effect_frame.BackgroundTransparency = 1
			create_effect_frame.Active = false
			create_effect_frame.Size = UDim2.new(1,0,1,0)
			create_effect_frame.Parent = Toggle
			create_effect_frame.ZIndex = 9

			Toggle.Name = "Toggle"
			Toggle.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Toggle.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Toggle.ZIndex = 8

			UIAspectRatioConstraint.Parent = Toggle
			UIAspectRatioConstraint.AspectRatio = 6.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Toggle

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Toggle
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 37, 1, 37)
			DropShadow.ZIndex = 7
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			Igone.Name = "Igone"
			Igone.Parent = Toggle
			Igone.AnchorPoint = Vector2.new(0.5, 0.5)
			Igone.BackgroundTransparency = 1.000
			Igone.BorderSizePixel = 0
			Igone.Position = UDim2.new(0.5, 0, 0.5, 0)
			Igone.Size = UDim2.new(1, 0, 1, 0)
			Igone.ZIndex = 10
			Igone.Image = "rbxassetid://10924531821"
			Igone.ImageColor3 = Color3.fromRGB(129, 129, 129)
			Igone.ImageTransparency = 0.500
			Igone.SliceCenter = Rect.new(49, 49, 450, 450)

			Button.Name = "Button"
			Button.Parent = Toggle
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.030
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			Button.ZIndex = 15
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextScaled = true
			Button.TextSize = 14.000
			Button.TextTransparency = 1.000
			Button.TextWrapped = true

			Effects.Name = "Effects"
			Effects.Parent = Toggle
			Effects.AnchorPoint = Vector2.new(0.5, 0.5)
			Effects.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Effects.BackgroundTransparency = 1.000
			Effects.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Effects.BorderSizePixel = 0
			Effects.Position = UDim2.new(0.100000001, 0, 0.5, 0)
			Effects.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
			Effects.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Effects.ZIndex = 9

			DropShadow_2.Name = "DropShadow"
			DropShadow_2.Parent = Effects
			DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow_2.BackgroundTransparency = 1.000
			DropShadow_2.BorderSizePixel = 0
			DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow_2.Size = UDim2.new(1, 27, 1, 27)
			DropShadow_2.ZIndex = 8
			DropShadow_2.Image = "rbxassetid://6014261993"
			DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow_2.ImageTransparency = 0.500
			DropShadow_2.ScaleType = Enum.ScaleType.Slice
			DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Effects

			UIStroke.Thickness = 1.600
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Effects

			Toggle_Inside.Name = "Toggle_Inside"
			Toggle_Inside.Parent = Effects
			Toggle_Inside.AnchorPoint = Vector2.new(0.5, 0.5)
			Toggle_Inside.BackgroundColor3 = Color3.fromRGB(182, 182, 182)
			Toggle_Inside.BackgroundTransparency = 1.000
			Toggle_Inside.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle_Inside.BorderSizePixel = 0
			Toggle_Inside.Position = UDim2.new(0.5, 0, 0.5, 0)
			Toggle_Inside.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			Toggle_Inside.ZIndex = 10

			UICorner_3.CornerRadius = UDim.new(0, 3)
			UICorner_3.Parent = Toggle_Inside

			Label.Name = "Label"
			Label.Parent = Toggle
			Label.AnchorPoint = Vector2.new(0.5, 0.5)
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.590403795, 0, 0.500001013, 0)
			Label.Size = UDim2.new(0.729571402, 0, 0.699999988, 0)
			Label.ZIndex = 9
			Label.Font = Enum.Font.GothamBold
			Label.Text = String or "Toggle"
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextScaled = true
			Label.TextSize = 14.000
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Left
			
			local function SetToggle(val)
				if val then
					TWEEN_SERVICE:Create(Toggle_Inside,TweenInfo.new(0.15),{BackgroundTransparency = 0}):Play()
					TWEEN_SERVICE:Create(Toggle_Inside,TweenInfo.new(0.45,Enum.EasingStyle.Back),{Size = UDim2.new(0.75,0,0.75,0)}):Play()
				else
					TWEEN_SERVICE:Create(Toggle_Inside,TweenInfo.new(0.45,Enum.EasingStyle.Back),{Size = UDim2.new(0,0,0,0)}):Play()
					TWEEN_SERVICE:Create(Toggle_Inside,TweenInfo.new(0.15),{BackgroundTransparency = 1}):Play()
				end
			end
			
			SetToggle(info)
			
			Button.MouseButton1Click:Connect(function()
				Create_Ripple(create_effect_frame)
				info = not info
				SetToggle(info)
				Callback(info)
			end)
			
			local l = {}
			
			function l:Set(val)
				info = val
				SetToggle(val)
			end
			
			return l
		end
		
		function tba_assets:NewKeybind(LOG,String,info,callback)
			info = info or "None"
			callback = callback or function() end
			info = info or "None"
			
			local function Converter(ket)
				if typeof(ket) ~= "EnumItem" then
					return "None"
				else
					local name = ket.Name

					return name
				end
			end
			
			local Keybind = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local DropShadow = Instance.new("ImageLabel")
			local Igone = Instance.new("ImageLabel")
			local Button = Instance.new("TextButton")
			local Effects = Instance.new("Frame")
			local DropShadow_2 = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local BindText = Instance.new("TextLabel")
			local Label = Instance.new("TextLabel")

			Keybind.Name = "Keybind"
			Keybind.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Keybind.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Keybind.ZIndex = 8

			UIAspectRatioConstraint.Parent = Keybind
			UIAspectRatioConstraint.AspectRatio = 6.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Keybind

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Keybind
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 37, 1, 37)
			DropShadow.ZIndex = 7
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			Igone.Name = "Igone"
			Igone.Parent = Keybind
			Igone.AnchorPoint = Vector2.new(0.5, 0.5)
			Igone.BackgroundTransparency = 1.000
			Igone.BorderSizePixel = 0
			Igone.Position = UDim2.new(0.5, 0, 0.5, 0)
			Igone.Size = UDim2.new(1, 0, 1, 0)
			Igone.ZIndex = 10
			Igone.Image = "rbxassetid://10924531821"
			Igone.ImageColor3 = Color3.fromRGB(129, 129, 129)
			Igone.ImageTransparency = 0.500
			Igone.SliceCenter = Rect.new(49, 49, 450, 450)

			Button.Name = "Button"
			Button.Parent = Keybind
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.030
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			Button.ZIndex = 15
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextScaled = true
			Button.TextSize = 14.000
			Button.TextTransparency = 1.000
			Button.TextWrapped = true

			Effects.Name = "Effects"
			Effects.Parent = Keybind
			Effects.AnchorPoint = Vector2.new(0.5, 0.5)
			Effects.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Effects.BackgroundTransparency = 1.000
			Effects.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Effects.BorderSizePixel = 0
			Effects.Position = UDim2.new(0.100000001, 0, 0.5, 0)
			Effects.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
			Effects.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Effects.ZIndex = 9

			DropShadow_2.Name = "DropShadow"
			DropShadow_2.Parent = Effects
			DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow_2.BackgroundTransparency = 1.000
			DropShadow_2.BorderSizePixel = 0
			DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow_2.Size = UDim2.new(1, 27, 1, 27)
			DropShadow_2.ZIndex = 8
			DropShadow_2.Image = "rbxassetid://6014261993"
			DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow_2.ImageTransparency = 0.500
			DropShadow_2.ScaleType = Enum.ScaleType.Slice
			DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Effects

			UIStroke.Thickness = 1.600
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Effects

			BindText.Name = "BindText"
			BindText.Parent = Effects
			BindText.AnchorPoint = Vector2.new(0.5, 0.5)
			BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindText.BackgroundTransparency = 1.000
			BindText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BindText.BorderSizePixel = 0
			BindText.Position = UDim2.new(0.5, 0, 0.5, 0)
			BindText.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			BindText.ZIndex = 9
			BindText.Font = Enum.Font.SourceSansBold
			BindText.Text = Converter(info)
			BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindText.TextScaled = true
			BindText.TextSize = 14.000
			BindText.TextWrapped = true

			Label.Name = "Label"
			Label.Parent = Keybind
			Label.AnchorPoint = Vector2.new(0.5, 0.5)
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.590403795, 0, 0.500001013, 0)
			Label.Size = UDim2.new(0.729571402, 0, 0.699999988, 0)
			Label.ZIndex = 9
			Label.Font = Enum.Font.GothamBold
			Label.Text = String or "Keybind"
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextScaled = true
			Label.TextSize = 14.000
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Left
			
			local Binding = false
			Button.MouseButton1Click:Connect(function()
				if Binding then
					return
				end
				Binding =  true
				Create_Ripple(Button)
				local targetloadded = nil

				local hook = UIS.InputBegan:Connect(function(is)
					if is.KeyCode ~= Enum.KeyCode.Unknown then
						targetloadded = is.KeyCode
					end
				end)
				BindText.Text = "..."
				repeat task.wait() until targetloadded or not Binding
				Binding =false
				if hook then
					hook:Disconnect()
				end
				if targetloadded then
					BindText.Text = Converter(targetloadded)
					callback(targetloadded)
				end
				return
			end)
			
			local Hook = {}

			function Hook:Set(val)
				if not val then
					return
				end
				BindText.Text = Converter(val)
				callback(val)
			end

			return Hook
			
		end
		
		function tba_assets:NewSlider(LOG,String,min,max,callback)
			min = min or 1
			max = max or 100
			callback = callback or function() end
			
			local Slider = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local DropShadow = Instance.new("ImageLabel")
			local Igone = Instance.new("ImageLabel")
			local Label = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local DropShadow_2 = Instance.new("ImageLabel")
			local UIStroke = Instance.new("UIStroke")
			local MOVE = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Slider.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Slider.ZIndex = 8

			UIAspectRatioConstraint.Parent = Slider
			UIAspectRatioConstraint.AspectRatio = 6.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Slider

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Slider
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 37, 1, 37)
			DropShadow.ZIndex = 7
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			Igone.Name = "Igone"
			Igone.Parent = Slider
			Igone.AnchorPoint = Vector2.new(0.5, 0.5)
			Igone.BackgroundTransparency = 1.000
			Igone.BorderSizePixel = 0
			Igone.Position = UDim2.new(0.5, 0, 0.5, 0)
			Igone.Size = UDim2.new(1, 0, 1, 0)
			Igone.Visible = false
			Igone.ZIndex = 10
			Igone.Image = "rbxassetid://10924531821"
			Igone.ImageColor3 = Color3.fromRGB(129, 129, 129)
			Igone.ImageTransparency = 0.500
			Igone.SliceCenter = Rect.new(49, 49, 450, 450)

			Label.Name = "Label"
			Label.Parent = Slider
			Label.AnchorPoint = Vector2.new(0.5, 0.5)
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.405, 0,0.37, 0)
			Label.Size = UDim2.new(0.71, 0, 0.44, 0)
			Label.ZIndex = 9
			Label.Font = Enum.Font.GothamBold
			Label.Text = String or "Slider"
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextScaled = true
			Label.TextSize = 14.000
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Left

			Frame.Parent = Slider
			Frame.Active = true
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0250000004, 0, 0.689999998, 0)
			Frame.Size = UDim2.new(0.949999988, 0, 0.200000003, 0)
			Frame.ZIndex = 9

			UICorner_2.CornerRadius = UDim.new(0, 2)
			UICorner_2.Parent = Frame

			DropShadow_2.Name = "DropShadow"
			DropShadow_2.Parent = Frame
			DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow_2.BackgroundTransparency = 1.000
			DropShadow_2.BorderSizePixel = 0
			DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow_2.Size = UDim2.new(1, 27, 1, 27)
			DropShadow_2.ZIndex = 8
			DropShadow_2.Image = "rbxassetid://6014261993"
			DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow_2.ImageTransparency = 0.500
			DropShadow_2.ScaleType = Enum.ScaleType.Slice
			DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

			UIStroke.Transparency = 0.500
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Parent = Frame

			MOVE.Name = "MOVE"
			MOVE.Parent = Frame
			MOVE.Active = true
			MOVE.AnchorPoint = Vector2.new(0, 0.5)
			MOVE.BackgroundColor3 = Color3.fromRGB(227, 197, 197)
			MOVE.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MOVE.BorderSizePixel = 0
			MOVE.Position = UDim2.new(0, 0, 0.5, 0)
			MOVE.Size = UDim2.new(0.200000003, 0, 1, 0)
			MOVE.ZIndex = 9

			UICorner_3.CornerRadius = UDim.new(0, 2)
			UICorner_3.Parent = MOVE
			
			local NumberRage = Instance.new("TextLabel")

			NumberRage.Name = "NumberRage"
			NumberRage.Parent = Slider
			NumberRage.AnchorPoint = Vector2.new(0.5, 0.5)
			NumberRage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NumberRage.BackgroundTransparency = 1.000
			NumberRage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NumberRage.BorderSizePixel = 0
			NumberRage.Position = UDim2.new(0.858637512, 0, 0.369838238, 0)
			NumberRage.Size = UDim2.new(0.206436709, 0, 0.43967849, 0)
			NumberRage.ZIndex = 9
			NumberRage.Font = Enum.Font.GothamBold
			NumberRage.Text = tostring(min)
			NumberRage.TextColor3 = Color3.fromRGB(255, 255, 255)
			NumberRage.TextScaled = true
			NumberRage.TextSize = 14.000
			NumberRage.TextWrapped = true
			NumberRage.TextXAlignment = Enum.TextXAlignment.Right
			
			local danger = false

			Frame.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					danger = true
				end
			end)

			Frame.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					danger = false
				end
			end)

			UIS.InputChanged:Connect(function(Input)
				if danger and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
					local SizeScale = math.clamp(((Input.Position.X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X), 0, 1)
					local Value = math.floor(((max - min) * SizeScale) + min)
					local Size = UDim2.fromScale(SizeScale, 1)
					NumberRage.Text = Value
					TWEEN_SERVICE:Create(MOVE,TweenInfo.new(0.1),{Size = Size}):Play()
					callback(Value)
				end
			end)
			
			local Hook = {}

			function Hook:Set(val)
				val = tonumber(val)
				if val then
					local UDSIze = math.clamp((val / max),0,1)
					local Size = UDim2.fromScale(UDSIze, 1)
					TWEEN_SERVICE:Create(Frame,TweenInfo.new(0.1),{Size = Size}):Play()
					NumberRage.Text = tostring(val)
					callback(tonumber(val))
				end
			end

			return Hook;
			
		end
		
		function tba_assets:NewDropdown(LOG,String,INFO,callback,refresh)
			INFO = INFO or {}
			callback = callback or function() end
			
			local Dropdown = Instance.new("Frame")
			local Frame = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Effects = Instance.new("Frame")
			local DropShadow = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Icon = Instance.new("ImageLabel")
			local Button = Instance.new("TextButton")
			local DropShadow_2 = Instance.new("ImageLabel")
			local Igone = Instance.new("ImageLabel")
			local Label = Instance.new("TextLabel")
			local UIListLayout = Instance.new("UIListLayout")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local ScrollingMain = Instance.new("Frame")
			local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
			local UICorner_3 = Instance.new("UICorner")
			local DropShadow_3 = Instance.new("ImageLabel")
			local UIStroke_2 = Instance.new("UIStroke")
			local ScrollingFrame = Instance.new("ScrollingFrame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local Lay = Instance.new("Frame")
			local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
			local UICorner_4 = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			
			UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y)
			end)
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = (typeof(LOG) == "Instance" and LOG) or Log1_Right
			Dropdown.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(0.959999979, 0, 0.5, 0)
			Dropdown.ZIndex = 8

			Frame.Parent = Dropdown
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.ZIndex = 9

			UIAspectRatioConstraint.Parent = Frame
			UIAspectRatioConstraint.AspectRatio = 8.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Frame

			Effects.Name = "Effects"
			Effects.Parent = Frame
			Effects.AnchorPoint = Vector2.new(0.5, 0.5)
			Effects.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Effects.BackgroundTransparency = 1.000
			Effects.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Effects.BorderSizePixel = 0
			Effects.Position = UDim2.new(0.899999976, 0, 0.5, 0)
			Effects.Size = UDim2.new(0.649999976, 0, 0.649999976, 0)
			Effects.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Effects.ZIndex = 9

			DropShadow.Name = "DropShadow"
			DropShadow.Parent = Effects
			DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow.BackgroundTransparency = 1.000
			DropShadow.BorderSizePixel = 0
			DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow.Size = UDim2.new(1, 27, 1, 27)
			DropShadow.ZIndex = 8
			DropShadow.Image = "rbxassetid://6014261993"
			DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow.ImageTransparency = 0.500
			DropShadow.ScaleType = Enum.ScaleType.Slice
			DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Effects

			UIStroke.Thickness = 1.600
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Effects

			Icon.Name = "Icon"
			Icon.Parent = Effects
			Icon.AnchorPoint = Vector2.new(0.5, 0.5)
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
			Icon.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
			Icon.ZIndex = 9
			Icon.Image = "rbxassetid://11269835227"

			Button.Name = "Button"
			Button.Parent = Frame
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.030
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
			Button.ZIndex = 15
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextScaled = true
			Button.TextSize = 14.000
			Button.TextTransparency = 1.000
			Button.TextWrapped = true

			DropShadow_2.Name = "DropShadow"
			DropShadow_2.Parent = Frame
			DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow_2.BackgroundTransparency = 1.000
			DropShadow_2.BorderSizePixel = 0
			DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow_2.Size = UDim2.new(1, 37, 1, 37)
			DropShadow_2.ZIndex = 7
			DropShadow_2.Image = "rbxassetid://6014261993"
			DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow_2.ImageTransparency = 0.500
			DropShadow_2.ScaleType = Enum.ScaleType.Slice
			DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

			Igone.Name = "Igone"
			Igone.Parent = Frame
			Igone.AnchorPoint = Vector2.new(0.5, 0.5)
			Igone.BackgroundTransparency = 1.000
			Igone.BorderSizePixel = 0
			Igone.Position = UDim2.new(0.5, 0, 0.5, 0)
			Igone.Size = UDim2.new(1, 0, 1, 0)
			Igone.Visible = false
			Igone.ZIndex = 10
			Igone.Image = "rbxassetid://10924531821"
			Igone.ImageColor3 = Color3.fromRGB(129, 129, 129)
			Igone.ImageTransparency = 0.500
			Igone.SliceCenter = Rect.new(49, 49, 450, 450)

			Label.Name = "Label"
			Label.Parent = Frame
			Label.AnchorPoint = Vector2.new(0.5, 0.5)
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.416157246, 0, 0.500000954, 0)
			Label.Size = UDim2.new(0.782000005, 0, 0.600000024, 0)
			Label.ZIndex = 9
			Label.Font = Enum.Font.GothamBold
			Label.Text = (String or "Dropdown")..tostring(" [None]")
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextScaled = true
			Label.TextSize = 14.000
			Label.TextWrapped = true
			Label.TextXAlignment = Enum.TextXAlignment.Left

			UIListLayout.Parent = Dropdown
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 3)

			UIAspectRatioConstraint_2.Parent = Dropdown
			UIAspectRatioConstraint_2.AspectRatio = 6.500
			UIAspectRatioConstraint_2.AspectType = Enum.AspectType.ScaleWithParentSize

			ScrollingMain.Name = "ScrollingMain"
			ScrollingMain.Parent = Dropdown
			ScrollingMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingMain.BackgroundTransparency = 1.000
			ScrollingMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingMain.BorderSizePixel = 0
			ScrollingMain.Size = UDim2.new(0.964999974, 0, 1, 0)
			ScrollingMain.SizeConstraint = Enum.SizeConstraint.RelativeXX
			ScrollingMain.Visible = false
			ScrollingMain.ZIndex = 9

			UIAspectRatioConstraint_3.Parent = ScrollingMain
			UIAspectRatioConstraint_3.AspectRatio = 2.500
			UIAspectRatioConstraint_3.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner_3.CornerRadius = UDim.new(0, 3)
			UICorner_3.Parent = ScrollingMain

			DropShadow_3.Name = "DropShadow"
			DropShadow_3.Parent = ScrollingMain
			DropShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
			DropShadow_3.BackgroundTransparency = 1.000
			DropShadow_3.BorderSizePixel = 0
			DropShadow_3.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropShadow_3.Size = UDim2.new(1, 37, 1, 37)
			DropShadow_3.ZIndex = 8
			DropShadow_3.Image = "rbxassetid://6014261993"
			DropShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
			DropShadow_3.ImageTransparency = 0.500
			DropShadow_3.ScaleType = Enum.ScaleType.Slice
			DropShadow_3.SliceCenter = Rect.new(49, 49, 450, 450)

			UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
			UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_2.Parent = ScrollingMain

			ScrollingFrame.Parent = ScrollingMain
			ScrollingFrame.Active = true
			ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame.BackgroundTransparency = 1.000
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			ScrollingFrame.Size = UDim2.new(0.980000019, 0, 0.980000019, 0)
			ScrollingFrame.ZIndex = 9
			ScrollingFrame.ScrollBarThickness = 1

			UIListLayout_2.Parent = ScrollingFrame
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 3)

			Lay.Name = "Lay"
			Lay.Parent = Dropdown
			Lay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Lay.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Lay.BorderSizePixel = 0
			Lay.Size = UDim2.new(0.980000019, 0, 1, 0)
			Lay.ZIndex = 9

			UIAspectRatioConstraint_4.Parent = Lay
			UIAspectRatioConstraint_4.AspectRatio = 100.000
			UIAspectRatioConstraint_4.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner_4.CornerRadius = UDim.new(0, 3)
			UICorner_4.Parent = Lay

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.14, 0.25), NumberSequenceKeypoint.new(0.85, 0.26), NumberSequenceKeypoint.new(1.00, 1.00)}
			UIGradient.Parent = Lay
			
			local function button()
				local Button = Instance.new("TextButton")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local UICorner = Instance.new("UICorner")
				local DropShadow = Instance.new("ImageLabel")

				Button.Name = "Button"
				Button.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0.980000019, 0, 0.5, 0)
				Button.ZIndex = 9
				Button.Font = Enum.Font.ArialBold
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextScaled = true
				Button.TextSize = 14.000
				Button.TextWrapped = true

				UIAspectRatioConstraint.Parent = Button
				UIAspectRatioConstraint.AspectRatio = 7.000
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				UICorner.CornerRadius = UDim.new(0, 3)
				UICorner.Parent = Button

				DropShadow.Name = "DropShadow"
				DropShadow.Parent = Button
				DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
				DropShadow.BackgroundTransparency = 1.000
				DropShadow.BorderSizePixel = 0
				DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropShadow.Size = UDim2.new(1, 30, 1, 30)
				DropShadow.ZIndex = 8
				DropShadow.Image = "rbxassetid://6014261993"
				DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
				DropShadow.ImageTransparency = 0.500
				DropShadow.ScaleType = Enum.ScaleType.Slice
				DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
				return Button
			end
			
			local function LOAD()
				for i,v : TextButton in ipairs(ScrollingFrame:GetChildren()) do
					if v:isA("TextButton") then
						v:Destroy()
					end
				end
				
				for i,v in ipairs(INFO) do
					local buton = button()
					buton.Text = tostring(v)
					buton.Parent = ScrollingFrame
					buton.MouseButton1Click:Connect(function()
						Label.Text = String..tostring(" [")..tostring(v)..tostring("]")
					 	callback(v)
					end)
				end
			end
			
			local function DB_TOGGLE(val)
				LOAD()
				if val then
					TWEEN_SERVICE:Create(Dropdown:FindFirstChildWhichIsA('UIAspectRatioConstraint'),TweenInfo.new(0.2),{AspectRatio = 1.8}):Play()
					ScrollingMain.Visible = true
					TWEEN_SERVICE:Create(ScrollingMain:FindFirstChildWhichIsA("UIAspectRatioConstraint"),TweenInfo.new(0.1,Enum.EasingStyle.Linear),{AspectRatio = 2.5}):Play()
					TWEEN_SERVICE:Create(ScrollingMain:FindFirstChildWhichIsA("UIStroke"),TweenInfo.new(0.25),{Transparency = 0}):Play()
					TWEEN_SERVICE:Create(Icon,TweenInfo.new(0.2),{Rotation = 180}):Play()
				else
					TWEEN_SERVICE:Create(Icon,TweenInfo.new(0.2),{Rotation = 0}):Play()
					TWEEN_SERVICE:Create(ScrollingMain:FindFirstChildWhichIsA("UIStroke"),TweenInfo.new(0.25),{Transparency = 1}):Play()
					
					TWEEN_SERVICE:Create(Dropdown:FindFirstChildWhichIsA('UIAspectRatioConstraint'),TweenInfo.new(0.2),{AspectRatio = 6.5}):Play()
					
					TWEEN_SERVICE:Create(ScrollingMain:FindFirstChildWhichIsA("UIAspectRatioConstraint"),TweenInfo.new(0.25,Enum.EasingStyle.Linear),{AspectRatio = 1000}):Play()
					
					task.wait(0.3)
					
					if ScrollingMain:FindFirstChildWhichIsA("UIAspectRatioConstraint").AspectRatio == 100 then
						ScrollingMain.Visible = false
					end
				end
			end
			
			DB_TOGGLE(false)
			
			local valtg = false
			
			Button.MouseButton1Click:Connect(function()
				Create_Ripple(Button)
				valtg = not valtg
				DB_TOGGLE(valtg)
			end)
			
			local Hook = {}

			function Hook:Refresh(infonew)
				if infonew then
					INFO = infonew
					LOAD()
				end
			end

			function Hook:Set(name)
				callback(name)
				Label.Text = String..tostring(" [")..tostring(name)..tostring("]")
			end

			return Hook
			
		end
		
		return tba_assets
	end
	
	function screen:RGB(speed)
		if speed then
			RGB_SPEED = speed
		end
		coroutine.wrap(function()
			while true do task.wait()
				local R = RGB_CODE.Value.R
				local G = RGB_CODE.Value.G
				
				local colorDropw = Color3.fromHSV(R,G, 0.654902)
				TWEEN_SERVICE:Create(DropShadow,TweenInfo.new(0.1),{ImageColor3 = RGB_CODE.Value}):Play()
				TWEEN_SERVICE:Create(DropShadow_2,TweenInfo.new(RGB_SPEED),{ImageColor3 = RGB_CODE.Value}):Play()
				TWEEN_SERVICE:Create(DropShadow_3,TweenInfo.new(RGB_SPEED),{ImageColor3 = RGB_CODE.Value}):Play()
			end
		end)()
	end
	
	local dragToggle = nil
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Frame, TweenInfo.new(0.1), {Position = position}):Play()
	end

	Header.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
	UIS.InputBegan:Connect(function(k)
		if k.KeyCode == screen.Toggle then
			ui_val = not ui_val
			toggleEvent:Fire(ui_val)
		end
	end)
	
	return screen
end

return PH_HUB
