
function Centers=SDAL(data,k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shattering Distribution for Active Learning. Xiaofeng~Cao and Ivor W.~Tsang.  

%Email:xiaofeng.cao.uts@gmail.com

%The shattering step.

% radius is set as 0.15

% 1+varepsilon, varepsilon=.02

% Users can adjust the parameters to adapt different datasets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[Id,Cen]=kmeans(data,k);

Center=Cen;

 Radi=0.25;T=0;
 [L,R]=size(data);
 f=0;

 
 f=NumberDensity(data,Center,Radi);

 while T<50
   
     for j=1:1:k
         Ball=[];
         for i=1:1:L     
                    dist(i)=norm(data(i,:)-Center(j,:));
                if dist(i)<Radi
                       Ball=[Ball;data(i,:)];
                end
         end
          if length(Ball)==0
              
              Center(j,:)=Center(j,:);
          else
              
         Center(j,:)=mean(Ball,1);
          
          end
         
        
         
     end
     
     F=NumberDensity(data,Center,Radi);
  
     
     if F-f==0 ||length(find(pdist(Center)<2*Radi))>0 % convergence condition
        break;
         
     else
         f=F;
     end
      
     T=T+1;
     Radi=(1+0.1)*Radi;
 end
 
 plot(data(:,1),data(:,2),'b.')

 hold on
 plot(Center(:,1),Center(:,2),'rs')
 hold on
plot(Cen(:,1),Cen(:,2),'g*')
hold on
for j=1:1:k
    viscircles(Center(j,:),Radi)
end


Idx = knnsearch(data,Center);
Center=data(Idx,:);
