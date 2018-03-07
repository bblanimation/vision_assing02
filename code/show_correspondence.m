% Local Feature Matching Code
% Written by Henry Hu and James Hays, Georgia Tech
% Modified for Octave by Jon Denning, Taylor University


% Visualizes corresponding points between two images. Corresponding points
% will have the same random color.

% You do not need to modify anything in this function, although you can if
% you want to.
function [ h ] = show_correspondence(imgA, imgB, X1, Y1, X2, Y2)

h = figure(2);
% set(h, 'Position', [100 100 900 700])
% subplot(1,2,1);
% imshow(image1, 'Border', 'tight')
% 
% subplot(1,2,2);
% imshow(image2, 'Border', 'tight')

Height = max(size(imgA,1),size(imgB,1));
Width = size(imgA,2)+size(imgB,2);
numColors = size(imgA, 3);
newImg = zeros(Height, Width,numColors);
newImg(1:size(imgA,1),1:size(imgA,2),:) = imgA;
newImg(1:size(imgB,1),1+size(imgA,2):end,:) = imgB;
imshow(newImg, 'Border', 'tight')
shiftX = size(imgA,2);
hold on
for i = 1:size(X1,1)
    cur_color = rand(3,1);

    plot(X1(i),Y1(i), 'o', 'LineWidth',2, 'MarkerEdgeColor','k',...
                       'MarkerFaceColor', cur_color, 'MarkerSize',10)

    plot(X2(i)+shiftX,Y2(i), 'o', 'LineWidth',2, 'MarkerEdgeColor','k',...
                       'MarkerFaceColor', cur_color, 'MarkerSize',10)

end
hold off;

% for i = 1:size(X1,1)
%     cur_color = rand(3,1);
%     subplot(1,2,1);
%     hold on;
%     plot(X1(i),Y1(i), 'o', 'LineWidth',2, 'MarkerEdgeColor','k',...
%                        'MarkerFaceColor', cur_color, 'MarkerSize',10)
% 
%     hold off;
%    
%     subplot(1,2,2);
%     hold on;
%     plot(X2(i),Y2(i), 'o', 'LineWidth',2, 'MarkerEdgeColor','k',...
%                        'MarkerFaceColor', cur_color, 'MarkerSize',10)
%     hold off;
% end

fprintf('Saving visualization to vis_dots.png\n')
print -dpng vis_dots.png;
