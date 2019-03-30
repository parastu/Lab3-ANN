%% 300 zero centered random patterns
% Same thing happens with a smaller network (note that the number of noisy 
% pixels and the similarity threshold have been lowered accordingly).
clear; rng(1);
all_patterns = sgn(randn(300, 100));
print_pattern_stat(all_patterns);
N = 300;
noisy_pixels = 30;
repetitions = 3;

performances = [];
stables = [];
%for P = 1:size(all_patterns, 1)
for P = 1:N
    patterns = all_patterns(1:P, :);
    w = train_weights(patterns);
    
    successes = 0;
    stable_patterns = 0;
    for original_pat = patterns'
        % try if one original pattern remains stable after one iter
        after_one_iter = sgn(w * original_pat);
        if isequal(after_one_iter, original_pat)
            stable_patterns = stable_patterns + 1;
        end
        
        % try if a distorted pattern remains stable after one iter
        for i=1:repetitions
            distorted_pat = flip_img(original_pat', noisy_pixels)';
            reconstructed_pat = evolve_net(w, distorted_pat);
            if sum(original_pat~=reconstructed_pat)<3
                successes = successes + 1;
            end
        end
    end
    
    performance = successes / (P * repetitions); %kedua
    performances = [performances, performance]; %pertama
    stables = [stables, stable_patterns/P];
end

figure;

subplot(1,2,1);
plot(1:N, stables);
grid on;
title('Stability of pattern memories', 'fontsize',16);
xlabel('Number of training patterns', 'fontsize',16);
ylabel('Percentage of patterns stability','fontsize',16);

subplot(1,2,2);
%plot(1:size(all_patterns, 1), performances);
plot(1:N, performances);
grid on;
title('Denoising of the memories', 'fontsize',16);
xlabel('Number of training patterns', 'fontsize',16);
ylabel('Percentage of denoised patterns', 'fontsize',16); 



suptitle('300 Units - 300 zero centered random patterns');