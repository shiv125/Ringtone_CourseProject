
function [z]=  noise(f)

Te=0.4;
Ts=10000;
t = 1/Ts:1/Ts:Te;

T=round(Ts/(2*f));

n = round(Te*f);
x2=zeros(size(t));
k=1;
dec=1;

dec2=1-t/Te;        % linear decay

    for i = 1:n
       R1= random('unif',-1,1);
       R2= random('unif',-1,1);
       for j = 1:(T) 
           x2(k)=R1*dec;
           k= k+1;
       end
       for l =(T+1):(2*T)
           x2(k)=R2*dec;
           k=k+1;
       end
           dec = dec2(2*i*(T-1));
    end
    
z=0.75*x2(1:Te*Ts);
end