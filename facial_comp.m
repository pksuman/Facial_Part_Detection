 function varargout = facial_comp(varargin)
% FACIAL_COMP MATLAB code for facial_comp.fig
%      FACIAL_COMP, by itself, creates a new FACIAL_COMP or raises the existing
%      singleton*.
%
%      H = FACIAL_COMP returns the handle to a new FACIAL_COMP or the handle to
%      the existing singleton*.
%
%      FACIAL_COMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACIAL_COMP.M with the given input arguments.
%
%      FACIAL_COMP('Property','Value',...) creates a new FACIAL_COMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before facial_comp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to facial_comp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help facial_comp

% Last Modified by GUIDE v2.5 20-Apr-2015 13:40:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @facial_comp_OpeningFcn, ...
                   'gui_OutputFcn',  @facial_comp_OutputFcn, ...
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




% --- Executes just before facial_comp is made visible.
function facial_comp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to facial_comp (see VARARGIN)

% Choose default command line output for facial_comp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes facial_comp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = facial_comp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






% --- Executes on button press in Load_image.
function Load_image_Callback(hObject, eventdata, handles)
% hObject    handle to Load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
set(gca,'YTick',NaN);
set(gca,'XTick',NaN);
[File_Name, Path_Name] = uigetfile('*.jpg;*.png;*.jpeg;*.BMP;*.tiff');
im=imread([Path_Name,File_Name]);
handles.pic=im;
guidata(hObject,handles);
axes(handles.axes1);
imshow(im);









    


% --- Executes on button press in Eye.
function Eye_Callback(hObject, eventdata, handles)
% hObject    handle to Eye (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%To detect Eyes
im =getimage(gca);
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB=step(EyeDetect,im);
hold on
rectangle('Position',BB,'LineWidth',2,'LineStyle','-','EdgeColor','b');



















% --- Executes on button press in Face.
function Face_Callback(hObject, eventdata, handles)

% hObject    handle to Face (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im =getimage(gca);
faceDetector = vision.CascadeObjectDetector; 		
I = getimage(gca); %Read face
bboxes = step(faceDetector, I);%Detect faces
% IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');  %Annotate face 
rectangle('Position',bboxes,'LineWidth',2,'LineStyle','-','EdgeColor','y');

axes(handles.axes1);


% --- Executes on button press in Nose.
function Nose_Callback(hObject, eventdata, handles)
% hObject    handle to Nose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im =getimage(gca);
NoseDetect = vision.CascadeObjectDetector('Nose');
BB=step(NoseDetect,im);
rectangle('Position',BB,'LineWidth',2,'LineStyle','-','EdgeColor','g');



% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)










% --- Executes during object creation, after setting all properties.
function Load_image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Load_image.
function Load_image_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
[File_Name, Path_Name] = uiputfile('*.jpg;*.png;*.jpeg;*.BMP;*.tiff');
Name=fullfile(Path_Name,File_Name);
im=getimage(gcf);
imwrite(im,Name,'bmp'); 


% --------------------------------------------------------------------
function View_Help_Callback(hObject, eventdata, handles)
% hObject    handle to View_Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox('This software uses voila-jones algorithm. In case of false detection of mouth,try increasing Threshold if too many features are detected.Decrease threshold if none are detected');

% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox('Developed by students of RCCIIT ');




% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pos=get(hObject,'Value');
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on button press in Mouth.
function Mouth_Callback(hObject, eventdata, handles)
% hObject    handle to Mouth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%To detect Mouth
im=getimage(gcf);
handles.mpic=im;
guidata(hObject,handles);
k=handles.pos;
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',k);
BB=step(MouthDetect,im);
hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','r');

end


% --- Executes on button press in Remove.
function Remove_Callback(hObject, eventdata, handles)
% hObject    handle to Remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla; 
cla reset;;
% set(handles.im,'reset');
set(gca,'YTick',NaN);
set(gca,'XTick',NaN);

% set(gca,'Xtick',NaN,'Ytick',NaN);
clear all;
clear guidata;
refresh;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(hObject,'String'));
handles.pos=a;
guidata(hObject,handles)
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


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=handles.pic;
guidata(hObject,handles);

imshow(im);
