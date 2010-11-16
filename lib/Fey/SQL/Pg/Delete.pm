package Fey::SQL::Pg::Delete;
# ABSTRACT: Generate PostgreSQL specific DELETE statements
use Moose;
use namespace::autoclean;

use Moose;
use MooseX::StrictConstructor;

extends 'Fey::SQL::Delete';
with 'Fey::SQL::Pg::Role::Returning';

around sql => sub {
    my $orig = shift;
    my ($self, $dbh) = @_;
    return ( join ' ',
             $self->$orig($dbh),
             $self->returning_clause($dbh)
           );
};


__PACKAGE__->meta->make_immutable;
1;

=head1 DESCRIPTION

Specific PostgreSQL extensions to C<DELETE> statements.

=head1 EXTENSIONS

=head2 DELETE ... RETURNING

Allows you to perform a C<SELECT> like query on deleted rows.

Specify columns to be returned by using C<returning>. This takes the
same input as C<select> in L<Fey::SQL::Select>.

=cut

