@echo off
del bjtu_template.pdf >nul 2>nul
if exist bjtuthesis.pdf (
	echo Close the file: bjtu_template.pdf!!!
	echo Or use Sumatra to open bjtu_template.pdf
	pause
	exit
)


echo Compile...
echo clean files...
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.alg *.glsdefs *.fdb_latexmk *.fls >nul 2>nul
echo If stuck, look for the error in texstudio
echo xelatex -no-pdf bjtu_template...
xelatex -no-pdf bjtu_template >nul
echo bibtex --debug bjtu_template...
bibtex bjtu_template >nul
echo xelatex bjtu_template twice...
xelatex bjtu_template >nul
xelatex bjtu_template >nul
echo clean files...
del *.aux *.run.xml *.bcf *.log *.xdv *.bbl *.bak *.blg *.out *.thm *.toc *.synctex* *.glg *.glo *.gls *.ist *.idx *.ilg *.ind *.acn *.acr *.lof *.lot *.alg *.glsdefs *.fdb_latexmk *.fls >nul 2>nul
echo open file
bjtu_template.pdf
