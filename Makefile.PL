use inc::Module::Install;

name     'Dancer-Plugin-EmptyGIF';
all_from 'lib/Dancer/Plugin/EmptyGIF.pm';
author   q{David Moreno <david@axiombox.com>};
license  'mit';

perl_version '5.010';

requires 'Dancer' => '1.3091';

test_requires 'lib::abs';
test_requires 'Test::More';

auto_install;

WriteAll;