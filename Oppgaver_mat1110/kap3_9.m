% Plot av parametrisering fra r2 -> r3
% r(u,v) = uv^2 i + u j + sin(uv) k;  -1 til 1 for u, 0 til 3 for v

u = linspace(-1,1,1000);
v = linspace(0,3,1000);
[U,V] = meshgrid(u,v);
i = U.*V^2;
j = U;
k = sin(U.*V);
surf(i,j,k);
% axis('equal')