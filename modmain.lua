PrefabFiles = {
 "magicpouch",
 "icepouch",
 "utilpouch",
}

Assets = {
 Asset("ATLAS", "images/inventoryimages/magicpouch.xml"),
 Asset("IMAGE", "images/inventoryimages/magicpouch.tex"),
 Asset("ATLAS", "minimap/magicpouch.xml" ),
 Asset("IMAGE", "minimap/magicpouch.tex" ),
 Asset("ATLAS", "images/inventoryimages/icepouch.xml"),
 Asset("IMAGE", "images/inventoryimages/icepouch.tex"),
 Asset("ATLAS", "minimap/icepouch.xml" ),
 Asset("IMAGE", "minimap/icepouch.tex" ),
 Asset("ATLAS", "images/inventoryimages/utilpouch.xml"),
 Asset("IMAGE", "images/inventoryimages/utilpouch.tex"),
 Asset("ATLAS", "minimap/utilpouch.xml" ),
 Asset("IMAGE", "minimap/utilpouch.tex" ),
}

-- add minimap icons
AddMinimapAtlas("minimap/magicpouch.xml")
AddMinimapAtlas("minimap/icepouch.xml")
AddMinimapAtlas("minimap/utilpouch.xml")

STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
Vector3 = GLOBAL.Vector3

-- add strings
STRINGS.NAMES.MAGICPOUCH = "Magical Pouch"
STRINGS.RECIPE_DESC.MAGICPOUCH = "Shrinks items to fit in your pocket!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICPOUCH = "Shrinks items to fit in your pocket!"
STRINGS.NAMES.ICEPOUCH = "Icy Magical Pouch"
STRINGS.RECIPE_DESC.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
STRINGS.NAMES.UTILPOUCH = "Utility Magical Pouch"
STRINGS.RECIPE_DESC.UTILPOUCH = "A Magical Pouch that can store tools, instruments and weapons!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UTILPOUCH = "A Magical Pouch that can store tools, instruments and weapons!"

-- get mod settings
GLOBAL.crsMagicalPouchAutoCollectToggle = GetModConfigData("crsMagicalPouchAutoCollectToggle")
GLOBAL.crsMagicalPouchAutoCollectRadius = GetModConfigData("crsMagicalPouchAutoCollectRadius")
GLOBAL.crsMagicalPouchAutoCollectInterval = GetModConfigData("crsMagicalPouchAutoCollectInterval")
GLOBAL.crsIcyMagicalPouchPerishMult = GetModConfigData("crsIcyMagicalPouchPerishMult")
GLOBAL.crsIcyMagicalPouchTempDuration = GetModConfigData("crsIcyMagicalPouchTempDuration")
GLOBAL.crsIcyMagicalPouchAutoCollectToggle = GetModConfigData("crsIcyMagicalPouchAutoCollectToggle")
GLOBAL.crsIcyMagicalPouchAutoCollectRadius = GetModConfigData("crsIcyMagicalPouchAutoCollectRadius")
GLOBAL.crsIcyMagicalPouchAutoCollectInterval = GetModConfigData("crsIcyMagicalPouchAutoCollectInterval")
GLOBAL.crsUtilityMagicalPouchAutoCollectToggle = GetModConfigData("crsUtilityMagicalPouchAutoCollectToggle")
GLOBAL.crsUtilityMagicalPouchAutoCollectRadius = GetModConfigData("crsUtilityMagicalPouchAutoCollectRadius")
GLOBAL.crsUtilityMagicalPouchAutoCollectInterval = GetModConfigData("crsUtilityMagicalPouchAutoCollectInterval")

