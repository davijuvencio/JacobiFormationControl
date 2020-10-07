clc;
t0 = 0; tf = 15;
x0=[-10,10,10,-10,10,10,-10,-10,0,0,0,0,0,0,0,0];
hold on;

%[t,x] = ode23(@formjacobi,[t0,tf],x0);
%[t,x] = ode23(@formjacobi1,[t0,tf],x0);
%[t,x] = ode23(@formjacobi3,[t0,tf],x0);
[t,x] = ode23(@formjacobi2,[t0,tf],x0);
for i=1:length(t)
    plot(x(i,1),x(i,2),'ro')
    plot(x(i,3),x(i,4),'go')
    plot(x(i,5),x(i,6),'bo')
    plot(x(i,7),x(i,8),'ko')
    pause(.1)
end
