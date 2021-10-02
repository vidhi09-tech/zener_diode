clc;
clear all;
close all;
t = 0:0.001:4;
a1 = 1;
a2 = 0.3; //variable 1


x1 = cos(pi*t);
x2 = cos(pi*t);

nx = (a1*x1 + a2*x2);
for i = 1:length(t)
    if nx(i) > 0.5;
        lhs(i) =  0.5;
    elseif nx(i) <= -0.5;
        lhs(i) = -0.5;
    else lhs(i) = nx(i);
    end
end

vs_t1 = a1*x1;
for i = 1:length(t)
    if vs_t1(i) > 0.5;
        y1(i) =  0.5;
    elseif vs_t1(i) <= -0.5;
        y1(i) = -0.5;
    else y1(i) = vs_t1(i);
    end
end

vs_t2 = a2*x2;
for i = 1:length(t)
    if vs_t2(i) > 0.5;
        y2(i) =  0.5;
    elseif vs_t2(i) <= -0.5;
        y2(i) = -0.5;
    else y2(i) = vs_t2(i);
    end
end

rhs = y1+y2;
if(lhs == rhs)
    disp(' SYSTEM IS LINEAR');
else
    disp('SYSYTEM IS NOT LINEAR');
end

figure(1)
subplot(511)
plot(t,x1)
title('x1(t)')
subplot(512)
plot(t,y1)
title('y1(t)')
subplot(513)
plot(t, x2)
title('x2(t)')
subplot(514)
plot(t,y2)
title('y2(t)')
subplot(515)
plot(t, nx)
title('a1*x1 + a2*x2')

figure(2)
subplot(211)
plot(t,lhs)
title('lhs')
subplot(212)
plot(t,rhs)
title('rhs')


v1=cos(pi*t);
for i=1:length(t-1)
    if v1(i)>0.5;
        t1(i)=0.5;
    elseif v1(i)<=-0.5;
        t1(i)=-0.5;
    else t1(i)=v1(i);
    end
end
 for k = 1:length(t)
     if t(k) > 1
      a(k)=1;
     else
      a(k) = 0;
     end
 end
 
 
q1=a.*t1;
v2=cos(pi*(t-1));
for i=1:length(t)
    if v2(i)>0.5;
        t2(i)=0.5;
    elseif v2(i)<=-0.5;
        t2(i)=-0.5;
    else t2(i)=v2(i);
    end
end
 
if(q1==t2)
    disp('It is a Time-Invariant Systeem')
else 
    disp('It is a Time-variant Systeem')

end
figure(3)

subplot(411)
plot(t,v1);
title('V1 cos(pi*t)');
subplot(412)
plot(t,v2);
title('V2 cos(pi*(t-1)) delayed by 1 unit');
subplot(413)
plot(t,q1);
title('Q1 passed through system then delayed SIGNAL');
subplot(414)
plot(t,t2);
title('T2 FIRST DELAYED THEN PASSED');
