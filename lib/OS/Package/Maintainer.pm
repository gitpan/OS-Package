use v5.14.0;
use warnings;

package OS::Package::Maintainer;

# ABSTRACT: Default Abstract Description, Please Change.
our $VERSION = '0.2.1'; # VERSION

use Moo;
use Types::Standard qw( Str Enum );

has author => ( is => 'rw', isa => Str, required => 1 );

has company => (
    is      => 'rw',
    isa     => Str,
    default => sub { my $self = shift; return $self->author }
);

has [qw/nickname email phone/] => ( is => 'rw', isa => Str );

sub by_line {
    my $self = shift;

    my $by_line = $self->author;

    if ( defined $self->nickname ) {
        $by_line .= sprintf ' (%s)', $self->nickname;
    }

    if ( defined $self->email ) {
        $by_line .= sprintf ' <%s>', $self->email;
    }

    return $by_line;

}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

OS::Package::Maintainer - Default Abstract Description, Please Change.

=head1 VERSION

version 0.2.1

=head1 METHODS

=head2 by_line

Returns string "Author (nickname) <email>".

=head1 AUTHOR

James F Wilkus <jfwilkus@mac.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James F Wilkus.

This is free software, licensed under:

  The (three-clause) BSD License

=cut
