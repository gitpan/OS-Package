use v5.14.0;
use warnings;

package OS::Package::Role::Prune;

# ABSTRACT: Default Abstract Description, Please Change.
our $VERSION = '0.2.1'; # VERSION

use OS::Package::Log;
use Path::Tiny;
use Try::Tiny;
use Role::Tiny;

sub prune {

    my $self = shift;

    if ( !defined $self->fakeroot ) {
        $LOGGER->warn('fakeroot is not defined');
        return;
    }

    if ( !-d $self->fakeroot ) {
        $LOGGER->warn('fakeroot does not exist');
        return 1;
    }

    if ( defined $self->prune_files ) {

        $LOGGER->info( sprintf 'prune files: %s', $self->name );

        foreach my $file ( @{ $self->prune_files } ) {

            my $pfile =
                sprintf( '%s/%s/%s', $self->fakeroot, $self->prefix, $file );
            $LOGGER->debug( sprintf 'removing file: %s', $pfile );

            unlink path($pfile)->stringify;
        }
    }

    if ( defined $self->prune_dirs ) {

        $LOGGER->info( sprintf 'prune directories: %s', $self->name );

        foreach my $dir ( @{ $self->prune_dirs } ) {

            my $pdir =
                sprintf( '%s/%s/%s', $self->fakeroot, $self->prefix, $dir );
            $LOGGER->debug( sprintf 'removing directory: %s', $pdir );

            path($pdir)->remove_tree( { safe => 0 } );
        }
    }

    return 1;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

OS::Package::Role::Prune - Default Abstract Description, Please Change.

=head1 VERSION

version 0.2.1

=head1 METHODS

=head2 prune

Attempts to clean workdir and fakeroot directories.

=head1 AUTHOR

James F Wilkus <jfwilkus@mac.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James F Wilkus.

This is free software, licensed under:

  The (three-clause) BSD License

=cut
