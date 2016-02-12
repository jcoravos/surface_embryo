# surface_embryo

Work in progress

Identify the outer surface of an embryo to project onto a flat plane. Use this as input for image segmentation.

Strategy:

Create a mask in the image volume that correctly identifies the boundary of the embryo. Find the surface of this
mask and return the pixel coordinates.

Return a "flattened" embryo where these pixel coordinates are now aligned in a plane, with some continuation into space
above and below the plane.
