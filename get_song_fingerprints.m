function [hashes, time_deltas] = get_song_fingerprints(name, ts, te)
  [S, ~, ~] = spectrogram(name, ts, te);
  peaks = getpeaks_2(S);
  [hashes, time_deltas] = generate_hashes(peaks);
end

