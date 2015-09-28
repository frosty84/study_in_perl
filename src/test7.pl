use strict;

sub test{
my ($args) = @_;
my $data = $args->{data};
++$data->{order};
}

my $cnt = 1;
my $test = {order=>$cnt};
test({data=>$test});
test({data=>$test});

1;