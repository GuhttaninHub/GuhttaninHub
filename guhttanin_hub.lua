local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()

if Fluent then
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    local Window = Fluent:CreateWindow({
        Title = "True Love Cheats - Centipede",
        SubTitle = "Desenvolvido por Guhttanin",
        Size = UDim2.fromOffset(720, 400),
        Theme = "Aqua",
    })

    local Doors_Tab = Window:AddTab({ Title = "Doors", Icon = "door-open" })

    local Doors_Tab_Option_Button_All_Doors_Delete = Doors_Tab:AddButton({
            Title = "Delete All Doors",
            Description = "Delete All Doors From The Game",
            Callback = 
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
