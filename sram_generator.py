import sys
target_file = sys.argv[1]
sram_string=""
f = open(target_file, 'w')
for i in range(256):
	sram_string = "sram_cell"+str(i+1) + " 3" + " 4" +" sram" + "\n"
	f.write(sram_string)


f.close()