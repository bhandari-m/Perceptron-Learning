C1 = [3,3; 3,0; 2,1; 0,2];
C2 = [-1,1; 0,0; -1,-1; 1,0];
m1 = mean(C1);
m2 = mean(C2);

sw1 = zeros(size(m1,2));

for i=1:size(C1,1)
   sw1 = sw1 + (C1(i,:)-m1)'*(C1(i,:)-m1) + (C2(i,:)-m2)'*(C2(i,:)-m2);
end

w1 = (inv(sw1))*(m1-m2)'; %for class 1 and class 2 

pro_a = min(C1*w1);
pro_b = max(C2*w1);
b1 = -1*((pro_a+pro_b)/2);

figure
plot(C1(:,1),C1(:,2),'+');
hold on 
plot(C2(:,1),C2(:,2),'*');
hold on

x1 = -4:0.1:4;
y1 = (-w1(1)*x1 -b1)/w1(2);
plot(x1,y1);

col_size = size(C1, 1); 
onecol = (ones(col_size,1));
C11 = [C1,onecol];
C22 = [C2,onecol];

A = [C11;C22];
Y = [1;1;1;1;-1;-1;-1;-1];

w2 = inv(A'*A)*A'*Y;

plot(C1(:,1),C1(:,2),'+');
hold on 
plot(C2(:,1),C2(:,2),'*');
hold on

x2 = -4:0.1:4;
y2 = (-w2(1)*x2 -w2(3))/w2(2);
hold on
plot(x2,y2);