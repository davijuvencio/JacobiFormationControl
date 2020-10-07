function xdot=formjacobi1(t,x)
fc=[0;-2*sin(t)];
rcdot=[1;2*cos(t)];

r1=[x(1);x(2)];
r2=[x(3);x(4)];
r3=[x(5);x(6)];
r4=[x(7);x(8)];
r1dot=[x(9);x(10)];
r2dot=[x(11);x(12)];
r3dot=[x(13);x(14)];
r4dot=[x(15);x(16)];

q1=(1/sqrt(2))*(r2-r1);
q2=(1/sqrt(2))*(r3-r4);
q3=(1/2)*(r4+r3-r2-r1);
q=[q1 q2 q3];

q1dot=(1/sqrt(2))*(r2dot-r1dot);
q2dot=(1/sqrt(2))*(r3dot-r4dot);
q3dot=(1/2)*(r4dot+r3dot-r2dot-r1dot);
qdot=[q1dot q2dot q3dot];

q1f=[sqrt(2)*2;0];
q2f=[0;-sqrt(2)*1];
q3f=[0;0];
qf=[q1f q2f q3f];

k2=1;
k3=3;
f=fc;
xq1dot=[];
xq2dot=[];
for j=1:3
    xq1=q(:,j);
    xq2=qdot(:,j);
    
    u=-k2*(xq1-qf(:,j))-k3*xq2;
    xq1dot=[xq1dot xq2];
    xq2dot=[xq2dot u]; 
    f=[f u];
end

si=[1/4 1/4 1/4 1/4;-1/sqrt(2) 1/sqrt(2) 0 0;0 0 1/sqrt(2) -1/sqrt(2);-1/2 -1/2 1/2 1/2]';
f=f*inv(si);
rdot=[rcdot xq1dot]*inv(si);

xr1dot=[];
xr2dot=[];
for i=1:4
    xr2=rdot(:,i);
    xr1dot=[xr1dot xr2];
    xr2dot=[xr2dot f(:,i)];
end
xdot=[];
for cnt1=1:4
    xdot=[xdot;xr1dot(:,cnt1)];
end
for cnt2=1:4
    xdot=[xdot;xr2dot(:,cnt2)];
end