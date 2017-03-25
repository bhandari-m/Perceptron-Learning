C2 = [-1,1; 0,0; -1,-1; 1,0];
C3 = [3,3; 3,0; 2,1; 0,1.5];
m2 = mean(C2);
m3 = mean(C3);
Y = [1;1;1;1;-1;-1;-1;-1];
sw2 = zeros(size(m3,2));

for i=1:size(C2,1)
 
   sw2 = sw2 + (C3(i,:)-m3)'*(C3(i,:)-m3) + (C2(i,:)-m2)'*(C2(i,:)-m2);
end
w2 = (inv(sw2))*(m2-m3)'; %for class 2 and class 3

pro_c = max(C3*w2);
pro_d = min(C2*w2);
b2 = -1*((pro_c+pro_d)/2);

figure
plot(C3(:,1),C3(:,2),'+');
hold on 
plot(C2(:,1),C2(:,2),'*');
hold on

x2 = -4:0.1:4;
y2 = (-w2(1)*x2 -b2)/w2(2);
plot(x2,y2);

col_size = size(C2, 1); 
onecol = (ones(col_size,1));
C22 = [C2,onecol];
C33 = [C3,onecol];

B = [C33;C22];
w_new = inv(B'*B)*B'*Y;

plot(C3(:,1),C3(:,2),'+');
hold on 
plot(C2(:,1),C2(:,2),'*');
hold on

x = -4:0.1:4;
y = (-w_new(1)*x -w_new(3))/w_new(2);
plot(x,y);