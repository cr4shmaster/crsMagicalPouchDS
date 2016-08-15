PrefabFiles = {
    "magicpouch",
    "icepouch",
    "utilpouch",
}

local crsPouches = {
    "MP",
    "IMP",
    "UMP",
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
RoG = GLOBAL.REIGN_OF_GIANTS
SW = GLOBAL.CAPY_DLC

-- local noDLC = not IsDLCEnabled(RoG) and not GLOBAL.IsDLCEnabled(SW)
-- local anyDLC = IsDLCEnabled(RoG) or IsDLCEnabled(SW)
-- local rogDLC = IsDLCEnabled(RoG)
-- local swDLC = IsDLCEnabled(SW)

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

local MPMotes = Ingredient("darkmote", getConfig("cfgMPMotes"))
MPMotes.atlas = "images/inventoryimages/darkmote.xml"
local IMPMotes = Ingredient("darkmote", getConfig("cfgIMPMotes"))
IMPMotes.atlas = "images/inventoryimages/darkmote.xml"
local UMPMotes = Ingredient("darkmote", getConfig("cfgUMPMotes"))
UMPMotes.atlas = "images/inventoryimages/darkmote.xml"
local isIMPEnabled = getConfig("cfgIMPRecipeToggle")
local isUMPEnabled = getConfig("cfgUMPRecipeToggle")
local isDMCompEnabled = getConfig("cfgDMCompToggle")

local crsRecipeTabs = {
    RECIPETABS.ANCIENT,
    RECIPETABS.MAGIC,
    RECIPETABS.TOOLS,
    RECIPETABS.SURVIVAL,
}
local recipeTab = crsRecipeTabs[getConfig("cfgRecipeTab")]

local crsRecipeTechs = {
    TECH.NONE,
    TECH.SCIENCE_ONE, -- Science Machine
    TECH.SCIENCE_TWO, -- Alchemy Engine
    TECH.MAGIC_TWO, -- Prestihatitator
    TECH.MAGIC_THREE, -- Shadow Manipulator
    TECH.ANCIENT_TWO, -- Broken APS
    TECH.ANCIENT_FOUR, -- Repaired APS
    TECH.OBSIDIAN_TWO, -- Obsidian Workbench
}
local recipeTech = crsRecipeTechs[getConfig("cfgRecipeTech")]

-- Magical Pouch --
if isDMCompEnabled then
    local magicpouch = Recipe("magicpouch", {
        MPMotes,
    }, recipeTab, recipeTech)
    magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
else 
    local magicpouch = Recipe("magicpouch", {
        Ingredient("rope", getConfig("cfgMPRope")),
        Ingredient("silk", getConfig("cfgMPWeb")),
        Ingredient("purplegem", getConfig("cfgMPGems")),
    }, recipeTab, recipeTech)
    magicpouch.atlas = "images/inventoryimages/magicpouch.xml"
end
-- Icy Magical Pouch --
if isIMPEnabled then
    if isDMCompEnabled then
    local icepouch = Recipe("icepouch", {
        IMPMotes,
    }, recipeTab, recipeTech)
    icepouch.atlas = "images/inventoryimages/icepouch.xml"
else 
    local icepouch = Recipe("icepouch", {
        Ingredient("rope", getConfig("cfgIMPRope")),
        Ingredient("silk", getConfig("cfgIMPWeb")),
        Ingredient("bluegem", getConfig("cfgIMPGems")),
    }, recipeTab, recipeTech)
    icepouch.atlas = "images/inventoryimages/icepouch.xml"
    end
end
-- Utility Magical Pouch --
if isUMPEnabled then
    if isDMCompEnabled then
    local utilpouch = Recipe("utilpouch", {
        UMPMotes,
    }, recipeTab, recipeTech)
    utilpouch.atlas = "images/inventoryimages/utilpouch.xml"
else 
    local utilpouch = Recipe("utilpouch", {
        Ingredient("rope", getConfig("cfgUMPRope")),
        Ingredient("silk", getConfig("cfgUMPWeb")),
        Ingredient("livinglog", getConfig("cfgUMPLogs")),
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

local crsWidgetPosition = Vector3(getConfig("cfgXPos"),getConfig("cfgYPos"),0) -- background image position

local crsPouchDetails = {
    {id = 1, name = "pouchsmall", xy = 2, offset = 40, buttonx = 0, buttony = -100},
    {id = 2, name = "pouchmedium", xy = 3, offset = 80, buttonx = 0, buttony = -145},
    {id = 3, name = "pouchbig", xy = 4, offset = 120, buttonx = 0, buttony = -185},
    {id = 4, name = "pouchhuge", xy = 5, offset = 160, buttonx = 5, buttony = -225},
    {id = 5, name = "pouchzilla", x = 20, y = 5, xoffset = 762, yoffset = 160, buttonx = 20, buttony = -225},
}

local crsButtonPosition = {}

for k = 1, #crsPouches do
    local pouch = crsPouchDetails[getConfig("cfg"..crsPouches[k].."Size")]
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
    "boatrepairkit",
    "surfboard_item",
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
    if isIMPEnabled and isUMPEnabled then
        return not item:HasTag("crsMagicalPouch") and
        not crsUtilityMagicalPouchItemTest(inst, item, slot) and
        not crsIcyMagicalPouchItemTest(inst, item, slot)
    elseif isIMPEnabled and not isUMPEnabled then
        return not item:HasTag("crsMagicalPouch") and
        not crsIcyMagicalPouchItemTest(inst, item, slot)
    elseif not isIMPEnabled and isUMPEnabled then
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

-- ON OPEN/CLOSED/DROPPED --

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
    end)
end

-- AUTOCOLLECT --

for k = 1, #PrefabFiles do
    local function crsSearchForItem(inst)
        local item = FindEntity(inst, getConfig("cfg"..crsPouches[k].."AutoCollectRadius"), function(item) 
            return item.components.inventoryitem and 
            item.components.inventoryitem.canbepickedup and
            item.components.inventoryitem.cangoincontainer
        end)
        if item and not item:HasTag("crsNoAutoCollect") then -- if valid
            local given = 0
            if item.components.stackable then -- if stackable
                local canBeStacked = inst.components.container:FindItem(function(existingItem)
                    return (existingItem.prefab == item.prefab and not existingItem.components.stackable:IsFull())
                end)
                if canBeStacked then -- if can be stacked
                    inst.components.container:GiveItem(item)
                    given = 1
                end
            end
            if not inst.components.container:IsFull() and given == 0 then -- else if not full
                inst.components.container:GiveItem(item)
            end
        end
    end

    local crsToggleButton = {
        text = "Toggle",
        position = Vector3(crsButtonPosition[k].x, crsButtonPosition[k].y, 0),
        fn = function(inst)
            if inst.crsAutoCollectToggle == 0 then
                inst:DoPeriodicTask(getConfig("cfg"..crsPouches[k].."AutoCollectInterval"), crsSearchForItem)
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
        inst.OnSave = function(inst, data)
            data.crsAutoCollectToggle = inst.crsAutoCollectToggle
        end
        inst.OnLoad = function(inst, data)
            if data and data.crsAutoCollectToggle then
                inst.crsAutoCollectToggle = data.crsAutoCollectToggle
                if inst.crsAutoCollectToggle == 1 then
                    inst:DoPeriodicTask(getConfig("cfg"..crsPouches[k].."AutoCollectInterval"), crsSearchForItem)
                end    
            end
        end
    end)
 
end
