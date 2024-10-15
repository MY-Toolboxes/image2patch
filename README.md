# image2patch
Convert image to patches or recover image for patches with given size and stride.

> Author: Zhihong Zhang
>
> Email: z_zhi_hong@163.com

## Directory & Usage

##### `image2patch_v1` [matlab]

- `demo_patching.m` : a demo for the patching and restorage functions

- `im2patch.m`: convert image to patches with given size and stride, and the border can be chose to keep or discard

- `patch2im.m`: recover image for patches with given image size, stride, and border information

- parameters
  
  - img: original image, gray or multi-channel
  - patch_size: size of small patches, 2D int
  - skip_size: the stride of patches, 2D int
  - border: whether keep borders of the image when it cannot be separated exactly, string array, value={'on', 'off'}, default = 'on'
  - patches: small patches, [h, w, c] for gray image; [h, w, c, p] for multi-channel
  
  - img_size: the size of original image, 2D int

##### `image2patch_v2` [matlab]

- `demo.m `: a demo for the patching and restorage functions

- `image2patches.m`: convert image to patches with given size and stride, and the border can be chose to keep or discard

- `patches2image.m`: recover image for patches with given image size, stride, and border information

-  parameters：

  - im:				original image
  - \[n1 n2\]:			the patch's size
  - \[N1 N2\]:			original image's size
  - \[delta1 delta2\]:	the step size
  - border: whether keep borders of the image when it cannot be separated exactly, string array, value={'on', 'off'}, default = 'on'
  - M_patches: small patches, [h, w, c] for gray image; [h, w, c, p] for multi-channel


##### `image2patch_v3` [python]

- `utils_patch_proc.py`: utility functions for patching and merging

- `utils_patch2d_proc.py`: utility functions for patching and merging, suitable for 2d images

- `utils_patch3d_proc.py`: utility functions for patching and merging, suitable for 3d images


## Note

- `image2patch_v2` and `image2patch_v3` are recommended.
- The overlapping areas are averaged during reconstruction.
- :fire: [3rd-parth patch-wise inference toolboxes](https://github.com/MY-Toolboxes/patch_wise_inference) are recommented for patch-wise model inference.

## Reference

- http://hvrl.ics.keio.ac.jp/charmie/file/demo_patching.zip