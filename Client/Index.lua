
local canvas = Canvas(
    true,
    Color(0, 0, 0, 0),
    0,
    true
)
canvas:Subscribe("Update", function(self, width, height)
    local ply = Client.GetLocalPlayer()
    if ply then
        local char = ply:GetControlledCharacter()
        if char then
            local loc = char:GetLocation()
            local rot = char:GetRotation()

            self:DrawText(tostring(loc) .. ", YAW : " .. tostring(rot.Yaw), Vector2D(math.floor(Client.GetViewportSize().X * 0.5), math.floor(Client.GetViewportSize().Y * 0.95)), 0, 12, Color.WHITE, 0, true, true, Color(0, 0, 0, 0), Vector2D(), false, Color.WHITE)
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