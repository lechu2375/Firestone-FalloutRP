ITEM.name = "Pancerz Wspomagany"
ITEM.desc = "Model T-45."
ITEM.category = "Outfit"
ITEM.model = "models/fallout_3/power_armor_admin.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.outfitCategory = "suit"
ITEM.pacData = {
    [1] = {
    ["children"] = {
        [1] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.05,
                ["Bone"] = "left calf",
                ["UniqueID"] = "874114184",
                ["ClassName"] = "bone",
            },
        },
        [2] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["Bone"] = "left clavicle",
                ["UniqueID"] = "2656133688",
                ["Scale"] = Vector(1, 1, 1.2999999523163),
            },
        },
        [3] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["UniqueID"] = "1380166416",
                ["Bone"] = "left upperarm",
                ["Size"] = 1.075,
                ["Position"] = Vector(1.1328125, 0.98974609375, 0.5546875),
            },
        },
        [4] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.175,
                ["ClassName"] = "entity",
                ["HideEntity"] = true,
                ["UniqueID"] = "2877215394",
            },
        },
        [5] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.05,
                ["Bone"] = "spine 2",
                ["UniqueID"] = "458832364",
                ["ClassName"] = "bone",
            },
        },
        [6] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.05,
                ["Bone"] = "right calf",
                ["UniqueID"] = "4048757613",
                ["ClassName"] = "bone",
            },
        },
        [7] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.5,
                ["Bone"] = "left toe",
                ["UniqueID"] = "2754616942",
                ["ClassName"] = "bone",
            },
        },
        [8] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.125,
                ["Bone"] = "pelvis",
                ["UniqueID"] = "3737001015",
                ["ClassName"] = "bone",
            },
        },
        [9] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["Position"] = Vector(1.29638671875, -0.00390625, -0.00244140625),
                ["UniqueID"] = "2928362968",
            },
        },
        [10] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.075,
                ["Bone"] = "left forearm",
                ["UniqueID"] = "920246692",
                ["ClassName"] = "bone",
            },
        },
        [11] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["UniqueID"] = "3208241164",
                ["Bone"] = "left thigh",
                ["Size"] = 1.05,
                ["Position"] = Vector(0.970703125, 0.3779296875, 0.00421142578125),
            },
        },
        [12] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.5,
                ["Bone"] = "right toe",
                ["UniqueID"] = "4127024222",
                ["ClassName"] = "bone",
            },
        },
        [13] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["Bone"] = "right clavicle",
                ["UniqueID"] = "253662716",
                ["Scale"] = Vector(1, 1, 1.2999999523163),
            },
        },
        [14] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["UniqueID"] = "1102101136",
                ["Bone"] = "right upperarm",
                ["Size"] = 1.075,
                ["Position"] = Vector(1.1328125, 0.98974609375, 0.5546875),
            },
        },
        [15] = {
            ["children"] = {
                [1] = {
                    ["children"] = {
                    },
                    ["self"] = {
                        ["Material"] = "models/shadertest/unlitgenericmodel",
                        ["ClassName"] = "submaterial",
                        ["UniqueID"] = "1317409571",
                        ["SubMaterialId"] = 1,
                    },
                },
            },
            ["self"] = {
                ["BoneMerge"] = true,
                ["ClassName"] = "model",
                ["UniqueID"] = "2794703346",
                ["Model"] = "models/fallout_3/power_armor_admin.mdl",
                ["Position"] = Vector(0.34765625, -2.314453125, -0.18408203125),
            },
        },
        [16] = {
            ["children"] = {
            },
            ["self"] = {
                ["ClassName"] = "bone",
                ["UniqueID"] = "2226795415",
                ["Bone"] = "right thigh",
                ["Size"] = 1.05,
                ["Position"] = Vector(-0.3310546875, -0.5828857421875, 0.324951171875),
            },
        },
        [17] = {
            ["children"] = {
            },
            ["self"] = {
                ["Size"] = 1.075,
                ["Bone"] = "right forearm",
                ["UniqueID"] = "2250689808",
                ["ClassName"] = "bone",
            },
        },
    },
    ["self"] = {
        ["EditorExpand"] = true,
        ["UniqueID"] = "1403518495",
        ["ClassName"] = "group",
        ["Name"] = "my outfit",
        ["Description"] = "add parts to me!",
    },
},
}

ITEM:hook("Equip", function(item)
    item.player:SetPowerArmor(true)
end)

ITEM:hook("EquipUn", function(item)
    item.player:SetPowerArmor(false)
end)