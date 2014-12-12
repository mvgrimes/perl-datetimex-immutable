package DateTimeX::Immutable;

use strict;
use warnings;
use base 'DateTime';
use Sub::Install ();
use namespace::autoclean;

our $VERSION = '0.90';

for my $method ( qw(
    add_duration subtract_duration truncate set
    set_year set_month set_day set_hour set_minute set_second set_nanosecond
    ) )
{
    ( my $super = $method ) =~ s/^/SUPER::/;

    Sub::Install::install_sub( {
            code => sub {
                return shift->clone->$super(@_);
            },
            as => $method,
        } );
}

sub st { return shift->strftime("%FT%T%Z"); }
sub dt { return shift->st; }

1;
