package SCALP::Plain;

use warnings;
use strict;
use Carp;
use base qw( SCALP );

our $VERSION = '0.0.3';

sub content {
	my $self = shift;
	if (@_) {
		my $text = shift;
		$self->{'content'} = $text;
	}
	return $self->{'content'};
}

1;

__END__

=head1 NAME

SCALP::Plain - A _very_ plain content page of SCALP

=head1 VERSION

Version 0.0.3

=cut

=head1 SYNOPSIS

This module provides the simplest content page.

    use SCALP::Plain;

    my $about = SCALP::Plain->new();

or

    $about = SCALP::Plain->new( title => "About" );

(that way, the page even has a title - built in function by SCALP main module)

And using it

    $about->content("Welcome to the About page. Nothing about us is interesting.");
    print $about->content

Of course, this may seem trivial to you (and it just may be), but once you wrap a few pages inside the SCALP main module as a complete website and store it, it's easier to use it in a page rendering engine. At least for me :)

=head1 FUNCTIONS

=head2 content

Set the content of the page.

Returns the content of the page.

=cut

=head1 AUTHOR

Sawyer, C<< <xsawyerx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-scalp-plain at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SCALP>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc SCALP

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/SCALP>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/SCALP>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=SCALP>

=item * Search CPAN

L<http://search.cpan.org/dist/SCALP>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2007 Sawyer, all rights reserved.

This program is released under the following license: GPL v2 or later

=cut