-- add recipes
local crsMagicalPouchRecipeDarkMotes = Ingredient("darkmote", GetModConfigData("crsMagicalPouchRecipeDarkMotes"))
crsMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsIcyMagicalPouchRecipeDarkMotes = Ingredient("darkmote", GetModConfigData("crsIcyMagicalPouchRecipeDarkMotes"))
crsIcyMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsUtilityMagicalPouchRecipeDarkMotes = Ingredient("darkmote", GetModConfigData("crsUtilityMagicalPouchRecipeDarkMotes"))
crsUtilityMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsIsIcyMagicalPouchEnabled = GetModConfigData("crsIcyMagicalPouchRecipeToggle") == 1
local crsIsUtilityMagicalPouchEnabled = GetModConfigData("crsUtilityMagicalPouchRecipeToggle") == 1
local crsIsDarkMatterCompatibilityEnabled = GetModConfigData("crsDarkMatterCompatibilityToggle") == 1
-- MP
if crsIsDarkMatterCompatibilityEnabled then
 local magicpouch = Recipe("magicpouch", {
  crsMagicalPouchRecipeDarkMotes,
 }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
 magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
else 
 local magicpouch = Recipe("magicpouch", {
  Ingredient("rope", GetModConfigData("crsMagicalPouchRecipeRope")),
  Ingredient("silk", GetModConfigData("crsMagicalPouchRecipeWeb")),
  Ingredient("purplegem", GetModConfigData("crsMagicalPouchRecipePurpleGem")),
 }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
 magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
end
-- IMP
if crsIsIcyMagicalPouchEnabled then
 if crsIsDarkMatterCompatibilityEnabled then
  local icepouch = Recipe("icepouch", {
   crsIcyMagicalPouchRecipeDarkMotes,
  }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
  icepouch.atlas = "images/inventoryimages/icepouch.xml"
 else 
  local icepouch = Recipe("icepouch", {
   Ingredient("rope", GetModConfigData("crsIcyMagicalPouchRecipeRope")),
   Ingredient("silk", GetModConfigData("crsIcyMagicalPouchRecipeWeb")),
   Ingredient("bluegem", GetModConfigData("crsIcyMagicalPouchRecipeBlueGem")),
  }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
  icepouch.atlas = "images/inventoryimages/icepouch.xml"
 end
end
-- UMP
if crsIsUtilityMagicalPouchEnabled then
 if crsIsDarkMatterCompatibilityEnabled then
  local utilpouch = Recipe("utilpouch", {
   crsUtilityMagicalPouchRecipeDarkMotes,
  }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
  utilpouch.atlas = "images/inventoryimages/utilpouch.xml"
 else 
  local utilpouch = Recipe("utilpouch", {
   Ingredient("rope", GetModConfigData("crsUtilityMagicalPouchRecipeRope")),
   Ingredient("silk", GetModConfigData("crsUtilityMagicalPouchRecipeWeb")),
   Ingredient("livinglog", GetModConfigData("crsUtilityMagicalPouchRecipeLivingLog")),
  }, RECIPETABS.ANCIENT, TECH.MAGIC_TWO)
  utilpouch.atlas = "images/inventoryimages/utilpouch.xml"
 end
end

-- add tint
local function crsImageTintUpdate(self, num, atlas, bgim, owner, container)
 if container.widgetbgimagetint then
  self.bgimage:SetTint(container.widgetbgimagetint.r, container.widgetbgimagetint.g, container.widgetbgimagetint.b, container.widgetbgimagetint.a)
    end
end
AddClassPostConstruct("widgets/invslot", crsImageTintUpdate)

-- create widget
local crsWidgetPosition = Vector3(GetModConfigData("crsHorizontalPositon"),GetModConfigData("crsVerticalPositon"),0) -- background image position
-- 2x2 pouch
local function crsPouchSmall(inst)
 local slotpos = {}
 for y = 1, 0, -1 do
  for x = 0, 1 do
  table.insert(slotpos, Vector3(80*x-40, 80*y-40,0))
  end
 end
 inst.components.container:SetNumSlots(#slotpos)
 inst.components.container.widgetslotpos = slotpos
 inst.components.container.widgetbgimage = "pouchsmall.tex"
 inst.components.container.widgetbgatlas = "images/inventoryimages/pouchsmall.xml"
 inst.components.container.widgetpos = crsWidgetPosition
end
-- 3x3 pouch
local function crsPouchMedium(inst)
 local slotpos = {}
 for y = 2, 0, -1 do
  for x = 0, 2 do
  table.insert(slotpos, Vector3(80*x-80, 80*y-80,0))
  end
 end
 inst.components.container:SetNumSlots(#slotpos)
 inst.components.container.widgetslotpos = slotpos
 inst.components.container.widgetbgimage = "pouchmedium.tex"
 inst.components.container.widgetbgatlas = "images/inventoryimages/pouchmedium.xml"
 inst.components.container.widgetpos = crsWidgetPosition
end
-- 4x4 pouch
local function crsPouchBig(inst)
 local slotpos = {}
 for y = 3, 0, -1 do
  for x = 0, 3 do
  table.insert(slotpos, Vector3(80*x-120, 80*y-120,0))
  end
 end
 inst.components.container:SetNumSlots(#slotpos)
 inst.components.container.widgetslotpos = slotpos
 inst.components.container.widgetbgimage = "pouchbig.tex"
 inst.components.container.widgetbgatlas = "images/inventoryimages/pouchbig.xml"
 inst.components.container.widgetpos = crsWidgetPosition
end
-- 5x5 pouch
local function crsPouchHuge(inst)
 local slotpos = {}
 for y = 4, 0, -1 do
  for x = 0, 4 do
  table.insert(slotpos, Vector3(80*x-160, 80*y-160,0))
  end
 end
 inst.components.container:SetNumSlots(#slotpos)
 inst.components.container.widgetslotpos = slotpos
 inst.components.container.widgetbgimage = "pouchhuge.tex"
 inst.components.container.widgetbgatlas = "images/inventoryimages/pouchhuge.xml"
 inst.components.container.widgetpos = crsWidgetPosition
end
-- 5x20 pouch
local function crsPouchzilla(inst)
 local slotpos = {}
 for y = 4, 0, -1 do
  for x = 0, 19 do
  table.insert(slotpos, Vector3(80*x-762, 80*y-160,0))
  end
 end
 inst.components.container:SetNumSlots(#slotpos)
 inst.components.container.widgetslotpos = slotpos
 inst.components.container.widgetbgimage = "pouchzilla.tex"
 inst.components.container.widgetbgatlas = "images/inventoryimages/pouchzilla.xml"
 inst.components.container.widgetpos = crsWidgetPosition
end
-- MP
local crsGetMagicalPouchSize = GetModConfigData("crsMagicalPouchSize")
if crsGetMagicalPouchSize == 2 then
 AddPrefabPostInit("magicpouch", crsPouchMedium)
elseif crsGetMagicalPouchSize == 3 then
 AddPrefabPostInit("magicpouch", crsPouchBig)
elseif crsGetMagicalPouchSize == 4 then
 AddPrefabPostInit("magicpouch", crsPouchHuge)
elseif crsGetMagicalPouchSize == 5 then
 AddPrefabPostInit("magicpouch", crsPouchzilla)
else
 AddPrefabPostInit("magicpouch", crsPouchSmall)
end
-- IMP
local crsGetIcyMagicalPouchSize = GetModConfigData("crsIcyMagicalPouchSize")
if crsGetIcyMagicalPouchSize == 2 then
 AddPrefabPostInit("icepouch", crsPouchMedium)
elseif crsGetIcyMagicalPouchSize == 3 then
 AddPrefabPostInit("icepouch", crsPouchBig)
elseif crsGetIcyMagicalPouchSize == 4 then
 AddPrefabPostInit("icepouch", crsPouchHuge)
elseif crsGetIcyMagicalPouchSize == 5 then
 AddPrefabPostInit("icepouch", crsPouchzilla)
else
 AddPrefabPostInit("icepouch", crsPouchSmall)
end
-- UMP
local crsGetUtilityMagicalPouchSize = GetModConfigData("crsUtilityMagicalPouchSize")
if crsGetUtilityMagicalPouchSize == 2 then
 AddPrefabPostInit("utilpouch", crsPouchMedium)
elseif crsGetUtilityMagicalPouchSize == 3 then
 AddPrefabPostInit("utilpouch", crsPouchBig)
elseif crsGetUtilityMagicalPouchSize == 4 then
 AddPrefabPostInit("utilpouch", crsPouchHuge)
elseif crsGetUtilityMagicalPouchSize == 5 then
 AddPrefabPostInit("utilpouch", crsPouchzilla)
else
 AddPrefabPostInit("utilpouch", crsPouchSmall)
end

-- update tags
local function crsNoAutoCollect(inst)
 inst:AddTag("crsNoAutoCollect") -- items with this tag are not picked up automatically
end
AddPrefabPostInit("pumpkin_lantern", crsNoAutoCollect)
AddPrefabPostInit("trap", crsNoAutoCollect)
AddPrefabPostInit("birdtrap", crsNoAutoCollect)
AddPrefabPostInit("trap_teeth", crsNoAutoCollect)
AddPrefabPostInit("beemine", crsNoAutoCollect)
AddPrefabPostInit("boomerang", crsNoAutoCollect)
AddPrefabPostInit("lantern", crsNoAutoCollect)
AddPrefabPostInit("gunpowder", crsNoAutoCollect)
AddPrefabPostInit("blowdart_pipe", crsNoAutoCollect)
AddPrefabPostInit("blowdart_fire", crsNoAutoCollect)
AddPrefabPostInit("blowdart_sleep", crsNoAutoCollect)
-- UMP
local function crsGoesInUtilityMagicalPouch(inst)
 inst:AddTag("crsGoesInUtilityMagicalPouch") -- items with this tag can go in UMP
end
AddPrefabPostInit("webberskull", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("chester_eyebone", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("compass", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("fertilizer", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("featherfan", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("bedroll_furry", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("bedroll_straw", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("healingsalve", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("bandage", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("pumpkin_lantern", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("heatrock", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("waxwelljournal", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("sewing_kit", crsGoesInUtilityMagicalPouch)
AddPrefabPostInit("gunpowder", crsGoesInUtilityMagicalPouch)

-- configure itemtest
-- IMP
local function crsIcyMagicalPouchItemTest(inst, item, slot)
 return (item.components.edible and item.components.perishable) or 
 item.prefab == "mandrake" or 
 item.prefab == "tallbirdegg" or 
 item.prefab == "heatrock" or 
 item:HasTag("frozen") or
 item:HasTag("icebox_valid")
end
local function crsIcyMagicalPouchItemTestUpdate(inst)
 inst.components.container.itemtestfn = crsIcyMagicalPouchItemTest
end
AddPrefabPostInit("icepouch", crsIcyMagicalPouchItemTestUpdate)
-- UMP
local function crsUtilityMagicalPouchItemTest(inst, item, slot)
 return item.components.tool or
 item.components.instrument or
 item.components.weapon or
 item.components.shaver or
 item.components.equippable or
 item:HasTag("teleportato_part") or
 item:HasTag("wallbuilder") or
 -- item:HasTag("groundtile") or
 item:HasTag("mine") or
 item:HasTag("trap") or
 item:HasTag("hat") or
 item:HasTag("crsGoesInUtilityMagicalPouch")
end
local function crsUtilityMagicalPouchItemTestUpdate(inst)
 inst.components.container.itemtestfn = crsUtilityMagicalPouchItemTest
end
AddPrefabPostInit("utilpouch", crsUtilityMagicalPouchItemTestUpdate)
-- MP
local function crsMagicalPouchItemTest(inst, item, slot)
 if crsIsIcyMagicalPouchEnabled and crsIsUtilityMagicalPouchEnabled then
  return not item:HasTag("crsMagicalPouch") and
  not crsUtilityMagicalPouchItemTest(inst, item, slot) and
  not crsIcyMagicalPouchItemTest(inst, item, slot)
 elseif crsIsIcyMagicalPouchEnabled and not crsIsUtilityMagicalPouchEnabled then
  return not item:HasTag("crsMagicalPouch") and
  not crsIcyMagicalPouchItemTest(inst, item, slot)
 elseif not crsIsIcyMagicalPouchEnabled and crsIsUtilityMagicalPouchEnabled then
  return not item:HasTag("crsMagicalPouch") and
  not crsUtilityMagicalPouchItemTest(inst, item, slot)
 else
  return not item:HasTag("crsMagicalPouch")
 end
end
local function crsMagicalPouchItemTestUpdate(inst)
 inst.components.container.itemtestfn = crsMagicalPouchItemTest
end
AddPrefabPostInit("magicpouch", crsMagicalPouchItemTestUpdate)

-- tweak trap component
local function crsTrapComponentUpdate(self)

 function self:RemoveBait()
  if self.bait then
   self.bait:RemoveTag("crsNoAutoCollect") -- added
   if self.baitlayer then
    self.bait.AnimState:SetSortOrder(0)
   end
   self.bait.components.bait.trap = nil
   self.bait = nil
  end
 end
 
 function self:SetBait(bait)
  self:RemoveBait()
  if bait and bait.components.bait then
   self.bait = bait
   if self.baitlayer then
    self.bait.AnimState:SetSortOrder(self.baitsortorder)
   end
   bait.components.bait.trap = self
   bait.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
   bait:AddTag("crsNoAutoCollect") -- added
   if self.onbaited then
    self.onbaited(self.inst, self.bait)
   end
  end
 end
 
end
AddComponentPostInit("trap", crsTrapComponentUpdate)
