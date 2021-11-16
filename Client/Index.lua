
Render.ClearItems(3451)
local POS_TEXT = Render.AddText(3451, "", Vector2D(math.floor(Render.GetViewportSize().X * 0.5), math.floor(Render.GetViewportSize().Y * 0.95)), 0, 12, Color.WHITE, 0, true, true, false, Vector2D(), Color.WHITE, false,  Color.WHITE)


Client.Subscribe("Tick", function(ds)
    local ply = Client.GetLocalPlayer()
    if ply then
        local char = ply:GetControlledCharacter()
        if char then
            local loc = char:GetLocation()
            local rot = char:GetRotation()

            Render.UpdateItemText(3451, POS_TEXT, tostring(loc) .. ", YAW : " .. tostring(rot.Yaw))
        end
    end
end)

Client.Subscribe("Console", function(text)
    if text == "/cl" then
        local ply = Client.GetLocalPlayer()
        if ply then
            local char = ply:GetControlledCharacter()
            if char then
                local loc = char:GetLocation()
                local rot = char:GetRotation()

                print("CHARACTER LOCATION AND YAW")
                print("Vector(" .. tostring(loc.X) .. ", " .. tostring(loc.Y) .. ", " .. tostring(loc.Z) .. ")")
                print(tostring(rot.Yaw))
                print("__________________________________________________________________________")
            end
        end
    end
end)