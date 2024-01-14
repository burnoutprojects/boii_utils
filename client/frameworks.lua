----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--[[
    FRAMEWORK 
]]

framework = config.framework

-- Framework initialization
if framework == 'boii_base' then
    fw = exports['boii_base']:get_object()
elseif framework == 'qb-core' then
    fw = exports['qb-core']:GetCoreObject()
elseif framework == 'esx_legacy' then
    fw = exports['es_extended']:getSharedObject()
elseif framework == 'ox_core' then    
    -- TO DO: Add initialization for ox_core
elseif framework == 'custom' then
    -- Custom framework initialization
end

--[[
    FUNCTIONS
]]

-- Function to get and return a player's client-side data
-- Usage: local data = utils.fw.get_data('key') -- Using a key is not required
local function get_data(key)
    local player_data
    if framework == 'boii_base' then
        player_data = fw.get_data(key)
        return player_data
    elseif framework == 'qb-core' then
        player_data = fw.Functions.GetPlayerData()
        return player_data
    elseif framework == 'esx_legacy' then
        -- TO DO:
    elseif framework == 'ox_core' then  
        -- TO DO:
    elseif framework == 'custom' then
        
    end
end

-- Function to get a player's identity information depending on the framework
-- Usage: local identity = utils.fw.get_identity()
local function get_identity()
    local player = get_data()
    if not player then return false end

    local player_data

    if framework == 'boii_base' then
        player_data = {
            first_name = player.identity.first_name,
            last_name = player.identity.last_name,
            dob = player.identity.dob,
            sex = player.identity.sex,
            nationality = player.identity.nationality
        }
    elseif framework == 'qb-core' then
        player_data = {
            first_name = player.charinfo.firstname,
            last_name = player.charinfo.lastname,
            dob = player.charinfo.birthdate,
            sex = player.charinfo.gender,
            nationality = player.charinfo.nationality
        }
    elseif framework == 'esx_legacy' then
        player_data = {
            first_name = fw.PlayerData.firstName,
            last_name = fw.PlayerData.lastName,
            dob = fw.PlayerData.dateofbirth,
            sex = fw.PlayerData.sex,
            nationality = 'LS, Los Santos'
        }
    elseif framework == 'ox_core' then  
        -- TO DO:
    elseif framework == 'custom' then
        -- Add your own custom framework code here
    end
    return player_data
end

--[[
    ASSIGN LOCALS
]]

utils.fw = utils.fw or {}

utils.fw.get_data = get_data
utils.fw.get_identity = get_identity
