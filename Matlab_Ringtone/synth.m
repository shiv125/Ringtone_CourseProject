function y=synth(name)
name=name(name~=' ');
name=lower(name);
%make length of string multiple of 3
name=double(name)-96;%ascii values
Z=zeros(1,4000);
rem=mod(length(name),3);
if (rem==2)
    name=[name,name(1)];
elseif (rem==1)
    name=[name,name(1),name(1)];
end
%tone_generator(name);

load('mat_map');

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



channel_1=zeros(length(name),4);
channel_2=zeros(length(name),4);
channel_3=zeros(length(name),4);
for i=1:length(name)
    rem=mod(i,3);
    if (rem==1)
        channel_1(i,:)=mapping(name(i),:);
    elseif (rem==2)
        temp=random_saw(name(i));
        channel_2(i,temp)=1;
    else
        temp=random_saw(name(i));
        channel_3(i,temp)=1;
    end
end
out_waveform=[];
i=1;
while i<length(name)
    current_wave=0;
    temp=[];
    maps1=channel_1(i,:);
    for j=1:4
        if maps1(j)==-1
            temp=[temp, Z];
        else
            temp=[temp, sq(maps1(j),50)];
        end
    end
    i=i+1;
    maps2=channel_2(i,:);
    temp1=[];

    for j=1:4
        if maps2(j)==1
            temp1=[temp1, saw(freq(mod(name(i),10)+1),1)];
        else
            temp1=[temp1, Z];
        end
    end
    i=i+1;
    temp2=[];
    maps3=channel_3(i,:);
    for j=1:4
        if maps3(j)==1
            temp2=[temp2, noise(freq(mod(name(i),10)+1))];
        else
            temp2=[temp2, Z];
        end
    end 
    i=i+1;
    current_wave=temp+temp1+temp2;
    out_waveform=[out_waveform,current_wave];
end
iteration=0;
res=[];

while (iteration<12)
    iteration=iteration+1;
    res=[res,out_waveform];
end

y=res;
end