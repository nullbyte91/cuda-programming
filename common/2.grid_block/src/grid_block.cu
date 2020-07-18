#include <cuda_runtime.h> /* core lib */
#include "device_launch_parameters.h"
#include <stdio.h>

/* Device code - Kernel */
__global__ void hello_cuda()
{
    printf("Code execution on GPU\n");
}

/* Host code */
int
main(int argc, char** argv)
{
    printf("Code execution on CPU\n");

    /* 32 threds in parallel
    *  8 grid each runs 4 block threads in x direction
    */

    dim3 grid_x(8, 1, 1);
    dim3 block_y(4, 1, 1);

    /* Grid, block */
    hello_cuda<<< grid_x, block_y >>> ();

    /* Host waits untils GPU Code returns */
    cudaDeviceSynchronize();

    /* 32 threds in parallel
    *  8 grid in x, y direction each runs 4 block threads in x, y direction
    */

    dim3 grid_xy(8, 2, 1);
    dim3 block_xy(4, 1, 1);

    /* Grid, block */
    hello_cuda<<< grid_xy, block_xy >>> ();
    
    
    /* Host waits untils GPU Code returns */
    cudaDeviceSynchronize();

    /* Destroys the primary context of the device the host
     * thread currently operates 
     */ 
    cudaDeviceReset();
    return 0;
}