module content

// modules returns the tour's content, in reading order.
//
// Reading order is the whole point: prev/next navigation walks this list
// linearly across lesson and module boundaries, so inserting a lesson here
// inserts it into the tour's spine.
pub fn modules() []Module {
	return [
		welcome(),
		basics(),
		controlflow(),
		moretypes(),
		optionresult(),
		methods(),
		generics(),
		concurrency(),
	]
}
