use strict;

my @a = (1,1,1,3,5,8,16,32,44);
my @b = (1,2,5,8,23,25,44);

my %a;
%a = map {$_ => ++$a{$_}} @a;
for(@b){
    print $_."\n" if !$a{$_};
}
my $test;