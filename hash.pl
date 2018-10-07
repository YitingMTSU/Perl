#! /usr/bin/perl

use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

my $filename =  "thresholdAveragePrecision.txt";

#Open the file and seperate the word by space.
open (INPUT,"< $filename") or die "Can't open file, $filename:$!\n";
my @word = ();
while (my $line = <INPUT>)
{
    my @string = split /\s+/, $line;  
    push @word, @string;
}
close (INPUT);

#Begin to deal with the array
#delete all the punctuation in the string
foreach my $words (@word){
    $words=~s/[[:punct:]]//g;
   # print "$words\n";
}

#delete the number in the array
my $index = 0;
while ($index <= $#word){
    my $string  = $word[$index];
    if (looks_like_number($string))
    {
	splice @word, $index, 1;
	#print "$words is a number!\n";   }
    }
    else{
	$index++;
    }
}

#delete the empty element in the array
@word = grep{$_ ne "" } @word;

#foreach my $n(@word)
#{
#    print "$n\n";
#}
#create an empty hash
my %wordHash;
#create the hash and count the number
foreach my $str(@word){
    if (exists($wordHash{$str}))
    {
	$wordHash{$str}++;
    }
    else
    {
	$wordHash{$str} = 1;
    }
}
#sort the hash and print it 
foreach my $str(sort keys %wordHash)
{
    printf "%-50s : %s\n", $str, $wordHash{$str};
}

