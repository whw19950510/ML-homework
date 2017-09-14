function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)%循环遍历epililion，找一个合适的F1值
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

evaluation=zeros(2,2);
predictions = (pval < epsilon);%如果小于成立返回1异常，否则返回0正常，m*1向量
for i=1:length(predictions)
    if(predictions(i,1)==1&&yval(i,1)==1)
        evaluation(1,1)=evaluation(1,1)+1;
    else if(predictions(i,1)==1&&yval(i,1)==0)
        evaluation(1,2)=evaluation(1,2)+1;
    else if(predictions(i,1)==0&&yval(i,1)==1)
        evaluation(2,1)=evaluation(2,1)+1;
    else if(predictions(i,1)==0&&yval(i,1)==0)
        evaluation(2,2)=evaluation(2,2)+1;
        end
        end
        end
    end
end
precision=evaluation(1,1)/(evaluation(1,1)+evaluation(1,2));
recall=evaluation(1,1)/(evaluation(1,1)+evaluation(2,1));
F1=2*precision*recall/(precision+recall);








    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
