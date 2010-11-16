package Fey::SQL::Pg;
BEGIN {
  $Fey::SQL::Pg::VERSION = '0.004';
}
# ABSTRACT: Generate SQL with PostgreSQL specific extensions
use Moose;
use Method::Signatures::Simple;
use namespace::autoclean;

use Fey::SQL::Pg::Insert;
use Fey::SQL::Pg::Delete;

extends 'Fey::SQL';

method new_insert {
    return Fey::SQL::Pg::Insert->new(@_);
}

method new_delete {
    return Fey::SQL::Pg::Delete->new(@_);
}

__PACKAGE__->meta->make_immutable;
1;

=head1 SYNOPSIS

    use Fey::SQL::Pg;
    my $insert = Fey::SQL::Pg
        ->new_insert( auto_placeholders => 0 )
        ->into( $s->table('User') );
        ->returning( $s->table('User')->column('user_id'));

=head1 DESCRIPTION

Adds some PostgreSQL specific extensions to L<Fey>. For the excat features
implemented, see:

=over 4

=item L<Fey::SQL::Pg::Insert>

=item L<Fey::SQL::Pg::Delete>

=back

=cut

