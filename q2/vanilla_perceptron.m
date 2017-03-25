function w = vanilla_perceptron(x,y,num_epoch)
w = zeros(1,size(x,2));
b = 0;

%Two class perceptron. Therefore, y1=1 (for c1) & y2=-1 (for c2)
w = [w b];
col_size = size(x, 1); 
onecol = (ones(col_size,1));
x = [x,onecol];
iter=0;
% num_epoch=10;
 
while (num_epoch)
    iter=iter+1;
    for i = 1:size(x,1)
        if y(i)*(w*x(i,:)') <=0
            w = w + y(i)*x(i,:);
        end
    end
    num_epoch=num_epoch-1;
end
iter = iter-1;

