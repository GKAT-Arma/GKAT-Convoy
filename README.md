# GKAT-Convoy

Click and drag into your @ExileServer/Addons

To edit the convoys/settings, unpbo, change settings in config.sqf, repbo, and reinsert into your @ExileServer/Addons

//Config.sqf//

/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/
		
GKCSpawnTime = 30;											//Delay between spawning each Convoy in seconds.
GKCAISide = EAST;											//Side The AI should be on.	
GKCConvoyMarker = "loc_Truck";								//Marker in https://community.bistudio.com/wiki/Arma_3:_CfgMarkers to use for Convoys
GKCConvoyKillMoney = false;									//If true player will get money paid on kill, if false, the money will be put in the vehicle versus on kill. Set this to false and money to 0 below in the convoy settings if you want no money with convoys period.
GKCConvoyKillRep = true;									//If true player will get rep paid on kill, if false, they won't.  Rep set by convoy below in convoy settings.
GKCLimitConvoyType = true;									//If true, only one type of each convoy will be able to spawn at a time, make sure GKCMaxConvoy is less than or equal too total convoys below
GKCSpawnRadius = 100;										//Convoy will spawn within this radius after finding a safe location.  100 meters I found works best.
GKCPlayerDistance = 200;									//Closest a convoy will spawn to players.
GKCConvoyDistance = 5000;									//Convoy final waypoint must be atleast this distance from starting location.
GKCConvoyLocation = true;									//If true, convoy location will mark lead convoy based on GKCConvoyTimer.  If false, no marker will be put on the map.
GKCConvoyTimer = 200;										//If GKCConvoyLocation is true, this will mark lead vehicle this frequent in seconds.
GKCMarkerOffset = 100;										//Moves Convoy Marker to be offset so it's not right on the convoy itself adding a bit of ambiguity.  Set to 0 if you want it on the convoy.
GKCMarkerRadius = 200;										//Sets Marker Radius/Size.

/////////////////////////////////////////		
//DO NOT TOUCH//		
/////////////////////////////////////////
GKCMaxConvoy = 0;											//Do Not Touch, as this is defined below in GKC_ConvoySpawn
GKCMarker = 0;												//Do not Touch, changing this may break the convoy code.
GKC_liveConvoysArray = [];									//Do Not Touch, sets starter convoy count.
GKCMaxTempConvoy = 0;										//Do Not Touch, for temp convoy calculation
GKC_liveConvoys = 0;										//Do Not Touch
/////////////////////////////////////////		
//Foot Soldier Settings//		
/////////////////////////////////////////
//Add AI Classnames from https://community.bistudio.com/wiki/Arma_3:_CfgVehicles_WEST
GKC_Walkers = [
				"B_Soldier_lite_F",
				"B_soldier_LAT_F",
				"B_Soldier_GL_F",
				"B_soldier_AR_F",
				"B_Soldier_SL_F",
				"B_engineer_F",
				"B_recon_F",
				"B_recon_JTAC_F",
				"B_soldier_AT_F",
				"B_soldier_AA_F",
				"B_recon_LAT_F"
				];
/////////////////////////////////////////		
//Player Settings// Example: [1,2] - 1 Player makes 2 Convoys Spawn
/////////////////////////////////////////				
GKC_ConvoySpawn = [
					[1,1],
					[2,2],
					[3,3],
					[4,4]
				];

				
/////////////////////////////////////////		
//Convoy Settings//		
/////////////////////////////////////////

//Marker Colors - https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors
//Recommend keeping Convoys to max of 3 vehicles, but feel free to try.
					
GKC_Convoy =[
				//Convoy 1
				[
					1,	// Convoy Number - Needed to limit each convoy to one type at a time
						[
							"ColorRed", // Marker Color
							"Tank Patrol", //Vehicle Marker Text
							30, //Convoy Speed Limit
							round (random [20000, 25000, 30000]), // Money
							round (random [10000, 15000, 20000]), // Reputation
							false,	//If true, will spawn walking AI, Convoy speed will be limited to 15
							10, //Total Walking AI
							["O_T_MBT_02_cannon_ghex_F","B_T_MBT_01_cannon_F","O_MBT_02_railgun_F"]	// Vehicles
						]
				],
				//Convoy 2
				[
					2,	// Convoy Number - Needed to limit each convoy to one type at a time
						[
							"ColorYellow", // Marker Color
							"Troop March", //Vehicle Marker Text
							30, //Convoy Speed Limit
							round (random [10000, 15000, 20000]), // Money
							round (random [5000, 8000, 10000]), // Reputation
							true,	//If true, will spawn walking AI, Convoy speed will be limited to 15
							10, //Total Walking AI
							["O_MRAP_02_hmg_F","O_Truck_03_transport_F","O_MRAP_02_gmg_F"]	// Vehicles
						]
				],
				//Convoy 3
				[
					3,	// Convoy Number - Needed to limit each convoy to one type at a time
						[
							"ColorGreen", // Marker Color
							"Cadillac Escort", //Vehicle Marker Text
							30, //Convoy Speed Limit
							round (random [5000, 7500, 10000]), // Money
							round (random [1000, 3000, 5000]), // Reputation
							false,	//If true, will spawn walking AI, Convoy speed will be limited to 15
							10, //Total Walking AI
							["Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_SUV_Armed_Black","O_G_Offroad_01_armed_F"]	// Vehicles
						]
				],
				//Convoy 4
				[
					4,	// Convoy Number - Needed to limit each convoy to one type at a time
						[
							"ColorPink", // Marker Color
							"Pink Prize Vehicle", //Vehicle Marker Text
							200, //Convoy Speed Limit
							round (random [50000, 75000, 10000]), // Money
							-50000, // Reputation
							false,	//If true, will spawn walking AI, Convoy speed will be limited to 15
							0, //Total Walking AI
							["Golf_Civ_pink"]	// Vehicles
						]
				]
			];
