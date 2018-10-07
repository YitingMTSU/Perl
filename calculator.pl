#!/usr/bin/perl  -T

use strict;
use warnings;
use CGI qw/:standard/;

#make path safe
$ENV{'path'} = "/bin:/usr/bin";

print header(),
    start_html('Multiplication');
h1('Multiplication');
print start_form(),
    #prompt for input
    "What are the two numbers(seperate by comma,.i.e: num1,num2)",
    textfield('user'),
    submit(),
    end_form(),
    hr();
#get the input
my $user = param('user');
if ($user){
    if ($user =~ m/^(\d+),.*(\d+)/){
	#take these two numbers
	my ($num1,$num2) = $user =~ m/^(\d+),.*(\d+)/;
    }
    else{
	die("wrong input $!");
    }
    #excute the command
    my $output = `echo "scale = 10; $num1*$num2" | bc -l`;
    print p("The result for two number multiply is: $output ");
}
else{
    die ("wrong input $!");
}
print end_html();
1;
