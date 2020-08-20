all: clean
	zilf -w kingdom.zil
	-zapf -ab kingdom.zap > kingdom_freq.xzap
	rm kingdom_freq.zap
	zapf kingdom.zap

test: clean
	zilf -w kingdom.zil
	zapf kingdom.zap

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
