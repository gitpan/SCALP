package SCALP;

use warnings;
use strict;
use Carp;

our $VERSION = '0.0.2';

## GENERAL VARIABLES
sub title {
	my $self = shift;
	if (@_) { $self->{'title'} = shift; }
	return $self->{'title'};
}

sub preentry {
	my $self = shift;
	if (@_) { $self->{'preentry'} = shift; }
	return $self->{'preentry'};
}

sub postentry {
	my $self = shift;
	if (@_) { $self->{'postentry'} = shift; }
	return $self->{'postentry'};
}

## GENERAL ACTIONS
sub get_entry {
	# returns a pointer to a specific entry
	my $self = shift;
	my $id = shift;
	map { return $_ if $_->{'id'} == $id; } @{$self->{'entries'}};
}

sub get_entries {
	# return an array of pointers to entries
	my $self = shift;
	return @{$self->{'entries'}};
}

sub get_last_entry {
	my $self = shift;
	my $lastid = 0;
	map {
		my $currentid = $_->{'id'};
		return if !defined($currentid);
		if ($lastid < $currentid) { $lastid = $currentid; }
		$lastid++;
	} @{$self->{'entries'}};
	return $lastid;
}

## BASIC SERVICES FOR SUBMODULES

# creating a basic new object
sub new {
	my $self = {};
	bless $self, shift;
        my %params = @_;
        map {
                $self->{$_} = $params{$_};
        } keys (%params);
        return $self;
}

## OVERALL DEBUGGING
sub print_recursive {
	my $self = shift;
	sub print_var {
		map {
			my $param = $_;
			if (my $type = ref($param)) {
				print_var(@{$param}) if $type eq "ARRAY";
				if ($type eq "HASH") {
					#foreach my $key (keys %{$param}) { print "\t$key => ".$param->{$key}."\n"; }
					map { print "\t$_ {\n"; print_var($param->{$_}); print "\t}\n"; } sort keys %{$param};
				}
			}
			else { print "\t\t$_\n"; }
		} @_;
	}
	map { print "$_ {\n"; print_var($self->{$_}); print "}\n"; } sort keys %{$self};
}

1;


__END__

=head1 NAME

SCALP - Simple CMS Assistant for Lazy Programmers

=head1 VERSION

Version 0.0.2

=cut

=head1 SYNOPSIS

This module provides PERL programmers the ability to write a CMS with greater ease.

This is the way I use the module:
1. I create a skeleton of how a page is built (or "design", if you will) in HTML.
2. I replace the location of menus and content with tags (<#mainmenu#>, <#leftcontent#>) and so on.
3. I write a small web interface (or CLI, depends who maintains it - but web seems the easiest, no?) that allows me to store in a file (conf or using store()) the way the content merges with the HTML design.
For example: preentry = "<ul>" <-- that way I know the menu entries have <ul> before them.
After I've entered all the design preferences in the web interface and stored it using store() or a conf file, I write the engine.
4. The engine reads the conf and uses SCALP in order to save the data of the pages and preferences of each page and of the whole site.
5. I use SCALP's functions in order to create new pages or new entries in the content system and so on.
6. The engine I write replaces the tags with the values of the SCALP objects.

* Using SCALP makes the engine writing easier, more general and thus, more dynamic and suitable for different situations. Also, it enables me to have different types of pages and different behaviors upon each page.
* Using a conf file (or a stored file) allows me to adjust the designing, thus making the design replaceable. If I want to change the design, it will only take me a few minutes to adjust the configuration and the way the page is printed (the engine's job) 

For example:

    use SCALP;

    my $page = SCALP->new( title => "Why SCALP sucks" );
    ...

=head1 EXPORT

Nothing is exporter so far. Hopefully nothing will ever be.

=head1 FUNCTIONS

=head2 new

Creates a new SCALP object, probably a page of some sort.
It returns a reference to a hash that hold whichever values you give to it upon creation.

=cut

=head2 title

Sets a title to the SCALP object. Should be used as a page title.

=cut

=head1 AUTHOR

Sawyer, C<< <xsawyerx at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-scalp at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=SCALP>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

or

Just email me instead.

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

