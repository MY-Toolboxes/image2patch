# image2patch
Convert image to patches or  recover image for patches with given size and stride.

> Author: Zhihong Zhang
>
> Email: z_zhi_hong@163.com

## Directory & Usage

##### `image2patch_v1`

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

##### `image2patch_v2`

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

  

## Note

- `image2patch_v2` is recommended.
- The overlapping areas are averaged during reconstruction.

## Reference

- http://hvrl.ics.keio.ac.jp/charmie/file/demo_patching.zip