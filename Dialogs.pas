unit Dialogs;interface	uses		QDOffscreen, Globals, Graphics;{----------------------------}	procedure AlertWithMessage (message: Str255);{----------------------------}implementation{----------------------------}	procedure AlertWithMessage (message: Str255);		const			buttonID = 1;			staticTextID = 2;		var			oldPort: GrafPtr;			alertDialog: DialogPtr;			alertStorage: DialogRecord;			h, v, dButtonType, dTextType, userSelection: integer;			dButtonHandle, dTextHandle: Handle;			dButtonDisplayRect, dTextDisplayRect: Rect;	begin{ create dialog from resource }		GetPort(oldPort);		alertDialog := GetNewDialog(alertDialogID, @alertStorage, pointer(-1));		GetDialogItem(alertDialog, staticTextID, dTextType, dTextHandle, dTextDisplayRect);		SetIText(dTextHandle, message);{ center it }		with screenBits.bounds do			begin				h := round((right - alertDialog^.portRect.right) / 2);				v := round((bottom - alertDialog^.portRect.bottom) / 2) + 9;				MoveWindow(alertDialog, h, v, true);				DrawBackdrop;			end;{ draw it }{SetPort(alertDialog);}		DrawDialog(alertDialog);{ bold outline around OK button }		GetDItem(alertDialog, buttonID, dButtonType, dButtonHandle, dButtonDisplayRect);		PenSize(3, 3);		InsetRect(dButtonDisplayRect, -4, -4);		FrameRoundRect(dButtonDisplayRect, 16, 16);		repeat			ModalDialog(nil, userSelection);		until userSelection = 1;{ clean up }		CloseDialog(alertDialog);		SetPort(oldPort);		FlushEvents(everyEvent, 0);	end;{----------------------------}end.