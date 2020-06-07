function f=NumberDensity(data,Center,Radius)
f=0;
for i=1:1:length(data)
     Ball_dist=[];dist=[];
     for j=1:1:length(Center)
      dist(j)=norm(data(i,:)-Center(j,:));
      if dist(j)<Radius
          Ball_dist=[Ball_dist;dist(j)];
      end
     end
     f=f+sum(exp(Ball_dist/1.8).^2)/(length(Ball_dist)+1);
     
 end