function [z] = saw(f,D)

Te=0.4;
Ts=10000;
t = 1/Ts:1/Ts:Te;

x1=sawtooth(2*pi*f*t,D); %D=0.5 for triangle wave

x2=zeros(size(t));
k=0;
l=1;
for i =1:10
    for j=1:Te*1000
        x2(l)= 1-k;
        l=l+1;
    end
    k = k+0.1;
end

%x2=1       % to turn off decay

z=x2.*x1;

end