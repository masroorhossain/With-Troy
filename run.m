% getitng audio samples to play back 
% at different pitches by doing an FFT -> shifting the frequency bins 
%-> IFFT


[inwave,fs] = audioread("sample.wav");
%plot(y);
%size(y)


outwave=inwave;
chunk_size= 1024;

for start_sample=1:chunk_size:length(inwave)-chunk_size
  y=inwave(start_sample:start_sample+chunk_size);
  y_fft = fft(y);
  y_fft = fftshift(y_fft);


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


  spectrum_half_width = round(length(y_fft)/2);  %original half-width


  zero_hz_index = round(length(out)/2); %the new centre point in the spectrum

  % the negative half of the spectrum
  fft_negative = out(   zero_hz_index-spectrum_half_width: zero_hz_index); 

  % the positive half of the spectrum
  fft_positive = out(  zero_hz_index : zero_hz_index + spectrum_half_width);

  new_fft = [fft_negative , fft_positive];
  
  new_y = ifft(fftshift(new_fft));
  
  
  outwave(start_sample:start_sample+length(new_y)-1)=new_y;
  
  subplot(4,1,1);plot(abs(y_fft));
  subplot(4,1,2);plot(abs(fft_negative));
  subplot(4,1,3);plot(abs(fft_positive));
  subplot(4,1,4);plot(abs(new_fft));
endfor

wavwrite(outwave,fs,'out.wav');

figure;
subplot(2,1,1);plot(inwave);
subplot(2,1,2);plot(outwave);




%figure;
%subplot(4,1,1);plot(angle(y_fft));
%subplot(4,1,2);plot(angle(fft_negative));
%subplot(4,1,3);plot(angle(fft_positive));
%subplot(4,1,4);plot(angle(new_fft));


