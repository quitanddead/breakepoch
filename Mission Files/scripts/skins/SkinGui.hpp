#include "definitions.sqf"

class MenClothing {
	idd = SKINS_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'scripts\skins\List_Men.sqf'";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = SKINS_BCKGRND;
			x = 0.1; y = 0.101;
			w = 0.55; h = 0.8;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle : HW_RscText {
		   	idc = SKINS_TITLE;
			x = 0.05; y =  0.13;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.04;
			text = "Advanced Clothing";
		};
	};

	class controls {
		class RecruitQueue : HW_RscText {
		   	idc = SKINS_QUEUE;
			x = 0.06; y =  0.2;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "";
		};
		class RecruitPrise : HW_RscText {
		   	idc = SKINS_PRICE;
			x = 0.23; y =  0.2;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "";
		};
		class Unitlist: HW_RscGUIListBox {
			idc = SKINS_UNITLIST;
			default = 1;
			x = 0.101; y = 0.275;
			w = 0.405; h = 0.50;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "";
			onLBDblClick = "";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class RecruitButton: HW_RscGUIShortcutButton {
			x = 0.325; y = 0.825;
			w = 0.125; h = 0.05;
			text = "Change Skin";
			onButtonClick = "execVM 'scripts\skins\GetMen.sqf'";
		};
		class CloseButton: RecruitButton {
			x = 0.15;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
	};
};

class WomanClothing {
	idd = SKINS_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'scripts\skins\List_Woman.sqf'";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = SKINS_BCKGRND;
			x = 0.1; y = 0.101;
			w = 0.55; h = 0.8;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle : HW_RscText {
		   	idc = SKINS_TITLE;
			x = 0.05; y =  0.13;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.04;
			text = "Skin Trader";
		};
	};

	class controls {
		class RecruitQueue : HW_RscText {
		   	idc = SKINS_QUEUE;
			x = 0.06; y =  0.2;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "";
		};
		class RecruitPrise : HW_RscText {
		   	idc = SKINS_PRICE;
			x = 0.23; y =  0.2;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = { 1, 1, 1, 0.8 };
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "";
		};
		class Unitlist: HW_RscGUIListBox {
			idc = SKINS_UNITLIST;
			default = 1;
			x = 0.101; y = 0.275;
			w = 0.405; h = 0.50;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "";
			onLBDblClick = "";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class RecruitButton: HW_RscGUIShortcutButton {
			x = 0.325; y = 0.825;
			w = 0.125; h = 0.05;
			text = "Change Skin";
			onButtonClick = "execVM 'scripts\skins\GetWoman.sqf'";
		};
		class CloseButton: RecruitButton {
			x = 0.15;
			text = "Close";
			onButtonClick = "CloseDialog 0;";
		};
	};
};