function X = add_song(conn, filename)
  printf("File %s", filename);
  [h,t] = get_song_fingerprints(filename, 0, 0);
  query = sprintf( ...
    'INSERT INTO songs(song_name, file_sha1) VALUES (''%s'', decode(''aaaaaaaacb'', ''hex''))', filename);
  pq_exec_params(conn, query);
  query = "select song_id from songs order by song_id DESC LIMIT 1";
  sid = pq_exec_params(conn, query).data{1};
  insert_hashes(conn, sid, h, t);
end