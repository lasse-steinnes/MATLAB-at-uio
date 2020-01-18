function [Dp, Dr] = D(f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if f > 1
    Dp = (1/(1-f^2)) * (1 - (f/sqrt(f^2-1)) * log(f + sqrt(f^2 - 1)));
elseif f == 1
    Dp = 1/3;
elseif 0 < f && f < 1
    Dp = (1/(1-f^2)) * (1 - (f/sqrt(1-f^2)) * acos(f));
end

Dr = (1 - Dp)/2;

