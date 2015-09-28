use strict;

open(MYFILE, 'text.txt') or die("No File to open");
my %dict;
while(<MYFILE>){
    #print "\n".$_;
    my @line = split(/\s+/, $_);
    foreach my $w (@line){
        $w =~ s/[^A-Za-z0-9']+//;
        next if !$w;
        if(!$dict{$w}){
            $dict{$w} = 1;
        }
        else{
            $dict{$w}++;
        }
    }
}
close(MYFILE);

print "\n";
my @sortedKeys = sort {$dict{$b} <=> $dict{$a}} keys(%dict);
for(@sortedKeys){
    print $_."{".$dict{$_}."}";
}
