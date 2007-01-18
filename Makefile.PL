use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'SCALP',
    AUTHOR              => 'Sawyer <xsawyerx@gmail.com>',
    VERSION_FROM        => 'lib/SCALP.pm',
    ABSTRACT_FROM       => 'lib/SCALP.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'SCALP-*' },
);
