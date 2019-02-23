% Toby Thomas, 2017
function [data,data2] = ROI_3_gen()

close all;
clear;
%initalise data and data2
data = zeros (70);
data2 = zeros(70);

clear;

% create ROI
for x = 2:49
    for y = 2:49
        val = (x-50)*(y-50);
        
        if val > 300
            data (x,y) = 1;
        end
    end
end
%create continuous boundary values
i = 50000000;
for x = 2:49
    for y = 2:49
        val = (x-50)*(y-50);

        if (val <310 && val > 260)
            data2 (x,y) = i;
            i = i+1;
        end
    end
end

%save to .txt files
save('ROI_3.txt', 'data');
save('bdry_Values_3.txt','data2')

%visualise
subplot(1,2,1)
imagesc(data)
subplot(1,2,2)
imagesc(data2)
end
