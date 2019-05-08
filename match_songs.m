function sname = match_songs(conn, filename, ts, te)
  [h, td] = get_song_fingerprints(filename, ts, te);
  [sids, offsets] = get_matches(conn, h, td);
  sid = align_matches(sids, offsets);
  if (sid >0)
    query = sprintf("select song_name from songs where song_id=%d", sid);
    res = pq_exec_params(conn, query);
    sname = ["The song is: " res.data{1}];
  else
    sname = "No file found";
  end
end