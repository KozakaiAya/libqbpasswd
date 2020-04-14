// libqbpasswd front end
// accepts a plain password and returns the encoded value

#include "password.h"

#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        std::cout << "Usage: qb_password_gen(_static) <your plain password>" << std::endl;
        std::exit(-1);
    }

    std::string password = argv[1];

    Password encoder(100000, EVP_sha512());

    std::cout << encoder.generate(password) << std::endl;

    return 0;
}
