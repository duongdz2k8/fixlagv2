local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Arceus-X-UI-Library/main/source.lua"))()
lib:SetTitle("Fix Lag V2")
lib:SetIcon("http://www.roblox.com/asset/?id=9178187770")

local disableGPUThread
local fastModeThread
local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
local player = g.Players.LocalPlayer
local sv = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local RunService = g:GetService("RunService")


lib:AddToggle("Fast mode", function(state)
    if state then 
        fastModeThread= task.spawn(function() 
            sethiddenproperty(l,"Technology",2)
            sethiddenproperty(t,"Decoration",false)
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = 0
            l.FogEnd = 9e9
            l.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            for i, v in pairs(w:GetDescendants()) do
                if v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") and decalsyeeted then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                elseif v:IsA("SpecialMesh") and decalsyeeted  then
                    v.TextureId=0
                elseif v:IsA("ShirtGraphic") and decalsyeeted then
                    v.Graphic=0
                elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                    v[v.ClassName.."Template"]=0
                end
            end
            for i = 1,#l:GetChildren() do
                e=l:GetChildren()[i]
                if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                    e.Enabled = false
                end
            end
            w.DescendantAdded:Connect(function(v)
                wait()--prevent errors and shit
                if v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") and decalsyeeted then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                elseif v:IsA("SpecialMesh") and decalsyeeted then
                    v.TextureId=0
                elseif v:IsA("ShirtGraphic") and decalsyeeted then
                    v.ShirtGraphic=0
                elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                    v[v.ClassName.."Template"]=0
                end
            end)
        end)
    else task.cancel(fastModeThread) end
end, false)
lib:AddToggle("Disable GPU", function(gpu)
    if gpu then
        disableGPUThread = task.spawn(function() 
            RunService:Set3dRenderingEnabled(false)
            sv.Name = "sv"
            sv.Parent = g.CoreGui
            sv.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            BG.Name = "BG"
            BG.Parent = sv
            BG.BackgroundColor3 = Color3.fromRGB(7, 47, 95)
            BG.Position = UDim2.new(0, 0, -0.0502008051, 0)
            BG.Size = UDim2.new(1, 0, 1.10040164, 0)
            BG.Visible = true
        end)
    else task.cancel(disableGPUThread) end
end, false)
