
local function getlocandrot()
    local loc
    local rot

    local ply = Client.GetLocalPlayer()
    if ply then
        local char = ply:GetControlledCharacter()
        if char then
            loc = char:GetLocation()
            rot = char:GetRotation()
        else
            loc = ply:GetCameraLocation()
            rot = ply:GetCameraRotation()
        end
    end

    return loc, rot
end


local canvas = Canvas(
    true,
    Color(0, 0, 0, 0),
    0,
    true
)
canvas:Subscribe("Update", function(self, width, height)
    local loc, rot = getlocandrot()
    if (loc and rot) then
        self:DrawText(tostring(loc) .. ", YAW : " .. tostring(rot.Yaw), Vector2D(math.floor(Viewport.GetViewportSize().X * 0.5), math.floor(Viewport.GetViewportSize().Y * 0.95)), 0, 12, Color.WHITE, 0, true, true, Color(0, 0, 0, 0), Vector2D(), false, Color.WHITE)
    end
end)

Console.Subscribe("PlayerSubmit", function(text)
    if text == "/cl" then
        local loc, rot = getlocandrot()
        if (loc and rot) then
            print("CHARACTER/CAMERA LOCATION AND YAW")
            print("Vector(" .. tostring(loc.X) .. ", " .. tostring(loc.Y) .. ", " .. tostring(loc.Z) .. ")")
            print(tostring(rot.Yaw))
            print("__________________________________________________________________________")
        end
    end
end)