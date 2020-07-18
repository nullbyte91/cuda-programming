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

    /* The int param referes the number of threads runs on GPU */
    hello_cuda<<< 1, 1 >>> ();

    /* Host waits untils GPU Code returns */
    cudaDeviceSynchronize();

    /* Destroys the primary context of the device the host
     * thread currently operates 
     */ 
    cudaDeviceReset();
    return 0;
}