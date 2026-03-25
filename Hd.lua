-- [[ Kingdom Ultimate Speed Menu ]] --

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")

-- إعدادات الواجهة
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Name = "SpeedMaster"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 230, 0, 160)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

Title.Parent = Frame
Title.Text = "KINGDOM MODS"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.TextColor3 = Color3.fromRGB(0, 200, 255) -- لون أزرق سماوي نيون
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- وظيفة إنشاء الأزرار
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(0.9, 0, 0, 42)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

--- [ الأزرار بالقيم الجديدة ] ---

-- 1. زر إنتاج فائق (قيمة ثابتة 0.001)
createButton("⚡ إنتاج فائق (0.001s)", Color3.fromRGB(40, 40, 40), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj.Name == "ProductionSpeed" or obj.Name == "ProductionDelay") and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            obj.Value = 0.001
            count = count + 1
        end
    end
    print("تم ضبط الإنتاج على 0.001 لعدد: " .. count)
end)

-- 2. زر مضاعفة سرعة البناء (تقسيم الوقت على 1000)
createButton("🏗️ مضاعفة البناء x1000", Color3.fromRGB(0, 100, 50), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        -- البحث عن قيم البناء
        if (obj.Name == "BuildTime" or obj.Name == "BuildDelay" or obj.Name == "BuildSpeed" or obj.Name == "WaitTime") 
           and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            
            if obj.Value > 0 then
                -- تقسيم القيمة الحالية على 1000 لجعلها أسرع بـ 1000 مرة
                obj.Value = obj.Value / 1000
                count = count + 1
            end
        end
    end
    print("تم تسريع البناء بمقدار 1000 ضعف لعدد: " .. count)
end)

print("Ultimate Speed Script Loaded Successfully!")
