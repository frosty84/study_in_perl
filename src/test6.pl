use strict;
use List::Util qw {first max min minstr reduce shuffle sum};

my @a;
my $search = $ARGV[0];
for(0..100){
	push(@a, int(rand(10)));
}
print "\n".join("-", @a);
print "\nMAX: ".reduce {$a > $b ? $a : $b} @a;
print "\nSUM: ".reduce {$a + $b} @a;