#! ./blib/script/seis
use v6;
use Test;
plan 1;

# L<S32::IO/IO/"getc">

sub nonce () { return (".{$*PID}." ~ 1000.rand.Int) }

if $*OS eq "browser" {
  skip_rest "Programs running in browsers don't have access to regular IO.";
  exit;
}

my $tmpfile = "temp-test" ~ nonce();
{
  my $fh = open($tmpfile, :w) or die "Couldn't open \"$tmpfile\" for writing: $!\n";
  $fh.print: "TestÄÖÜ\n\n0";
  close $fh or die "Couldn't close \"$tmpfile\": $!\n";
}

{
  my $fh = open $tmpfile or die "Couldn't open \"$tmpfile\" for reading: $!\n";
  my @chars;
  push @chars, $_ while defined($_ = getc $fh);
  close $fh or die "Couldn't close \"$tmpfile\": $!\n";

  is ~@chars, "T e s t Ä Ö Ü \n \n 0", "getc() works even for utf-8 input";
}

END { unlink $tmpfile }

# vim: ft=perl6
