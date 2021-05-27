import os
import io
import strconv

fn process(og_ops []i64, noun i64, verb i64) i64 {
	mut ops := og_ops.clone()

	ops[1] = noun
	ops[2] = verb

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

	return ops[0]
}

fn main() {
	data := os.open('data/2.txt') or {
		println("Couldn't Open Data File")
		return
	}

	mut buffer := io.new_buffered_reader(
		reader: data
	)

	line := buffer.read_line() or { return }

	mut ops_og := []i64{}

	for char in line.split(',') {
		ops_og << strconv.parse_int(char, 10, 64)
	}

	mut result := i64(0)

	outer: for n in 0..100 {
		for v in 0..100 {
			if process(ops_og, n, v) == 19690720 {
				result = 100 * n + v
				break outer
			}
		}
	}

	println('Result: $result')
}
