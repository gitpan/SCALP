package SCALP::Menu;

use warnings;
use strict;
use Carp;
use base qw( SCALP );

our $VERSION = '0.0.3';

sub new {
	# creates a new menu object
	# accepts any parameters that fit
	# TODO: add checks of the parameters we accept
	my $self = { entries => [ {} ] };
	bless $self, shift;
	my %params = @_;
	map {
		$self->{$_} = $params{$_};
	} keys (%params);
	return $self;
}

# global entries for the menu
sub headline {
	my $self = shift;
	my $id = shift;
	if (@_) {
		my $headline = shift;
		$self->{'entries'}[$id]->{'headline'} = $headline;
	}
	return $self->{'entries'}[$id]->{'headline'};
}

sub href {

	my $self = shift;
	my $id = shift;
	if (@_) {
		my $href = shift;
		$self->{'entries'}[$id]->{'href'} = $href;
	}
	return $self->{'entries'}[$id]->{'href'};
}

sub add_entry {
	# adds an entry to the menu
	# 1. get next ID
	# 2. add an entry with the id of the next entry
	# 3. fill the entry with the parameters entered for the function
	my $self = shift;
	my %details = @_;
	my $next_entry = $self->get_last_entry;
	return if !defined($next_entry);
	push (@{$self->{'entries'}}, { id => $next_entry });
	map {
		$self->{'entries'}[$next_entry]->{$_} = $details{$_};
	} keys (%details);
	return $next_entry;
}

1;


__END__

=head1 NAME

SCALP::Menu - The default Menu module that comes with SCALP

=head1 VERSION

Version 0.0.3

=cut

=head1 SYNOPSIS

This module provides simple menu capabilities.

    use SCALP::Menu;

    my $menu = SCALP::Menu->new();
    ...

=head1 FUNCTIONS

=head2 new

Creates an object of SCALP::Menu.

Can accept any argument given and adds it.

Any Menu type page has an array of entries, and they are composed of "headline" and "href".

Each headline has its own href and SCALP::Menu allows you to access them easily.

=cut

=head2 add_entry

Adds a new menu entry (refered to as 'entries') :

    $menu->add_entry( headline => 'About us', href => 'about.html' );

(I understand the parody in using a script to create a link to a static html file :)

or you could also use the ID concept available in SCALP:

    my $id = $menu->add_entry;

=cut

=head2 headline

Sets up a headline for an entry:

    $id->headline('About us');

=cut

=head2 href

Sets up an href for an entry:

    $id->href('renderer.pl?page=about.html');

=cut

=head1 AUTHOR

Sawyer, C<< <xsawyerx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-scalp-menu at rt.cpan.org>, or through the web interface at
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

