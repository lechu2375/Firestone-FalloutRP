AddCSLuaFile()

local TEXTENTRY = {}

function TEXTENTRY:Init()
  self.dark = Color(15, 72, 34,215)
  self.light = Color(17,255,31)
  self:SetText("")
  self:SetDrawLanguageID(false)
  self:SetMultiline(true)
end

function TEXTENTRY:Paint(w, h)
  surface.SetDrawColor(self.light)
  surface.DrawOutlinedRect(0, 0, w, h)
  surface.DrawOutlinedRect(1, 1, w-2, h-2)
  self:DrawTextEntryText(Color(255, 255, 255), Color(29, 173, 37), Color(255, 255, 255))

end

vgui.Register("FS_TextEntry", TEXTENTRY, "DTextEntry")
