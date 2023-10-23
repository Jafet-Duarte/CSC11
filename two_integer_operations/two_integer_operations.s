
.global main

.align 4
.data

x_value:	.word 0
y_value:	.word 0

.align 4
.section .rodata

prompt:		.asciz "Enter two signed integers seperated by a space to be calculated: "
response:	.asciz "You entered the values %d and %d from the keyboard, now some operations on those values!\n"
scan2int:	.asciz "%d %d"

//calculations
output_sum:	.asciz "The sum of %d and %d is %d \n"
output_product:	.asciz "The product of %d and %d is %d \n"
output_and:	.asciz "The logical and of %d and %d is %d \n"
output_or:	.asciz "The logical or of %d and %d is %d \n"


.align 4
.text
main:
	push {lr}		//save lr to stack
	ldr r4, =x_value	//ldr 4 is a pointer to label x_value
	ldr r5, =y_value	//ldr 5 is a pointer to label y_value

	//prompt user to enter values for x and y
	ldr r0, =prompt		//load r0 address of prompt
	bl printf		//call printf to output the prompt

	//input values
	ldr r0, =scan2int	//load r0 the string of scan int
	mov r1, r4		//copy r1, the address of r4, x value
	mov r2, r5		//copy r2, the address of r5, y value
	bl scanf		//call scan f to read the 2 integers
stop_scanf:
	//output
	ldr r0, =response	//load in r0 the address of the response string
	ldr r1, [r4]		//load r1 the data in address of r4
	ldr r2, [r5]		//load r2 the data in address of r5
	bl printf

	//sum
	ldr r0, =output_sum	//load in r0 address of string output_sum
	ldr r1, [r4]		//load r1 the data in address of r4
	ldr r2, [r5]		//load r2 the data in address of r5
	add r3, r2, r1		//load r6 the sum of data in  address r4 and r5
	bl printf		//display string output_sum with values

	//product
	ldr r0, =output_product	//load in r0 address of string output_product
	ldr r1, [r4]		//load r1 the data at address r4
	ldr r2, [r5]		//load r2 the data at address r5
	mul r3, r2, r1		//multiply data in r2 and r1 and store in r3
	bl printf		//display string output_product with values

	//and
	ldr r0, =output_and	//load in r0 address of string output_and
	ldr r1, [r4]		//load r1 the data in address r4
	ldr r2, [r5]		//load r2 the dara in address r5
	and r3, r2, r1		//store r3 logical and of r1 and r2
	bl printf		//display string output_and with values

	//or
	ldr r0, =output_or	//load in r0 address of string output_or
	ldr r1, [r4]		//load r1 the data in address r4
	ldr r2, [r5]		//load r2 the data in address r5
	orr r3, r2, r1		//store data from logical or of r2 and r1 into register r3
	bl printf		//display string output_or with values

	//end program
	mov r0, #0		//move literal integer 0 to r0 for s return  value
	pop {pc} 		//place original lr value
