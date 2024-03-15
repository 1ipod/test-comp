import os

fn main(){
	prgm := ['x','1','+','ry','p','i','2']
	mut mem := [0,0,0,0,0,0,0,0]
	debug := false
	mut skip := false
	mut x := 0
	mut y := 0
	mut ma := 0
	mut r := 0
	mut a := false
	mut j := -1
	for i := 0; i < prgm.len; i++{
		j++
		token := prgm[i]
		mut litoken := token
		mut p := false
		if skip {
			skip = false
			continue 
		}
		/* parse portion */
		match token{
			'x'    {x = prgm[i + 1].int(); skip = true}
			'y'    {y = prgm[i + 1].int(); skip = true}
			'r'    {r = prgm[i + 1].int(); skip = true}
			'i'    {i = prgm[i + 1].int() - 1; a = true}
			'ma'   {ma = prgm[i + 1].int(); skip = true}
			'mv'   {mem[ma] = prgm[i + 1].int(); skip = true}
			'rx'   {x = r}
			'ry'   {y = r}
			'xma'  {ma = x}
			'yma'  {ma = y}
			'xmv'  {mem[ma] = x}
			'ymv'  {mem[ma] = y}
			'mvx'  {x = mem[ma]}
			'mvy'  {y = mem[ma]}
			'+'    {r = x + y}
			'-'    {r = x - y}
			'*'    {r = x * y}
			'jxn0' {if x != 0 {i = y - 1}}
			'p'    {p = true}
			'e'    {break}
			else {}
		}
		/* list portion */
		if debug{
			if skip{
				litoken += ' = '  + prgm[i + 1]
			}
			if a {i++}
			println('${j}:${i}) ${litoken}|x:${x}|y:${y}|r:${r}|ma:${ma}|mv:${mem[ma]}|')
			if a {i--}
		}
		if p{
			println(r)
		}
	}
}
