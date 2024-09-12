function [cm]=xcormovil(x,y,paso,w,t)
c=0; 
for i=w:paso:length(x) 
mm(c+1)=cr(x(i-w+1:i),y(i-w+1:i),t); 
d_m(c+1)=desfasemaximo(x(i-w+1:i),y(i-w+1:i),t);
c=c+1
end
cm=mm'
end