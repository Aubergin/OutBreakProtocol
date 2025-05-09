-- Outbreak_KatanaExplosion.lua
local function onWeaponHitCharacter(player, weapon, target, damage)
    if not weapon or not target or not instanceof(target, "IsoZombie") then return end
    if weapon:getFullType() == "OutbreakItems.KatanaGodblade" then
        -- Play explosion sound at the zombie's location
        getSoundManager():PlayWorldSound("Explosion_Boom", target:getSquare(), 0, 20, 1, true)
        -- Spawn a random explosion sprite (ExplosionZZ_0 to ExplosionZZ_14)
        local spriteNum = ZombRand(0, 15)
        local spriteName = string.format("ExplosionZZ_%d", spriteNum)
        local square = target:getSquare()
        if square then
            -- You can use addWorldInventoryItem for a visible effect, or spawn a visual effect if available
            square:AddWorldInventoryItem(spriteName, 0.5, 0.5, 0)
        end
        -- Remove the zombie for gibbing effect
        target:removeFromWorld()
        target:removeFromSquare()
    end
end

Events.OnWeaponHitCharacter.Add(onWeaponHitCharacter)