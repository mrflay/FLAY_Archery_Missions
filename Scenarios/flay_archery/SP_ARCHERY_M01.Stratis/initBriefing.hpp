player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		"Gemini - You"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		"1. Reach the infiltration point on Pythos Island. <br />2. Locate and free the captured helicopter crew. <br />3. Escort the crew to the extraction vehicle. <br />4. Rendezvous with the extraction team in Kamino Bay.<br />"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		"Find and rescue the captured crew member before he is moved to a secure facility on Stratis. Stealth is of the outmost importance as the enemy is on high alert and will call in reinforcements on any sign of a rescue attempt."
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		"A secret prototype of a new advanced attack helicopter malfunctioned during a test flight and crashed on the island of Pythos, north east of Stratis. Intel indicates that at least one of the crew members survived the crash and is in the process of being moved to a secure facility on Stratis. <br/><br/>The crew has extensive knowledge of the new prototype which must not be allowed to fall into enemy hands.<br/><br/>The enemy is on high alert and have forces ready to strike at a moments notice on any sign of a rescue attempt."
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};
