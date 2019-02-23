% Toby Thomas, 2017
%% main
clear; close all;
%%load
data_set = input('which data set, 1), 2),3)?');
switch data_set
    case 1
        ROI = load('ROI_1.txt');
        bdry = load('bdry_Values_1.txt');
    case 2
        ROI = load('ROI_2.txt');
        bdry = load('bdry_Values_2.txt');
    case 3 
        %alert the user that this data dile is larger than 1 and 2
        warning ('the data set for 3 is larger than 1 and 2 and will take more time to compute.')
        cont = input('Contunue? [1]for yes/[0] for no?');
        if cont == 0
            error('you chose to about the program');  
        end
       [ROI,bdry] = ROI_3_gen();
        
end
%% ask user for convergence criteria
max_iter = input('Enter maximum number of iterations = ');
eps = input ('Enter epsilon = ');

%% select method

method = input('enter method [a] or [b]','s');
switch method
    case 'a'
        [t,n] = methoda(eps,max_iter,ROI,bdry);
        
    case 'b'
        [t,n] = methodb(eps,max_iter,ROI,bdry);
end
%% report performance
fprintf('time taken was %.2f seconds\n', t);
fprintf('number of iterations was %d\n', n);