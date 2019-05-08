function add_dir(conn, path)
  a = dir([path "*.wav"]);
  for file = a'
    file.name
    add_song(conn, [path char(file.name)]);
  end
end