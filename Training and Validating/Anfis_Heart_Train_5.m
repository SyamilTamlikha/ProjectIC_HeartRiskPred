% Author: Group 1
% Heart Attack Risk Prediction 

% load finalData
% 1. Cholesterol                   1 - 10
% 2. Blood Pressure                1 - 10
% 3. Heart rate                    1 - 10
% 4. Stress level                  1 - 10
% 5. BMI                           1 - 10

%clear all;

data = load(['finalData_sorted_2.txt']); 
Heart_risk = load('Risk_sorted.txt');

% Normalize the data using Z score
 normdata = zscore(data);

data = [data Heart_risk];
% create training and checking data


% equal distribution of data
d1=data(1:400, :);
d2=data(667:833, :);
trnData = [d1; d2];

d5=data(401:534, :);
d6=data(834:917, :);
testData = [d5;d6];

d3=data(535:666, :);
d4=data(917:1000, :);
chkData = [d3;d4];

MaxDim = 5;

clear d1;
clear d2;
clear d3;
clear d4;
clear d5;
clear d6;

% To start the training, we need an FIS structure that specifies the
% structure and initial parameters of the FIS for learning. This is the task of genfis1.
MyFIS5Dim = genfis1(trnData, 3, 'gaussmf');

MyFIS5Dim.input(1,1).name = 'Cholesterol';
    MyFIS5Dim.input(1,1).mf(1,1).name = 'Low';
    MyFIS5Dim.input(1,1).mf(1,2).name = 'Medium';
    MyFIS5Dim.input(1,1).mf(1,3).name = 'High';
   
    
MyFIS5Dim.input(1,2).name = 'Blood Pressure';
    MyFIS5Dim.input(1,2).mf(1,1).name = 'Low';
    MyFIS5Dim.input(1,2).mf(1,2).name = 'Medium';
    MyFIS5Dim.input(1,2).mf(1,3).name = 'High';

    
MyFIS5Dim.input(1,3).name = 'Heart rate';
    MyFIS5Dim.input(1,3).mf(1,1).name = 'Low';
    MyFIS5Dim.input(1,3).mf(1,2).name = 'Normal';
    MyFIS5Dim.input(1,3).mf(1,3).name = 'High';
  
 %%   
MyFIS5Dim.input(1,5).name = 'Stress level';
    MyFIS5Dim.input(1,5).mf(1,1).name = 'Not Stressed';
    MyFIS5Dim.input(1,5).mf(1,2).name = 'Intermediate';
    MyFIS5Dim.input(1,5).mf(1,3).name = 'Stressed';

  %%  
MyFIS5Dim.input(1,4).name = 'BMI';
    MyFIS5Dim.input(1,4).mf(1,1).name = 'Underweight';
    MyFIS5Dim.input(1,4).mf(1,2).name = 'Normal';
    MyFIS5Dim.input(1,4).mf(1,3).name = 'Overweight';


% The range of the membership functions
for t=1:MaxDim, 
    MyFIS5Dim.input(1,t).range = [min(data(:, t)) , max(data(:, t))];
end

%We set the training options in the vector 
%   TRNOPT(1): training epoch number :100                    
%   TRNOPT(2): training error goal : 0                      
%   TRNOPT(3): initial step size : 0.01                        
%   TRNOPT(4): step size decrease rate : 0.9                   
%   TRNOPT(5): step size increase rate : 1.1      

k = [300 0 0.01 0.9 1.1];
[MyFIS5Dim1,error1,ss,MyFIS5Dim2,error2] = anfis(trnData,MyFIS5Dim,k,[],chkData);
%%
x = [1:300];
plot(x,error1,'.b',x,error2,'*r')
%%
writeFIS(MyFIS5Dim2, 'MyFIS5Dim2_300ep.fis');
