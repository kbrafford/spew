ROOT := test_dir
APPNAME := spew

CC = docker run -it -v `pwd`:/work kbrafford/musl-gcc musl-gcc
LD = docker run -it -v `pwd`:/work kbrafford/musl-gcc ld
STRIP = docker run -it -v `pwd`:/work kbrafford/musl-gcc strip

spew: spew.c 
	tar -zcvf archive.tar.gz $(ROOT)
	mv archive.tar.gz resource.bin
	$(LD) -r -b binary -o /work/binary.o /work/resource.bin
	$(CC) -Os -fdata-sections -ffunction-sections -s /work/binary.o -Wl,--gc-sections -static -o /work/spew /work/spew.c
	$(STRIP) --strip-all --remove-section=.comment /work/spew
	docker build -t $(APPNAME) .

clean:
	rm -f *.o
	rm -f *.bin
	rm -f spew

