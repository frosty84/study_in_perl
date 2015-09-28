use strict;
my @a;
my $search = $ARGV[0];
for(0..100){
	push(@a, int(rand(10)));
}
print "\n".join("-", @a);
print "\nSearch for $search";
my @seq;

for(my $i = 0; $i <= $#a; $i++){
	@seq = getSeq(\@a, $i, $search);
	if(scalar(@seq)){
		print "\nFollowing sequence found: ".join("-", @seq);
		last;
	}
}

if(!scalar(@seq)){
	print "\nNo required sequence found";
}

sub getSeq
{
	my ($a, $index, $search) = @_;
	my @result;
	my $sum;
	for(my $k = $index; $k <= scalar(@$a); $k++){
		push(@result, @$a[$k]);
		$sum += @$a[$k];
		if($sum == $search){
			last;
		}
		elsif($sum > $search)
		{
			@result = ();
			last;	
		}	
	}
	return @result;
}