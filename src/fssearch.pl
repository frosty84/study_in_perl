use strict;

my $directory = $ARGV[0] || ".";
my $searchfor = $ARGV[1];
die("No search string") if !$searchfor;

sub rreaddir{
    my ($directory, $searchfor) = @_;
    my @res;
    print "========Searching for $searchfor in $directory==========\n";
    my $DIR;
    opendir($DIR, $directory) or die "Can't open directory\n";
    while(my $file = readdir($DIR)){
        next if $file =~ /^[.]+$/ || $file =~ /\.svn$/;
        if(-d "$directory/$file"){
            my @tmp = rreaddir("$directory/$file", $searchfor);
            push(@res, @tmp);
        }
        else{
            if($file =~ /$searchfor/){
                push(@res, $file);
            }
        }
    }
    closedir($DIR);
    return @res;
}

my @res = rreaddir($directory, $searchfor);
print join(" ", @res);