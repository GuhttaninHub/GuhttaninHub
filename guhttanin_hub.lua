local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    local Window = Fluent:CreateWindow({
        Title = "EB Luy Script Hub",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Dark",
    })

    local Player = Window:AddTab({ Title = "Settings", Icon = "settings"})

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

    local toggle_no_clip = section_settings_player:Toggle("Toggle_NoClip",
        {
            Title = "NoClip",
            Default = false,
            Callback = function(state)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()

                if state then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                else
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end
    })

    local variable_tween_player

    local section_settings_tween = Player:Section("Tween")

    local dropdown_tween_player = section_settings_tween:Dropdown("DropDown_Tween_Players",
        {
            Title = "Player",
            Values = {},
            Default = nil,
            Callback = function(selectedOption)
                variable_tween_player = selectedOption
            end
    })

    local function UpdatePlayers()
        local players = {}
        for _, player in pairs(game.Players:GetPlayers()) do
            table.insert(players, player.Name)
        end
        dropdown_tween_player:SetValues(players)
    end

    UpdatePlayers()

    local button_tween_player = section_settings_tween:AddButton({
            Title = "Teletransportar",
            Description = "Se teletransporte para o jogador selecionado",
            Callback = function()
                local player_tween = game.Players:FindFirstChild(variable_tween_player)
                if player_tween then
                    local character = player_tween.Character
                    if character then
                        local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")
                        if humanoid_root_part then
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(humanoid_root_part.CFrame)
                        end
                    end
                end
            end
    })

    local tab_pedreiro = Window:AddTab({ Title = "Pedreiro", Icon = "settings"})

    local tab_pedreiro_button_portao_rec = tab_pedreiro:AddButton({
            Title = "Quebrar Portão de Recrutamento",
            Description = "Some com o portão de recrutamento",
            Callback = function()
                local gate = game.Workspace:FindFirstChild("Gates")

                if gate then
                    local gatesRec = gate:FindFirstChild("GatesRec")
                    if gatesRec then
                        local targetGate = gatesRec:FindFirstChild("Gate")
                        if targetGate then
                            targetGate:Destroy()
                        end
                    end
                end
            end
    })

    local tab_farm = Window:AddTab({ Title = "Farm", Icon = "settings"})

    local tab_farrm_buttob_farm_bank = tab_farm:AddButton({
            Title = "Farm Bank",
            Description = "Inicia o Farm no Banco",
            Callback = function()
                local door = game.Workspace.Bank.CofreDoorModel:FindFirstChild("DoorBank")
                if door then
                    door:Destroy()
                end

                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()

                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(
                        160.375336, 19.5691586, 88.2443695, 
                        -1.1920929e-07, 0, 1.00000012, 
                        0, 1, 0, 
                        -1.00000012, 0, -1.1920929e-07
                    )
                end

                wait(1)

                character.HumanoidRootPart.CFrame = CFrame.new(
                    170.940872, 21.8941059, 123.225372,
                    1, 0, 0, 
                    0, 1, 0, 
                    0, 0, 1
                )

                wait(1)

                character.HumanoidRootPart.CFrame = CFrame.new(
                    167.144455, 17.9736748, 163.366989, 
                    0, 0, 1, 
                    0, 1, 0, 
                    -1, 0, 0
                )

                wait(0.3)

                character.HumanoidRootPart.CFrame = CFrame.new(
                    170.940872, 21.8941059, 123.225372,
                    1, 0, 0, 
                    0, 1, 0, 
                    0, 0, 1
                )
                
            end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
