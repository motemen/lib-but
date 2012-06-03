use inc::Module::Install;

name 'lib-but';
all_from 'lib/lib/but.pm';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';

auto_set_repository;
auto_include_deps;

readme_from 'lib/lib/but.pm';

WriteAll;
