if GetObjectName(GetMyHero()) ~= "Udyr" then return end
require('Inspired')

local info = "Udyr Plain and Simple by Merda"
textTable = {info}
PrintChat(textTable[1])

Udyr = MenuConfig("Plain and Simple", "Udyr")

Udyr:Menu("Combo", "Combo")
Udyr.Combo:Boolean("Q", "Use Q", true)
Udyr.Combo:Boolean("W", "Use W", true)
Udyr.Combo:Boolean("E", "Use E", true)
Udyr.Combo:Boolean("R", "Use R", true)

Udyr:Menu("Keys", "Keys")
Udyr.Keys:Key("Combo", "Combo", 32)

OnTick(function(myHero)
local target = GetCurrentTarget()

	if IOW:Mode() == "Combo" then

		if CanUseSpell(myHero,_E) == READY and ValidTarget(target, 1550) and Udyr.Combo.E:Value() then
		   CastSpell(_E)
		end
		
		if CanUseSpell(myHero,_Q) == READY and ValidTarget(target, 125) and Udyr.Combo.Q:Value() then
		   CastSpell(_Q)
		end
		
		if CanUseSpell(myHero,_R) == READY and ValidTarget(target, 125) and Udyr.Combo.R:Value() then
		   CastSpell(_R)
		end
		
		if CanUseSpell(myHero,_W) == READY and ValidTarget(target, 125) and Udyr.Combo.W:Value() then
		   CastSpell(_W)
		end
end
end)
