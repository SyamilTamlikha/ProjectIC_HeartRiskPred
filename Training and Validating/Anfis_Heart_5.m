% Clear all variables and figures.

clear all;

  data1 = load('Sorted_data.txt');
  data = [data1(:,1),data1(:,2), data1(:,3), data1(:,4), data1(:,5)];
  Risk = data1(:,6);
 %%
% Plot data.
  plot([1:1000],data,'x');
  %%
% Calculate PC's.
 myCov = cov(data);
 [pc, latent, explained] = pcacov(myCov);
 
 % rotate the data to the principal values
 finalData = data*pc(:,1:5);
 
% Plot data.
  figure;
  plot([1:1000], finalData(:,1), 'b*', [1:1000], finalData(:,2), 'ro',[1:1000], finalData(:,3), 'gx', [1:1000], finalData(:,4), 'yo', [1:1000], finalData(:,5), 'cyo');
  xlabel('Index');
  ylabel('Value');
  title('Reduced Data');
  h = legend('Ch','BP', 'HR','ST','BMI');

% Tidy up.
  %%close all;

  