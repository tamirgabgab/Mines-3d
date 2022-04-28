
function [u]=Generate_Map(hObject,handles)
    global C_MAP
    cla(handles.axes1);
    x=str2double(get(handles.X_dim,'String'));
    y=str2double(get(handles.Y_dim,'String'));
    z=str2double(get(handles.Z_dim,'String'));
    m=str2double(get(handles.Num_Mines,'String'));
    
    C_MAP=zeros(x,y,z);
    global vecs
    vecs=[];
    for i=1:x
        for j=1:y
            for k=1:z
                vecs=cat(1,vecs,[i,j,k]);
            end
        end
    end
    global mines_loc
    mines_loc=randperm(x*y*z,m);
    handles.vecs=vecs;
    handles.mines_loc=mines_loc;
    for i=1:m
        x_m=vecs(mines_loc(i),1);
        y_m=vecs(mines_loc(i),2);
        z_m=vecs(mines_loc(i),3);
        C_MAP(x_m,y_m,z_m)=-666;
        for dx=-1:1
            if x_m+dx<1 || x_m+dx>x
                continue;
            end
            for dy=-1:1
                if y_m+dy<1 || y_m+dy>y
                    continue;
                end
                for dz=-1:1
                    if z_m+dz<1 || z_m+dz>z || C_MAP(x_m+dx,y_m+dy,z_m+dz)==-666
                        continue;
                    end
                    C_MAP(x_m+dx,y_m+dy,z_m+dz)=C_MAP(x_m+dx,y_m+dy,z_m+dz)+1;
                end
            end
        end
    end
    handles.Current_Map=C_MAP;
    max_idx_color=max(max(max(C_MAP)));
    COLOR=linspace(0,0.8,max_idx_color);
    handles.max_idx_color=max_idx_color;
    %{
    for a=1:x
        for b=1:y
            for c=1:z
                if MAP(a,b,c)==-666
                    plot3(a,b,c,'.','color','r','MarkerSize',16);
                    text(a,b,c+0.1,'X','color','r');
                else
                    %plot3(a,b,c,'.','color',...
                    %    [COLOR(MAP(a,b,c)+1) 0 1-COLOR(MAP(a,b,c)+1)],'MarkerSize',16);
                    plot3(a,b,c,'.','color',[MAP(a,b,c) 0 max_idx_color-MAP(a,b,c)]/max_idx_color,'MarkerSize',16)
                       
                    text(a,b,c+0.1,num2str(MAP(a,b,c)),'FontSize',16);
                end                
                hold on;
            end
        end
    end
    %}
    title("Mines 3d");
    xlabel("X");
    xlim([0 x+1]);
    xticks(0:x+1);
    ylabel("Y");
    ylim([0 y+1]);
    yticks(0:y+1);
    zlabel("Z");
    zlim([0 z+1]);
    zticks(0:z+1);
    grid on;
    rotate3d on;
    guidata(hObject, handles);
    u=1;
end