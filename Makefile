CXXFLAGS = -Wall -std=c++11 -O2
LDFLAGS = -lssl -lcrypto
STATIC_LDFLAGS = -l:libcrypto.a -lssl -ldl -pthread

all: base64.o password.o random.o main.o
	g++ $(CXXFLAGS) -o qb_password_gen base64.o random.o password.o main.o $(LDFLAGS)
	rm *.o

static_build: base64.o password.o random.o main.o
	g++ $(CXXFLAGS) -o qb_password_gen_static base64.o random.o password.o main.o $(STATIC_LDFLAGS)
	rm *.o

base64.o: base64.cpp base64.h
	g++ $(CXXFLAGS) -c base64.cpp
password.o: password.cpp password.h base64.h random.h
	g++ $(CXXFLAGS) -c password.cpp 
random.o: random.cpp random.h
	g++ $(CXXFLAGS) -c random.cpp 
main.o: main.cpp password.h
	g++ $(CXXFLAGS) -c main.cpp

clean:
	-rm *.o
	-rm qb_password_gen
	-rm qb_password_gen_static
	