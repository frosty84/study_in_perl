use strict;

my $users = [
    {
        name => 'John',
        score => 10,
    },
    {
        name => 'Bob',
        score => 1,
    },
    {
        name => 'Carlos',
        score => 5
    },
    {
        name => 'Alice',
        score => 5,
    },
    {
        name => 'Donald',
        score => 7
    }
];

sub test
{
    
}

my @sorted = sort {$b->{score} <=> $a->{score} || lc($a->{name}) cmp lc($b->{name})} @$users;

for(@sorted)
{
    print $_->{name}."\n"; 
}

my $test;