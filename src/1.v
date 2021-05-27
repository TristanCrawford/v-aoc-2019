import os
import io
import math
import strconv

fn calc_fuel(mod i64) i64 {
	req := i64(math.floor(mod / 3) - 2)

	if req > 0 {
		return req + calc_fuel(req)
	}

	return 0
}

fn main() {
	data := os.open('data/1.txt') or {
		println("Couldn't Open Data File")
		return
	}

	mut buffer := io.new_buffered_reader(
		reader: data
	)

	mut total := i64(0)

	for {
		line := buffer.read_line() or { break }
		parsed := i64(strconv.parse_int(line, 10, 64))
		total += calc_fuel(parsed)
	}

	println('Result: $total')
}
