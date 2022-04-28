
function [s]=Update_Game(hObject,handles,current)
    
    global X_MAP
    global C_MAP
    global vecs
    global mines_loc
    x_d=str2double(get(handles.X_dim,'String'));
    y_d=str2double(get(handles.Y_dim,'String'));
    z_d=str2double(get(handles.Z_dim,'String'));
    
    if C_MAP(current(1),current(2),current(3))==0
         X_MAP(current(1),current(2),current(3))=0;
         plot3(current(1),current(2),current(3),'.','color',...
             [0 0 1],'MarkerSize',16);                                
         text(current(1),current(2),current(3)+0.1,'0','FontSize',16);
         for dx=-1:1
            if current(1)+dx<1 || current(1)+dx>x_d
                continue;
            end
            for dy=-1:1
                if current(2)+dy<1 || current(2)+dy>y_d
                    continue;
                end
                for dz=-1:1
                    if current(3)+dz<1 || current(3)+dz>z_d || dx^2+dy^2+dz^2==0 ...
                        || ~isnan(X_MAP(current(1)+dx,current(2)+dy,current(3)+dz))
                        
                        continue;
                    end
                    Update_Game(hObject,handles,current+[dx,dy,dz]);
                end
            end
        end
    elseif C_MAP(current(1),current(2),current(3))>0
        cur=C_MAP(current(1),current(2),current(3));
        high=max(max(max(C_MAP)));
        X_MAP(current(1),current(2),current(3))=cur;               cur;
        plot3(current(1),current(2),current(3),'.','color',...
        [cur 0 high-cur]/high,'MarkerSize',16)                          
        text(current(1),current(2),current(3)+0.1,num2str(cur),'FontSize',16);
        guidata(hObject, handles);
        if sum(sum(sum(isnan(X_MAP))))==length(mines_loc)
            for i=1:length(mines_loc)
                x_m=vecs(mines_loc(i),1);
                y_m=vecs(mines_loc(i),2);
                z_m=vecs(mines_loc(i),3);
                plot3(x_m,y_m,z_m,'s','color','g','MarkerSize',16);
                text(x_m,y_m,z_m+0.1,'X','color','g');
            end
            disp('You won !!');
            title('YOU WON !!!','FontSize',24);
        end
        return;
    else
        for i=1:length(mines_loc)
            x_m=vecs(mines_loc(i),1);
            y_m=vecs(mines_loc(i),2);
            z_m=vecs(mines_loc(i),3);
            plot3(x_m,y_m,z_m,'.','color','r','MarkerSize',16);
            text(x_m,y_m,z_m+0.1,'X','color','r');
        end
        disp('You lose !!');
        title('YOU LOSE !!!','FontSize',24);
    end
    guidata(hObject, handles);
    s=1;
end