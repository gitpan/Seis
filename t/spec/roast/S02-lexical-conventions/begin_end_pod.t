#! ./blib/script/seis
use v6;

# Test various forms of comments

use Test;

plan 1;

# L<S02/Double-underscore forms/"The double-underscore forms are going away:">

ok 1, "Before the =END Block";

=begin END

flunk "After the end block";


# vim: ft=perl6
