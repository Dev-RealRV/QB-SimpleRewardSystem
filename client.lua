QBCore = exports['qb-core']:GetCoreObject()
RegisterCommand('dailyreward', function()
    QBCore.Functions.TriggerCallback('qb-rewardsystem:getDailyReward', function(reward)
    end)
end)