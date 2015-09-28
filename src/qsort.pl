use strict;

=begin description
Code sample implements quick sort algorithm
for randomly generated 0..10 array
ans counts number of iterations
=cut

my @a;
for(0..10){
    push(@a, int(rand(100)));
    print qq#-$a[$_]-#;
}

local our $count = 0;

sub qsort
{
    my ($aa) = @_;
    
    my $istart = 0;
    my $istop = scalar(@$aa)-1;
        
    my $i = int(rand($istop-$istart));
    my $key = $aa->[$i];
    print "\nkey: $key";
    
    my @sortedLeft;
    my @sortedRight;
    
    for($istart..$istop){
        $count++;
        my $current = $aa->[$_];
        next if $_ == $i;
        if($current <= $key){
            push(@sortedLeft, $current);
        }
        else{
            push(@sortedRight, $current);
        }
    }

    @sortedLeft = qsort(\@sortedLeft) if scalar(@sortedLeft) > 1;
    @sortedRight = qsort(\@sortedRight) if scalar(@sortedRight) > 1;
    
    return (@sortedLeft, $key, @sortedRight);
}

my @std = qsort(\@a);

print "\n";
for(@std){
    print qq#-$_-#;
}
print "\nTOTAL ITERATIONS: $count";
