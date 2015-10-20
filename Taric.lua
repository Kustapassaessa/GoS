--Taric by Merda

require('Inspired')
require('IOW')

--Menu
TaricMenu = Menu("Taric", "Taric")
TaricMenu:SubMenu("Combo", "Combo")
TaricMenu.Combo:Boolean("Q", "Use Q", true)
TaricMenu.Combo:Boolean("W", "Use W", true)
TaricMenu.Combo:Boolean("E", "Use E", true)
TaricMenu.Combo:Boolean("R", "Use R", true)

--Healing
TaricMenu:SubMenu("Healing", "Healing")
TaricMenu.Healing:Boolean("Q", "Auto Q", true)
TaricMenu.Healing:Slider("HealQ", "Q Heal At %", 85, 1, 100, 1)
TaricMenu.Healing:Info("Sep", "")

--Drawings
TaricMenu:SubMenu("Drawings", "Drawings")
TaricMenu.Drawings:Boolean("W","Draw W", true)

OnLoop(function(myHero)

local target = IOW:GetTarget()
local myHero = GetMyHero()

--Combo
if IOW:Mode() == "Combo" then
--Use Dazzle
			if CanUseSpell(myHero, _E) == READY and TaricMenu.Combo.E:Value() and GoS:ValidTarget(target, 625) then
               CastTargetSpell(target, _E)
			end
--Use Shatter
			if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 340) and TaricMenu.Combo.W:Value() then
			   CastSpell(_W)
			end
--Use Radiance
			if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 340) and TaricMenu.Combo.R:Value() then
               CastSpell(_R)
			end

end

--Auto use Imbue
if TaricMenu.Healing.Q:Value() then
				for _, ally in pairs(GoS:GetAllyHeroes()) do
						if (100 * GetCurrentHP(ally))/GetMaxHP(ally) <  TaricMenu.Healing.HealQ:Value() and
							CanUseSpell(myHero, _Q) == READY and GoS:IsInDistance(ally, 750) then
								CastTargetSpell(ally, _Q);
                        end
                    end
                end

if TaricMenu.Drawings.W:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


    end)

	PrintChat("Taric Ruby of Death")
