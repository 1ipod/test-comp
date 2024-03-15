import os

fn main(){
	prgm := ['mvx','mvy','*','p','rx','ma','2','xmv','ma','1','mvx','y','1','-','rx','xmv','y','26','jxn0','ma','0','mvx','y','1','*','p','e','ma','2','mvx','ma','0','i','1']
	mut mem := [2,4,0,0,0,0,0,0]
	debug := true
	mut skip := false
	mut x := 0
	mut y := 0
	mut ma := 0
	mut r := 0
	mut lio := 0
	mut li := 0
	for i := 0; i < prgm.len; i++{
		li = i 
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
			'i'    {i = prgm[i + 1].int(); skip = true}
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
			'jxn0' {if x != 0 {i = y}}
			'jyn0' {if y != 0 {i = x}}
			'p'    {p = true}
			'e'    {break}
			else {}
		}
		/* list portion */
		if debug{
			if skip{
				litoken += ' = '  + prgm[i + 1]
			}
			println('${li}) ${litoken}\n|x:${x}|y:${y}|r:${r}|ma:${ma}|mv:${mem[ma]}|')
		}
		if p{
			println(r)
		}
	}
}
