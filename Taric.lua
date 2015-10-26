if GetObjectName(GetMyHero()) ~= "Taric" then return end
require('Inspired')
PrintChat("Taric Ruby of Death by Merda")

Taric = MenuConfig("Ruby of Death", "Taric")

Taric:Menu("Combo", "Combo")
Taric.Combo:Boolean("Q", "Use Q", true)
Taric.Combo:Boolean("W", "Use W", true)
Taric.Combo:Boolean("E", "Use E", true)
Taric.Combo:Boolean("R", "Use R", true)

Taric:SubMenu("Drawings", "Drawings")
Taric.Drawings:Boolean("E", "Draw Stun Range", false)

Taric:SubMenu("Healing", "Healing")
Taric.Healing:Boolean("Q", "Auto Q", true)
Taric.Healing:Slider("HealQ", "Q Heal At %", 60, 1, 100, 1)
Taric.Healing:Info("Sep", "")

Taric:Menu("Keys", "Keys")
Taric.Keys:Key("Combo", "Combo", 32)

OnTick(function(myHero)
local target = GetCurrentTarget()

	if IOW:Mode() == "Combo" then

		if CanUseSpell(myHero,_E) == READY and ValidTarget(target, 625) and Taric.Combo.E:Value() then
		   CastTargetSpell(target,_E)
		end
		
		if CanUseSpell(myHero,_W) == READY and ValidTarget(target, 340) and Taric.Combo.W:Value() then
		   CastSpell(_W)
		end
		
		if CanUseSpell(myHero,_R) == READY and ValidTarget(target, 340) and Taric.Combo.R:Value() then
		   CastSpell(_R)
		end
end

if Taric.Healing.Q:Value() then
				for _, ally in pairs(GetAllyHeroes()) do
						if (100 * GetCurrentHP(ally))/GetMaxHP(ally) <  Taric.Healing.HealQ:Value() and
							CanUseSpell(myHero, _Q) == READY and IsInDistance(ally, 750) then
								CastTargetSpell(ally, _Q);
                        end
                    end
                end

if Taric.Drawings.E:Value() then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,(GetCastRange(myHero,_E)),3,100,0xff00ff00) end
end)

AddGapcloseEvent(_E, 610, true)
