% LAB 3: 3.1
%checking network to be able to store 3 patterns

%memory patterns:
x1 = [-1 -1 1 -1 1 -1 -1 1];
x2 = [-1 -1 -1 -1 -1 1 -1 -1];
x3 = [-1 1 1 -1 -1 1 -1 1];
%mu = number of patterns
[mux, mu] = size(x1);
un = 8; %number of units
P = mux; %number of patterns
X_comb = [x1; x2; x3]; %combine all the inputs
W_outer = X_comb' * X_comb; %getting the outer W
[s1,s2] = size(X_comb);
W_Outer = sign(W_outer); %because we have "3" i use sign to make it 1 and -1
w = [];
%weight update:
% for i
    

%   for i = 1 : s1
%       for j = 1:s2
%           w = (
%       end
%            
%   end
  