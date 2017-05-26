% getitng audio samples to play back 
% at different pitches by doing an FFT -> shifting the frequency bins -> IFFT


y = audioread("sample.wav");
%plot(y);
%size(y)

y_fft = fft(y);
size(y_fft)

%array shift of indice
n =2;
cnstnt = 1.059;

for i=1:length (y_fft)
  shift_y(i) = round(cnstnt*n*i);
%  content of shit_y has transformed indices
  endfor
  
for i=1:length (y_fft)
   out(shift_y(i)) = y_fft(i);
   endfor
   