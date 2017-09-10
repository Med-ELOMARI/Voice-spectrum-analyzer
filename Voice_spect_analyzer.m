Fs = 1600;
Fc = [70 300];
Wn = 2*Fc/Fs;
[num,den] = butter(1,Wn,'bandpass');
while true

recObj = audiorecorder;
recordblocking(recObj,0.20);
myRecording = getaudiodata(recObj);
subplot(3,1,1)
plot(myRecording);
title('Signal de la parole');
xlabel('Temps(s)');
ylabel('Amplitude');
axis([0 inf -1 1])
%-----------
Y = abs(fft(myRecording));
subplot(3,1,2)
plot(Y(1:800))
title('Spectre de la parole ');
xlabel('Frequence (Hz)');
ylabel('Amplitude spectrale');
%------------
myRecording_filtre = filter(num,den,myRecording);
Y_filtre = abs(fft(myRecording_filtre));
subplot(3,1,3)
plot(Y_filtre(1:800))
title('Spectre de la parole filtrer entre 70-300Hz');
xlabel('Frequence (Hz)');
ylabel('Amplitude spectrale');
end

