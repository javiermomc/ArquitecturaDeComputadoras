#Lab Exercise 1
.set noreorder #Avoid reordering instructions
.text #Start generating instructions
.global start #The label should be globally known
.ent start #The label marks an entry point
start: li $8, 0x1 #Load the value 1
li $9, 0x2 #Load the value 2
add $10, $8, $9 #Add the values
.end start #Marks the end of program
