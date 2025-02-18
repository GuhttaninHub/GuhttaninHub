local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local Window = Fluent:CreateWindow({
        Title = "Guhttanin Hub",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Dark",
    })

    local Player = Window:AddTab({ Title = "Player", Icon = "user"})

    local Toggle = Player:AddToggle("Walkspeed", 
    {
        Title = "Super Velocidade", 
        Default = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")

            if state then
                humanoid.WalkSpeed = 100
            else
                humanoid.WalkSpeed = 16
            end
        end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
