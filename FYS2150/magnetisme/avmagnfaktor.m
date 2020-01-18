% prelab magnetisme
% skal lage en funksjon som beregner D_paralell og
% D_ortogonal
%f = a_par/a_ort

%{
function val = D_par(f);
    if f > 1;
        val = 1/(1-f^2)*(1-f/(sqrt(f^2-1))*log(f+sqrt((f^2)-1)));
    elseif f == 1;
        val = 1/3;
    elseif 0 < f < 1;
        val = 1/(1-f^2)*(1 - f/sqrt(1-f^2)*arccos(f));
    end
end
%}

function [val] = D_par(f)
    if f > 1; 
        val = 1/(1-f^2)*(1-f/(sqrt(f^2-1))*log(f+sqrt((f^2)-1)));
    elseif f == 1
        val = 1/3; 
    elseif 0 < f && f < 1 
        val = 1/(1-f^2)*(1 - f/sqrt(1-f^2)*acos(f));
    end
end

function [val] = D_orto(f)
Dp = D_par(f);
val = (1- Dp)/2;
end
