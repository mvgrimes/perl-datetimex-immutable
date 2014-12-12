use strict;
use warnings;
use Test::More;
use DateTimeX::Immutable;

my $dt = DateTimeX::Immutable->new(
    year      => 2014,
    month     => 12,
    day       => 9,
    hour      => 12,
    minute    => 0,
    second    => 0,
    time_zone => 'America/New_York'
);
isa_ok $dt, 'DateTimeX::Immutable';
is $dt->st, '2014-12-09T12:00:00EST', '... equals correct time';

is $dt->add( minutes => 20 )->st, '2014-12-09T12:20:00EST', 'Add 20min';
is $dt->st, '2014-12-09T12:00:00EST', '... does not mutate';

is $dt->set_minute( 20 )->st, '2014-12-09T12:20:00EST', 'Set 20min';
is $dt->st, '2014-12-09T12:00:00EST', '... does not mutate';

is $dt->set( minute => 20 )->st, '2014-12-09T12:20:00EST', 'Set 20min';
is $dt->st, '2014-12-09T12:00:00EST', '... does not mutate';

is $dt->truncate( to => 'day' )->st, '2014-12-09T00:00:00EST', 'Truncate to day';
is $dt->st, '2014-12-09T12:00:00EST', '... does not mutate';

done_testing;
