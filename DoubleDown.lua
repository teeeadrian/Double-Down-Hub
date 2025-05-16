
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local scripts = {}

scripts["obby"] = function()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name == "Platform" then
            HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
            task.wait(0.15)
        end
    end
end

scripts["jump_rope"] = function()
    while true do
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
        task.wait(0.4)
    end
end

scripts["sword_fight"] = function()
    while true do
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Activate") then
            tool:Activate()
        end
        task.wait(0.3)
    end
end

-- 主程序部分，修改这里选择想执行的小游戏脚本
local selected = "obby"  -- 你可以改成 "jump_rope" 或 "sword_fight"

if scripts[selected] then
    print("开始执行脚本: " .. selected)
    scripts[selected]()
else
    warn("没有找到对应的脚本: " .. selected)
end
