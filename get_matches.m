function [sids, offsets] = get_matches(conn, hashes, offsets)
    m = javaObject("java.util.HashMap");
    size(hashes)(1);
    for i = 1:length(offsets)
        m.put(hashes(i,:),offsets(i));
    end
    
    a = (strcat("decode('",  hashes, "', 'hex'),"));
    a = a'(:)';
    a = a(1:end-1);
    query = sprintf('SELECT encode(hash::bytea, ''hex''), song_id, s_offset FROM fprints WHERE hash IN (%s)',a);
    matches = pq_exec_params(conn, query);
    
    sids=[];
    offsets=[];
    for i = 1:length(matches.data)
      sids = [sids; matches.data{i,2}];
   %   matches.data{i,3}-m.get(matches.data{i,1})
      offsets = [offsets; matches.data{i,3}-m.get(matches.data{i,1})];
    end
end

%align_matches("a", ["asdasd";"asddfg"], [1,2])