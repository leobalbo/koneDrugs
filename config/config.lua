config = {}

-- Configuração

config.groupPolice = "policia" -- Permissão da policia


config.general = {

    -- Aqui ficara todas as config
    ["favela01"] = { 

        ["marker"] = {
            id = 25, -- marker id = https://docs.fivem.net/docs/game-references/markers/
            color = {234,142,80,999}, -- marker color (R,G,B,A)
            scale = vec3(5.0, 5.0, 5.0),
            rotacao = vec3(0.0, 0.0, 130.0), -- marker Rotation (x,y,z)
            bobUpAndDown = false, -- marker bopUpAndDown
            faceCamera = false, -- marker faceCamera
            rotation = true, -- marker rotation
            custom = { -- Custom Marker (set id 8)
                active = false,
                dict = '',
                name = ''
            }
        },

        ["payment"] = {
            alertPolice = true,         -- Se vai ou não chamar a policia (true = chama a policia | false = não chamar a policia)
            chanceAlert = 50,           -- Chance de chamar a policia
            sellItem = "joint",         -- Nome do item que sera vendido.
            sellAmountMin = 1,          -- Quantia de item minimo que será vendido.
            sellAmountMax = 5,          -- Quantia de item maximo que será vendido.
            paymentType = "item",       -- Caso queira receber dinheiro coloque "money" caso for item coloque "item".
            paymentItem = "dollarsz",   -- Caso estiver utilizando a opção como item definir o item aqui.
            paymentAmountMin = 2000,    -- Quantia minima que será recebida
            paymentAmountMax = 3000,    -- Quantia maxima que será recebida
            webhoobLink = "https://discordapp.com/api/webhooks/972179587196940378/0EdA13dIHu1lLXq1Eg7tIMt9zfhIMCOWqkKCndC11jRVY55w2y_mX-38v768HPyhYME8"            -- Link do webhook do discord (https://support.discord.com/hc/pt-br/articles/228383668-Usando-Webhooks)
        },

        ["routs"] = {
            vec3(108.55, -75.1, 64.66),
            vec3(772.09, -231.93, 66.12),
            vec3(784.3, -1005.36, 26.14),
            vec3(206.08, -1129.54, 29.33)
        }

    },

}

config.startLocation = {
    {
        config = "favela01",
        coords = vec3(48.28, -864.74, 29.56)
    },
    {
        config = "favela01",
        coords = vec3(51.4, -866.05, 29.55)
    }
}

config.routs = {
    vec3(108.55, -75.1, 64.66),
    vec3(772.09, -231.93, 66.12),
    vec3(784.3, -1005.36, 26.14),
    vec3(206.08, -1129.54, 29.33)
}

return config