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

    local tab_trabalhos = Window:AddTab({ Title = "Farm", Icon = "circle-dollar-sign"})
    local section_farm_trabalhos = tab_trabalhos:Section("Farm Trabalhos")

    local section_button_farm_onibus = section_farm_trabalhos:Button({
                Title = "Farm Motorista",
                Description = "Inicia o farm manual do trabalho de motorista",
                Callback = function()
                    local player = game.Players.LocalPlayer
                    local modelName = player.Name .. "sCar" -- Nome do modelo no Workspace

        -- Aguarda o modelo aparecer no Workspace
                    local model
                    repeat
                        model = game.Workspace:FindFirstChild(modelName)
                        wait(0.6) -- Espera 0.6 segundos antes de tentar novamente
                    until model

        -- Lista de CFrames para teletransporte
                    local positions = {
                        CFrame.new(1504.08215, 13.8398476, 351.12735),
                        CFrame.new(-198.589859, 13.8361034, 734.847534),
                        CFrame.new(-421.780731, 13.8933334, 632.038086),
                        CFrame.new(56.9433823, 13.8396721, 2057.06519),
                        CFrame.new(1898.98572, 13.8608494, 3634.94531),
                        CFrame.new(4428.88916, 13.8896751, 3634.79346),
                        CFrame.new(5577.4917, 13.8896732, 3634.63184),
                        CFrame.new(6411.71729, 22.242281, 1888.05554),
                        CFrame.new(17033.5684, 81.8404388, 475.71463),
                        CFrame.new(14630.1699, 81.8404388, 382.090546),
                        CFrame.new(6203.78516, 13.839673, 381.741852),
                        CFrame.new(3597.10034, 13.8608475, 13.0256786),
                        CFrame.new(2893.47021, 13.8608475, -430.028687)
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

        -- Função para teletransportar o modelo pelos CFrames com a rotação fixa
                    for _, targetPosition in ipairs(positions) do
            -- Define a posição mantendo a rotação "reta"
                        model:SetPrimaryPartCFrame(CFrame.new(targetPosition.Position) * CFrame.Angles(0, 0, 0))
                        wait(0.3) -- Espera 0.3 segundos antes do próximo teletransporte
                    end
                end
            
    })

    local tab_radar = Window:AddTab({ Title = "Radar", Icon = "radar"})

    local button_destroy_radar = tab_radar:Button({
            Title = "Destruir/desativar Radares",
            Description = "Destrua/desative os radares para nunca mais tomar multas",
            Callback = function()
                for _, object in pairs(workspace:GetChildren()) do
                    if object.Name == "Radar" then
                        object:Destroy()
                    end
                end
            end
    })

    local tab_cnh = Window:AddTab({ Title = "CNH", Icon = "settings"})

    local section_tab_cnh_auto_cnh = tab_cnh:Button({
            Title = "Auto CNH",
            Description = "Faz o trageto/puzzle da CNH",
            Callback = function()
                -- Obtém o modelo com base no nome
                local player = game.Players.LocalPlayer
                local modelName = player.Name .. "sCar" -- Nome do modelo no Workspace

-- Aguarda o modelo aparecer no Workspace
                local model
                repeat
                    model = game.Workspace:FindFirstChild(modelName)
                    wait(0.6) -- Espera 0.6 segundos antes de tentar novament
                until model

-- Lista de CFrames para teletransporte
                local positions = {
                    CFrame.new(608.953369, 13.9914713, 656.754578, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    CFrame.new(648.325867, 13.9914713, 734.148132, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    CFrame.new(648.494385, 13.9914713, 821.196533, -1, 8.74227766e-08, 0, 8.74227766e-08, 1, 8.74227766e-08, 7.64274186e-15, 8.74227766e-08, -1),
                    CFrame.new(718.148132, 13.9914713, 940.732117, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    CFrame.new(792.810791, 13.9914713, 772.123718, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    CFrame.new(781.506897, 13.9914713, 689.813293, -1, 0, 0, 0, 1, 0, 0, 0, -1),
                    CFrame.new(731.802734, 8.52883148, 587.48999, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                    CFrame.new(608.953369, 13.9914713, 587.855347, -1, 0, 0, 0, 1, 0, 0, 0, -1)
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

-- Teletransporta o modelo pelos CFrames com rotação fixa
                for i, targetPosition in ipairs(positions) do
    -- Define a posição mantendo a rotação "reta"
                    model:SetPrimaryPartCFrame(CFrame.new(targetPosition.Position) * CFrame.Angles(0, 0, 0))
                    
                    if i == #positions - 1 then
                        wait(7)
                    else
                        wait(0.3) -- Espera 0.3 segundos antes do próximo teletransporte
                    end
                end
            end
        })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
