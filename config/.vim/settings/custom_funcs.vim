" Declares a function which uses python to format the current buffer as JSON
com! FormatJSON %!python -m json.tool
com! Copy %!pbcopy

" Put the current Git commit hash at the current line
command Ghash :execute 'normal k' | read !git rev-parse HEAD

" Create a blog post (see template in git@blog/blog_posts/guide.md)
function! CreateBlogPost(name) range
	" Do some more things
	let lines = getline(a:firstline, a:lastline)
	let post = [lines[0], '']
	let author = 'by T.J. Wilder ('.strftime('%Y-%m-%d').')'
	let post += [author, '']
	let referenceLines = ['', '## References']
	" Loop through to do substitutions
	let ind = 0
	let references = 0
	let commit = 0
	let sha = ''
	for line in lines
		if commit
			let sha = line
		endif
		if line ==? '## Commit hash'
			let commit = 1
		endif
		if references && !commit
			let referenceLines += [line]
		endif
		if line ==? '## References'
			let references = 1
		endif
		if !references && ind >= 2
			let post += [line]
		endif
		let ind += 1
	endfor
	let post += ['', 'The final version referred to in the blog post corresponds to the git commit `'.sha.'`.']
	let post += referenceLines
	
	execute "vsplit" a:name.".md"
	for line in post
		put =line
	endfor
endfunction
command -range -nargs=1 CreateBlogPost <line1>,<line2>call CreateBlogPost(<f-args>)

function! FixThis()
  if &ft ==# 'python'
    !autopep8 --global-config ~/.config/flake8 --in-place --aggressive --aggressive %:p
  else
    YcmCompleter FixIt
  endif
endfunction

function! Draw(file)
  let file = a:file . '.jpg'
  execute 'normal a![alt text](' . file . ')'
  " TODO: Setting? Allow for other image editing and other files/filetypes
  execute '!cp ~/Desktop/Code/life-knowledge/default.jpg ' . file
  " !photoshop file
  execute '!open -a /Applications/Adobe\ Photoshop\ 2020/Adobe\ Photoshop\ 2020.app ' . file
endfunction
command -nargs=1 Draw call Draw(<f-args>)

function! custom_funcs#Title(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")
  let basename = expand('%:p:s?\v(.*\/)([^\/]+)\/?\2 - ?:s?\v(.)-?\1 ?')

  if basename == ''
    return arg2
  else
    return substitute(template, '$1', basename, 'g')
  endif
endf
