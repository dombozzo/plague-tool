function sphereRotateF(handles)




theta = handles.thetaSlider.Value;
globe=imread('finalspread.png');
for k=1:3
    globe(:, :, k)=flipud(globe(:, :, k));
end
hax = handles.popAxes;
[M, N, L]=sphere(30);
R1 = surf(M, N, L, 'FaceColor', 'texturemap','CData', globe, 'EdgeColor', [0.6, 0.6, 0.6]);
axis equal
axis off
rotate(R1,[0 0 1],theta);

end




