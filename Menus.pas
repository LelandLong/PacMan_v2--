unit Menus;interface	uses		Globals;{----------------------------}	procedure SetUpMenus;	procedure DoCommand (mResult: longint);{----------------------------}implementation{----------------------------}	procedure SetUpMenus;		var			i: integer;	begin		myMenus[appleM] := GetMenu(appleID);		AddResMenu(myMenus[appleM], 'DRVR');		myMenus[fileM] := GetMenu(fileID);		myMenus[editM] := GetMenu(editID);		for i := 1 to menuCount do			InsertMenu(myMenus[i], 0);		DrawMenuBar;	end;{----------------------------}	procedure DoCommand (mResult: longint);		var			theItem: integer;			theMenu: integer;			name: Str255;			temp: integer;	begin		theItem := LoWord(mResult);		theMenu := HiWord(mResult);		case theMenu of			noMenuID: 				begin				end;			appleID: 				begin					GetItem(myMenus[appleM], theItem, name);					temp := OpenDeskAcc(name);					SetPort(myWindow);				end;			fileID: 				doneFlag := true;			editID: 				begin					if not SystemEdit(theItem - 1) then						case theItem of							cutCommand: 								doneFlag := doneFlag;							copyCommand: 								doneFlag := doneFlag;							pasteCommand: 								doneFlag := doneFlag;							clearCommand: 								doneFlag := doneFlag;						end;				end;		end;		HiliteMenu(0);	end;{----------------------------}end.