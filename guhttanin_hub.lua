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

                humanoid.Walkspeed = value
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

    local section_settings_tween = Player:Section("Tween")

    local variable_tween_player

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

    local section_trabalhos = Player:Section("Farm Trabalhos")

    local section_button_farm_onibus = section_trabalhos:Button({
    Title = "Farm Motorista",
    Description = "Inicia o farm manual do trabalho de motorista",
    Callback = function()
        local player = game.Players.LocalPlayer
        local modelName = player.Name .. "sCar" -- Nome do modelo no Workspace

        -- Aguarda o modelo aparecer no Workspace
        local model
        repeat
            model = game.Workspace:FindFirstChild(modelName)
            wait(1) -- Espera 1 segundo antes de tentar novamente
        until model

        -- Lista de CFrames para teletransporte
        local positions = {
            CFrame.new(1504.08215, 13.8398476, 351.12735, -6.43730164e-06, -0.173615217, 0.984813571, 1, -6.43730164e-06, 5.48362732e-06, 5.48362732e-06, 0.984813571, 0.173615217),
            CFrame.new(-198.589859, 13.8361034, 734.847534, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(-421.780731, 13.8933334, 632.038086, -5.24520874e-06, 9.15527344e-05, 1, 1, 5.24520874e-06, 5.24520874e-06, -5.24520874e-06, 1, -9.15527344e-05),
            CFrame.new(56.9433823, 13.8396721, 2057.06519, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(1898.98572, 13.8608494, 3634.94531, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(4428.88916, 13.8896751, 3634.79346, -3.64780426e-05, -0.014883101, 0.999889135, 0.99999994, -3.64780426e-05, 3.59117985e-05, 3.59117985e-05, 0.999889135, 0.0148831606),
            CFrame.new(5577.4917, 13.8896732, 3634.63184, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(6411.71729, 22.242281, 1888.05554, -6.83069229e-05, 6.74426556e-05, 1.00000024, 0.999952793, 0.00973552465, 6.74426556e-05, -0.00973573327, 0.999952793, -6.83069229e-05),
            CFrame.new(17033.5684, 81.8404388, 475.71463, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(14630.1699, 81.8404388, 382.090546, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(6203.78516, 13.839673, 381.741852, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(3597.10034, 13.8608475, 13.0256786, 0, 0, 1, 1, 0, 0, 0, 1, 0),
            CFrame.new(2893.47021, 13.8608475, -430.028687, 0, 0, 1, 1, 0, 0, 0, 1, 0)
        }

        -- Verifica se o modelo tem uma PrimaryPart
        if not model.PrimaryPart then
            local part = model:FindFirstChildWhichIsA("BasePart")
            if part then
                model.PrimaryPart = part
            else
                warn("O modelo não tem peças válidas!")
                return
            end
        end

        -- Desancora todas as partes do modelo
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
            end
        end

        -- Função para teletransportar o modelo pelos CFrames com delay de 2 segundos
        for _, targetCFrame in ipairs(positions) do
            model:SetPrimaryPartCFrame(targetCFrame)
            wait(2) -- Espera 2 segundos antes do próximo teletransporte
        end
    end
})
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
