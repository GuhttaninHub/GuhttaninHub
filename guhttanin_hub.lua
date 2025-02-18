local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local Window = Fluent:CreateWindow({
        Title = "Guhttanin Hub",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Dark",
    })

    local Player = Window:AddTab({ Title = "Settings", Icon = "user"})

    local section_settings_player = Player:Section("Player")

    local slider_walkspeed = section_settings_player:AddSlider("Slider_WalkSpeed",
        {
            Title = "Velocidade",
            Min = 0,
            Max = 500,
            Default = 16,
            Increment = 1,
            Callback = function(value)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")

                humanoid.WalkSpeed = value
            end
    })

    local slider_jump = section_settings_player:AddSlider("Slider_Jump",
        {
            Title = "Pulo",
            Min = 0,
            Max = 500,
            Default = 50,
            Increment = 1,
            Callback = function(value)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")

                humanoid.JumpPower = value
            end
    })

    local section_settings_game = Player:Section("Game")

    local slider_gravity = section_settings_game:AddSlider("Slider_Gravity",
        {
            Title = "Gravidade", 
            Min = 0,
            Max = 500,
            Default = 196.2,
            Increment = 0.2,
            Callback = function(value)
                Workspace.Gravity = value
            end
    })

    local section_settings_restore = Player:Section("Restore")

    local button_restore_velocity = section_settings_restore:AddButton("Button_Restore_Speed",
        {
            Title = "Restaurar Velocidade",
            Description = "Resete a velocidade para default",
            Callback = function()
                Slider_WalkSpeed:SetValue(16)
            end
    })

    local button_restore_jump = section_settings_restore:AddButton("Button_Restore_Jump",
        {
            Title = "Restaurar Pulo",
            Description = "Resete o pulo para default",
            Callback = function()
                Slider_Jump:SetValue(50)
            end
    })

    local button_restore_gravity = section_settings_restore:AddButton("Button_Restore_Gravity",
        {
            Title = "Restaurar Gravidade",
            Description = "Resete a gravidade para default",
            Callback = function()
                Slider_Gravity:SetValue(196.2)
            end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
