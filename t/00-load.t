#!perl -T

use Test::More tests => 4;

BEGIN {
	use_ok( 'SCALP' );
	use_ok( 'SCALP::Plain' );
	use_ok( 'SCALP::News' );
	use_ok( 'SCALP::Menu' );
}

diag( "Testing SCALP $SCALP::VERSION, Perl $], $^X" );
