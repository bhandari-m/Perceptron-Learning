function [W,B,C]= voted_perceptron(x,y,num_epochs)

n=1;
w1 = zeros(1,size(x,2));
b1 = 0;
c1 = 1;
W = [w1];
B = [b1];
C = [c1];

for iter = 1:num_epochs
    for i=1:size(x,1)
        if (y(i)*(x(i,:)*W(n,:)' + B(n))) <= 0
            n = n+1;
            w = W(n-1,:) + y(i)*x(i,:);
            W = [W;w];
            b = B(n-1) + y(i);
            B = [B b];
            c = 1;
            C = [C c];
        else
            C(n) = C(n)+1;
        end
    end
end
end

