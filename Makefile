CPPFLAGS = -Wall -std=c++11 -O2
LDFLAGS = -lssl -lcrypto

all: base64.o password.o random.o main.o
	g++ $(CPPFLAGS) -o qb_password_gen base64.o random.o password.o main.o $(LDFLAGS)
	rm *.o

base64.o: base64.cpp base64.h
	g++ $(CPPFLAGS) -c base64.cpp
password.o: password.cpp password.h base64.h random.h
	g++ $(CPPFLAGS) -c password.cpp 
random.o: random.cpp random.h
	g++ $(CPPFLAGS) -c random.cpp 
main.o: main.cpp password.h
	g++ $(CPPFLAGS) -c main.cpp

clean:
	-rm *.o
	-rm qb_password_gen