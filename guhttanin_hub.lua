local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    local Window = Fluent:CreateWindow({
        Title = "Guhttanin Hub",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Dark",
    })

    local Player = Window:AddTab({ Title = "Settings", Icon = "user"})

    local section_settings_player = Player:Section("Player")

    local variable_velocity = 16
    local variable_jump = 50
    local variable_gravity = 196.2
    
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
                variable_velocity = value
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
                variable_jump = value
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
                variable_gravity = value
            end
    })

    local section_settings_restore = Player:Section("Restore")

    local button_restore_velocity = section_settings_restore:Button({
        Title = "Restaurar Velocidade",
        Description = "Resete a velocidade para default",
        Callback = function()
            slider_walkspeed:SetValue(16)
        end
    })

    local button_restore_jump = section_settings_restore:Button({
        Title = "Restaurar Pulo",
        Description = "Resete o pulo para default",
        Callback = function()
            slider_jump:SetValue(50)
        end
    })

    local button_restore_gravity = section_settings_restore:Button({
        Title = "Restaurar Gravidade",
        Description = "Resete a gravidade para default",
        Callback = function()
            slider_gravity:SetValue(196.2)
        end
    })

    local toggle_imortal = section_settings_player:Toggle("Toggle_Imortal",
        {
            Title = "Imortalidade",
            Default = false,
            Callback = function(state)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")

                local connection
                
                if state then
                    connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                            humanoid.Health = humanoid.MaxHealth
                        end)
                else
                    if connection then
                        connection:Disconnect()
                        connection = nil
                    end
                end
            end
            
    })

    humanoid.Died:Connect(function()
            wait(1)
            slider_velocity:SetValue(variable_velocity)
            slider_jump:SetValue(variable_jump)
            slider_gravity:SetValue(variable_gravity)
        end)
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
