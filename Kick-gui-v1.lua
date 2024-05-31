-- Define the notification service
local NotificationService = game:GetService("NotificationService")

-- Create a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.Parent = ScreenGui

-- Create a TextBox for Player's Name
local PlayerTextBox = Instance.new("TextBox")
PlayerTextBox.Size = UDim2.new(0, 180, 0, 30)
PlayerTextBox.Position = UDim2.new(0.5, -90, 0.1, -15)
PlayerTextBox.PlaceholderText = "Enter player's name..."
PlayerTextBox.Parent = Frame

-- Create a TextBox for Reason
local ReasonTextBox = Instance.new("TextBox")
ReasonTextBox.Size = UDim2.new(0, 180, 0, 30)
ReasonTextBox.Position = UDim2.new(0.5, -90, 0.4, -15)
ReasonTextBox.PlaceholderText = "Enter reason for kick..."
ReasonTextBox.Parent = Frame

-- Create a Button for Submit
local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0, 100, 0, 30)
SubmitButton.Position = UDim2.new(0.5, -50, 0.7, -15)
SubmitButton.Text = "Submit"
SubmitButton.Parent = Frame

-- Function to kick the player and notify
local function KickPlayer(playerName, reason)
    local player = game.Players:FindFirstChild(playerName)
    if player then
        player:Kick("You have been kicked from the game. Reason: " .. reason)
        -- Notify success kick
        local notificationId = NotificationService:CreateNotification(
            "Success Kick!",
            playerName .. " has been kicked from the game. Reason: " .. reason,
            "rbxassetid://trollface"
        )
        NotificationService:SetNotificationIcon(notificationId, "rbxassetid://trollface")
        NotificationService:SetCallback(notificationId, function()
            -- Handle notification click if needed
        end)
        NotificationService:SetDuration(notificationId, 5) -- Display notification for 5 seconds
        NotificationService:ShowNotification(notificationId)
    else
        -- Notify invalid player
        local notificationId = NotificationService:CreateNotification(
            "Invalid Player",
            "The specified player is invalid or has quit the game.",
            "rbxassetid://trollface"
        )
        NotificationService:SetNotificationIcon(notificationId, "rbxassetid://trollface")
        NotificationService:SetCallback(notificationId, function()
            -- Handle notification click if needed
        end)
        NotificationService:SetDuration(notificationId, 5) -- Display notification for 5 seconds
        NotificationService:ShowNotification(notificationId)
    end
end

-- Event handler for SubmitButton Clicked
SubmitButton.MouseButton1Click:Connect(function()
    local playerName = PlayerTextBox.Text
    local reason = ReasonTextBox.Text
    if playerName ~= "" and reason ~= "" then
        KickPlayer(playerName, reason)
    end
end)

game.Players.PlayerAdded:Connect(function(player)
    if game.PlaceId == 4483381587 then
        player:Kick("Sorry, this game does not support players from this server. Use Game: Baseplate")
    end
end)
