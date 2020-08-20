%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%


Img = zeros(28, 28, 1, 12);
    for i = 1:10
        Img(:,:,:,i) = (reshape(EVecs(:,i)*255.0, 28, 28)');
    end
montage(Img, 'DisplayRange', [-50, 50]);

end
