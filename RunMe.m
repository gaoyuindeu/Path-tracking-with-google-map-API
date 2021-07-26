load('data');
apiKey = 'Here add your own google API';
figure();
h = animatedline(latitude(1),longitude(1),'color','r');
axis([min(latitude(:)),max(latitude(:)),min(longitude(:)),max(longitude(:))]);
plot_google_map('APIKey',apiKey,'MapType','satellite','Refresh',1);

[A,map] = rgb2ind(frame2im(getframe),256);
imwrite(A,map,'2.gif','LoopCount',65535,'DelayTime',0.01);
for k = 1:(length(latitude))
    addpoints(h,latitude(k),longitude(k));

    drawnow
    if(mod(k,20)==0)
        [A,map] = rgb2ind(frame2im(getframe),256);
        imwrite(A,map,'2.gif','WriteMode','append','DelayTime',0.01);
    end
end