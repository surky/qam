clear all
close all
numberOfBits = 64;
x = rand(1, numberOfBits);
x( x < 0.5 ) = 0;
x( x >= 0.5 ) = 1;


% Mapa 16QAM pierscieniowa
% promienie pierscieni
r1 = 1;
r2 = 2;
mappingTable(1) = r1 * exp(1i* 0);
mappingTable(2) = r1 * exp(1i* pi/4);
mappingTable(3) = r1 * exp(1i* 3*pi/4);
mappingTable(4) = r1 * exp(1i* pi/2);
mappingTable(5) = r1 * exp(1i* 7*pi/4);
mappingTable(6) = r1 * exp(1i* 3*pi/2);
mappingTable(7) = r1 * exp(1i* pi);
mappingTable(8) = r1 * exp(1i* 5*pi/4);
mappingTable(9:16) = mappingTable(1:8) ./ r1 .* r2;

% Mapa 16QAM kwadratowa
mappingTable_16type3(1)  =   1 + 1*j;
mappingTable_16type3(2)  =   3 + 1*j;
mappingTable_16type3(3)  =   1 + 3*j;
mappingTable_16type3(4)  =   3 + 3*j;     
mappingTable_16type3(5)  =   1 + (-1)*j;
mappingTable_16type3(6)  =   1 + (-3)*j; 
mappingTable_16type3(7)  =   3 + (-1)*j; 
mappingTable_16type3(8)  =   3 + (-3)*j;
mappingTable_16type3(9)  =  -1 + 1*j;
mappingTable_16type3(10) =  -1 + 3*j;
mappingTable_16type3(11) =  -3 + 1*j;
mappingTable_16type3(12) =  -3 + (3)*j;
mappingTable_16type3(13) =  -1 + (-1)*j;
mappingTable_16type3(14) =  -3 + (-1)*j;
mappingTable_16type3(15) =  -1 + (-3)*j;
mappingTable_16type3(16) =  -3 + (-3)*j;

if mod(numberOfBits, 4) ~= 0
    error('numberOfBits must be a multiple of 4.');
end
mappedSymbols = zeros(1, numberOfBits / 4);

% Map bits to symbols
for i = 1:4:length(x)

    symbolBits = x(i:i+3);

    symbolIndex = 2^3 * symbolBits(1) + 2^2 * symbolBits(2) + 2^1 * symbolBits(3) + 2^0 * symbolBits(4);

    % Mapping
    mappedSymbols((i - 1)/4 + 1) = mappingTable_16type3( symbolIndex + 1);
    
end

symbol=ones(1,400);
s=[];
for j= 1:1:length(mappedSymbols)
   
    s=[s symbol*mappedSymbols(j)];
    
end

t = 0:2*pi/100:2*pi*length(x)-2*pi/100;
sygnal = real(s).*cos(t)-imag(s).*sin(t);
figure(1)
plot(sygnal);
Vnx=sygnal.*cos(t);
Vny=sygnal.*-1.*sin(t);
figure(2)
plot(Vnx)
figure(3)
plot(Vny)
