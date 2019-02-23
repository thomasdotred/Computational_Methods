% Toby Thomas, 2017
function [t,n] = methodb (eps,max_iter,ROI,bdry)
tic;

%set convergence criteria
U = bdry;
Udiff = 1;
n = 0;

%Use the same method as before, only this time we will be skipping every
%other pixel, then repeating with the ones mussed out.

while (n < max_iter)
    %first loop over every other i
    for i = 2:2:length(bdry)-1
        % % loop over every other j
        for j = 2:2:length(bdry)-1
            if ROI(i,j) == 1
                U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1)) /4; 
                Udiff = abs(U(i,j) - U(i,j-1));
            end           
        end
        % %loop over the rest of the js
        for j = 3:2:length(bdry)-1
            if ROI(i,j) == 1   
                U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1)) /4; 
                Udiff = abs(U(i,j) - U(i,j-1));
            end
        end
    end
    %loop over the rest of the is
    for i = 3:2:length(bdry)-1
        % %loop over every other j for new is
        for j = 2:2:length(bdry)-1
            if ROI(i,j) == 1
                U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1)) /4; 
                Udiff = abs(U(i,j) - U(i,j-1));
            end           
        end
        % %loop over rest of the js for the new is
        for j = 3:2:length(bdry)-1
            if ROI(i,j) == 1
                U(i,j) = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1)) /4; 
                Udiff = abs(U(i,j) - U(i,j-1));
            end
        end
    end

    %
    n = n+1;
    imagesc(U)
end
t = toc;
%visualise
figure;
imagesc(U)
end
