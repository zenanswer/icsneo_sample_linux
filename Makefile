CXX=g++
CC=gcc
CFLAGS=-g -c -O2
LDFLAGS=
AR=ar

all: sample sample_static


sample_static: icsneo_sample.o
	$(CXX) $(LDFLAGS) icsneo_sample.o ../icsneoapi/ics/lib/libicsneoapi.a -o icsneo_sample_static -lpthread -lftdi

sample: icsneo_sample.o
	$(CXX) $(LDFLAGS) icsneo_sample.o -o icsneo_sample -L../icsneoapi/ics/lib/ -lpthread -licsneoapi

icsneo_sample.o: icsneo_sample.cpp
	$(CXX) $(CFLAGS) -I../icsneoapi/ics/include/ icsneo_sample.cpp

clean:
	rm -rf *.o icsneo_sample icsneo_sample_static
