PrefabFiles = {
 "magicpouch",
 "icepouch",
 "utilpouch",
}

local crsPouches = {
 "MagicalPouch",
 "IcyMagicalPouch",
 "UtilityMagicalPouch",
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

STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
Vector3 = GLOBAL.Vector3
IsDLCEnabled = GLOBAL.IsDLCEnabled
getConfig = GetModConfigData
GetPlayer = GLOBAL.GetPlayer
FindEntity = GLOBAL.FindEntity

-- local crsNoDLCEnabled = not IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) and not IsDLCEnabled(GLOBAL.CAPY_DLC)
-- local crsAnyDLCEnabled = IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) or IsDLCEnabled(GLOBAL.CAPY_DLC)
-- local crsReignOfGiantsEnabled = IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
local crsShipwreckedEnabled = IsDLCEnabled(GLOBAL.CAPY_DLC)


-- MAP ICONS --

AddMinimapAtlas("minimap/magicpouch.xml")
AddMinimapAtlas("minimap/icepouch.xml")
AddMinimapAtlas("minimap/utilpouch.xml")


-- STRINGS --

STRINGS.NAMES.MAGICPOUCH = "Magical Pouch"
STRINGS.RECIPE_DESC.MAGICPOUCH = "Shrinks items to fit in your pocket!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICPOUCH = "Shrinks items to fit in your pocket!"
STRINGS.NAMES.ICEPOUCH = "Icy Magical Pouch"
STRINGS.RECIPE_DESC.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEPOUCH = "A Magical Pouch that can keep food fresh forever!"
STRINGS.NAMES.UTILPOUCH = "Utility Magical Pouch"
STRINGS.RECIPE_DESC.UTILPOUCH = "A Magical Pouch that can store tools, instruments and weapons!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UTILPOUCH = "A Magical Pouch that can store tools, instruments and weapons!"

-- RECIPES --

local crsRecipeTab = getConfig("crsMagicalPouchRecipeTab")
local crsRecipeTech = getConfig("crsMagicalPouchRecipeTech")
local crsMagicalPouchRecipeDarkMotes = Ingredient("darkmote", getConfig("crsMagicalPouchRecipeDarkMotes"))
crsMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsIcyMagicalPouchRecipeDarkMotes = Ingredient("darkmote", getConfig("crsIcyMagicalPouchRecipeDarkMotes"))
crsIcyMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsUtilityMagicalPouchRecipeDarkMotes = Ingredient("darkmote", getConfig("crsUtilityMagicalPouchRecipeDarkMotes"))
crsUtilityMagicalPouchRecipeDarkMotes.atlas = "images/inventoryimages/darkmote.xml"
local crsIsIcyMagicalPouchEnabled = getConfig("crsIcyMagicalPouchRecipeToggle") == 1
local crsIsUtilityMagicalPouchEnabled = getConfig("crsUtilityMagicalPouchRecipeToggle") == 1
local crsIsDarkMatterCompatibilityEnabled = getConfig("crsDarkMatterCompatibilityToggle") == 1

local recipeTab = RECIPETABS.ANCIENT
if crsRecipeTab == 2 then
 recipeTab = RECIPETABS.MAGIC
elseif crsRecipeTab == 3 then
 recipeTab = RECIPETABS.TOOLS
elseif crsRecipeTab == 4 then
 recipeTab = RECIPETABS.SURVIVAL
end
local recipeTech = TECH.NONE
if crsRecipeTech == 1 then
 recipeTech = TECH.SCIENCE_ONE
elseif crsRecipeTech == 2 then
 recipeTech = TECH.SCIENCE_TWO
elseif crsRecipeTech == 3 then
 recipeTech = TECH.MAGIC_TWO
elseif crsRecipeTech == 4 then
 recipeTech = TECH.MAGIC_THREE
elseif crsRecipeTech == 5 then
 recipeTech = TECH.ANCIENT_TWO
elseif crsRecipeTech == 6 then
 recipeTech = TECH.ANCIENT_FOUR
elseif crsRecipeTech == 7 then
 recipeTech = TECH.OBSIDIAN_TWO
end
-- Magical Pouch --
if crsIsDarkMatterCompatibilityEnabled then
 local magicpouch = Recipe("magicpouch", {
  crsMagicalPouchRecipeDarkMotes,
 }, recipeTab, recipeTech)
 magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
else 
 local magicpouch = Recipe("magicpouch", {
  Ingredient("rope", getConfig("crsMagicalPouchRecipeRope")),
  Ingredient("silk", getConfig("crsMagicalPouchRecipeWeb")),
  Ingredient("purplegem", getConfig("crsMagicalPouchRecipePurpleGem")),
 }, recipeTab, recipeTech)
 magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
end
-- Icy Magical Pouch --
if crsIsIcyMagicalPouchEnabled then
 if crsIsDarkMatterCompatibilityEnabled then
  local icepouch = Recipe("icepouch", {
   crsIcyMagicalPouchRecipeDarkMotes,
  }, recipeTab, recipeTech)
  icepouch.atlas = "images/inventoryimages/icepouch.xml"
 else 
  local icepouch = Recipe("icepouch", {
   Ingredient("rope", getConfig("crsIcyMagicalPouchRecipeRope")),
   Ingredient("silk", getConfig("crsIcyMagicalPouchRecipeWeb")),
   Ingredient("bluegem", getConfig("crsIcyMagicalPouchRecipeBlueGem")),
  }, recipeTab, recipeTech)
  icepouch.atlas = "images/inventoryimages/icepouch.xml"
 end
end
-- Utility Magical Pouch --
if crsIsUtilityMagicalPouchEnabled then
 if crsIsDarkMatterCompatibilityEnabled then
  local utilpouch = Recipe("utilpouch", {
   crsUtilityMagicalPouchRecipeDarkMotes,
  }, recipeTab, recipeTech)
  utilpouch.atlas = "images/inventoryimages/utilpouch.xml"
 else 
  local utilpouch = Recipe("utilpouch", {
   Ingredient("rope", getConfig("crsUtilityMagicalPouchRecipeRope")),
   Ingredient("silk", getConfig("crsUtilityMagicalPouchRecipeWeb")),
   Ingredient("livinglog", getConfig("crsUtilityMagicalPouchRecipeLivingLog")),
  }, recipeTab, recipeTech)
  utilpouch.atlas = "images/inventoryimages/utilpouch.xml"
 end
end

-- TINT --

local function crsImageTintUpdate(self, num, atlas, bgim, owner, container)
 if container.widgetbgimagetint then
  self.bgimage:SetTint(container.widgetbgimagetint.r, container.widgetbgimagetint.g, container.widgetbgimagetint.b, container.widgetbgimagetint.a)
 end
end
AddClassPostConstruct("widgets/invslot", crsImageTintUpdate)

-- CONTAINER --

local crsWidgetPosition = Vector3(getConfig("crsHorizontalPositon"),getConfig("crsVerticalPositon"),0) -- background image position

local crsPouchDetails = {
 {id = 1, name = "pouchsmall", xy = 2, offset = 40, buttonx = 0, buttony = -100},
 {id = 2, name = "pouchmedium", xy = 3, offset = 80, buttonx = 0, buttony = -145},
 {id = 3, name = "pouchbig", xy = 4, offset = 120, buttonx = 0, buttony = -185},
 {id = 4, name = "pouchhuge", xy = 5, offset = 160, buttonx = 5, buttony = -225},
 {id = 5, name = "pouchzilla", x = 20, y = 5, xoffset = 762, yoffset = 160, buttonx = 20, buttony = -225},
}

local crsButtonPosition = {}

