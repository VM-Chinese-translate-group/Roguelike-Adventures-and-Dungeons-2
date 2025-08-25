import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.MCPlayerLoggedInEvent;
import crafttweaker.api.event.entity.living.MCLivingDeathEvent;
import crafttweaker.api.event.entity.player.MCPlayerRespawnEvent;
import crafttweaker.api.event.tick.MCPlayerTickEvent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.world.MCWorld;

CTEventManager.register<MCPlayerLoggedInEvent>((event) => {
	val player = event.getPlayer() as MCPlayerEntity;
	val world = player.getWorld();
	val username = player.getName().getString();
		if (player.getPersistentData().contains("checkedforhardcore"))
			return;
		if (world.hardcore == true) {
		world.asServerWorld().server.executeCommand("execute as " + username + ' run function rad_recipes:hardcore_startup', true);
		world.asServerWorld().server.executeCommand("execute as " + username + ' run ftbquests change_progress @s complete 2A79FAE23F150F49', true);
		player.addGameStage("hardcore");
		player.updatePersistentData({checkedforhardcore: 1});
		<item:enigmaticlegacy:cursed_stone>.addTooltip("\u5728\u6781\u9650\u6a21\u5f0f\u4e0b\u65e0\u6cd5\u79fb\u9664\u4e03\u5492\u4e4b\u6212");
		}
});

CTEventManager.register<MCPlayerRespawnEvent>((event) => {
	val player = event.getPlayer() as MCPlayerEntity;
	val world = player.getWorld();
	val username = player.getName().getString();
		if (world.hardcore == true) {
		world.asServerWorld().server.executeCommand("execute as " + username + ' run function rad_recipes:hardcore_respawn', true);
		}
});