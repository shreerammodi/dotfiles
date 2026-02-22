" hledger / ledger journal files
setlocal commentstring=;\ %s
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" Disable autopairs — square/paren brackets are meaningful ledger syntax:
"   [virtual balanced postings] and (virtual unbalanced postings)
let b:autopairs_enabled = 0
