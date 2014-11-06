
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'bin/ospkg',
    'lib/OS/Package.pm',
    'lib/OS/Package/Application.pm',
    'lib/OS/Package/Artifact.pm',
    'lib/OS/Package/Artifact/Role/Download.pm',
    'lib/OS/Package/Artifact/Role/Extract.pm',
    'lib/OS/Package/Artifact/Role/Validate.pm',
    'lib/OS/Package/CLI.pm',
    'lib/OS/Package/Config.pm',
    'lib/OS/Package/Factory.pm',
    'lib/OS/Package/Init.pm',
    'lib/OS/Package/Log.pm',
    'lib/OS/Package/Maintainer.pm',
    'lib/OS/Package/Plugin/Linux/RPM.pm',
    'lib/OS/Package/Plugin/Linux/deb.pm',
    'lib/OS/Package/Plugin/Solaris/IPS.pm',
    'lib/OS/Package/Plugin/Solaris/SVR4.pm',
    'lib/OS/Package/Role/Build.pm',
    'lib/OS/Package/Role/Clean.pm',
    'lib/OS/Package/Role/Prune.pm',
    'lib/OS/Package/System.pm',
    't/00-load.t',
    't/01-ospkg.t',
    't/02-config.t',
    't/03-log.t',
    't/04-system.t',
    't/05-app.t',
    't/06-maintainer.t',
    't/07-package.t',
    't/08-plugin-solaris-svr4.t',
    't/21-cli.t',
    't/author-critic.t',
    't/author-no-tabs.t',
    't/author-pod-spell.t',
    't/release-eol.t',
    't/release-pod-coverage.t',
    't/release-pod-syntax.t'
);

notabs_ok($_) foreach @files;
done_testing;
