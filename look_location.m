
function [v]=look_location(hObject,handles)
    delete(handles.Current_look);
    x=str2double(get(handles.X_loc,'String'));
    y=str2double(get(handles.Y_loc,'String'));
    z=str2double(get(handles.Z_loc,'String'));
    handles.Current_look=plot3(x,y,z,'O','color','m','MarkerSize',16);
    guidata(hObject, handles);
    v=1;
end