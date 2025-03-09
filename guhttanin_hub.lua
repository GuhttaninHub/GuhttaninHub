local function Delete_All_Doors()
    local map = game.Workspace:FindFirstChild("Map")
    if map then
        local puzzles = map:FindFirstChild("Puzzles")
        if puzzles then
            puzzles:Destroy()
        end
    end
end

local function Notification(title, content, duration)
    Fluent:Notify{
        Title = title,
        Content = content,
        Duration = duration
    }
end

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
            Callback = function()
                Delete_All_Doors()
                Notification("Portas Deletadas", "Um obrigado de Guhttanin (Dev)", 5)
            end
    })
    
    Window:Show()
else
    warn("Erro ao carregar o Fluent.")
end
