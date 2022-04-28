function varargout = Mines(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mines_OpeningFcn, ...
                   'gui_OutputFcn',  @Mines_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Mines_OpeningFcn(hObject, eventdata, handles, varargin)
cla(handles.axes1);
X_len=4;
Y_len=6;
Z_len=5;
Mines=26;

handles.X_len=X_len;
handles.Y_len=Y_len;
handles.Z_len=Z_len;
handles.Mines=Mines;
handles.dim_Max=10;
handles.Current_look=plot3(1,1,1,'O','color','w','MarkerSize',4);

set(handles.X_dim,'String',num2str(handles.X_len));
set(handles.Y_dim,'String',num2str(handles.Y_len));
set(handles.Z_dim,'String',num2str(handles.Z_len));
set(handles.Num_Mines,'String',num2str(handles.Mines));

set(handles.X_loc,'String','1');
set(handles.Y_loc,'String','1');
set(handles.Z_loc,'String','1');

set(handles.X_Slider,'Min',1,'Max',X_len,'Value',1);
set(handles.Y_Slider,'Min',1,'Max',Y_len,'Value',1);
set(handles.Z_Slider,'Min',1,'Max',Z_len,'Value',1);

set(handles.X_Center,'String','1');
set(handles.Y_Center,'String','1');
set(handles.Z_Center,'String','1');

set(handles.X_Slider_Center,'Min',1,'Max',X_len,'Value',1);
set(handles.Y_Slider_Center,'Min',1,'Max',Y_len,'Value',1);
set(handles.Z_Slider_Center,'Min',1,'Max',Z_len,'Value',1);

handles.mark=[];

handles.output = hObject;
guidata(hObject, handles);

function varargout = Mines_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function X_Slider_Callback(hObject, eventdata, handles)
set(handles.X_loc,'String',num2str(round(hObject.Value)));
look_location(hObject,handles);


function X_Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Y_Slider_Callback(hObject, eventdata, handles)
set(handles.Y_loc,'String',num2str(round(hObject.Value)));
look_location(hObject,handles);

function Y_Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Z_Slider_Callback(hObject, eventdata, handles)
set(handles.Z_loc,'String',num2str(round(hObject.Value)));
look_location(hObject,handles);

function Z_Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function X_loc_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.X_dim,'String'))
    val=str2double(get(handles.X_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.X_Slider,'Value',val);
look_location(hObject,handles);


function X_loc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_loc_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.Y_dim,'String'))
    val=str2double(get(handles.Y_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.Y_Slider,'Value',val);
look_location(hObject,handles);


function Y_loc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Z_loc_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.Z_dim,'String'))
    val=str2double(get(handles.Z_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.Z_Slider,'Value',val);
look_location(hObject,handles);


function Z_loc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Choose_Button_Callback(hObject, eventdata, handles)
point=[str2double(get(handles.X_loc,'String')),...
       str2double(get(handles.Y_loc,'String')),...
       str2double(get(handles.Z_loc,'String'))];
Update_Game(hObject,handles,point);
global X_MAP
handles.Player_Visible_Map=X_MAP;

function X_dim_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>handles.dim_Max
    val=handles.dim_Max;
end
set(hObject,'String',num2str(val));
handles.X_len=val;


function X_dim_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_dim_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>handles.dim_Max
    val=handles.dim_Max;
end
set(hObject,'String',num2str(val));
handles.Y_len=val;


function Y_dim_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_dim_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>handles.dim_Max
    val=handles.dim_Max;
end
set(hObject,'String',num2str(val));
handles.Z_len=val;


function Z_dim_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Num_Mines_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>handles.X_len*handles.Y_len*handles.Z_len
    val=handles.X_len*handles.Y_len*handles.Z_len;
end
set(hObject,'String',num2str(val));
handles.X_len=val;


function Num_Mines_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Restart_Button_Callback(hObject, eventdata, handles)
set(handles.X_loc,'String','1');
set(handles.Y_loc,'String','1');
set(handles.Z_loc,'String','1');

set(handles.X_Slider,'Min',1,'Max',str2double(get(handles.X_dim,'String')),'Value',1);
set(handles.Y_Slider,'Min',1,'Max',str2double(get(handles.Y_dim,'String')),'Value',1);
set(handles.Z_Slider,'Min',1,'Max',str2double(get(handles.Z_dim,'String')),'Value',1);

set(handles.X_Center,'String','1');
set(handles.X_Center,'String','1');
set(handles.X_Center,'String','1');

set(handles.X_Slider_Center,'Min',1,'Max',str2double(get(handles.X_dim,'String')),'Value',1);
set(handles.Y_Slider_Center,'Min',1,'Max',str2double(get(handles.Y_dim,'String')),'Value',1);
set(handles.Z_Slider_Center,'Min',1,'Max',str2double(get(handles.Z_dim,'String')),'Value',1);
global C_MAP
C_MAP=zeros(str2double(get(handles.X_dim,'String')),...
            str2double(get(handles.Y_dim,'String')),...
            str2double(get(handles.Z_dim,'String')));
Generate_Map(hObject,handles);
handles.Player_Visible_Map=NaN(handles.X_len,handles.Y_len,handles.Z_len);
global X_MAP
X_MAP=NaN(str2double(get(handles.X_dim,'String')),...
            str2double(get(handles.Y_dim,'String')),...
            str2double(get(handles.Z_dim,'String')));
look_location(hObject,handles);
hold on;
for x=1:str2double(get(handles.X_dim,'String'))
    for y=1:str2double(get(handles.Y_dim,'String'))
        for z=1:str2double(get(handles.Z_dim,'String'))
            plot3(x,y,z,'.','color','m','MarkerSize',6);
            hold on;
        end
    end
end
title("Mines 3d");
xlabel("X");
xlim([0 str2double(get(handles.X_dim,'String'))+1]);
ylabel("Y");
ylim([0 str2double(get(handles.Y_dim,'String'))+1]);
zlabel("Z");
zlim([0 str2double(get(handles.Z_dim,'String'))+1]);
grid on;
rotate3d on;



function X_Center_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.X_dim,'String'))
    val=str2double(get(handles.X_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.X_Slider_Center,'Value',val);


function X_Center_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Center_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.Y_dim,'String'))
    val=str2double(get(handles.Y_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.Y_Slider_Center,'Value',val);


function Y_Center_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Center_Callback(hObject, eventdata, handles)
val=round(str2double(get(hObject,'String')));
if val<1
    val=1;
end
if val>str2double(get(handles.Z_dim,'String'))
    val=str2double(get(handles.Z_dim,'String'));
end
set(hObject,'String',num2str(val));
set(handles.Z_Slider_Center,'Value',val);


function Z_Center_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function X_Slider_Center_Callback(hObject, eventdata, handles)
set(handles.X_Center,'String',num2str(round(hObject.Value)));


function X_Slider_Center_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Y_Slider_Center_Callback(hObject, eventdata, handles)
set(handles.Y_Center,'String',num2str(round(hObject.Value)));


function Y_Slider_Center_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Zoom_Slider_Callback(hObject, eventdata, handles)
set(handles.Factor_Val,'String',num2str(get(hObject,'Value')));
Make_Zoom(handles);


function Zoom_Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Z_Slider_Center_Callback(hObject, eventdata, handles)
set(handles.Z_Center,'String',num2str(round(hObject.Value)));


function Z_Slider_Center_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function X_plus_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.X_loc,'String'));
MAX=str2double(get(handles.X_dim,'String'));
set(handles.X_Slider,'Value',min(val+1,MAX));
set(handles.X_loc,'String',num2str(min(val+1,MAX)));
look_location(hObject,handles);


