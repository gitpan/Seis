#! ./blib/script/seis
use v6;
use Test;

plan 6;

is Any.Str,     '',      'Any.Str is empty string';
is Any.Stringy, '',      'Any.Str is empty string';
is Any.gist,    '(Any)', 'Any.gist has those parens';

# maybe a bit too retrictive?
is Any.perl,    'Any',   'Any.perl does not have parens';

is Any.^name,   'Any',   '.^name';

isa_ok (class A { }).new, A, 'can instantiate return value of class declaration';
