function varargout = PlagueTool(varargin)
% PLAGUETOOL MATLAB code for PlagueTool.fig
%      PLAGUETOOL, by itself, creates a new PLAGUETOOL or raises the existing
%      singleton*.
%
%      H = PLAGUETOOL returns the handle to a new PLAGUETOOL or the handle to
%      the existing singleton*.
%
%      PLAGUETOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAGUETOOL.M with the given input arguments.
%
%      PLAGUETOOL('Property','Value',...) creates a new PLAGUETOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PlagueTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PlagueTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PlagueTool

% Last Modified by GUIDE v2.5 18-Apr-2017 22:24:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PlagueTool_OpeningFcn, ...
                   'gui_OutputFcn',  @PlagueTool_OutputFcn, ...
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


% --- Executes just before PlagueTool is made visible.
function PlagueTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PlagueTool (see VARARGIN)

% Choose default command line output for PlagueTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PlagueTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
cla
borders('countries','nomap');
axis off


% --- Outputs from this function are returned to the command line.
function varargout = PlagueTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in mapchoicePopUp.
function mapchoicePopUp_Callback(hObject, eventdata, handles)
% hObject    handle to mapchoicePopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mapchoicePopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mapchoicePopUp
if (handles.mapchoicePopUp.Value == 2) && strcmp(handles.percentStatic.String,'Simulation 100% complete.')
    export_fig(handles.popAxes,'ganggang');
    cla(handles.popAxes);
    cla(handles.popAxes,'reset');
    threedglobeF(handles);
elseif (handles.mapchoicePopUp.Value == 1) && strcmp(handles.percentStatic.String,'Simulation 100% complete.')
   handles.thetaSlider.Value = 0;
   cla(handles.popAxes);
   cla(handles.popAxes,'reset');
   axes(handles.popAxes);
   imshow('ganggang.png');
   axis off
end



% --- Executes during object creation, after setting all properties.
function mapchoicePopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mapchoicePopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in countryListBox.
function countryListBox_Callback(hObject, eventdata, handles)
% hObject    handle to countryListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns countryListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from countryListBox


% --- Executes during object creation, after setting all properties.
function countryListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to countryListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in goButton.
function goButton_Callback(hObject, eventdata, handles)
% hObject    handle to goButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.worldAxes);
%cla reset
axes(handles.popAxes)
cla(handles.popAxes);
cla(handles.popAxes,'reset');
borders('countries', 'nomap')
axis off
handles.mapchoicePopUp.Value = 1;
handles.thetaSlider.Value = 0;
runSimulationF(handles);


% --- Executes on slider movement.
function thetaSlider_Callback(hObject, eventdata, handles)
% hObject    handle to thetaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if handles.mapchoicePopUp.Value == 2
    cla(handles.popAxes);
    cla(handles.popAxes,'reset');
    threedglobeF(handles);
end

% --- Executes during object creation, after setting all properties.
function thetaSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thetaSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
