use strict;

=begin description
Code sample implements simple sort algorithm
for randomly generated 0..10 array
ans counts number of iterations
=cut

my @a;
my @sorted;

for(0..10){
    push(@a, int(rand(100)));
}

print join("-", @a)."\n";

my $size = $#a;
my $count = 0;
for(my $i = 0; $i <= $size; $i++){
    my ($minKey, $min);
    for(0..$#a){
        my $current = $a[$_];
        if($_ == 0 || $current < $min){
            $min = $current;
            $minKey = $_;
        }
        $count++;
    }
    print "\nMIN[$minKey] = $min";
    splice(@a, $minKey, 1);
    push(@sorted, $min);
}

print "\n\n".join("-", @sorted)."\n";
print "TOTAL ITERATIONS: $count";