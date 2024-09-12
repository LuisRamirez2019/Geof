function [cm,P_cm,tm,tmf]=CorreMovil(X,Y,t,m)  
% vectores x,y, tiempo t, ventana m
tmf=t(m:end,1); %tiempo localizado al final de la gráfica.
cm=zeros(length(X)-m,1); % vector para llenar con datos de cm
tm=zeros(length(X)-m,1); % vector tiempo centrado en la gráfica 
P_cm=zeros(length(X)-m,1); % vector para el pval de rho
for i=0:length(X)-m % dado que se pierden datos, el ciclo comienza desde 0
     [cm(i+1,1),P_cm(i+1,1)]=corr(X(i+1:m+i,1),Y(i+1:m+i,1),...
         'Type','Pearson','rows','complete'); % Correlación movil
     tm(i+1,1)=mean(t1(i+1:m+i,1),'omitnan'); % Tiempo móvil centrado
end   
end