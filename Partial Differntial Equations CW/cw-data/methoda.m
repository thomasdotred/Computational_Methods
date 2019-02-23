% Toby Thomas, 2017
%function [t,n] = methoda(eps,max_iter,ROI,bdry)
tic;

%set convergence criteria
U = bdry;
Udiff = 1;
n = 0;

%Solve laplace's equation
while (n < max_iter)
    for i = 2:length(bdry)-1
        for j = 2:length(bdry)-1
            U_next = U;
            
            if ROI(i,j) == 1
                newVal = (U(i-1,j) + U(i,j-1) + U(i+1,j) + U(i,j+1)) / 4;
                U_next(i,j) = newVal;
                Udiff = abs(U_next(i,j) - U(i,j));
            end
            U = U_next;
        end
    end
    
    if Udiff < eps
        break;
    end
    n = n + 1;
end
t = toc;

%Visualise the solutions obtained by each method
figure;
imagesc(U)
t = toc;


%Give an output message(s) for both methods’ performance in terms of the number of iterations and the time taken

end
