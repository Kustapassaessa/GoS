UdyrMenu = Menu("Udyr", "Udyr")

UdyrMenu:SubMenu("Combo", "Combo")
UdyrMenu.Combo:Boolean("Q", "Use Q", true)
UdyrMenu.Combo:Boolean("W", "Use W", true)
UdyrMenu.Combo:Boolean("E", "Use E", true)
UdyrMenu.Combo:Boolean("R", "Use R", true)

UdyrMenu:SubMenu("Drawings", "Drawings")
UdyrMenu.Drawings:Boolean("R","Draw R", true)

OnLoop(function(myHero)


local target = GetCurrentTarget()



if IOW:Mode() == "Combo" then
			if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target, 1550) and UdyrMenu.Combo.E:Value() then
                       		 CastSpell(_E)
				end
			if CanUseSpell(myHero, _Q) == READY and GoS:ValidTarget(target, 125) and UdyrMenu.Combo.Q:Value() then
                       		 CastSpell(_Q)
					end
			if CanUseSpell(myHero, _R) == READY and GoS:ValidTarget(target, 250) and UdyrMenu.Combo.R:Value() then
                       		 CastSpell(_R)
						end
			if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 125) and UdyrMenu.Combo.W:Value() then
                       		 CastSpell(_W)
							end

								end



if UdyrMenu.Drawings.R:Value() then DrawCircle(GoS:myHeroPos().x, GoS:myHeroPos().y, GoS:myHeroPos().z,(GetCastRange(myHero,_R)),3,100,0xff00ff00) end


    end)

	PrintChat("Udyr Plain and Simple")
