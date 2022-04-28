
function [w]=Make_Zoom(handles)
    x_c=str2double(get(handles.X_Center,'String'));
    y_c=str2double(get(handles.Y_Center,'String'));
    z_c=str2double(get(handles.Z_Center,'String'));
    
    x_d=str2double(get(handles.X_dim,'String'));
    y_d=str2double(get(handles.Y_dim,'String'));
    z_d=str2double(get(handles.Z_dim,'String'));
    
    f=get(handles.Zoom_Slider,'Value');
    f=1-f;
    handles.axes1.XLim=[x_c+f*(1-x_c)-0.5 x_c+f*(x_d-x_c)+0.5];
    handles.axes1.YLim=[y_c+f*(1-y_c)-0.5 y_c+f*(y_d-y_c)+0.5];
    handles.axes1.ZLim=[z_c+f*(1-z_c)-0.5 z_c+f*(z_d-z_c)+0.5];
    
    w=1;
end