CPPFLAGS = -Wall -std=c++11 -Ofast

base64.o: base64.cpp base64.h
	gcc $(CPPFLAGS) -c base64.cpp
password.o: password.cpp password.h base64.h random.h
	gcc $(CPPFLAGS) -c password.cpp
random.o: random.cpp random.h
	gcc $(CPPFLAGS) -c random.cpp
main.o: main.cpp password.h
	gcc $(CPPFLAGS) -c main.cpp
all: base64.o password.o random.o main.o
	gcc $(CPPFLAGS) -o qb_password_gen base64.o random.o password.o main.o

clean:
	-rm *.o
	-rm qb_password_gen