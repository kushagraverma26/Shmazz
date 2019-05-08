function [S, f, t] =  spectrogram(file, t_start, t_end)
  [amps, fs] = audioread(file);
  sig = (amps(:, 1) + amps(:, 2))/2;
  [M, N] = size(amps);
  
  if t_end > 0
    dt = 1/fs;
    t_change = dt*(0:M-1);
    starts =  (t_start <= t_change);
    ends =  (t_end >= t_change);
    idx = (ends & starts);
    sig = sig(idx); 
  endif
  window = 4096;
 
 % specgram(sig, 2^nextpow2(window), fs, window, window/2);
  [S, f, t] = specgram(sig, 2^nextpow2(window), fs, window, window/2);
  S = log10(S);
  S(S == -inf) = 0;
  
endfunction
    