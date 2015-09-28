use strict;

=begin description
Code sample that analizes two randomly generated arrays @a and @b
And returns elements, that are not presented in both arrays (XOR) at the same time
=cut

my (@a, @b);
for(0..10){
    push(@a, int(rand(10)));
    push(@b, int(rand(10)));
}

print "\nA: ".join("-", @a);
print "\nB: ".join("-", @b);

sub axor{
    my ($a, $b) = @_;
    
    my %res;
    my @overall = (@$a, @$b);
    my %keysa = map {$_ => 1} @$a;
    my %keysb = map {$_ => 1} @$b;
    for(@overall){
        $res{$_} = 1 unless $keysa{$_} && $keysb{$_};
    }
    
    return keys %res;
}

my @res = axor(\@a, \@b);
print "\nXOR: ".join("-", @res);
