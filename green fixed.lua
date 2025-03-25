-- Services
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

-- Create the ImageLabel
local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = screenGui
imageLabel.Size = UDim2.new(0, 138, 0, 138)  -- Size: 138x138
imageLabel.Position = UDim2.new(0.01, 0, 0.813, 0)  -- Position as specified
imageLabel.Image = "rbxassetid://104147423617326"  -- Using the provided Decal ID
imageLabel.Visible = true  -- Make it visible
imageLabel.ImageTransparency = 1  -- Start with fully transparent image
imageLabel.BackgroundTransparency = 1  -- Make the background fully transparent

-- Function to smoothly change transparency twice and then hide smoothly
local function changeTransparencyTwiceAndHideSmoothly()
    -- Fade the image in (make it visible)
    local tweenInfoIn = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goalIn = {ImageTransparency = 0}  -- Make it fully visible

    local tweenIn = TweenService:Create(imageLabel, tweenInfoIn, goalIn)
    tweenIn:Play()  -- Play the fade-in tween

    -- Wait for the fade-in to complete
    tweenIn.Completed:Wait()

    -- Fade the image out (make it transparent)
    local tweenInfoOut = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goalOut = {ImageTransparency = 1}  -- Make it fully transparent

    local tweenOut = TweenService:Create(imageLabel, tweenInfoOut, goalOut)
    tweenOut:Play()  -- Play the fade-out tween

    -- Wait for the fade-out to complete
    tweenOut.Completed:Wait()

    -- Fade the image back in (make it visible again)
    local tweenInfoIn2 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goalIn2 = {ImageTransparency = 0}  -- Make it fully visible again

    local tweenIn2 = TweenService:Create(imageLabel, tweenInfoIn2, goalIn2)
    tweenIn2:Play()  -- Play the fade-in tween again

    -- Wait for the fade-in to complete
    tweenIn2.Completed:Wait()

    -- Fade the image out again and then hide it smoothly
    local tweenInfoOut2 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goalOut2 = {ImageTransparency = 1}  -- Make it fully transparent again

    local tweenOut2 = TweenService:Create(imageLabel, tweenInfoOut2, goalOut2)
    tweenOut2:Play()  -- Play the fade-out tween again

    -- Wait for the second fade-out to complete
    tweenOut2.Completed:Wait()

    -- Smoothly hide the ImageLabel by making it invisible
    imageLabel.Visible = false  -- Hide the image label
    -- Or destroy it if you no longer need it
    -- imageLabel:Destroy()  -- Optionally destroy the ImageLabel from the screen
end

-- Call the function to start the effect
changeTransparencyTwiceAndHideSmoothly()
