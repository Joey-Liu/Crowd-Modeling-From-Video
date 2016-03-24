function [nv] = faNorm(vec, delta)
%This function will normalize the input vector vec,so that the length of
%vec is equal to sqrt(2) * delta
if(0 == norm(vec))
    nv = zeros(size(vec));
else
    nv = vec / norm(vec) * sqrt(2) * delta;
end
end

