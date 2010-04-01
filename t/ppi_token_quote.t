#!/usr/bin/perl

# Unit testing for PPI, generated by Test::Inline

use strict;
use File::Spec::Functions ':ALL';
BEGIN {
	$|  = 1;
	$^W = 1;
	$PPI::XS_DISABLE = 1;
	$PPI::XS_DISABLE = 1; # Prevent warning
    no warnings 'once';
    $PPI::Lexer::X_TOKENIZER = "PPI::XS::Tokenizer";
}
use PPI;
use PPI::XS::Tokenizer;

# Execute the tests
use Test::More tests => 15;

# =begin testing string 15
{
# Prove what we say in the ->string docs
my $Document = PPI::Document->new(\<<'END_PERL');
  'foo'
  "foo"
  q{foo}
  qq <foo>
END_PERL
isa_ok( $Document, 'PPI::Document' );

my $quotes = $Document->find('Token::Quote');
is( ref($quotes), 'ARRAY', 'Found quotes' );
is( scalar(@$quotes), 4, 'Found 4 quotes' );
foreach my $Quote ( @$quotes ) {
	isa_ok( $Quote, 'PPI::Token::Quote');
	can_ok( $Quote, 'string'           );
	is( $Quote->string, 'foo', '->string returns "foo" for '
		. $Quote->content );
}
}


1;
