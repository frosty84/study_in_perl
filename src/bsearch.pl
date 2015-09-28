use strict;

=begin description
Code sample that implements binary search algorithm for a value in randomly generated array
=cut
sub binsearch
{
    my ($a, $searchfor, $left, $right) = @_;
    my @aa = @$a;
    
    if(!defined($left) && !defined($right)){
        $left = 0;
        $right = $#aa;
    }
    
    return -1 if $left < 0 || $right > $#aa || $left > $right;
    
    use POSIX;
    my $middle = ceil($left + ($right - $left) / 2);
    print "\n $left<[$middle]<$right = ".$aa[$middle]." | [?$searchfor]".join("-", @aa);
    my $res = -1;
    if($aa[$middle] == $searchfor){
        $res = $middle;
    }
    elsif($searchfor < $aa[$middle])
    {
        $res = binsearch($a, $searchfor, $left, $middle-1);
    }
    else{
        $res = binsearch($a, $searchfor, $middle+1, $right);
    }
    return $res;
}

for(my $try = 0; $try < 100; $try++){
    print "\n";
    my @a;
    for(0..50){
            push(@a, int(rand(100)));
    }
    @a = sort {$a <=> $b} @a;
    
    my $searchfor = int(rand(100));
    #my $searchfor = 7;
    
    print "\n[?$searchfor]".join("-", @a);
    
    my $res = binsearch(\@a, $searchfor);
    my $msg = $res == -1 ? "\nNo key found" : "\nFound key for $searchfor is [$res]";
    print $msg;
    
    my $reCheck = scalar grep {$_ == $searchfor} @a;
    if($reCheck && $res == -1){
        print "\nFAIL [NOT FOUND]!";
        last;
    }
    elsif(!$reCheck && $res != -1)
    {
        print "\nFAIL [INCORRECT FOUND]!";
        last;
    }
}