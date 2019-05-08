function X = insert_hashes(conn, sid,hash,offset)
    for i = 1:length(hash)
        insert(conn, sid, hash(i, :),offset(i));
    end
end