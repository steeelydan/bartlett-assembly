# Data access modes

Direct addressing mode:
`movl ADDRESS, %eax` loads %eax with the value at ADDRESS.

Indexed addressing mode:
`movl string_start(,%ecx,1), %eax` starts at string_start, adds 1 * %ecx to that address, loads value into %eax

Indirect addressing mode:
`movl (%eax), %ebx` moves value at address %eax into %ebx

Base pointer addressing mode:
`movl 4(%eax), %ebx` adds 4 bytes to addres of %eax

Immediate mode:
`movl $12, %eax` loads number 12 into %eax

Register addressing mode:
Just means register is addressed, see 2nd operand in all examples.

Every mode except immediate mode can be used as source- and destination operand. Immediate mode only can be used as source operand.