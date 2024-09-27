function [] = plotthisgraph(data)

[n, ~] = size(data);

best_val=data;
for i = 2:n
    best_val(i, :)=min(best_val(i, :), best_val(i-1, :));
end

mean_val = mean(best_val, 2);
%disp(mean_val);


%plot([1:100]', mean_val);
FE = 1:size(mean_val, 1); % Function evaluations

figure;
plot(FE, mean_val, 'm-*', 'MarkerSize', 3);
xlabel('Function evaluations');
ylabel('Mean of best fitness function value');
title('Mean Best Fitness Function Value vs Function Evaluations');
grid on;
end
