function img = patch2im(patches, img_size, skip_size, border)
%PATCH2IM: restore images from patches
%   - patches: small patches, [h, w, c] for gray image; [h, w, c, p] for multi-channel
%	- img_size: the height and width of original image, 2D int
%	- skip_size: the stride of patches, 2D int
%   - border: whether keep borders of the image when it cannot be separated
%				exactly, string array, value={'on', 'off'}
%	- img: reconstructed image, gray or multi-channel
% 
%	Note: if 'border' is 'on', then the last sub-image will be the "first"
%	sub-image counting from the end of the row or the column.
% 
% Modified by Zhihong Zhang (z_zhi_hong@163.com), 2021-4-15


if(nargin < 4), border = 'on'; end

patch_size = [size(patches,1) size(patches,2)];

if ndims(patches)<4
    channel_num = 1;
else
    channel_num = size(patches,3);
end

% restore image from patcher
img = zeros(img_size);

for ch = 1:channel_num
    img_tmp = zeros(img_size);
    w = zeros(img_size);
    
    if channel_num == 1
        patches_tmp = patches;
    else
        patches_tmp = squeeze(patches(:,:,ch,:));
    end
    
    % get the index map that mapping image to patches (plane mapping) 
    patch_loc = patch_idx_map(img_size, patch_size, skip_size, border);
    
    patches_tmp = reshape(patches_tmp, [prod(patch_size) size(patches_tmp,3)]);
    
    for n=1:size(patch_loc,3)
        img_tmp(patch_loc(:,:,n)) = img_tmp(patch_loc(:,:,n)) + reshape(patches_tmp(:,n), patch_size);
        w(patch_loc(:,:,n)) = w(patch_loc(:,:,n)) + 1;
    end
    img_tmp = img_tmp ./ w; %去重复累加的部分
   
    
    if channel_num == 1
        img = img_tmp;
    else
        img(:,:,ch) = img_tmp;
    end
end

% crop the nan area
if strcmp(border, 'off')
    img_x = find(isnan(img(:,1,1)),1);
    img_y = find(isnan(img(1,:,1)),1);
	if ~isempty(img_x)
		img = img(1:img_x-1, :,:);
	end
	if ~isempty(img_y)
		img = img(:,1:img_y-1, :);
	end
	warning('BORDER off, the real image size is %dx%d\n',size(img,1), size(img,2));
end