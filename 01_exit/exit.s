# PURPOSE:  Simple program that exists and returns a
#           status code back to the Linux kernel
#

# INPUT:    none
#

# OUTPUT:   returns a status code. This can be viewed
#           by typing
#
#           echo $?
#
#           after running the program

# VARIABLES:    %eax holds the system call number
#               %ebx holds the return status

.section .data  # Infos for the assembler
                # No data is used in our program.

.section .text  # Actual code

.globl _start   # Declare global symbol

_start:         # Define global symbol

movl $1, %eax   # "Move a 1 into eax register"  
                # this is the linux kernel command
                # number (system call) for exiting
                # a program

movl $0, %ebx   # "Move a 0 into ebx register"
                # this is the status number we will
                # return to the operating system.
                # Change this around and it will
                # return different things to
                # echo $?

int $0x80       # "Call Interrupt 80"
                # this wakes up the kernel to run
                # the exit command
