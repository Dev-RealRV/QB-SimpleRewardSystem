
local QBCore = exports['qb-core']:GetCoreObject()

local rewards = {
    "water_bottle",
    "sandwich",
    "pistol_ammo",
    "armor",
    "kurkakola",
    --You can add item ...
}

function GetRandomReward()
    local reward = rewards[math.random(1, #rewards)]
    print(reward)
    return reward
end

local rewardCooldown = 24 * 60 * 60 
local playerLastRewardTimes = {} 

function GiveReward(playerId, reward)
    local src = playerId 
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player ~= nil then
        local currentTime = os.time()
        local lastRewardTime = playerLastRewardTimes[src]
        
        if lastRewardTime == nil or (currentTime - lastRewardTime) >= rewardCooldown then
            Player.Functions.AddItem(reward, 1)
            playerLastRewardTimes[src] = currentTime
           TriggerClientEvent('QBCore:Notify', src, "You received the reward !", 'success')
        else
            local remainingCooldown = rewardCooldown - (currentTime - lastRewardTime)
            local hours = math.floor(remainingCooldown / 3600)
            local minutes = math.floor((remainingCooldown % 3600) / 60)
            local seconds = remainingCooldown % 60
            local cooldownMessage = string.format("You can receive the reward again in %02d:%02d:%02d.", hours, minutes, seconds)
           TriggerClientEvent('QBCore:Notify', src, cooldownMessage, 'error')
        end
    else
     TriggerClientEvent('QBCore:Notify', src, "Player Not Found.", 'error')
    end
end
