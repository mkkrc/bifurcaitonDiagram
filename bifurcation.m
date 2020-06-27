clc
clear

%----------------------ÝNPUTS-----------------------------------

%r=2.9;
n=100;   %nufusun hesaplanacagi yil miktari
x0=0.5; %baþlangic nufusu
m=50000;    %r sayacý
%---------------------------------------------------------------
xn= size(n,m);  %her bir yilin ve oranin nufusunun tutulacagi matris
x=x0;  
years=(1:1:n);
rvec=size(m,1);

for j=1:m
   r=(j-1)/(m/4);
   rvec(j,1)=r;
   
   for i=1:n
      
       if i==1
         xn(i,j)=x0;
       else
         xn(i,j)=r*x*(1-x);
        end
       
       if xn(i,j)<0.00000001
         xn(i,j)=0;
       else
         x=xn(i,j);
       end
    
       if i<n-10
         xn(i,j)=0;
       else
         x=xn(i,j);
       end
   end   
end
plot(rvec,xn,'.')
