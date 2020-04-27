import sys
target_file = sys.argv[1]
sram_string=""
f = open(target_file, 'w')
for i in range(256):
	sram_string = "Xsram"+str(i+1) + " 1"+" 2" +" 3" + " 4" + " 9"+ " 10"+" sram" + "\n"
	f.write(sram_string)


f.close()
