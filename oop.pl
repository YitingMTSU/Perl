#! /usr/bin/perl

use strict;
use warnings;

#Allow using the modules in current directory
use FindBin;
use lib "$FindBin::Bin";

use myfruits;

#Create a new myfuits object using a class method (constructor)
my $FRUITS = myfruits->new();

# Access data from the new object using an object method (accessor)
print "I have the following in my store:\n";
print "Apples :".$FRUITS->apples()."\n";
print "Banans :".$FRUITS->bananas()."\n";
print "Strawberry :".$FRUITS->strawberry()."\n";
    
# Modify data
#This month I go to walmart 3 times
for( 1..3){
    $FRUITS->goshopping();
}
#eating 4 weeks
for( 1..4){
    $FRUITS->eating();
}
print "(After this month)I have the following in my store:\n";
print "Apples :".$FRUITS->apples()."\n";
print "Banans :".$FRUITS->bananas()."\n";
print "Strawberry :".$FRUITS->strawberry()."\n";

