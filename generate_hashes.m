function [hashes,time_deltas] =generate_hashes(peaks)
  DEFAULT_FAN_VALUE = 16;
  FINGERPRINT_REDUCTION = 20;
  MIN_HASH_TIME_DELTA = 0;
  MAX_HASH_TIME_DELTA = 200;

	fan_value=DEFAULT_FAN_VALUE;

	peaks=sortrows(peaks, 2);

	hashes = [];
	time_deltas = [];
	for i = 1:(size(peaks)(1))
  %    [i j size(peaks)(1) fan_value]
      for j = 1:fan_value
          %[i j length(peaks) size(peaks)(1) fan_value]
          
          if (i + j) < length(peaks) 
              freq1 = peaks(i,1);
              freq2 = peaks(i + j,1);
              t1 = peaks(i,2);
              t2 = peaks(i + j,2);
              t_delta = t2 - t1;
         %     [freq1 freq2 t1 t2 t_delta]
              if t_delta >= MIN_HASH_TIME_DELTA && t_delta <= MAX_HASH_TIME_DELTA

                string2hash=[num2str(freq1) '|' num2str(freq2) '|' num2str(t_delta)];
                hashed = hash('sha1', string2hash);
              endif
          endif
        
          hashed = hashed(1:FINGERPRINT_REDUCTION);
          hashes = [hashes; hashed];
          time_deltas = [time_deltas; t1];
       endfor
  endfor