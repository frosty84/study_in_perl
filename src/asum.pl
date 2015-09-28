use strict;
use List::Util qw {first max min minstr reduce shuffle sum};

=begin description
Code sample implements array sum and array max functionality
with List::Util reduce function
=cut

my @a;
my $search = $ARGV[0];
for(0..100){
	push(@a, int(rand(10)));
}
print "\n".join("-", @a);
print "\nMAX: ".reduce {$a > $b ? $a : $b} @a;
print "\nSUM: ".reduce {$a + $b} @a;