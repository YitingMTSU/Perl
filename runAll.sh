runALL : hello.o data.o age.o hash.o
         perl -o runALL hello.o data.o age.o hash.o
hello.o : hello.pl
         perl -c hello.pl
data.o : data.pl
	 perl -c data.pl
age.o : age.pl
         perl -c age.pl
hash.o : hash.pl
	 perl -c hash.pl 
