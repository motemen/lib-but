use strict;
use warnings;
use Test::More tests => 1;
use lib::but 'B';

eval { require 'B' };
ok $@;
