package DateTimeX::Role::Immutable;

# ABSTRACT: A role that can be composed into a DateTime subclass to make it immutable

use strict;
use warnings;
use Role::Tiny;

our $VERSION = '0.91';

my @mutators = [ qw(
      add_duration subtract_duration truncate set
      set_year set_month set_day set_hour set_minute set_second set_nanosecond
      ) ];
      # set_time_zone set_locale set_formatter

around @mutators => sub {
    my $orig = shift;
    my $self = shift;

    return $self->clone->$orig(@_);
};

1;

__END__

=pod

=head1 NAME

DateTimeX::Role::Immutable - A role that can be composed into a DateTime subclass to make it immutable

=head1 VERSION

version 0.91

=head1 SYNOPSIS

    package Your::DateTime;
    use base 'DateTime';
    use Role::Tiny::With;
    with 'DateTimeX::Role::Immutable';

=head1 DESCRIPTION

This is role that can be composed into a L<DateTime> subclass which will 
override the methods that modify a DateTime object. Those new methods leave the
original object untouched, and return a new DateTime object with the expected
changes.

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

=head1 SEE ALSO

L<DateTimeX::Role::Immutable>, L<DateTime>, L<DateTime::Moonpig>,
L<Time::Moment>

=head1 AUTHOR

Mark Grimes, E<lt>mgrimes@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Mark Grimes, E<lt>mgrimes@cpan.orgE<gt>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
