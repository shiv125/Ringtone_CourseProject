function [z] = sq(f,D)

Te=0.4;
Ts=10000;
t = 1/Ts:1/Ts:Te;

x1=square(2*pi*f*t,D);




dec3=1-t/(Te);        % linear decay


% x2=1       % to turn off decay

z=[0.25*x1(1:0.3*Ts) x1(0.3*Ts+1:Ts*Te).*dec3(0.3*Ts+1:Ts*Te)];


end

