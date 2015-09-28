use strict;

my $zip = $ARGV[0];
if($zip =~ /^\d{5}$/){
	print "\nCorrect ZIP: $zip";
}
else{
	print "\nNot a ZIP: $zip";
}