function varargout = sayfa_1(varargin)
% SAYFA_1 MATLAB code for sayfa_1.fig
%      SAYFA_1, by itself, creates a new SAYFA_1 or raises the existing
%      singleton*.
%
%      H = SAYFA_1 returns the handle to a new SAYFA_1 or the handle to
%      the existing singleton*.
%
%      SAYFA_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAYFA_1.M with the given input arguments.
%
%      SAYFA_1('Property','Value',...) creates a new SAYFA_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sayfa_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sayfa_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sayfa_1

% Last Modified by GUIDE v2.5 12-Jun-2020 01:10:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sayfa_1_OpeningFcn, ...
                   'gui_OutputFcn',  @sayfa_1_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before sayfa_1 is made visible.
function sayfa_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sayfa_1 (see VARARGIN)

% Choose default command line output for sayfa_1
handles.output = hObject;
[handles.sayi,handles.str,handles.tum] = xlsread('Kredi_turu.xlsx',1);
[durum,sekme,format]= xlsfinfo('Kredi_turu.xlsx');
set(handles.popupmenu1,'String',sekme);
set(handles.popupmenu2,'String','Vade Seçiniz...')
set(handles.figure1,'Name','Kredi Baþvuru Uygulamasý');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sayfa_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sayfa_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',2);
i_faiz=handles.tum(2,2);
i_faiz2=handles.tum(3,2);
i_faiz3=handles.tum(4,2);

    
[num,str,handles.tum]=xlsread('Kredi_turu.xlsx',3);
k_faiz=handles.tum(2,2);
k_faiz2=handles.tum(3,2);
k_faiz3=handles.tum(4,2);

[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',4);
t_faiz=handles.tum(2,2);
t_faiz2=handles.tum(3,2);
t_faiz3=handles.tum(4,2);
axes(handles.axes1);
x=[i_faiz2{1}-i_faiz{1},k_faiz2{1}-k_faiz{1},t_faiz2{1}-t_faiz{1}];
y=[12,24,36];
z=[10,10,10];
plot3(x,y,z)





% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

secili_deger=get(hObject,'Value');
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',secili_deger);
krediler = handles.tum(:,1);
set(handles.popupmenu2,'String',krediler);
set(handles.popupmenu2,'Value',1);
guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
secili_deger= get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secili_kredi=get(handles.popupmenu1,'Value');
liste_kredi=get(handles.popupmenu1,'String');
secili_eleman_kredi =liste_kredi{secili_kredi};
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',secili_kredi);

secili_vade=get(handles.popupmenu2,'Value');

liste_vade=get(handles.popupmenu2,'String');
secili_eleman_vade =liste_vade{secili_vade};
a = handles.tum(secili_vade,2);


tc=get(handles.edit1,'String');
ad=get(handles.edit2,'String');
soyad=get(handles.edit4,'String');
miktar=get(handles.edit3,'String');

faiz=(a{1}*str2double(miktar))/100;
if (secili_kredi==1 || secili_vade ==1)
    errordlg('Vade Seçmediniz','Hata','moda1')
elseif isnan(str2double(tc))
    errordlg('Tc alaný sayý olmalýdýr','Hata','modal');
elseif isempty(ad)
    errordlg('Ad alanýný boþ býraktýnýz','Hata','modal');
elseif isempty(soyad)
    errordlg('Soyad alanýný boþ býraktýnýz','Hata','modal');
elseif isnan(str2double(miktar))
    errordlg('Miktar alanýný sayý olmalýdýr','Hata','modal');
else


A = {secili_eleman_kredi,secili_eleman_vade,tc,ad,soyad,miktar,faiz};
[num,str,tum] = xlsread('basvuru.xlsx',1);
y = strcat('A',num2str(size(tum,1)+1));
[drm,msj] = xlswrite('basvuru.xlsx',A,1,y)
if drm==1 
    set(handles.text2,'String','Baþvuru Tamamlandý.');
    pause(3);
    set(handles.text2,'String','');
    
else
    set(handles.text2,'String','Hata');
    pause(3);
    set(handles.text2,'String','');
end
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);
sayfa_2();


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.tutar = get(handles.edit3,'String');
close(handles.figure1);
sayfa_2(handles);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.togglebutton1,'Value')==0
    set(handles.uipanel1,'Visible','off')
    set(handles.axes1,'Visible','off')
    set(handles.pushbutton2,'Visible','off')
else
    set(handles.uipanel1,'Visible','on')
    set(handles.axes1,'Visible','on')
    set(handles.pushbutton2,'Visible','on')
end

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
