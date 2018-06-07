globe=imread('finalspread.png');
for k=1:3
    globe(:, :, k)=flipud(globe(:, :, k));
end
% axes(handles.popAxes);
[M, N, L]=sphere(30);
figure(1)
R1 = surf(M, N, L, 'FaceColor', 'texturemap','CData', globe, 'EdgeColor', [0.6, 0.6, 0.6]);