ROOT := test_dir
DOCKERID := kbrafford
APPNAME := spew

spew: spew.c 
	tar -zcvf archive.tar.gz $(ROOT)
	mv archive.tar.gz resource.bin
	ld -r -b binary -o binary.o resource.bin
	musl-gcc -Os -fdata-sections -ffunction-sections -s binary.o -Wl,--gc-sections -static -o spew spew.c
	strip --strip-all --remove-section=.comment spew
	docker build -t $(APPNAME) .

clean:
	rm -f *.o
	rm -f *.bin
	rm -f spew

