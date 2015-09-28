use strict;

=begin description
Code sample that finds out unique values of array @a
And put them to array @b, List::MoreUtils implementation
=cut

use List::MoreUtils qw{uniq};
my @a;
my $search = $ARGV[0];
for(0..100){
	push(@a, int(rand(10)));
}
print "\n".join("-", @a);
my @b = uniq(@a);
print "\nUNIQ: ".join("-", @b);