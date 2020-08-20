%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
load(MAT_ClusterCentres, 'C')
Img = zeros(28, 28, 1, size(C,1));
    for i = 1:size(C,1)
        Img(:,:,:,i) = (reshape(C(i,:), 28, 28)');
    end
montage(Img, 'Size', [1 20]);
end
