require "prefabutil"

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
 Asset("ANIM", "anim/utilpouch.zip"),
 Asset("SOUND", "sound/deerclops.fsb"),
}

local function crsOnDropped(inst, owner)
 inst.components.container:Close(owner)
end

local function crsOnOpen(inst)
 inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end

local function crsOnClose(inst)
 inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "open")
 return (inst)
end

local function fn(Sim)
 local inst = CreateEntity()
 
 inst.entity:AddTransform()
 
 MakeInventoryPhysics(inst)
 
 inst.entity:AddAnimState()
 inst.AnimState:SetBank("utilpouch")
 inst.AnimState:SetBuild("utilpouch")
 inst.AnimState:PlayAnimation("idle")
 
 inst.entity:AddSoundEmitter()
 
 inst:AddTag("crsMagicalPouch")
 inst:AddTag("crsUtilityMagicalPouch")

 local minimap = inst.entity:AddMiniMapEntity()
 minimap:SetIcon("utilpouch.tex")

 inst:AddComponent("inventoryitem")
 inst.components.inventoryitem.cangoincontainer = true
 inst.components.inventoryitem.atlasname = "images/inventoryimages/utilpouch.xml"
 inst.components.inventoryitem:SetOnDroppedFn(crsOnDropped)

 inst:AddComponent("inspectable")
 
 inst:AddComponent("container")
 inst.components.container.onopenfn = crsOnOpen
 inst.components.container.onclosefn = crsOnClose
 inst.components.container.widgetanimbank = nil 
 inst.components.container.widgetanimbuild = nil
 inst.components.container.side_align_tip = 160
 inst.components.container.widgetbgimagetint = {r=.80,g=.52,b=.24,a=1}

 if inst then
  -- autocollect items func
  local function SearchForItem(inst)
   local crsItem = FindEntity(inst, crsUtilityMagicalPouchAutoCollectRadius, function(crsItem) 
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
  if crsUtilityMagicalPouchAutoCollectToggle == 1 then
   inst:DoPeriodicTask(crsUtilityMagicalPouchAutoCollectInterval, SearchForItem)
  end
 end
 
 return inst
end

return Prefab( "common/utilpouch", fn, assets)
