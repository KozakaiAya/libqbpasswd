#include <openssl/evp.h>
#include <string>

typedef const EVP_MD *digest_t;

class Password
{
private:
    const int hashIterations;
    const digest_t hashMethod;

public:
    Password(int iter = 100000, digest_t method = EVP_sha512()) : hashIterations(iter), hashMethod(method) {};
    std::string generate(const std::string& password);
    std::string generate(const std::u16string& password);
};
