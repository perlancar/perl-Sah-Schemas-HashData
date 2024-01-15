package Sah::Schema::perl::hashdata::modname_with_optional_args;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

use Sah::PSchema::perl::modname_with_optional_args;

our $schema = Sah::PSchema::perl::modname_with_optional_args->get_schema({
    ns_prefix => "HashData",
});

$schema->[1]{summary} = 'Perl HashData::* module name without the prefix (e.g. Sample::DeNiro) with optional args (e.g. Foo::Bar=arg1,arg2)';

1;
# ABSTRACT:
