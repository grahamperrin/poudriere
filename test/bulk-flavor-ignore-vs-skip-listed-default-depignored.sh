FLAVOR_DEFAULT_ALL=no

# XXX: Removing DEFAULT here breaks the framework. It should default to the first flav due to FLAVOR_DEFAULT_ALL=no
LISTPORTS="misc/foo-default-DEPIGNORED@default"
OVERLAYS="overlay omnibus"
. common.bulk.sh

do_bulk -n ${LISTPORTS}
assert 0 $? "Bulk should pass"

EXPECTED_IGNORED="misc/foo-dep-FLAVORS-unsorted@depignored"
EXPECTED_SKIPPED="misc/foo-default-DEPIGNORED@default"
EXPECTED_TOBUILD="ports-mgmt/pkg"
EXPECTED_QUEUED="${EXPECTED_TOBUILD} misc/foo-default-DEPIGNORED@default misc/foo-dep-FLAVORS-unsorted@depignored"
EXPECTED_LISTED="misc/foo-default-DEPIGNORED@default"

assert_bulk_queue_and_stats
