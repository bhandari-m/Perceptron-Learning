f = csvread('breast-cancer-wisconsin.csv');
x = f(:,1:9);
y = f(:,10);
y = y-3;
num_epochs = [10,15, 20, 25, 30, 35,40, 45, 50];

sz = size(x);
k = int32(9/10*sz(1));
traSet_x = x(1:k,:);
traSet_y = y(1:k,:);

testSet_x = x(k+1:sz(1),:);
testSet_y = y(k+1:sz(1),:);
acc = zeros(1,size(num_epochs,2));

f1 = csvread('ionosphere.csv');
x1 = f1(:,1:34);
y1 = f1(:,35);

sz1 = size(x1);
k1 = int32(9/10*sz1(1));
traSet_x1 = x1(1:k1,:);
traSet_y1 = y1(1:k1,:);

testSet_x1 = x1(k1+1:sz1(1),:);
testSet_y1 = y1(k1+1:sz1(1),:);
acc1 = zeros(1,size(num_epochs,2));

for kk = 1:size(num_epochs,2)
    [w,b,c] = voted_perceptron(traSet_x,traSet_y,num_epochs(kk));
    count = 0;
    for i = 1:size(testSet_x,1)
        su = 0;
        for j = 1:size(w,1);
            m = c(1,j)*sign(x(i,:)*w(j,:)' + b(1,j));
            su = su + m;
        end;    
        y_pre = sign(su);
        if y_pre*testSet_y(i,1) == 1
            count = count+1;
        end
    end
    acc(1,kk) = count/size(testSet_y,1);
end;
figure
plot(num_epochs,acc);
 
for kk1 = 1:size(num_epochs,2)
    [w1,b1,c1] = voted_perceptron(traSet_x1,traSet_y1,num_epochs(kk1));
    count1 = 0;
    for i1 = 1:size(testSet_x1,1)
        su1 = 0;
        for j1 = 1:size(w1,1);
            m1 = c1(1,j1)*sign(x1(i1,:)*w1(j1,:)' + b1(1,j1));
            su1 = su1 + m1;
        end;
        y_pre1 = sign(su1);
        if y_pre1*testSet_y1(i1,1) == 1
            count1 = count1+1;
        end
    end
    acc1(1,kk1) = count1/size(testSet_y1,1);
end;
figure
plot(num_epochs,acc1);


for kk3 = 1:size(num_epochs,2)
    w_w = vanilla_perceptron(traSet_x,traSet_y,num_epochs(kk3));
    szz =  size(w_w,2);
    count3 = 0;
    for i3 = 1:size(testSet_x,1)
        m3 = sign(testSet_x(i3,:)*w_w(1,1:szz-1)' + w_w(szz));
        y_pre3 = sign(m3);
        if y_pre3*testSet_y(i3,1) == 1
            count3 = count3+1;
        end
    end
    acc3(1,kk3) = count3/size(testSet_y,1);
end;
figure
plot(num_epochs,acc3);
 
 for kk4 = 1:size(num_epochs,2)
    w_w1 = vanilla_perceptron(traSet_x1,traSet_y1,num_epochs(kk4));
    szz1 =  size(w_w1,2);
    count4 = 0;
    for i4 = 1:size(testSet_x1,1)
        m4 = sign(testSet_x1(i4,:)*w_w1(1,1:szz1-1)' + w_w1(szz1));
        y_pre4 = sign(m4);
        if y_pre4*testSet_y1(i4,1) == 1
            count4 = count4+1;
        end
    end
    acc4(1,kk4) = count4/size(testSet_y1,1);
end;
figure
plot(num_epochs,acc4);

