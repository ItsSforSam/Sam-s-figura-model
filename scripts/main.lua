-- Auto generated script file --
local physBone = require('utils.physbone')

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)
--re-enable the helmet item
vanilla_model.HELMET_ITEM:setVisible(true)



nameplate.ALL:setText("${name} :trans::pan:")
--entity init event, used for when the avatar entity is loaded for the first time
function events.entity_init()
  -- NOTE: the chest is going to look werid in the cloud menu, it fixes itself when you
  --       actually exit the menu, it just doesn't have the physics yet
  
  -- just keeps the model file clean without having to name it "CapeTail"
  --@TODO: have the tail work independently of the cape, it looks stiff
  models.sam_player.root.Body.Tail:setParentType("Cape")

  --player functions goes here
  -- physBone.setPreset(models.model.root.Body.physBoob)
  --@TODO: figure out how to modify a Physboob, or even retreve the object
  --@type physBone.physBone
  -- log(models.sam_player.root.Body.physBoob)
  -- local breasts = physBone:getPhysBone()
  
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
  local helmet = player.getItem(6)
  if helmet == nil or helmet == ""
end

function events.skull_render(delta, block, item, entity, ctx)
  --@TODO: have it be lower and having away in hand and have it either be ontop of players head or just
  --       use default skull option (which is everything just attached to the headbone)
  -- if ctx == "RIGHT_HAND" or ctx == "LEFT_HAND" then
    
  -- end  
end
