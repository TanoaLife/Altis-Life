#define true 1
#define false 0

class DefaultEventhandlers;
class CfgPatches
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"Tonic"};
	};
};

/*Server Settings*/

class CfgServerSettings
{
	class extDB
	{
		/*Database Selection*/
		Database = "AltisLife"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = true; //Log queries? Only set this to true if you are developing.
	};
};

/*Functions*/

class CfgFunctions
{

	class Jail_Sys
	{
	file = "Functions\Jail";
			class JailPlayer {};
			class jailSys {};
			class JailTimer {};
	};
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "Functions\MP";
			class addScore {};
			class call {};
			class execFSM {};
			class execRemote {};
			class execVM {};
			class initMultiplayer {};
			class initPlayable {};
			class missionTimeLeft {};
			class MP {};
			class MPexec {};
			class onPlayerConnected {};
			class setRespawnDelay {};
			class spawn {};
		};
	};

	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "Functions\MySQL";
			class asyncCall {};
			class bool {};
			class insertRequest {};
			class insertVehicle {};
			class mresArray {};
			class mresString {};
			class numberSafe {};
			class queryRequest {};
			class updatePartial {};
			class updateRequest {};
		};
	};

	class Life_System
	{
		tag = "life";
		class Custom
		{
			file = "Functions\Custom";
			class atmMarkers {};
			class spawnCargo {};
			class spawnGold {};
			class spawnIllegalArea {};
		};
		class Wanted_Sys
		{
			file = "Functions\WantedSystem";
			class wantedAdd {};
			class wantedBounty {};
			class wantedCrimes {};
			class wantedFetch {};
			class wantedFetchForCivilian {};
			class wantedPerson {};
			class wantedProfUpdate {};
			class wantedRemove {};
			class wantedSyncList {};
		};

		class Jail_Sys
		{
			file = "Functions\Jail";
			class JailPlayer {};
			class jailSys {};
			class JailTimer {};
		};

		class Client_Code
		{
			file = "Functions\Client";
			class updateMoney {};
		};
	};

	class TON_System
	{


		tag = "TON";
		class Systems
		{
			file = "Functions\Systems";
			class ajustprices {};
			class blowSafe {};
			class cargoUpdate {};
			class chopShopSell {};
			class cleanup {};
			class cleanupRequest {};
			class clientDisconnect {};
			class federalUpdate {};
			class getID {};
			class getprices {};
			class getVehicles {};
			class goldUpdate {};
			class huntingZone {};
			class keyManagement {};
			class loadPrices {};
			class logIt {};
			class managesc {};
			class setObjVar {};
			class spawnVehicle {};
			class spikeStrip {};
			class syncPrices {};
			class vehicleCreate {};
			class vehicleDead {};
			class vehicleDelete {};
			class vehicleIsDead {};
			class vehicleStore {};
		};
		class Paintball
		{
			file = "Functions\paintball";
			class game {};
			class paintball {};
		};
        class Airdrop
		{
			file = "Functions\airdrop";
			class generateAirdrop {};
			class GenerateAirdropAuto {};
		};
		class cargoUpdate {};
		class goldUpdate {};
		class Housing
		{
			file = "Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class houseCleanup {};
			class initHouses {};
			class nearestDoor {};
			class preCheckHouse {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
		};

		class Gangs
		{
			file = "Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};

		class Actions
		{
			file = "Functions\Actions";
			class pickupAction {};
		};

		class Smartphone
		{
			file = "Functions\Smartphone";
			class cleanupMessages {};
			class handleMessages {};
			class msgRequest {};
		};
		class pauction
		{
			file = "Functions\pauction";
			class SAH_addOffer {};
			class SAH_checkPID {};
			class SAH_looper {};
			class SAH_reciever {};
			class SAH_removeOffer {};
			class SAH_Transaction {};
		};
		class VehicleUpgrades
		{
			file = "Functions\VehicleUpgrades";
			class changeSlingLoad {};
			class updateUpgrades {};
		};
		class Admin
		{
			file = "Functions\Admin";
			class restorePlayers {};
			class toggleInvisible {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};

	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};
