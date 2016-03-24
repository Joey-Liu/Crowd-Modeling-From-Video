function [distance] = gridDistance(j, u, k, v, delta)
distance = sqrt(((j - u) * delta)^2 + ((k - v) * delta)^2)
end

