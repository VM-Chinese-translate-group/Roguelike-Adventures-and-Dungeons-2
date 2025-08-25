#priority 11
import crafttweaker.api.events.CTEventManager;
import mods.gamestages.StageHelper;
import mods.gamestages.events.GameStageAdded;


//need to add localization for them so that underscore is not shown in game nitpick but can be left for full release

StageHelper.grantStageOnAdvancement("minecraft:end/kill_dragon", "Ender_Ender");
StageHelper.grantStageOnKill(<entitytype:minecraft:ender_dragon>, "Ender_Ender");
StageHelper.grantStageOnDimension("minecraft:the_end", "Wither_Wiper");
StageHelper.grantStageOnKill(<entitytype:minecraft:wither>, "Wither_Wiper");
StageHelper.grantStageOnJoinWithCondition(player => player.hasGameStage("Ender_Ender"), "Wither_Wiper");

CTEventManager.register<GameStageAdded>((event) => {


    if (event.stage == "Wither_Wiper" && !event.player.hasGameStage("Ender_Ender")) {

        //change message to something thats more creative 
        if (event.player.world.dimension == "minecraft:the_end") {
            event.player.sendMessage("§d§l\u6270\u4e71\u8fd9\u4e9b\u8d2b\u7620\u7684\u571f\u5730\uff0c\u4f1a\u6fc0\u6012\u90a3\u4e9b\u602a\u7269");
        }  else {
            event.player.sendMessage("§d§l\u968f\u7740\u4e00\u540d\u9886\u4e3b\u7684\u9668\u843d\uff0c\u602a\u7269\u53d8\u5f97\u66f4\u52a0\u5f3a\u5927\u3002");
        } 
    }

    if (event.stage == "Ender_Ender") {
        //maybe sounds better   
        event.player.sendMessage("§4§l\u672b\u5730\u66b4\u541b\u7684\u6b7b\u4ea1\u5f7b\u5e95\u89e3\u653e\u4e86\u602a\u7269\u7684\u5168\u90e8\u529b\u91cf");
    }
});

//locks bosses from getting affixes until first edragon kill. Easier bosses locked behind wither or end instead.

//these bosses appear after the dragon so they would always be champion anyways
//"stalwart_dungeons:shelterer","alexsmobs:void_worm"

mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:naga");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:lich");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:minoshroom");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:knight_phantom");
mods.champions.ChampionStages.addStage("Wither_Wiper", "stalwart_dungeons:awful_ghast");
mods.champions.ChampionStages.addStage("Wither_Wiper", "meetyourfight:swampjaw");
mods.champions.ChampionStages.addStage("Wither_Wiper", "meetyourfight:bellringer");
mods.champions.ChampionStages.addStage("Wither_Wiper", "meetyourfight:dame_fortuna");
mods.champions.ChampionStages.addStage("Wither_Wiper", "mowziesmobs:ferrous_wroughtnaut");
mods.champions.ChampionStages.addStage("Wither_Wiper", "mowziesmobs:barako");
mods.champions.ChampionStages.addStage("Wither_Wiper", "mowziesmobs:frostmaw");
mods.champions.ChampionStages.addStage("Wither_Wiper", "alexsmobs:warped_mosco");
mods.champions.ChampionStages.addStage("Wither_Wiper", "blue_skies:alchemist");
mods.champions.ChampionStages.addStage("Wither_Wiper", "blue_skies:summoner");
mods.champions.ChampionStages.addStage("Wither_Wiper", "minecraft:wither");
mods.champions.ChampionStages.addStage("Wither_Wiper", "ars_nouveau:wilden_boss");
mods.champions.ChampionStages.addStage("Wither_Wiper", "blue_skies:arachnarch");
mods.champions.ChampionStages.addStage("Wither_Wiper", "blue_skies:starlit_crusher");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:snow_queen");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:hydra");
mods.champions.ChampionStages.addStage("Wither_Wiper", "twilightforest:ur_ghast");
mods.champions.ChampionStages.addStage("Wither_Wiper", "atum:pharaoh");

//locks legendary and ultimate champions behind killing wither
mods.champions.ChampionStages.addTierStage("Wither_Wiper", 3);

//locks demonic champions behind killing edragon
mods.champions.ChampionStages.addTierStage("Ender_Ender", 5);
