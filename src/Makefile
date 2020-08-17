all: clean
	zilf -w kingdom.zil
	-zapf -ab kingdom.zap > kingdom_freq.xzap
	rm kingdom_freq.zap
	zapf kingdom.zap

test: clean
	zilf -w kingdom.zil
	zapf kingdom.zap
	
clean:
	rm -f *.xzap *.zap *.z?
