#! usr/bin/perl

use strict;
use warnings;

# Read the data from the file line by line;
open (FILE,"<", 'data.dat') or die "Can't open file: $!\n";
my @num;
while (<FILE>)
{
    unshift @num, <FILE>;
}
close (FILE);
# print "\$num[1]: $num[1]\n";

#########################################
### Samll test to seperate the string ###
### my @word = split /\s+/ , $num[1]; ###
### print "\@word[0]: @word[0]\n";    ###
### print "\@word[1]: @word[1]\n";    ###
### print "\@word[2]: @word[2]\n";    ###
### print "\@word[3]: @word[3]\n";    ###
### print "\@word[4]: @word[4]\n";    ###
### print "\@word[5]: @word[5]\n";    ###
### print "\@word[6]: @word[6]\n";    ###
#########################################

#seperate the number no matter how many space
my @splicing;
my @number;
foreach my $line(@num)
{
    @splicing = split /\s+/, $line;
    foreach my $nn(@splicing)
    {
	unshift @number, $nn;
    }
}
# print "\@number: @number\n";
# print "$number[1]\n";
# print "$number[2]\n";

#find the largest and the smallest
my $Smallest = $number[1];
my $Largest = $number[1];
my $sum = 0;
my $count = 0;
my $millianvalue = 0;    
foreach my $i (@number)
{
    $Smallest = $Smallest < $i ? $Smallest : $i;
    $Largest = $Largest > $i ? $Largest : $i;
    $sum = $sum + $i;
    $count ++;
    #find the 1000000th value
    if ($count == 1000000)
    {
	$millianvalue = $i;
    }
}
my $median = 0;
#sort the array from small to large
my @sortnumber = sort {$a <=> $b} @number;
# print "@sortnumber\n";
#find the median data value
if ($count % 2 == 0)
{
    $median = ($sortnumber[$count/2] + $sortnumber[$count/2 + 1])/2;
}
else
{
    $median = $sortnumber[($count + 1)/2];
}
#print the result
print "The smallest value is: $Smallest \n";
print "The largest value is: $Largest \n";
print "The sum of all the values is: $sum \n";
print "The 1,000,000th value is: $millianvalue \n";
print "The median data value is: $median \n";

    
    
