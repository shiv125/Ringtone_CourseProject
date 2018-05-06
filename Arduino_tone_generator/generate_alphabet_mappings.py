import random
#26*4
print '{ ',
for i in range(25):
	print "{",
	for j in range(4):
		if j<3:
			print str(random.randint(1,3))+",",
		else:
			print str(random.randint(1,3)),
	if j<24:
		print "},",
	else:
		print "}",
print '}'
