function X = insert(conn, sid, hash, offset) %Insert a (sha1, song_id, offset) row into database
    INSERT_FINGERPRINT = sprintf('INSERT INTO fprints (hash, song_id, s_offset) values(decode(''%s'', ''hex''),%d, %d)' ,hash,sid,offset);
    pq_exec_params(conn,INSERT_FINGERPRINT);
end

