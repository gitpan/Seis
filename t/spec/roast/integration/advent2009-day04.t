#! ./blib/script/seis
# http://perl6advent.wordpress.com/2009/12/04/day-4-testing/

use v6;

sub fac(Int $n) {
    [*] 1..$n
}

use Test;
plan 6;

is fac(0), 1,  'fac(0) works';
is fac(1), 1,  'fac(1) works';
is fac(2), 2,  'fac(2) works';
is fac(3), 6,  'fac(3) works';
is fac(4), 24, 'fac(4) works';

#?pugs todo
dies_ok { eval(q[ fac('oh noes i am a string')]) }, 'Can only call it with ints';
