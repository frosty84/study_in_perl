use strict;

my @a;
my $count;
for (0..10){
    push(@a, int(rand(100)));
}

print join("-", @a);

my $i = 0;
my $j = 1;
while ($i <= $#a){
    if($a[$i] > $a[$i+1] && defined $a[$i+1]){
        my $tmp = $a[$i];
        $a[$i] = $a[$i+1];
        $a[$i+1] = $tmp;
        $i-- if $i > 0;
    }
    else{
        $i++;
    }
    $count++;
}

print "\n".join("-", @a);
print "\nTOTAL ITERATIONS: $count";