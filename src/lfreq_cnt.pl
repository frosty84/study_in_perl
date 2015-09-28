use strict;
use POSIX;

=begin description
Code sample implements letter frequency counter algorithm
for sample text in ./lfreq_cnt_sample.txt
=cut

open(MYFILE, 'lfreq_cnt_sample.txt');

my %counts;
while(<MYFILE>)
{
    my @letters = split(//, $_);
    foreach my $letter (@letters)
    {
        if($letter =~ /[A-Za-z]/)
        {
            $counts{lc($letter)}++;
        }
    }
}

my $max = (sort {$b <=> $a} map {$counts{$_}} keys(%counts))[0];

for(sort(keys(%counts)))
{
    my $pcnt = ceil($counts{$_} * 80 / $max);
    my $bar = "*" x $pcnt;
    print "$bar$_\n";
}

close(MYFILE);