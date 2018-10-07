#! /usr/bin/perl

use strict;
use warnings;
#begin at welcome.html
my $filepath = "/nfshome/yw3c/perl/perl2/slides/";
my $file = "welcome.html";
open (INFILE, "<$filepath/$file") or die ("$!:$filepath");
#read the file
my @array = <INFILE>;
#signal to find the footer
my $foot = "footer";
my $control = 0;  #control to delete the rest
my $size = @array;#length of the array;
#print "$size\n";
my $signalNextFile="accesskey=\"n\"";
my $NextFile;
foreach (@array){
    if (index($_, $signalNextFile) != -1){
	$_=~ /"(\w+.html)/;
        $NextFile =$1;  # get the name of next html
    }
}
#print "$NextFile\n";
foreach (@array){
   if (index($_, $foot) != -1){
	last;
   }
   $control++;#find the position
}
#print "$control\n";

#for the first file welcome.html,just delete the footer
for(my $i = $control;$i<$size;$i++){
    pop @array;
}
close(INFILE);
#deal all the file use for loop
while($NextFile ne "welcome.html"){
    #find the header of the file
    my $signalHead = "class=\"title\"";
    my $HeadPosition = 0;
    #open the next file
    open (INFILE, "<$filepath/$NextFile") or die ("$!:$filepath");
    #read the file
    my @arrayNew = <INFILE>;
    my $size = @arrayNew;#length of the array;
    
    foreach (@arrayNew){
	if (index($_, $signalNextFile) != -1){
	    $_=~ /"(\w+.html)/;
	    $NextFile =$1;  # get the name of next html
	}
    }
    
    #find the head position
    foreach (@arrayNew){
	if (index($_, $signalHead) != -1){
	    last;
	}
	$HeadPosition++;#find the position
    }
    #delete the head
    for(my $i = 1;$i<$HeadPosition;$i++){
	shift @arrayNew;
    }

    #find the footer position
    my $footPosition = 0;
    foreach (@arrayNew){
	if (index($_, $foot) != -1){
	    last;
	}
	$footPosition++;#find the position
    }
    #delete the footer
    for(my $i = $footPosition;$i<$size;$i++){
	pop @arrayNew;
    }
    close(INFILE);

    #combine the array
    unshift @array,@arrayNew;
}

foreach(@array){
    print "$_";
}
