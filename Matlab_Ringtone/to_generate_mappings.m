%Function to create mappings

Ts=10000;
%f = [130.81 138.59	146.83	155.56	164.81	174.61	185.00 196.00	207.65 220 233.08 246.94  261.63 277.18  293.66 311.13 329.63 349.23 369.99 392 415.3 440 466.16 493.88];

c5=525.25;
a4=440;
g4=392;
e4=329.63;
d4=293.66;
c4=261.63;
a3=220;
g3=196;
e3=164.81;
d3=146.83;
c3=130.81;

freq=[c5 a4 g4 e4 d4 c4 a3 g3 e3 d3 c3];


mapping=zeros(26,4);
for i=1:26
    for j=1:4
        temp=randi([1 11], 1);
        mapping(i,j)=freq(temp);
    end
end

%for Z
for i=1:26
    j=randi([1 4],1);
    mapping(i,j)=-1;
end
random_saw=zeros(1,26);
for i=1:26
    temp=randi([1 4], 1);
    random_saw(i)=temp;
end
save('mat_map','mapping','random_saw');