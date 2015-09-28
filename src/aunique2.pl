use strict;
use List::MoreUtils qw{uniq};
my @a;
my $search = $ARGV[0];
for(0..100){
	push(@a, int(rand(10)));
}
print "\n".join("-", @a);
my @b = uniq(@a);
print "\nUNIQ: ".join("-", @b);