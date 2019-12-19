#include "password.h"

#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
    std::string password = argv[1];

    Password encoder(100000, EVP_sha512());

    std::cout << encoder.generate(password) << std::endl;

    return 0;
}
