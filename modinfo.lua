name = "Magical Pouch v3.1.2"
description = "Shrinks items to fit in your pocket!"
author = "cr4shmaster"
version = "3.2.1"
forumthread = ""
api_version = 6
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"

local crsSize = {
 {description = "4 slots", data = 1},
 {description = "9 slots", data = 2},
 {description = "16 slots", data = 3},
 {description = "25 slots", data = 4},
 {description = "Pouchzilla", data = 5},
}
local crsIngredient = {
 {description = "1", data = 1},
 {description = "2", data = 2},
 {description = "3", data = 3},
 {description = "5", data = 5},
 {description = "10", data = 10},
 {description = "15", data = 15},
 {description = "20", data = 20},
}
local crsCount = {
 {description = "-5", data = -5},
 {description = "-4", data = -4},
 {description = "-3", data = -3},
 {description = "-2", data = -2},
 {description = "-1", data = -1},
 {description = "0", data = 0},
 {description = "1", data = 1},
 {description = "2", data = 2},
 {description = "3", data = 3},
 {description = "4", data = 4},
 {description = "5", data = 5},
}
local crsToggle = {
 {description = "Enabled", data = 1},
 {description = "Disabled", data = 0},
}
local crsRadius = {
 {description = "1", data = 1},
 {description = "2", data = 2},
 {description = "3", data = 3},
 {description = "5", data = 5},
 {description = "10", data = 10},
 {description = "15", data = 15},
 {description = "20", data = 20},
}
local crsInterval = {
 {description = ".1", data = .1},
 {description = ".2", data = .2},
 {description = ".3", data = .3},
 {description = ".4", data = .4},
 {description = ".5", data = .5},
 {description = ".6", data = .6},
 {description = ".7", data = .7},
 {description = ".8", data = .8},
 {description = ".9", data = .9},
 {description = "1", data = 1},
}
local crsChance = {
 {description = "1", data = 1},
 {description = "2", data = 2},
 {description = "3", data = 3},
 {description = "4", data = 4},
 {description = "5", data = 5},
 {description = "6", data = 6},
 {description = "7", data = 7},
 {description = "8", data = 8},
 {description = "9", data = 9},
 {description = "10", data = 10},
}
local crsDarkMotes = {
 {description = "50", data = 50},
 {description = "60", data = 60},
 {description = "70", data = 70},
 {description = "80", data = 80},
 {description = "90", data = 90},
 {description = "100", data = 100},
 {description = "125", data = 125},
 {description = "150", data = 150},
 {description = "200", data = 200},
 {description = "250", data = 250},
 {description = "300", data = 300},
 {description = "350", data = 350},
 {description = "400", data = 400},
 {description = "450", data = 450},
 {description = "500", data = 500},
}
local crsPosition = {
 {description = "500", data = 500},
 {description = "475", data = 475},
 {description = "450", data = 450},
 {description = "425", data = 425},
 {description = "400", data = 400},
 {description = "375", data = 375},
 {description = "350", data = 350},
 {description = "325", data = 325},
 {description = "300", data = 300},
 {description = "275", data = 275},
 {description = "250", data = 250},
 {description = "225", data = 225},
 {description = "200", data = 200},
 {description = "175", data = 175},
 {description = "150", data = 150},
 {description = "125", data = 125},
 {description = "100", data = 100},
 {description = "75", data = 75},
 {description = "50", data = 50},
 {description = "25", data = 25},
 {description = "0", data = 0},
 {description = "-25", data = -25},
 {description = "-50", data = -50},
 {description = "-75", data = -75},
 {description = "-100", data = -100},
 {description = "-125", data = -125},
 {description = "-150", data = -150},
 {description = "-175", data = -175},
 {description = "-200", data = -200},
 {description = "-225", data = -225},
 {description = "-250", data = -250},
 {description = "-275", data = -275},
 {description = "-300", data = -300},
 {description = "-325", data = -325},
 {description = "-350", data = -350},
 {description = "-375", data = -375},
 {description = "-400", data = -400},
 {description = "-425", data = -425},
 {description = "-450", data = -450},
 {description = "-475", data = -475},
 {description = "-500", data = -500},
}

