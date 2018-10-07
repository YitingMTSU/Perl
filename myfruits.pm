#! /usr/bin/perl

package myfruits;
use strict;
use warnings;

# Constructor method
sub new {
    my $self = { apples => 3,
                 bananas => 6,
                 strawberry => 1};
    bless $self, "myfruits" ;
}
# Accessor Methods
sub apples{
    my $self = shift @_;
    return $self->{apples};
}

sub bananas{
    my $self = shift @_;
    return $self->{bananas};
}

sub strawberry{
    my $self = shift @_;
    return $self->{strawberry};
}

#Mutator Method
sub goshopping{
    my $self = shift;
    $self->{apples} += 3;
    #I always buy three apples, three bananas and one strawberry each time
    $self->{bananas} += 2;
    $self->{strawberry} += 1;
}

sub eating{
    my $self = shift;
    #I always eat 2 apples, 3 bananas and 1 strawberry a week
    $self->{apples} -= 2;
    $self->{bananas} -= 3;
    $self->{strawberry} -= 1;
}

1; #return true
