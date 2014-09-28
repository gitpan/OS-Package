#!/bin/env perl -w
use IPC::Cmd qw(run can_run);
use File::Basename qw( basename dirname );
use Path::Tiny;
use File::Temp;
use YAML::Any qw(LoadFile);

#use Smart::Comments;
use Template;
use Try::Tiny;

use v5.14.0;
use warnings;

my $vars = { FAKEROOT => '/tmp' };

my $config = LoadFile('config.yml');

### $config

#my $temp_sh = 'temp.sh';

my $temp_sh = File::Temp->new();

### $temp_sh

my $template = Path::Tiny->tempfile;
### $template

$template->spew( $config->{install} );

my $tt = Template->new( { INCLUDE_PATH => dirname($template) } );
### $tt

$tt->process( basename($template), $vars, $temp_sh );

my $command = [ can_run('bash'), '-e', $temp_sh->filename ];

try {
    my ( $success, $error_message, $full_buf, $stdout_buf, $stderr_buf ) =
        run( command => $command );

    if ( !$success ) {
        printf "install script failed: %s\n", $error_message;

        foreach ( @{$full_buf} ) {
            printf "$_\n";
        }

        ### $full_buf;
    }

}
catch {
    if (@_) {
        printf "install script failed: %s\n", @_;
    }
}
