class CfgPatches
{
	class FLAY_Archery_Missions
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Missions_F", "A3_Missions_F_Beta", "FLAY_Archery"};
	};
};

class CfgMissions
{
	class Campaigns{};
	class Missions
	{
		class FLAY_Archery
		{
			briefingName = "Archery";
			overviewText = "Try out archery in combat scenarios.";
			overviewPicture = "FLAY\FLAY_Archery_Missions\Scenarios\overview_co.paa";
			author = "mrflay";			
			class SP_ARCHERY_M01
			{
				directory = "FLAY\FLAY_Archery_Missions\scenarios\flay_archery\SP_ARCHERY_M01.Stratis";
			};	
		};
	};	
	class MPMissions
	{
		class MP_Archery_Mission_01
		{
			briefingName = "Archery: Hunter";
			directory = "FLAY\FLAY_Archery_Missions\mpscenarios\mp_archery_m01.stratis";
		};
	};
	class Challenges
	{
		class flay_archery
		{
			briefingName = "Archery";
			overviewText = "Try out archery in various practice and competition modes.";
			overviewPicture = "\FLAY\FLAY_Archery_Missions\Challenges\overview_co.paa";
			author = "mrflay";
			class SP_ARCHERY_C00
			{
				directory = "FLAY\FLAY_Archery_Missions\Challenges\flay_archery\SP_ARCHERY_C00.Stratis";
			};			
			class SP_ARCHERY_C01
			{
				directory = "FLAY\FLAY_Archery_Missions\Challenges\flay_archery\SP_ARCHERY_C01.Stratis";
			};
			class SP_ARCHERY_C02
			{
				directory = "FLAY\FLAY_Archery_Missions\Challenges\flay_archery\SP_ARCHERY_C02.Stratis";
			};	
			class SP_ARCHERY_C03
			{
				directory = "FLAY\FLAY_Archery_Missions\Challenges\flay_archery\SP_ARCHERY_C03.Stratis";
			};
			class SP_ARCHERY_C04
			{
				directory = "FLAY\FLAY_Archery_Missions\Challenges\flay_archery\SP_ARCHERY_C04.Stratis";
			};			
		};
	};
	class CfgFlayArchery
	{
		class SP_ARCHERY_M01
		{	
		};
		class SP_ARCHERY_C00
		{
		};	
		class SP_ARCHERY_C01
		{	
		};
		class SP_ARCHERY_C02
		{
		};
		class SP_ARCHERY_C03
		{
		};
		class SP_ARCHERY_C04
		{
		};			
	};
};
