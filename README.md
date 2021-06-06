# CollatzVisualisation
We implement a MATLAB animated visualisation of the generalised Collatz system:

![equation](https://latex.codecogs.com/gif.latex?C%28n%29%3D%5Cbegin%7Bcases%7D%5Cfrac%7Bn%7D%7B2%7D%20%26%20%5Ctext%7Bif%20%7Dn%5Cequiv%200%5Cpmod%7B2%7D%5C%5Can&plus;b%20%26%20%5Ctext%7Bif%20%7Dn%5Cequiv1%5Cpmod%7B2%7D%5Cend%7Bcases%7D).

For each even iteration k in C^k(n), when C^k(n) does not equal 1, from n up to t, the x-coordinate of a point increases by lcos(theta) and for each odd iteration delta(x)=-lcos(theta). The source code is found in main.m.
