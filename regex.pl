#! usr/bin/perl

use strict;
use warnings;

my $filename = "names.txt";
#read the file
open (INPUT,"< $filename") or die "Can't open file, $filename:$!\n";
while (my $line = <INPUT>)
{
    #print "$line"
    #find the first name and the family name in the string
    my($familyName, $firstName) = ($line =~ /^(\w+),\s*(\w+)/m);
    #inverse the position and print it 
    print "$firstName, $familyName\n";
}
#close the file
close (INPUT);
