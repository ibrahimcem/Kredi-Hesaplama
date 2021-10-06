function varargout = sayfa_2(varargin)
% SAYFA_2 MATLAB code for sayfa_2.fig
%      SAYFA_2, by itself, creates a new SAYFA_2 or raises the existing
%      singleton*.
%
%      H = SAYFA_2 returns the handle to a new SAYFA_2 or the handle to
%      the existing singleton*.
%
%      SAYFA_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAYFA_2.M with the given input arguments.
%
%      SAYFA_2('Property','Value',...) creates a new SAYFA_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sayfa_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sayfa_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sayfa_2

% Last Modified by GUIDE v2.5 12-Jun-2020 03:07:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sayfa_2_OpeningFcn, ...
                   'gui_OutputFcn',  @sayfa_2_OutputFcn, ...
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


% --- Executes just before sayfa_2 is made visible.
function sayfa_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sayfa_2 (see VARARGIN)

% Choose default command line output for sayfa_2
handles.output = hObject;
if (nargin == 4)
    tutar = varargin{1}.tutar;
else
    tutar = '';
end
set(handles.edit1,'String',tutar);

[durum,sekme,format]= xlsfinfo('Kredi_turu.xlsx');
set(handles.popupmenu1,'String',sekme);
set(handles.popupmenu2,'String','Vade Seçiniz...')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sayfa_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sayfa_2_OutputFcn(hObject, eventdata, handles) 
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
close(handles.figure1);
sayfa_1();



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',2);
i_faiz=handles.tum(2,2);
[num,str,handles.tum]=xlsread('Kredi_turu.xlsx',3);
k_faiz=handles.tum(2,2);
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',4);
t_faiz=handles.tum(2,2);
x=[i_faiz{1},k_faiz{1},t_faiz{1}];
y=[10,20,30];
axes(handles.axes1);
bar(x,y);


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'String');
secili_kredi=get(handles.popupmenu1,'Value');
liste_kredi=get(handles.popupmenu1,'String');
secili_eleman_kredi =liste_kredi{secili_kredi};
[num,str,handles.tum] = xlsread('Kredi_turu.xlsx',secili_kredi);

secili_vade=get(handles.popupmenu2,'Value');

b=handles.tum(secili_vade,2);
faiz=(b{1}*str2double(a))/100;
c=faiz+str2double(a);
c
set(handles.text2,'String',num2str(c));
if (secili_kredi==1 || secili_vade ==1)
    errordlg('Vade Seçmediniz','Hata','moda1')
else isnan(str2double(a))
    errordlg('Miktar alaný sayý olmalýdýr','Hata','modal');
end
    
