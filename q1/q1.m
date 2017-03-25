w = [0;0];
b = 0;
C1 = [0.1,1.1; 6.8,7.1; -3.5,-4.1; 2.0,2.7; 4.1,2.8; 3.1,5.0; -0.8,-1.3; 0.9,1.2; 5.0,6.4; 3.9,4.0];
C2 = [7.1,4.2; -1.4,-4.3; 4.5,0.0; 6.3,1.6; 4.2,1.9; 1.4,-3.2; 2.4,-4.0; 2.5,-6.1; 8.4,3.7; 4.1,-2.2];
C3 = [-3.0,-2.9; 0.5,8.7; 2.9,2.1; -0.1,5.2; -4.0,2.2; -1.3,3.7; -3.4,6.2; -4.1,3.4; -5.1,1.6; 1.9,5.1];

%% part one of the question
%Two class perceptron. Therefore, y1=1 (for c1) & y2=-1 (for c2)
w = [w;b];
col_size = size(C1, 1); 
onecol = (ones(col_size,1));
C11 = [C1,onecol];
C22 = [C2,onecol];
C22= -C22;
C33 = [C3,onecol];

points = [C11;C22];
count = 0;
iter=0;

while (1)
    iter=iter+1;
    for i = 1:size(points,1)
        if w'*points(i,:)' <=0
            w = w + points(i,:)';
            count = count+1;
        end
    end
    if count == 0;
        break;
    else
        count=0;
    end
end
iter = iter-1;
figure
plot(C1(:,1),C1(:,2),'*');
hold on 
plot(C2(:,1),C2(:,2),'+');
hold on

x = -10:0.1:10;
y = (-w(1)*x -w(3))/w(2);
plot(x,y);
hold on

%% part two of the question 
% Two class perceptron. Therefore, y1=1 (for c3) & y2=-1 (for c2)
w2 = [0;0];
b2 = 0;
w2 = [w2;b2];
points_2 = [C22;C33];
count_2 = 0;
iter_2 =0;

while (1)
    iter_2=iter_2+1;
    for i = 1:size(points_2,1)
        if w2'*points_2(i,:)' <=0
            w2 = w2 + points_2(i,:)';
            count_2 = count_2 + 1;
        end
    end
    if count_2 == 0;
        break;
    else
        count_2=0;
    end
end
iter_2=iter_2-1;
figure
plot(C2(:,1),C2(:,2),'+');
hold on 
plot(C3(:,1),C3(:,2),'*');
hold on

x2 = -10:0.1:10;
y2 = (-w2(1)*x2 -w2(3))/w2(2);
plot(x2,y2);

