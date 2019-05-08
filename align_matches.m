function sid = align_matches(sids, diffs)
  diff_counter = javaObject("java.util.HashMap");
  largest = 0; 
  largest_count = 0; 
  sid = -1;
  
  for i = 1:length(sids)
    if isempty(diff_counter.get(diffs(i)))
      diff_counter.put(diffs(i), javaObject("java.util.HashMap"));
    end
    diff_counter.get(diffs(i));
    if isempty(diff_counter.get(diffs(i)).get(sids(i)))
      diff_counter.get(diffs(i)).put(sids(i), 0);
    end
    diff_counter.get(diffs(i)).put(sids(i), diff_counter.get(diffs(i)).get(sids(i))+1);
    if (diff_counter.get(diffs(i)).get(sids(i)) > largest_count)
      largest = diffs(i);
      largest_count = diff_counter.get(diffs(i)).get(sids(i));
      sid = sids(i);
    end
  end
end