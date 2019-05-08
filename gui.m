% create figure and panel on it
f = figure;
% create a button (default style)
b1 = uicontrol (f,"string", "select file..", "position",[50 350 150 40],"callback","browse");

function browse (hObject, eventdata)
  conn = setup();
  [filename pathname] =uigetfile({'*wav'},'file selector');
  filefullpath=strcat(pathname,filename);
  %display string of full path
  c1=uicontrol ("style", "text","string", "FILE LOCATION :","horizontalalignment", "left","position", [50 300 450 40]);
  c2=uicontrol ("style", "text","string", filefullpath,"horizontalalignment", "left","position", [150 300 450 40]);
  s = match_songs(conn, filefullpath, 0, 0);
  d1=uicontrol ("style", "text","string", s ,"horizontalalignment", "left","position", [150 200 450 40]);
  
end                
