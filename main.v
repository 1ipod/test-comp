import os

fn main(){
	prgm := ['z','3','zx','zy','zmv','ma','1','mv','3','*','p','rz','ma','1','mvx','y','1','-','p','rmv','rx','y','30','jxn0','zx','y','0','+','p','e','zx','ma','0','mvy','i','9']
	mut mem := [0,0,0,0,0,0,0,0]
	debug := false
	mut skip := false
	mut x := 0
	mut y := 0
	mut z := 0
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
			'x'    {x = prgm[i + 1].int(); skip = true}       /* Set X */
			'y'    {y = prgm[i + 1].int(); skip = true}       /* Set Y */
			'z'    {z = prgm[i + 1].int(); skip = true}       /* Set z */
			'i'    {i = prgm[i + 1].int() - 1; a = true}      /* Set Instruction Pointer */
			'ma'   {ma = prgm[i + 1].int(); skip = true}      /* Set Memory Address */
			'mv'   {mem[ma] = prgm[i + 1].int(); skip = true} /* Set Memory Value */
			'rx'   {x = r}                                    /* Set X to return */
			'ry'   {y = r}                                    /* Set Y to return */
			'rz'   {z = r}                                    /* Set Z to return */
			'xma'  {ma = x}                                   /* Set Memory Address to X */
			'yma'  {ma = y}
			'zma'  {ma = z}
			'rma'  {ma = r}
			'xmv'  {mem[ma] = x}
			'ymv'  {mem[ma] = y}
			'zmv'  {mem[ma] = z}
			'rmv'  {mem[ma] = r}
			'mvx'  {x = mem[ma]}
			'mvy'  {y = mem[ma]}
			'mvz'  {z = mem[ma]}
			'xz'   {z = x}
			'yz'   {z = y}
			'zx'   {x = z}
			'zy'   {y = z}
			'+'    {r = x + y}
			'-'    {r = x - y}
			'*'    {r = x * y}
			'jxn0' {if x != 0 {i = y - 1}}
			'p'    {p = true}
			'in'   {r = os.input('${i}').int()}
			'e'    {break}
			else {}
		}
		/* list portion */
		if debug{
			if skip{
				litoken += ' = '  + prgm[i + 1]
			}
			if a {
				i++
			}
			println('${j}:${i}) ${litoken}|x:${x}|y:${y}|z:${z}|r:${r}|ma:${ma}|mv:${mem[ma]}|')
			if a {
				i--
			}
		}
		if p{
			println(r)
		}
	}
}
