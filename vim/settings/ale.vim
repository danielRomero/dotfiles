let g:ale_set_loclist = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \}
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \}

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_ruby_rubocop_executable = 'bundle'
