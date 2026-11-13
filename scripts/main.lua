local physBone = require('utils.physbone')

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
-- vanilla_model.ARMOR:setVisible(false)
--re-enable the helmet item
-- vanilla_model.HELMET_ITEM:setVisible(true)



-- nameplate.ALL:setText("${name} ::trans:: ::pan::")
--entity init event, used for when the avatar entity is loaded for the first time
function events.entity_init()
  -- log(goofy)
  -- figuraMetatables.
  -- Just disables backtick+shift, comment out this line if debugging physics
  physBone.disableDebugMode = true
  if player:getName() == "S_for_Sam" then -- 
    nameplate.ALL:setText("The Sami ${badges}:trans::pan:")
  else 
    log("Backing up to fallback name, you ain't THE Sami")
    nameplate.ALL:setText("Sami (${name}) $badges")
  end
  models.sam_player:setSecondaryRenderType("CUTOUT_CULL")
  -- NOTE: the chest is going to look werid in the cloud menu, it fixes itself when you
  --       actually exit the menu, it just doesn't have the physics yet
  
  -- just keeps the model file clean without having to name it "CapeTail"
  --@TODO: have the tail work independently of the cape, it looks stiff
  -- models.sam_player.root.Body.Tail:setParentType("Cape")

  --player functions goes here
  -- physBone.setPreset(models.model.root.Body.physBoob)
  --@TODO: figure out how to modify a Physboob, or even retreve the object
  --@type physBone.physBone
  -- log(models.sam_player.root.Body.physBoob)
  -- local breasts = physBone:getPhysBone()
  -- log(models.sam_player.root.Body.physBoneTail:getName())
  physBone:getPhysBone(models.sam_player.root.Body.physBoneTail)
  -- logTable(physBone.index)
  physBone.physBoneTail:setNodeDensity(3)

end

--tick event, called 20 times per second
function events.tick()
  -- animations.
  
end

--render event, called every time your avatar is rendered
--it have two arguments, "delta" and "context"
--"delta" is the percentage between the last and the next tick (as a decimal value, 0.0 to 1.0)
--"context" is a string that tells from where this render event was called (the paperdoll, gui, player render, first person)
function events.render(delta, context)
  --@TODO: Ears can go down, so can hide them if wearing armer (or make custom helmet model)
  --       BUT boobs can only go down so far (ask transmasc people)
  --       They should be using custom model whenever possible
  local helmet = player:getItem(6)
  -- -- local hename = helmet
  --  -- if invalid or nothing show ears, also ears can pick thu chainmail.
  if helmet == nil or helmet:toStackString() == "minecraft:air" or helmet:toStackString() == "minecraft:chainmail_helmet" then 
   
    models.sam_player.root.HeadEars:visible(true)
  else
    models.sam_player.root.HeadEars:visible(false)
  end


  -- Bind it girl
  --@TODO: use custom model for chestplates
  local chest = player:getItem(5)
  if chest == nil or chest:toStackString() == "minecraft:air" then
    models.sam_player.root.Body.physBoob:visible(true)

  else
    models.sam_player.root.Body.physBoob:visible(false)
  end
end

function events.skull_render(delta, block, item, entity, ctx)
  --@TODO: have it be lower and having away in hand and have it either be ontop of players head or just
  --       use default skull option (which is everything just attached to the headbone)
  if entity == nil then return end -- this errors for some reason, but if no entity is given, just error out
  if ctx == "RIGHT_HAND" or ctx == "LEFT_HAND" then
    
  else if ctx == "HEAD" or entity:isPlayer() then 
    
  else

  end
end
end
