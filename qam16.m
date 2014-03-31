
%%%%---------------16 QAM Konstelacja kwadratowa---------------------------
msg_length =64; %d³ugoœæ wiadomoœci
data=randi(0:1,1,msg_length); % generowanie bitów
len=length(data);

%%%--------------------konwerter pocz¹tek----------------------------------
k=1;
for i=1:4:len
    if (data(i:i+3)==[1 0 1 1])
        I(k)=-3;
        Q(k)=3;
        k=k+1;
    elseif (data(i:i+3)==[1 0 1 0])
        I(k)=-3;
        Q(k)=1;
        k=k+1;
    elseif (data(i:i+3)==[1 1 0 1])
        I(k)=-3;
        Q(k)=-1;
        k=k+1;
    elseif (data(i:i+3)==[1 1 1 1])
        I(k)=-3;
        Q(k)=-3;
        k=k+1;
    elseif (data(i:i+3)==[1 0 0 1])
        I(k)=-1;
        Q(k)=3;
        k=k+1;
    elseif (data(i:i+3)==[1 0 0 0])
        I(k)=-1;
        Q(k)=1;
        k=k+1;
    elseif (data(i:i+3)==[1 1 0 0])
        I(k)=-1;
        Q(k)=-1;
        k=k+1;
    elseif (data(i:i+3)==[1 1 1 0])
        I(k)=-1;
        Q(k)=-3;
        k=k+1;
    elseif (data(i:i+3)==[0 0 1 0])
        I(k)=1;
        Q(k)=3;
        k=k+1;
    elseif (data(i:i+3)==[0 0 0 0])
        I(k)=1;
        Q(k)=1;
        k=k+1;
    elseif (data(i:i+3)==[0 1 0 0])
        I(k)=1;
        Q(k)=-1;
        k=k+1;
    elseif (data(i:i+3)==[0 1 0 1])
        I(k)=1;
        Q(k)=-3;
        k=k+1;
    elseif (data(i:i+3)==[0 0 1 1])
        I(k)=3;
        Q(k)=3;
        k=k+1;
    elseif (data(i:i+3)==[0 0 0 1])
        I(k)=3;
        Q(k)=1;
        k=k+1;
    elseif (data(i:i+3)==[0 1 1 0])
        I(k)=3;
        Q(k)=-1;
        k=k+1;
    elseif (data(i:i+3)==[0 1 1 1])
        I(k)=3;
        Q(k)=-3;
        k=k+1;
    end
end
%%%--------------------------konwerter koniec------------------------------


