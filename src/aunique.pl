use strict;

my @a;
for(0..100){
	push(@a,int(rand(100)));
}
print "\n".join("-", sort {$a <=> $b} @a);

my @b;
my %check;
for(@a){
	if(!$check{$_}){
		push(@b, $_);
		$check{$_}++;
	}
}

print "\nResult:";
print "\n".join("-", sort {$a <=> $b} @b);