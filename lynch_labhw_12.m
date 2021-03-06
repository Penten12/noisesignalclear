% Nathaniel Lynch
% UID: 115342026
clear, clc

%Part i)
[x,Fs] = audioread("noisy_clip_12.wav");

N = length(x);
Fs = 22050; %Sampling rate
%soundsc(x,Fs) %listen to the messed up audio

%Part ii)
 
S = spectrogram(x, 512, 0);
title("Given audio spectrum");

mesh(db(abs(S))), xlabel('Time'), ylabel('Freq')
view(100,45)

spectrogram(x, 512, 0)

% .76>, in passband, bandlimited from 0 to 0.76*pi
% noise is bandlimited to about .81*pi to 1*pi , in stopband
%Low-pass should remove noise
%wpass = .76
%wstop = .81

%attentuation for stopband modified to 60, pass stayed at 1
%Part iii)
%fdatool
load("lynch_bb.mat");

%Part iv)
y = filter(bb,1,x) ;
        spectrogram(y,512,0) ;
%soundsc(y,Fs)
 audiowrite("lynch_labhw_12.wav",y,Fs);
        
        
        
        