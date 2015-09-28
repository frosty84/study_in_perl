use strict;

=begin description
code sample to join two arrays
and return result numerically sorted
=cut

my @a = (1,3,4,4,56,23,40);
my @b = (1,2,3,4,6,10,56,41,100);

my @res = ajoin(\@a, \@b);

sub ajoin{
    my ($aa, $bb) = @_;
    my %dups;
    my @res;
    my @joined = (@$aa, @$bb);
    for(@joined){
	if(!$dups{$_}){
	     push(@res, $_);
        }
	$dups{$_}++;
    }
    
    return sort {$a <=> $b} @res;
}

print join("-", @res);