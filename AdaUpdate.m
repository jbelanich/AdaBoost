function [w_next, err, hyp, distanceFromBound, difference_val] = AdaUpdate(w, M)

error_vect = M * w;

[s_error_vect,s_idx] = sort(error_vect);

err = s_error_vect(1);
hyp = s_idx(1);

for i = 2:length(s_error_vect)
    %calcaulate the error where they differ
    second_error = s_error_vect(i);
    second_hyp = s_idx(i);
    
    difference_val = 0;
    for j = 1:length(M(hyp,:))
        if((M(hyp,j)==0) && (M(second_hyp,j)==1))
            difference_val = difference_val + w(j);
        end
    end
    
    if(difference_val >= 10^-9)
        break;
    end
end

%     second_error = s_error_vect(2);
%     second_hyp = s_idx(2);
%     
%     difference_val = 0;
%     for j = 1:length(M(hyp,:))
%         if((M(hyp,j) ~= M(second_hyp,j)))
%             difference_val = difference_val + w(j);
%         end
%     end

distanceFromBound = (second_error - err);

w_next(logical(M(hyp, :))) = w(logical(M(hyp, :))) .* (1/err) .* (1/2);
w_next(~logical(M(hyp, :))) = w(~logical(M(hyp, :))) .* (1/(1-err)) .* (1/2);
w_next = w_next ./ sum(w_next);
w_next = w_next';

end