#!/bin/bash
echo check the R library abcrf
#wget https://cran.r-project.org/src/contrib/abcrf_1.7.1.tar.gz
#sudo R CMD INSTALL abcrf_1.7.1.tar.gz

echo check msnsam
if which msnsam >/dev/null; then
	echo msnsam is ok
else
	echo msnsam has to be installed
	git clone https://github.com/rossibarra/msnsam
	cd msnsam
	./clms
	sudo ln $PWD/${i}/msnsam /usr/bin/
	cd ..
fi

for i in mscalc_wgd.py priorgenwgd run_ABC_polyploid.py; do
	echo check ${i}
	if which ${i}>/dev/null; then
		echo ${i} is ok
	else
		echo ${i} not in the bin.
		chmod +x ${i} 
		sudo ln $PWD/${i} /usr/bin/
	fi
done

echo check pypy
if which pypy >/dev/null; then
	echo pypy is ok
else
	echo installation of pypy
	wget https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-linux32.tar.bz2
	pypy2-v6.0.0-linux32.tar.bz2
	cd pypy2-v6.0.0-linux32/bin
	sudo ln -s $PWD/pypy /usr/bin
fi

