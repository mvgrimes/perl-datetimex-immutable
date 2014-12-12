# NAME

DateTimeX::Immutable - An immutable subclass of DateTime

# VERSION

version 0.33

# SYNOPSIS

    use DateTimeX::Immutable;
    my $now = DateTime->now;  # 2012-12-12T11:15:10
    my $day = $now->truncate( to => 'day' );
    say $now;  # 2012-12-12T11:15:10
    say $day;  # 2012-12-12T00:00:00

# DESCRIPTION

This is subclass of [DateTime](https://metacpan.org/pod/DateTime) which overrides the methods that modify a
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

At the moment, `set_time_zone`, `set_locale`, and `set_formatter` continue
to act as mutators. DateTime uses these internally and changing them creates
unexpected behavior. These methods also do not really change the time value.

TODO: Talk about why this is a good idea, how it is implemented, and how this
differs from alternate approaches.

# SEE ALSO

[DateTime](https://metacpan.org/pod/DateTime), [DateTime::Moonpig](https://metacpan.org/pod/DateTime::Moonpig), [Time::Moment](https://metacpan.org/pod/Time::Moment)

# AUTHOR

Mark Grimes, <mgrimes@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Mark Grimes, <mgrimes@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
