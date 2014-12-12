package DateTimeX::Immutable;

# ABSTRACT: An immutable subclass of DateTime

use strict;
use warnings;
use base 'DateTime';
use Role::Tiny::With;

our $VERSION = '0.91';

with 'DateTimeX::Role::Immutable';

sub st { return shift->strftime("%FT%T%Z"); }
sub dt { return shift->st; }

1;

__END__

=pod

=head1 NAME

DateTimeX::Immutable - An immutable subclass of DateTime

=head1 VERSION

version 0.91

=head1 SYNOPSIS

    use DateTimeX::Immutable;
    my $now = DateTime->now;  # 2012-12-12T11:15:10
    my $day = $now->truncate( to => 'day' );
    say $now;  # 2012-12-12T11:15:10
    say $day;  # 2012-12-12T00:00:00

=head1 DESCRIPTION

This is subclass of L<DateTime> which overrides the methods that modify a
DateTime object. Those new methods leave the original object untouched, and
return a new DateTime object with the expected changes.

The methods that are impacted are:

    add_duration
    subtract_duration
    truncate
    set
    set_year
    set_month
    set_day
    set_hour
    set_minute
    set_second
    set_nanosecond

At the moment, C<set_time_zone>, C<set_locale>, and C<set_formatter> continue
to act as mutators. DateTime uses these internally and changing them creates
unexpected behavior. These methods also do not really change the time value.

TODO: Talk about why this is a good idea, how it is implemented, and how this
differs from alternate approaches.

=head1 SEE ALSO

L<DateTime>, L<DateTime::Moonpig>, L<Time::Moment>

=head1 AUTHOR

Mark Grimes, E<lt>mgrimes@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Mark Grimes, E<lt>mgrimes@cpan.orgE<gt>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
