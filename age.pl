#! /usr/bin/perl

use strict;
use warnings;

#calculate the month that you live
sub calmonth{
    my ($month,$year) = @_;
    my $todayYear = 2016;
    my $todayMonth = 11;
    my $sumMonth = ($todayYear - $year -1) * 12 + (12 - $month) + $todayMonth;
    return $sumMonth;
}
#Input the birth of month and year
print "Please enter your birth of month:(Example:03--May)\n";
my $month = <STDIN>;
chomp $month;
print "Please enter your birth of year:(Example:1994)\n";
my $year = <STDIN>;
chomp $year;

my $sumMonth = calmonth($month, $year);
#print the result
print "The amount of month that you live is: $sumMonth\n";
