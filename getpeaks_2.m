function peaks = getpeaks_2(S)
  S = abs(S);
  se = strel( 'diamond', 20 );
  st = getnhood(se);
  B = ordfilt2(S,size(st(:))(1) - 1,st);
  peaks = S==B;
%  background = S == 0;
 % imshow(background);
%  find(background > 0)
%  er_bg = imerode(background,st);
%  find(er_bg > 0)
%  peaks = logical(peaks - er_bg);
  amps = S(peaks);
  [f,t] = find(peaks);
  idxs = amps>5;
  peaks = [f(idxs), t(idxs)];
 % amps  
%  new_image = zeros(size(S)(1), size(S)(2), 3);
%  new_image(:,:,1) = S;
%  new_image(:,:,2) = peaks;
%  imshow(imresize(new_image, [1000, 1000]));
  
endfunction