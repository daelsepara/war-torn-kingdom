all: clean wartorn

test: clean wartorn-test

wartorn: clean
	zilf -w wartorn.zil
	-zapf -ab wartorn.zap > wartorn_freq.xzap
	rm wartorn_freq.zap
	zapf wartorn.zap

wartorn-test: clean
	zilf -w wartorn.zil
	zapf wartorn.zap

clean:
	rm -f *.xzap *.zap *.z?
