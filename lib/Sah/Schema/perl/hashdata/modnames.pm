package Sah::Schema::perl::hashdata::modnames;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl HashData::* module names without the prefix, e.g. ["Sample::DeNiro", "CPAN::AuthorName::ByPAUSEID"]',
    description => <<'_',

Array of Perl HashData::* module names, where each element is of
`perl::hashdata::modname` schema, e.g. `Sample::DeNiro`,
`CPAN::AuthorName::ByPAUSEID`.

Contains coercion rule that expands wildcard, so you can specify:

    CPAN::**

and it will be expanded to e.g.:

    ["CPAN::AuthorName::ByPAUSEID", "CPAN::Module::ByName"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::hashdata::modname", {req=>1}, {}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'HashData'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_modname', {ns_prefix=>'HashData'}],

}];

1;
# ABSTRACT:
