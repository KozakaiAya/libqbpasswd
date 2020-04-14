CPPFLAGS_STATIC = -Ibuild/include
CXXFLAGS = -Wall -std=c++11 -O2
LDFLAGS = -lssl -lcrypto
LDFLAGS_STATIC = -Lbuild/lib -lssl -lcrypto -ldl -static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive

all: base64.o password.o random.o main.o
	g++ $(CXXFLAGS) -o qb_password_gen base64.o random.o password.o main.o $(LDFLAGS)
	rm *.o

static_build: build_openssl base64.o password_s.o random.o main_s.o
	g++ $(CXXFLAGS) -o qb_password_gen_static base64.o random.o password_s.o main.o $(STATIC_LDFLAGS)
	rm *.o

base64.o: base64.cpp base64.h
	g++ $(CXXFLAGS) -c base64.cpp
password.o: password.cpp password.h base64.h random.h
	g++ $(CXXFLAGS) -c password.cpp 
random.o: random.cpp random.h
	g++ $(CXXFLAGS) -c random.cpp 
main.o: main.cpp password.h
	g++ $(CXXFLAGS) -c main.cpp

password_s.o: build_openssl password.cpp password.h base64.h random.h
	g++ $(CPPFLAGS_STATIC) $(CXXFLAGS) -c password.cpp -o password_s.o 
main_s.o: build_openssl main.cpp password.h
	g++ $(CPPFLAGS_STATIC) $(CXXFLAGS) -c main.cpp -o main_s.o

.PHONY build_openssl
build_openssl:
	$(shell ./build_openssl.sh)

clean:
	-rm *.o
	-rm qb_password_gen
	-rm qb_password_gen_static
	