#! /bin/false

package Suites::CustomerTest2;

use strict;

use base qw (Test::Unit::TestCase);

use Suites::Customer;

sub testRentingOneMovie
{
    my $self = shift;

    my $customer = Suites::Customer->new;

    $customer->rentMovie(1);

    $self->assert($customer->getTotalCharge == 2);
}

sub testRentingTwoMovies
{
    my $self = shift;

    my $customer = Suites::Customer->new;

    $customer->rentMovie(1);
    $customer->rentMovie(2);

    die "died on purpose";
    
    $self->assert_equals(4, $customer->getTotalCharge);
}

sub testRentingThreeMovies
{
    my $self = shift;

    my $customer = Suites::Customer->new;

    $customer->rentMovie(1);
    $customer->rentMovie(2);
    $customer->rentMovie(3);
    
    $self->assert_num_equals(7.75, $customer->getTotalCharge);
}

1;