function Y_plus_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.Y_loc,'String'));
MAX=str2double(get(handles.Y_dim,'String'));
set(handles.Y_Slider,'Value',min(val+1,MAX));
set(handles.Y_loc,'String',num2str(min(val+1,MAX)));
look_location(hObject,handles);


function Z_plus_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.Z_loc,'String'));
MAX=str2double(get(handles.Z_dim,'String'));
set(handles.Z_Slider,'Value',min(val+1,MAX));
set(handles.Z_loc,'String',num2str(min(val+1,MAX)));
look_location(hObject,handles);


function X_sub_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.X_loc,'String'));
set(handles.X_Slider,'Value',max(val-1,1));
set(handles.X_loc,'String',num2str(max(val-1,1)));
look_location(hObject,handles);


function Y_sub_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.Y_loc,'String'));
set(handles.Y_Slider,'Value',max(val-1,1));
set(handles.Y_loc,'String',num2str(max(val-1,1)));
look_location(hObject,handles);


function Z_sub_button_Callback(hObject, eventdata, handles)
val=str2double(get(handles.Z_loc,'String'));
set(handles.Z_Slider,'Value',max(val-1,1));
set(handles.Z_loc,'String',num2str(max(val-1,1)));
look_location(hObject,handles);



function Matk_button_Callback(hObject, eventdata, handles)
mark_point=[str2double(get(handles.X_loc,'String')),...
            str2double(get(handles.Y_loc,'String')),...
            str2double(get(handles.Z_loc,'String'))];
if isempty(handles.mark) || isempty(find(vecnorm((mark_point-handles.mark)')==0, 1))
    handles.mark=cat(1,handles.mark,mark_point);
    plot3(mark_point(1),mark_point(2),mark_point(3),...
       'p','color','r','MarkerSize',14);
   hold on;
end
handles.output = hObject;
guidata(hObject, handles);
