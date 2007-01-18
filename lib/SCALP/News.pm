package SCALP::News;

use warnings;
use strict;
use Carp;
use base qw( SCALP );

our $VERSION = '0.01';

sub new {
	my $self = { entries => [ {} ] };
	bless $self, shift;
	my %params = @_;
	map {
		$self->{$_} = $params{$_};
	} keys (%params);
	return $self;
}

sub add_entry {
	my $self = shift;
	my %details = @_;
	return 0 if ((!$details{'title'}) && (!$details{'content'}));
	my $date = $details{'date'} || scalar localtime time;
	my $next_entry = &get_last_entry($self);
	$self->{'entries'}[$next_entry]->{'id'} = $next_entry;
	$self->{'entries'}[$next_entry]->{'title'} = "$date :: $details{'title'}";
	$self->{'entries'}[$next_entry]->{'content'} = $details{'content'};
}

# functions to help debug
sub print_all {
	my $self = shift;
	print qq(* name of page: $self->{'name'}\n);
	print "* entries:\n";
	map {
		my $hashref = $_;
		foreach my $key (keys %$hashref) {
			print "-> $key => ".$_->{"$key"}."\n";
		}
	} @{$self->{'entries'}};
}

1;


__END__
=head1 NAME

SCALP::News - The great new SCALP::News!

=head1 VERSION

Version 0.01

=cut

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use SCALP::News;

    my $foo = SCALP::News->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Sawyer, C<< <xsawyerx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-scalp-news at rt.cpan.org>, or through the web interface at
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

