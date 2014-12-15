" Render the current LaTeX file and open the resulting PDF
nmap <silent> <leader>r :!pdflatex '%:p' && pdflatex '%:p' && pdflatex '%:p' && open '%:p:r.pdf' && rm '%:p:r.log' && rm '%:p:r.aux'<CR><CR>
