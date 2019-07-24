all:  docs install

docs:
	R -e "devtools::document()"
build:
	(cd ..; R CMD build --no-build-vignettes trenaProjectMouseTCEx)

install:
	(cd ..; R CMD INSTALL trenaProjectMouseTCEx)

check:
	(cd ..; R CMD check `ls -t trenaProjectMouseTCEx) | head -1`)

test:
	for x in inst/unitTests/test_*.R; do echo $$x; R -f $$x; done

