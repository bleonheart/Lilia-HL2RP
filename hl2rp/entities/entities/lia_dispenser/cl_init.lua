include("shared.lua")
local COLOR_RED = 1
local COLOR_ORANGE = 2
local COLOR_BLUE = 3
local COLOR_GREEN = 4
local colors = {
    [COLOR_RED] = Color(255, 50, 50),
    [COLOR_ORANGE] = Color(255, 80, 20),
    [COLOR_BLUE] = Color(50, 80, 230),
    [COLOR_GREEN] = Color(50, 240, 50)
}

function ENT:Draw()
    local position, angles = self:GetPos(), self:GetAngles()
    angles:RotateAroundAxis(angles:Forward(), 90)
    angles:RotateAroundAxis(angles:Right(), 270)
    cam.Start3D2D(position + self:GetForward() * 7.6 + self:GetRight() * 8.5 + self:GetUp() * 3, angles, 0.1)
    render.PushFilterMin(TEXFILTER.NONE)
    render.PushFilterMag(TEXFILTER.NONE)
    surface.SetDrawColor(40, 40, 40)
    surface.DrawRect(0, 0, 66, 60)
    draw.SimpleText(self:GetDisabled() and "OFFLINE" or (self:GetText() or ""), "Default", 33, 0, Color(255, 255, 255, math.abs(math.cos(RealTime() * 1.5) * 255)), 1, 0)
    surface.SetDrawColor(colors[self:GetDisabled() and COLOR_RED or self:GetDispColor()] or color_white)
    surface.DrawRect(4, 14, 58, 42)
    surface.SetDrawColor(60, 60, 60)
    surface.DrawOutlinedRect(4, 14, 58, 42)
    render.PopFilterMin()
    render.PopFilterMag()
    cam.End3D2D()
end
