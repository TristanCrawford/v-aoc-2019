import os
import io
import math
import strconv

fn main() {

	data := os.open("data/1.txt") or { 
		println("Couldn't Open Data File")
		return
	}

	mut total := u32(0)
	
	mut buffer := io.new_buffered_reader({
		reader: data
	})

	for {
		line := buffer.read_line() or { break }
		parsed := strconv.parse_uint(line, 10, 32)
		total += u32(math.floor(parsed / 3) - 2)
	}

	println("Result: $total")
}
