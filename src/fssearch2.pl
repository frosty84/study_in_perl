use strict;

=begin description
Code sample that searches for a timestamp related phrase (GETDATE, NOW, CURRENT_TIMESTAMP, SYSDATE)in a directory $ARGV[0]
And prints results with a list of matched files to ./result_files_summary.txt
=cut

my $directory = $ARGV[0] || ".";

sub rreaddir{
    my ($directory, $searchfor) = @_;
    print "========Scanning in $directory==========\n";
    
    my %res;
    my @searchFor = (qr/GETDATE\s?\(\)/, qr/NOW\s?\(\)/, qr/CURRENT_TIMESTAMP/, qr/SYSDATE/);
    my $DIR;
    opendir($DIR, $directory) or die "Can't open directory\n";
    unlink('result_files_line_matching.txt');
    open(my $RESS, '>>', 'result_files_line_matching.txt') or die "Could not open file result_files_line_matching.txt!";
    while(my $file = readdir($DIR)){
        next if $file =~ /^[.]+$/ || $file =~ /\.svn$/ || $file =~ /\.dll$/ || $file =~ /\.html$/;
        if(-d "$directory/$file"){
            my %tmp = rreaddir("$directory/$file", $searchfor);
            foreach my $key (keys(%tmp)){
                $res{$key} += $tmp{$key};
            }
        }
        else{
            print "LOOKING IN: $file\n";
            open(FILE, "$directory/$file");
            my $l = 1;
            while(<FILE>){
                foreach my $expr (@searchFor){
                    if($_ =~ /$expr/){
                        $_ =~ s/^\s+//;
                        $_ =~ s/\s+$//;
                        my $message = "Matched $expr in L$l of $directory/$file: \n$_\n\n";
                        print $RESS $message;
                        print $message;
                        ++$res{"$directory/$file"};
                    }
                }
                $l++;
            }
            close(FILE);
            #print "$file\n";
        }
    }
    close($RESS);
    closedir($DIR);
    return %res;
}

unlink('result_files_summary.txt');
open(my $RESS2, '>', 'result_files_summary.txt') or die "Could not open file result_files_line_matching.txt!";
my %res = rreaddir($directory);
for(keys(%res)){
    print $RESS2 "\n$_: $res{$_}";
}
close($RESS2);