% filter specifications
fs = 48000; % sampling frequency (Hz)
wp = 5000; % passband frequency
ws = 7000; % stopband frequency
n = 6; % filter order = 2*n = 12
w1 = (2 * wp)/fs;
w2 = (2 * ws)/fs;
wn = [w1, w2];
[b, a] = butter(n, wn, 'stop');

% plot magnitude response
w = 0:0.01:pi;
[h, om] = freqz(b, a, w);
m = 20*log10(abs(h));
figure, plot(om/pi * (fs/2), m);
ylabel('Gain (dB)');
xlabel('Frequency (Hz)');

% create signal and check response
ts = 1/fs;
t = 0:ts:1;
f = 2000;
x = sin(2*pi*f*t);
figure, plot(t, x);
hold on
y = filter(b, a, x);
plot(t, y);

% write data to file
% fileID = fopen('data_2k.txt','w');
% fprintf(fileID, '%f\n', x);
% fclose(fileID);

