use strict;
package Node;

sub new
{
   my $class = shift;
   my $args = shift;
   
   my $self = {
                value => $args->{value},
                left  => $args->{left},
		right => $args->{right}
              };
   bless($self, $class);
   return $self;
}

1;