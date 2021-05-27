import os
import io
import strconv

fn main() {
	data := os.open('data/2.txt') or {
		println("Couldn't Open Data File")
		return
	}

	mut buffer := io.new_buffered_reader(
		reader: data
	)

	line := buffer.read_line() or { return }

	mut ops := []i64{}

	for char in line.split(',') {
		ops << strconv.parse_int(char, 10, 64)
	}

	ops[1] = 12
	ops[2] = 2

	mut i := 0
	for i < ops.len {
		op := ops[i]
		l_pos := ops[i + 1]
		r_pos := ops[i + 2]
		o_pos := ops[i + 3]

		match op {
			1 {
				ops[o_pos] = ops[l_pos] + ops[r_pos]
			}
			2 {
				ops[o_pos] = ops[l_pos] * ops[r_pos]
			}
			99 {
				break
			}
			else {}
		}

		i += 4
	}

	println('Result: ${ops[0]}')
}
