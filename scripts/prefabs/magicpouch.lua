local assets = {
 Asset("ATLAS", "images/inventoryimages/pouchhuge.xml"),
 Asset("IMAGE", "images/inventoryimages/pouchhuge.tex"),
 Asset("ATLAS", "images/inventoryimages/pouchbig.xml"),
 Asset("IMAGE", "images/inventoryimages/pouchbig.tex"),
 Asset("ATLAS", "images/inventoryimages/pouchmedium.xml"),
 Asset("IMAGE", "images/inventoryimages/pouchmedium.tex"),
 Asset("ATLAS", "images/inventoryimages/pouchsmall.xml"),
 Asset("IMAGE", "images/inventoryimages/pouchsmall.tex"),
 Asset("ATLAS", "images/inventoryimages/pouchzilla.xml"),
 Asset("IMAGE", "images/inventoryimages/pouchzilla.tex"),
 Asset("ANIM", "anim/magicpouch.zip"),
}

local crsMagicalPouchDS = nil
if GetModConfigData("crsMagicalPouchTest", "workshop-399011777") == 1 then
 crsMagicalPouchDS = "workshop-399011777"
else
 crsMagicalPouchDS = "crsMagicalPouchDS"
end

local function fn(Sim)
 local inst = CreateEntity()
 
 inst.entity:AddTransform()
 
 MakeInventoryPhysics(inst)
 
 inst.entity:AddAnimState()
 inst.AnimState:SetBank("magicpouch")
 inst.AnimState:SetBuild("magicpouch")
 inst.AnimState:PlayAnimation("idle")
 
 inst.entity:AddSoundEmitter()
 
 inst:AddTag("crsMagicalPouch")

 local minimap = inst.entity:AddMiniMapEntity()
 minimap:SetIcon("magicpouch.tex")

 inst:AddComponent("inventoryitem")
 inst.components.inventoryitem.cangoincontainer = true
 inst.components.inventoryitem.atlasname = "images/inventoryimages/magicpouch.xml"

 inst:AddComponent("inspectable")
 
 inst:AddComponent("container")
 inst.components.container.widgetanimbank = nil 
 inst.components.container.widgetanimbuild = nil
 inst.components.container.side_align_tip = 160
 
 if inst then
  -- autocollect items func
  local function crsSearchForItem(inst)  
   local crsItem = FindEntity(inst, GetModConfigData("crsMagicalPouchAutoCollectRadius", crsMagicalPouchDS), function(crsItem) 
    return crsItem.components.inventoryitem and 
    crsItem.components.inventoryitem.canbepickedup and
    crsItem.components.inventoryitem.cangoincontainer
   end)
   if crsItem and not crsItem:HasTag("crsNoAutoCollect") then -- if valid
    local crsGiven = 0
    if crsItem.components.stackable then -- if stackable
     local crsCanBeStacked = inst.components.container:FindItem(function(crsExistingItem)
      return (crsExistingItem.prefab == crsItem.prefab and not crsExistingItem.components.stackable:IsFull())
     end)
     if crsCanBeStacked then -- if can be stacked
      inst.components.container:GiveItem(crsItem)
      crsGiven = 1
     end
    end
    if not inst.components.container:IsFull() and crsGiven == 0 then -- else if not full
     inst.components.container:GiveItem(crsItem)
    end
   end
  end
  -- do periodic task
  if GetModConfigData("crsMagicalPouchAutoCollectToggle", crsMagicalPouchDS) == 1 then
   inst:DoPeriodicTask(GetModConfigData("crsMagicalPouchAutoCollectInterval", crsMagicalPouchDS), crsSearchForItem)
  end
 end

 return inst
end

return Prefab( "common/magicpouch", fn, assets)
