package SCALP::News;

use warnings;
use strict;
use Carp;
use base qw(SCALP);

our $VERSION = '0.0.3';

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
	my $next_entry = $self->get_last_entry;
	$self->{'entries'}[$next_entry]->{'id'} = $next_entry;
	$self->{'entries'}[$next_entry]->{'title'} = "$date :: $details{'title'}";
	$self->{'entries'}[$next_entry]->{'content'} = $details{'content'};
}

sub title {
	my $self = shift;
	my $id = shift;
	if (@_) {
		my $title = shift;
		$self->{'entries'}->[$id]->{'title'} = $title;
	}
	return $self->{'entries'}->[$id->{'title'};
}

sub content {
	my $self = shift;
	my $id = shift;
	if (@_) {
		my $content = shift;
		$self->{'entries'}->[$id]->{'content'} = $content;
	}
	return $self->{'entries'}->[$id->{'content'};
}

1;


__END__
=head1 NAME

SCALP::News - The default News template that comes with SCALP

=head1 VERSION

Version 0.0.3

=cut

=head1 SYNOPSIS

Create a news type page and add, edit, and present entries.

The object returned is a hash references that has an array called 'entries' in which it saves the entries.

    use SCALP::News;

    my $newspage = SCALP::News->new( name => 'News' );

or even:

    my $newspage = SCALP::News->new(
                                     title => 'News',
                                     preentry => '<p>',
                                     postentry => '</p>',
                                   );

this sets up the preentry and postentry variables.

=head1 FUNCTIONS

=head2 new

Creates an object of SCALP::News.
Can accept any argument given and adds it.

    $news = SCALP::News->new;

It's best the give them names and/or ids to keep track.

The object returned is a hash references that has an array called 'entries' in which it saves the entries.

for example:

    print "All news entries:\n";
    map {
        print "Entry no. $_: ";
	print $news->{'entries'}->[$_]->{'title'}
	print "\n";
	print "Content: ";
	print $news->{'entries'}->{'content'};
	print "\n\n";
    } @{$news->{'entries'}};

=cut

=head2 add_entry

Adds a news entry to the page.

Returns the ID of the entry. The ID is manufactured internally and helps you reach the entry faster.

    my $id = $news->add_entry;

or

    $id = $news->add_entry( title => 'Vacation!', content => 'I am going on vacation! Whee!' );

=cut

=head2 title

Sets the title of an entry with the corresponding ID

Returns the Title for an ID

    $news->title($id, 'Vacation! - Well, not really...');
or
    print "The title of ID #", $id, "is ", $news->title($id), "\n";

=cut

=head2 content

Sets the title of an entry with the corresponding ID

Returns the Content for an ID

    $news->content($id, 'My vacation was cancelled!');

=cut

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

