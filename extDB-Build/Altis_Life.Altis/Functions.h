class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class requestReceived {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class initCiv {};
		class initCop {};
		class initMedic {};
		class IntroCam {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class welcomeNotification {};
	};
	
	class tempGangs
	{
		file = "core\tempGangs";
		class createGroup {};
		class gangBrowser {};
		class gangManagement {};
		class groupMenu {};
		class joinGang {};
		class kickGang {};
		class leaveGang {};
		class lockGang {};
		class setGangLeader {};
		class unlockGang {};
	};	
	
	
	class Admin
	{
		file = "core\admin";
		class adminCompensate {};
		class adminDebugCon {};
		class adminFreeze {};
		class admingetID {};
		class adminGodMode {};
		class adminid {};
		class admininfo {};
		class adminInvisibility {};
		class adminMarkers {};
		class adminMenu {};
		class adminQuery {};
		class adminRevive {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class newLifeRule {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class pulloutDead {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
	};
	
	class Actions
	{
		file = "core\actions";
		class arrestAction {};
		class buyLicense {};
		class captureHideout {};
		class captureRebelHideout {};
		class catchFish {};
		class catchTurtle {};
		class coppulloutAction {};
		class douevenlift {};
		class douevenliftjail {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class getDPMission {};
		class gutAnimal {};
		class healHospital {};
		class impoundAction {};
		class jailBreakout {};
		class jailBreakoutCompleted {};
		class packupSpikes {};
		class pickupItem {};
		class pickupMoney {};
		class postBail {};
		class processAction {};
		class pulloutAction {};
		class pumpRepair {};
		class pushVehicle {};
		class putInCar {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class robShops {};
		class searchAction {};
		class searchVehAction {};
		class serviceChopper {};
		class skyDiving {};
		class stealVehicle {};
		class stopEscorting {};
		class storeVehicle {};
		class suicideBomb {};
		class surrender {};
		class ticketAction {};
		class unrestrain {};
	};
	
	class Paintball
	{
		file = "core\paintball";
		class pb_response {};
	};
	
	class Housing
	{
		file = "core\housing";
		class boughtHouse {};
		class boughtHouseFail {};
		class buyHouse {};
		class copBreakDoor {};
		class copHouseOwner {};
		class displayStats {};
		class garageRefund {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class openHouseVInv {};
		class raidHouse {};
		class sellHouse {};
		class swapItem {};
	};
	
	class Config
	{
		file = "core\config";
		class eatFood {};
		class impoundPrice {};
		class itemWeight {};
		class licensePrice {};
		class licenseType {};
		class shopMenus {};
		class taxRate {};
		class varHandle {};
		class varToStr {};
		class vehicleAnimate {};
		class vehicleWeightCfg {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class AAN {};
		class cellphone {};
		class giveItem {};
		class giveMoney {};
		class keyDrop {};
		class keyGive {};
		class keyMenu {};
		class newMsg {};
		class pardon {};
		class p_openMenu {};
		class p_prisionbreak {};
		class p_updateMenu {};
		class removeItem {};
		class revokeLicense {};
		class settingsInit {};
		class settingsMenu {};
		class showMsg {};
		class smartphone {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class updateBounty {};
		class updateViewDistance {};
		class useItem {};
		class vUseItem {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
	};
	
	class Functions
	{
		file = "core\functions";
		class accType {};
		class actionKeyHandler {};
		class animSync {};
		class calWeightDiff {};
		class CarAlarmSound {};
		class clearVehicleAmmo {};
		class collectArmaItems {};
		class dropItems {};
		class earplugs {};
		class emptyFuel {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class giveDiff {};
		class handleDamage {};
		class handleDowned {};
		class handleInv {};
		class handleItem {};
		class hudSetup {};
		class hudUpdate {};
		class Info {};
		class inString {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class mouseHandler {};
		class nearATM {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class onPutItem {};
		class onTakeItem {};
		class playerCount {};
		class playerTags {};
		class prisionbreak {};
		class progressBaren {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class receiveMoney {};
		class revealObjects {};
		class ryn_message {};
		class saveGear {};
		class simDisable {};
		class speaking {};
		class stripDownPlayer {};
		class tazeSound {};
		class Uniformscolor {};
	};
	class pauction
	{
   	file = "core\pauction";
		class CAH_Buy {};
		class CAH_fetchDetails {};
		class CAH_getPlayerObj {};
		class CAH_loadInventory {};
		class CAH_loadOffers {};
		class CAH_loggedIn {};
		class CAH_reciever {};
		class CAH_Sell {};
	};
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class say3D {};
		class setFuel {};
		class setTexture {};
		class soundDevice {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class breakoutTimer {};
		class civInteractionMenu {};
		class civLoadout {};
		class demoChargeTimer {};
		class freezePlayer {};
		class gearRevive {};
		class heliChargeTimer {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
		class waterChargeTimer {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class addVehicle2Chain {};
		class BlinkerInit {};
		class BlinkerLeft {};
		class BlinkerRight {};
		class civVInteractionMenu {};
		class colorVehicle {};
		class deviceMine {};
		class lockVehicle {};
		class lowerCenter {};
		class medVInteractionMenu {};
		class openInventory {};
		class toggleGPS {};
		class upgradeMenu {};
		class upgradeMenuChange {};
		class upgradeVehicle {};
		class vehicleOwners {};
		class vehicleWeight {};
		class vehInventory {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vInteractionMenu {};
		class WarnBlinker {};
	};
	
	class Cop
	{
		file = "core\cop";
		class arrestDialog_Arrest {};
		class bountyReceive {};
		class breathalyzer {};
		class copEnter {};
		class copHorn {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copOpener {};
		class copSearch {};
		class copSiren {};
		class copSiren2 {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class questionDealer {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class searchClient {};
		class seizeAction {};
		class seizeObjects {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
		class showArrestDialog {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class vehInvSearch {};
		class wantedGrab {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class createGang {};
		class gangCreated {};
		class gangDemote {};
		class gangDisband {};
		class gangDisbanded {};
		class gangInvite {};
		class gangInvitePlayer {};
		class gangKick {};
		class gangLeave {};
		class gangMarkers {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
		class updateGangHouse {};
		class updateGangInfo {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
		class impoundMenu {};
		class vehicleShopBuy {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class virt_buy {};
		class virt_menu {};
		class virt_sell {};
		class virt_update {};
		class weaponShopBuySell {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
	};
	
	class Items
	{
		file = "core\items";
		class bankalarmsound {};
		class blastingCharge {};
		class boltcutter {};
		class cocaine {};
		class defuseKit {};
		class drinkbeer {};
		class drinkmoonshine {};
		class drinkwhiskey {};
		class flashbang {};
		class gpsTracker {};
		class heliblastCharge {};
		class heroine {};
		class jerryRefuel {};
		class lockpick {};
		class pickaxeUse {};
		class speedBomb {};
		class spikeStrip {};
		class storageBox {};
		class underwaterCharge {};
		class weed {};
	};
	
	class Scripts
	{
		file = "scripts";
		class ctrlFunction_Settings {};
		class statusBar {};
		class vdmWatcher {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class calldialog {};
		class cargoTake {};
		class displayHandler {};
		class gangDeposit {};
		class garageLBChange {};
		class goldTake {};
		class impoundMenu {};
		class progressBar {};
		class safeCargo {};
		class safeFix {};
		class safeGold {};
		class safeInvCargo {};
		class safeInventory {};
		class safeInvGold {};
		class safeOpen {};
		class safeStore {};
		class safeTake {};
		class sellGarage {};
		class sendChannel {};
		class setMapPosition {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class unimpound {};
		class vehicleGarage {};
		class wireTransfer {};
	};
	
	class Cam
	{
	   file ="core";
	   class IntroCam {};
	};
	
	class economy
	{
		file = "core\economy";
		class addsubstract {};
		class marketGrab {};
		class OpenEconomy {};
		class retrievePrices {};
		class virt_updateEconomy {};
		class virt_updatePrice {};
	};
};