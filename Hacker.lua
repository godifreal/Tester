 ScreenGui = Instance.new("ScreenGui")
 Frame = Instance.new("Frame")
 Title = Instance.new("TextLabel")
 Tab = Instance.new("Frame")
 Section = Instance.new("Frame")
 Button = Instance.new("TextButton")
 ToggleButton = Instance.new("ImageButton")
 CloseButton = Instance.new("ImageButton")

-- Parent ScreenGui to the Player's GUI
ScreenGui.Parent = game.Players.Player:WaitForChild("PlayerGui")
ScreenGui.Name = "CoolLibraryGui"
ScreenGui.ResetOnSpawn = false

-- Frame properties
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0.3, 0, 0.5, 0)
Frame.Position = UDim2.new(0.35, 0, 0.25, 0)
Frame.BorderSizePixel = 0
Frame.Active = true -- Allows dragging
Frame.Draggable = true -- Makes draggable
Frame.Visible = false -- Start as hidden for animation

-- Title properties
Title.Parent = Frame
Title.Text = "Cool Library"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.BackgroundTransparency = 1

-- Close Button properties
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(0.95, -20, 0.03, 0)
CloseButton.Image = "rbxassetid://6035047409" -- Close icon
CloseButton.BackgroundTransparency = 1
CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

-- Tab properties
Tab.Parent = Frame
Tab.Size = UDim2.new(0.3, 0, 0.9, 0)
Tab.Position = UDim2.new(0, 0, 0.1, 0)
Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Tab.BorderSizePixel = 0

 TabLabel = Instance.new("TextLabel")
TabLabel.Parent = Tab
TabLabel.Text = "Tab 1"
TabLabel.Font = Enum.Font.Gotham
TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TabLabel.TextScaled = true
TabLabel.Size = UDim2.new(1, 0, 0.1, 0)
TabLabel.BackgroundTransparency = 1

-- Section properties
Section.Parent = Frame
Section.Size = UDim2.new(0.7, 0, 0.9, 0)
Section.Position = UDim2.new(0.3, 0, 0.1, 0)
Section.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Section.BorderSizePixel = 0

-- Button properties
Button.Parent = Section
Button.Text = "Cool Button!"
Button.Font = Enum.Font.Gotham
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.Size = UDim2.new(0.8, 0, 0.2, 0)
Button.Position = UDim2.new(0.1, 0, 0.1, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Button.BorderSizePixel = 0

-- Add hover effect for button
Button.MouseEnter:Connect(function()
    Button.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Brighten
end)
Button.MouseLeave:Connect(function()
    Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Reset color
end)

Button.MouseButton1Click:Connect(function()
    print("Button clicked!")
end)

 Toggle Button properties
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0)
ToggleButton.Image = "rbxassetid://6031068420" -- Replace with custom icon
ToggleButton.BackgroundTransparency = 1

 isFrameVisible = false
ToggleButton.MouseButton1Click:Connect(function()
    isFrameVisible = not isFrameVisible
    if isFrameVisible then
        Frame.Visible = true
        Frame:TweenPosition(UDim2.new(0.35, 0, 0.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
    else
        Frame:TweenPosition(UDim2.new(0.35, 0, -0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true, function()
            Frame.Visible = false
        end)
    end
end)

-- Add Rounded Corners (Optional)
 function addUICorner(instance, radius)
     UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(radius, 0)
    UICorner.Parent = instance
end

addUICorner(Frame, 0.02)
addUICorner(Tab, 0.02)
addUICorner(Section, 0.02)
addUICorner(Button, 0.1)

-- Smooth Show/Hide Animation
Frame.Position = UDim2.new(0.35, 0, -0.5, 0) -- Start off-screen
