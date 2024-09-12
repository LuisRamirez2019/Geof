load sismos.mat;
%Arreglo para representar cada componenete del sismograma
for i=1:3
    datos(:,i)=sismos(i).data;
    fechas(:,i)=sismos(i).matlabTimeVector;
    figure(1)
    subplot(3,1,i)
    plot(fechas(:,i),datos(:,i))
    datetick
    title(sismos(i).channel)
    axis tight
end

%trabajaremos con la componente vertical
datos1(:,1)=sismos(1).data;
fechas1(:,1)=sismos(1).matlabTimeVector;
figure()
plot(fechas1(:,1),datos1(:,1))
datetick
title('Sismos para componente vertical HHZ')
axis tight

%Media movil como filtro
datos2=datos1(:,1);
fechas2=fechas1(:,1);
ventana=61;
win=ones(ventana,1)/ventana; %normalizamos; sum(win)
c=0; %parte desde 0
for i=ventana:1:length(datos2)%se mueve desde la ventana, de uno en uno
    
    filtro(c+1)=sum(win.*datos2(i-ventana+1:i));%media movil 7-7+1:7
    c=c+1;
end
tiempo_filtro=fechas2(1+(ventana-1)/2:end-(ventana-1)/2);

figure()
hold on
plot(fechas2,datos2,'LineWidth',1.5)
plot(tiempo_filtro,filtro,'r','LineWidth',1.5)
datetick
hold off
grid on
axis tight
    
%ventana rectangular de 12 ventanas y 31 vwntanas
rw=rectwin(12); %para largo de ventana
rwn=rw/sum(rw);   %vector de pesos
f=filtfilt(rwn,1,datos2);  %filtro pasa bajo para ventana rectangular de 12

figure()
plot(fechas2,datos2)
hold on
plot(fechas2,f)

rw1=rectwin(31);  %para largo de ventana
rwn1=rw1/sum(rw1);   %vector de pesos
f1=filtfilt(rwn1,1,datos2);  %filtro pasa bajo para ventana rectangular de 31

figure()
plot(fechas2,datos2)
hold on
plot(fechas2,f1)

wvtool(rwn)
wvtool(rwn1)

%ventana triangular para 12 y 31 ventanas

tw=triang(12);
twn=tw/sum(tw);
filtfilt(twn,1,datos2);

tw=triang(12);
twn=tw/sum(tw);
filtfilt(twn,1,datos2);

%ventana para 12 y 31 ventanas

gw=gausswin(12);
gwn=gw/sum(gw);
filtfilt(gwn,1,datos2);

gw=gausswin(31);
gwn=gw/sum(gw);
filtfilt(gwn,1,datos2);











