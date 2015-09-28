use strict;
my @names = qw(John Donald Alice Carlos Bob);
my @filtered = grep {length($_) < 4} @names;
for (@filtered){
    print $_."\n";
}