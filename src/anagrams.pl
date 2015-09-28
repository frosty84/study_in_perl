use strict;

=begin description
Code sample checks if two provided strings are anagrams
=cut

my $s1 = $ARGV[0];
my $s2 = $ARGV[1];

print "S1: $s1\n";
print "S2: $s2\n";

my (%h1, %h2);
%h1 = map {lc($_) => ++$h1{$_}} split(//, $s1);
%h2 = map {lc($_) => ++$h2{$_}} split(//, $s2);

if(scalar(keys(%h1)) == scalar(keys(%h2)))
{
    my $isAnAnagram = 1;
    foreach my $key (keys(%h1))
    {
        print "h1{$key}[$h1{$key}] ~ h2{$key}[$h2{$key}]\n";
        if($h1{$key} != $h2{$key})
        {
            $isAnAnagram = 0;
        }
    }
    print "Strings are ".($isAnAnagram ? "" : "NOT ")."anagrams";
}
else
{
    print "Not an anagram!";
}

my $test;