# NAME

DateTimeX::Immutable - An immutable subclass of DateTime

# VERSION

version 0.35

# SYNOPSIS

    use DateTimeX::Immutable;
    my $now = DateTimeX::Immutable->now;  # 2012-12-12T11:15:10
    my $day = $now->with_hour( 0 )->with_minute( 0 )->with_second( 0 );
    say $now;           # 2012-12-12T11:15:10
    say $day;           # 2012-12-12T00:00:00
    $now->set_day( 1 ); # throws an exception

or with aliased:

    use aliased 'DateTimeX::Immutable' => 'DateTime';
    my $now = DateTime->now;  # 2012-12-12T11:15:10
    my $day = $now->with_hour( 0 )->with_minute( 0 )->with_second( 0 );
    say $now;           # 2012-12-12T11:15:10
    say $day;           # 2012-12-12T00:00:00
    $now->set_day( 1 ); # throws an exception

# DESCRIPTION

This is subclass of [DateTime](https://metacpan.org/pod/DateTime) which throws an exception when methods that
modify the object are called. Those methods are replaced with new methods that
leave the original object untouched, and return a new `DateTimeX::Immutable`
object with the expected changes.

The following methods now thrown an exception:

    $dt->add_duration()
    $dt->subtract_duration()
    $dt->add()
    $dt->subtract()
    $dt->set()
    $dt->set_year()
    $dt->set_month()
    $dt->set_day()
    $dt->set_hour()
    $dt->set_minute()
    $dt->set_second()
    $dt->set_nanosecond()
    $dt->truncate()

and are replaced by these methods which return the changed value:

    $dt->plus_duration()
    $dt->minus_duration()
    $dt->plus()
    $dt->minus()
    $dt->with_component()
    $dt->with_year()
    $dt->with_month()
    $dt->with_day()
    $dt->with_hour()
    $dt->with_minute()
    $dt->with_second()
    $dt->with_nanosecond()
    $dt->trunc()

At the moment, `set_time_zone`, `set_locale`, and `set_formatter` continue
to act as mutators. DateTime uses these internally and changing them creates
unexpected behavior. These methods also do not really change the time value.

TODO: Talk about why this is a good idea, how it is implemented, and how this
differs from alternate approaches.

See [DateTime](https://metacpan.org/pod/DateTime) for the rest of the documentation.

# SEE ALSO

[DateTime](https://metacpan.org/pod/DateTime), [DateTime::Moonpig](https://metacpan.org/pod/DateTime::Moonpig), [Time::Moment](https://metacpan.org/pod/Time::Moment)

# AUTHOR

Mark Grimes, <mgrimes@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Mark Grimes, <mgrimes@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
