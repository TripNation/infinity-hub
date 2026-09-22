-- =========================================================
-- Infinity Hub - Central Games Configuration
-- Any game added here will AUTOMATICALLY:
-- 1. Auto-inject when you join that game (via loader.lua)
-- 2. Show up as a card on the "GAME" page of Infinity Hub
-- =========================================================

return {
    {
        Name = "Ride A Pet",
        PlaceId = 124216119978534,
        UniverseId = 10035204815,
        Desc = "Auto Farm, Train, Ride & Mods",
        Thumbnail = "rbxthumb://type=GameThumbnail&id=10035204815&w=768&h=432",
        Script = "games/ride_a_pet.lua"
    },
    
    {
        Name = "Escape Tsunami For Brainrots",
        PlaceId = 131623223084840,
        UniverseId = 9363735110,
        Desc = "Anti-Wave, Auto Farm, Brainrot Grabber",
        Thumbnail = "rbxthumb://type=GameThumbnail&id=9363735110&w=768&h=432",
        Script = "games/escape_tsunami.lua"
    },

    -- Example for how to add your next game:
    -- {
    --     Name = "Prison Life",
    --     PlaceId = 155615604,
    --     Desc = "Guns, Aimbot, Removals",
    --     Thumbnail = "rbxthumb://type=GameThumbnail&id=155615604&w=768&h=432",
    --     Script = "games/prison_life.lua"
    -- },
}
