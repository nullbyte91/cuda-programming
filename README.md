# CUDA Programming
#### Process:
A process is the instance of a computer program that is being executed by one or many threads.

#### Thread:
A thread is a flow of execution through the process code, with its own program counter that keeps track of which instruction to execute next, system registers which hold its current working variables, and a stack which contains the execution history. A thread is also called a lightweight process.

#### Context:
A context switch is the process of storing the state of a process or thread, so that it can be restored and resume execution at a later point. This allows multiple processes to share a single central processing unit (CPU), and is an essential feature of a multitasking operating system.

#### Task Level vs Data Level Paralleslism:
Task level - Perform different task on same or different data
Data Level - Perform same task on different data

#### CUDA Flow
* Initialization of data from CPU
* Transfer data from CPU Context to GPU Context
* Kernel Launch with needed grid/block size
* Transfer results back to CPU Context from GPU Context
* Reclaim the memory from both CPU and GPU

#### Elements of a CUDA Program
* Host code
* Device Code
