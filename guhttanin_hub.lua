local function End_Teleport()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    local destino = CFrame.new(582.218201, 902.354614, 598.786926, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07) -- Altere para a posição desejada

    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = destino
    end

    local args = {
        [1] = "teleportToCheckpoint",
        [2] = 21
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Travel"):FireServer(unpack(args))

    local args = {
        [1] = "teleportToCheckpoint",
        [2] = 23
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Travel"):FireServer(unpack(args))
end

local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    local Window = Fluent:CreateWindow({
        Title = "True Love Cheats - Passeio Com Cachorro - Obby de 2 Jogadores",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Aqua",
    })

    local End_Tab = Window:AddTab({ Title = "End Teleport", Icon = "settings" })

    local End_Button = End_Tab:AddButton({
            Title = "End Teleport",
            Description = "Te Teleporta Até o Final",
            Callback = function()
                End_Teleport()
                Fluent:Notify{
                    Title = "Um Obrigado de Guhttanin (Dev)",
                    Content = "Teletransportado até o final! Obrigado por usar meus Cheats",
                    Duration = 10
                }
            end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
