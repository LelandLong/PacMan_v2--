unit Globals;interface	const		appleID = 128;		fileID = 129;		editID = 130;		noMenuID = 0;		appleM = 1;		fileM = 2;		editM = 3;		menuCount = 3;		windowID = 128;		undoCommand = 1;		cutCommand = 3;		copyCommand = 4;		pasteCommand = 5;		clearCommand = 6;	var		myMenus: array[1..menuCount] of MenuHandle;		dragRect: Rect;		theChar: char;		extended: boolean;		doneFlag: boolean;		myEvent: EventRecord;		wRecord: WindowRecord;		myWindow: WindowPtr;		whichWindow: WindowPtr;{----------------------------}implementation{----------------------------}end.