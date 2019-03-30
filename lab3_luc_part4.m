% Distortion Resistance

%%
set(0, 'DefaultFigurePosition', get(0,'screensize'));
clc; clear; close all;

%% Introduction
% 
% In this exercise we will test how stable is the network. For this
% purpose, we will first train the network with some patterns. Next, we
% will add some noise to these patterns and test if the network is able to
% denoise them.
%
%% Creating patterns and training
%
% As usual, we first load the patterns and train them to obtain the weight
% matrix.
Patterns;
patterns = [ 
    p1;
    p2;
    p3
    ];
[P, N] = size(patterns);
w = train_weights(patterns);

%% Distortion and reconstruction
%
% Results still depend on random initialization, but for less than 20%% or 
% more than 80%% of noisy pixels it works most of the times.
%

noisy_pixels = [ (1/12)*1024  (1/6)*1024 (1/2)*1024 (3/4)*1024 (2/3)*1024 5/6*1024 ];
%rng(1);
for n = noisy_pixels
    figure;
    x_in = flip_img(p1, n);
    subplot(1,2,1); vis(x_in);
    title(sprintf('Flipping %d/%d = %.2f\\%% of the pixels of p1',...
        n, N, n/N*100), 'Fontsize', 16);
    [x_out, it] = evolve_net(w, x_in', patterns);
    subplot(1,2,2); vis(x_out);
    title(sprintf('Result after %d iterations', it), 'Interpreter',...
        'latex', 'Fontsize', 16);
end

%%
%close all;