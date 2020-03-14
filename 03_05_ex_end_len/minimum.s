# PURPOSE:  This program finds the maximum number o a
#           set of data items.
#
# VARIABLES:    The registers have the following uses:
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data

.section .data

data_items:                     # Doesn't have a .globl declaration:
                                # Only needed within our program.

# Memory reservations:
# .byte: 1 storage location (1 byte) -> 0-255
# .int: 2 storage locations (2 bytes) -> 0-65535
# .long: 4 storage locations (4 bytes)
# .ascii: one storage location per char
#   --> "Hello there\0" would take 12 bytes ("\0"
#       as terminating char only takes 1 byte

.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255  
# We arbitrarily chose 0 as delimiter.

.section .text

.globl _start                   # Has a .global declaration:
                                # OS needs to see this

_start:
movl $0, %edi                   # move 0 (l = long) into index register
# Indexed addressing mode instruction, in general:
# movl BEGINNINGADDRESS(,%INDEXREGISTER,WORDSIZE)
movl data_items(,%edi,4), %eax  # Load the first byte of data
movl %eax, %ebx                 # since this is the first item,
                                # %eax is the biggest

start_loop:
# Check if we've hit the end

cmpl $13, %edi # Use length
# Still open: Use end ADDRESS!

# Jump statements:
# je: Jump if equal
# jg: Jump if 2nd > 1st
# jge: Jump if 2nd >= 1st
# jl: Jump if 2nd < 1st
# jle: Jump if 2nd <= 1st
# jmp: Jump no matter what
je loop_exit                    # ...exit loop then
incl %edi                       # Increment counter
movl data_items(,%edi,4), %eax  # Load next value
cmpl %ebx, %eax                 # Compare values
jge start_loop                  # Jump to loop beginning if the
                                # new one isn't smaller
movl %eax, %ebx                 # Else: Set the value as the smallest
jmp start_loop                  # Jump to loop beginning

loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax
int $0x80
