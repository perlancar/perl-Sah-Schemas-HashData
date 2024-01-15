package Sah::Schema::perl::hashdata::modnames_with_optional_args;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl HashData::* module names without the prefix, with optional args, e.g. ["Sample::DeNiro", "Foo=arg1,1,arg2,2"]',
    description => <<'_',

Array of Perl HashData::* module names without the prefix and optional args.
Each element is of `perl::hashdata::modname` schema, e.g.
`Sample::DeNiro`, `CPAN::AuthorName::ByPAUSEID`.

Contains coercion rule that expands wildcard, so you can specify:

    CPAN::**

and it will be expanded to e.g.:

    ["CPAN::AuthorName::ByPAUSEID", "CPAN::Module::ByName"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::hashdata::modname_with_optional_args", {req=>1}, {}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'HashData'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_modname', {ns_prefix=>'HashData'}],

}];

1;
# ABSTRACT:
