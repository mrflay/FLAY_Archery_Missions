player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		"1. Find weapon and ammunition. <br />2. Destroy the enemey helicopter."
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		"Destroy enemy attack helicopter."
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};
