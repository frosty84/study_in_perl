use strict;

=begin description
Code sample that filters arrays of @names and prints
names that are less than 4 letters long
=cut

my @names = qw(John Donald Alice Carlos Bob);
my @filtered = grep {length($_) < 4} @names;
for (@filtered){
    print $_."\n";
}