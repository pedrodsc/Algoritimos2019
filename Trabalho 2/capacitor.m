close all

a= 2; %modulo da posição x no dipolo, posição y ou x no quadripolo, e posição x no caso do capacitor
b= 2.5; %posição y da primeira carga (de cima pra baixo) no caso do capacitor
c= 0.5; %espaço entre as cargas no caso do capacitor
d= 10; %valor da carga

k = 8.987E9; % Coulomb's constant

%Dipolo
%p = [-a,0;a,0];
%Q = [d,-d];

%Quadripolo
%p= [0,a;-a,0;0,-a;0,a;];
%Q= [d,d,-d,-d];

%Capacitor
p = [-a,b;-a,(b-c);-a,(b-2*c);-a,(b-3*c);-a,(b-4*c);-a,(b-5*c);-a,(b-6*c);-a,(b-7*c);-a,(b-8*c);-a,(b-9*c);a,b;a,(b-c);a,(b-2*c);a,(b-3*c);a,(b-4*c);a,(b-5*c);a,(b-6*c);a,(b-7*c);a,(b-8*c);a,(b-9*c);];
Q = [d,d,d,d,d,d,d,d,d,d,-d,-d,-d,-d,-d,-d,-d,-d,-d,-d];

[X,Y] = meshgrid(-5:0.05:5); % Create a grid of coordinates where V is to be calculated

V = zeros(size(X)); % Start with zero electric potential
for ii = 1:numel(Q) % Superpose the electric potential field of each charge
    V = V + k * Q(ii) ./ hypot(p(ii,1)-X, p(ii,2)-Y);
end

hContour = contourf(X,Y,V);
hColorbar = colorbar;
ylabel(hColorbar,'Electric potential (V)')

%hContour.LevelList = [0 quantile(V(:),10)];

[Ex,Ey] = gradient(V);
Ex = Ex.*-1;
Ey = Ey.*-1;
validColumns = all(isfinite(Ex) & isfinite(Ey)); % Ignore columns where E contains infinite values due to the point charges since streamslice can't handle them
hold on
hLines = streamslice(X(:,validColumns),Y(:,validColumns),Ex(:,validColumns),Ey(:,validColumns));
set(hLines,'Color','r');