for k = 1, #crsPouches do
 local pouch = crsPouchDetails[getConfig("crs"..crsPouches[k].."Size")]
 table.insert(crsButtonPosition, {x = pouch.buttonx, y = pouch.buttony})
 AddPrefabPostInit(PrefabFiles[k], function(inst)
  local slotpos = {}
  for y = (pouch.xy or pouch.y), 1, -1 do
   for x = 1, (pouch.xy or pouch.x) do
   table.insert(slotpos, Vector3(80 * (x-1) - (pouch.offset or pouch.xoffset), 80 * (y-1) - (pouch.offset or pouch.yoffset), 0))
   end
  end
  inst.components.container:SetNumSlots(#slotpos)
  inst.components.container.widgetslotpos = slotpos
  inst.components.container.widgetbgimage = pouch.name..".tex"
  inst.components.container.widgetbgatlas = "images/inventoryimages/"..pouch.name..".xml"
  inst.components.container.widgetpos = crsWidgetPosition
 end)
end

-- TAGS --

local function crsNoAutoCollect(inst)
 inst:AddTag("crsNoAutoCollect") -- items with this tag are not picked up automatically
end
local crsNoAutoCollectList = {
 "pumpkin_lantern",
 "trap",
 "birdtrap",
 "trap_teeth",
 "beemine",
 "boomerang",
 "lantern",
 "gunpowder",
 "blowdart_pipe",
 "blowdart_fire",
 "blowdart_sleep",
 "doydoy",
 "seatrap",
}
for k = 1, #crsNoAutoCollectList do
 if crsNoAutoCollectList[k] then
  AddPrefabPostInit(crsNoAutoCollectList[k], crsNoAutoCollect)
 end
end
-- Utility Magical Pouch --
local function crsGoesInUtilityMagicalPouch(inst)
 inst:AddTag("crsGoesInUtilityMagicalPouch") -- items with this tag can go in Utility Magical Pouch
end
local crsGoesInUtilityMagicalPouchList = {
 "webberskull",
 "chester_eyebone",
 "compass",
 "fertilizer",
 "featherfan",
 "bedroll_furry",
 "bedroll_straw",
 "healingsalve",
 "bandage",
 "pumpkin_lantern",
 "heatrock",
 "waxwelljournal",
 "sewing_kit",
 "gunpowder",
 "tropicalfan",
 "packim_fishbone",
}
for k = 1, #crsGoesInUtilityMagicalPouchList do
 if crsGoesInUtilityMagicalPouchList[k] then
  AddPrefabPostInit(crsGoesInUtilityMagicalPouchList[k], crsGoesInUtilityMagicalPouch)
 end
end

-- ITEM TEST --

-- Icy Magical Pouch --
local function crsIcyMagicalPouchItemTest(inst, item, slot)
 return (item.components.edible and item.components.perishable) or 
 item.prefab == "mandrake" or 
 item.prefab == "tallbirdegg" or 
 item.prefab == "heatrock" or 
 item.prefab == "spoiled_food" or 
 item:HasTag("frozen") or
 item:HasTag("icebox_valid")
end
local function crsIcyMagicalPouchItemTestUpdate(inst)
 inst.components.container.itemtestfn = crsIcyMagicalPouchItemTest
end
AddPrefabPostInit("icepouch", crsIcyMagicalPouchItemTestUpdate)
-- Utility Magical Pouch --
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
-- Magical Pouch --
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

-- TRAPS --

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

-- ON OPEN/CLOSED/DROPPED/SAVE/LOAD --

local oldOverflow = nil

local function crsOnDropped(inst, owner)
 inst.components.container:Close(owner)
 inst.crsAutoCollectToggle = 0
end

local function crsOnOpen(inst)
 oldOverflow = GetPlayer().components.inventory.overflow
 GetPlayer().components.inventory:SetOverflow(inst)
 GetPlayer().HUD.controls.crafttabs:UpdateRecipes()
 inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end

local function crsOnClose(inst)
 GetPlayer().components.inventory:SetOverflow(oldOverflow)
 GetPlayer().HUD.controls.crafttabs:UpdateRecipes()
 inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "open")
 return (inst)
end

for k = 1, #PrefabFiles do
 AddPrefabPostInit(PrefabFiles[k], function(inst)
  inst.components.inventoryitem:SetOnDroppedFn(crsOnDropped)
  inst.components.container.onopenfn = crsOnOpen
  inst.components.container.onclosefn = crsOnClose
  inst.OnSave = function(inst, data)
   data.crsAutoCollectToggle = inst.crsAutoCollectToggle
  end
  inst.OnLoad = function(inst, data)
   if data and data.crsAutoCollectToggle then
    inst.crsAutoCollectToggle = data.crsAutoCollectToggle
   end
  end
 end)
end

-- AUTOCOLLECT --

for k = 1, #PrefabFiles do
 local function crsSearchForItem(inst)
  local crsItem = FindEntity(inst, getConfig("crs"..crsPouches[k].."AutoCollectRadius"), function(crsItem) 
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

 local crsToggleButton = {
  text = "Toggle",
  position = Vector3(crsButtonPosition[k].x, crsButtonPosition[k].y, 0),
  fn = function(inst)
   if inst.crsAutoCollectToggle == 0 then
    inst:DoPeriodicTask(getConfig("crs"..crsPouches[k].."AutoCollectInterval"), crsSearchForItem)
    inst.crsAutoCollectToggle = 1
   else
    inst:CancelAllPendingTasks()
    inst.crsAutoCollectToggle = 0
   end
  end,
  validfn = function(prefab)
   return true
  end,
 }
 
 AddPrefabPostInit(PrefabFiles[k], function(inst)
  inst.components.container.widgetbuttoninfo = crsToggleButton
 end)
end