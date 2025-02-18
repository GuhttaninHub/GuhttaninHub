local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local Window = Fluent:CreateWindow({
        Title = "Guhttanin Hub",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Dark",
    })

    local Player = Window:AddTab({ Title = "Player", Icon = "user"})

    local slider_walkspeed = Player:AddSlider({
            Title = "Velocidade",
            Min = 0,
            Max = 500,
            Default = 16,
            Increment = 1,
            Callback = function(value)
                local player = game.Players.LocalPlayer
                local character = player.Character or player.Character:AddedWait()
                local humanoid = character:WaitForChild("Humanoid")

                humanoid.WalkSpeed = value
            end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
