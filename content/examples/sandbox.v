import time

fn main() {
	println('Welcome to the V sandbox.')
	println('Started at unix time ${time.now().unix()}')

	time.sleep(400 * time.millisecond)

	println('That last line waited for the clock.')
	println('Your program is boxed: no network, no disk, a few seconds of CPU.')
}