configuration_options = {
 {
  name = "crsMagicalPouchRecipeTab",
  label = "Recipe Tab",
  options = {
   {description = "Ancient", data = 1},
   {description = "Magic", data = 2},
   {description = "Tools", data = 3},
   {description = "Survival", data = 4},
  },
  default = 1,
 },
 {
  name = "crsMagicalPouchRecipeTech",
  label = "Recipe Tech",
  options = {
   {description = "None", data = 0},
   {description = "Science Machine", data = 1},
   {description = "Alchemy Engine", data = 2},
   {description = "Prestihatitator", data = 3},
   {description = "Shadow Manip.", data = 4},
   {description = "Broken APS", data = 5},
   {description = "Repaired APS", data = 6},
   {description = "Obs. Workbench", data = 7},
  },
  default = 4,
 },
 {
  name = "crsMagicalPouchSize",
  label = "MP Size",
  options = crsSize,
  default = 2,
 },
 {
  name = "crsMagicalPouchRecipeRope",
  label = "MP Rope",
  options = crsIngredient,
  default = 1,
 },
 {
  name = "crsMagicalPouchRecipeWeb",
  label = "MP Spider Web",
  options = crsIngredient,
  default = 15,
 },
 {
  name = "crsMagicalPouchRecipePurpleGem",
  label = "MP Purple Gem",
  options = crsIngredient,
  default = 5,
 },
 {
  name = "crsMagicalPouchAutoCollectToggle",
  label = "MP Collect Toggle",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsMagicalPouchAutoCollectRadius",
  label = "MP Collect Radius",
  options = crsRadius,
  default = 10,
 },
 {
  name = "crsMagicalPouchAutoCollectInterval",
  label = "MP Collect Interval",
  options = crsInterval,
  default = .3,
 },
 {
  name = "crsIcyMagicalPouchRecipeToggle",
  label = "IMP Recipe",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsIcyMagicalPouchSize",
  label = "IMP Size",
  options = crsSize,
  default = 1,
 },
 {
  name = "crsIcyMagicalPouchPerishMult",
  label = "IMP Perish Time",
  options = {
   {description = "Default", data = .5},
   {description = "25% longer", data = .37},
   {description = "50% longer", data = .25},
   {description = "75% longer", data = .12},
   {description = "None", data = 0},
  },
  default = .5,
 },
 {
  name = "crsIcyMagicalPouchTempDuration",
  label = "IMP Temp Duration",
  options = crsCount,
  default = -1,
 },
 {
  name = "crsIcyMagicalPouchRecipeRope",
  label = "IMP Rope",
  options = crsIngredient,
  default = 1,
 },
 {
  name = "crsIcyMagicalPouchRecipeWeb",
  label = "IMP Spider Web",
  options = crsIngredient,
  default = 15,
 },
 {
  name = "crsIcyMagicalPouchRecipeBlueGem",
  label = "IMP Blue Gem",
  options = crsIngredient,
  default = 10,
 },
 {
  name = "crsIcyMagicalPouchAutoCollectToggle",
  label = "IMP Collect Toggle",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsIcyMagicalPouchAutoCollectRadius",
  label = "IMP Collect Radius",
  options = crsRadius,
  default = 10,
 },
 {
  name = "crsIcyMagicalPouchAutoCollectInterval",
  label = "IMP Collect Interval",
  options = crsInterval,
  default = .3,
 },
 {
  name = "crsUtilityMagicalPouchRecipeToggle",
  label = "UMP Recipe",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsUtilityMagicalPouchSize",
  label = "UMP Size",
  options = crsSize,
  default = 1,
 },
 {
  name = "crsUtilityMagicalPouchRecipeRope",
  label = "UMP Rope",
  options = crsIngredient,
  default = 1,
 },
 {
  name = "crsUtilityMagicalPouchRecipeWeb",
  label = "UMP Spider Web",
  options = crsIngredient,
  default = 15,
 },
 {
  name = "crsUtilityMagicalPouchRecipeLivingLog",
  label = "UMP Living Log",
  options = crsIngredient,
  default = 10,
 },
 {
  name = "crsUtilityMagicalPouchAutoCollectToggle",
  label = "UMP Collect Toggle",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsUtilityMagicalPouchAutoCollectRadius",
  label = "UMP Collect Radius",
  options = crsRadius,
  default = 10,
 },
 {
  name = "crsUtilityMagicalPouchAutoCollectInterval",
  label = "UMP Collect Interval",
  options = crsInterval,
  default = .3,
 },
 {
  name = "crsDarkMatterCompatibilityToggle",
  label = "DM Compatibility",
  options = crsToggle,
  default = 1,
 },
 {
  name = "crsMagicalPouchRecipeDarkMotes",
  label = "MP DM Recipe",
  options = crsDarkMotes,
  default = 150,
 },
 {
  name = "crsIcyMagicalPouchRecipeDarkMotes",
  label = "IMP DM Recipe",
  options = crsDarkMotes,
  default = 200,
 },
 {
  name = "crsUtilityMagicalPouchRecipeDarkMotes",
  label = "UMP DM Recipe",
  options = crsDarkMotes,
  default = 100,
 },
 {
  name = "crsHorizontalPositon",
  label = "UI x Position",
  options = crsPosition,
  default = -300,
 },
 {
  name = "crsVerticalPositon",
  label = "UI y Position",
  options = crsPosition,
  default = -100,
 },
 {
  name = "crsMagicalPouchTest",
  label = "Installed",
  options = {
   {description = "Yes", data = 1},
  },
  default = 1,
 },
}
