#include "password.h"
#include "random.h"
#include "base64.h"

#include "debug.h"

#include <codecvt>
#include <locale>
#include <array>

#ifdef DEBUG

#include <iostream>

#endif

std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> converter;

std::string Password::generate(const std::u16string& password)
{
    std::string password_u8 = converter.to_bytes(password);
    return this->generate(password_u8);
}
 
std::string Password::generate(const std::string& password)
{
    const std::array<uint32_t, 4> salt{get_rand(), get_rand(), get_rand(), get_rand()};
    
    std::array<unsigned char, 64> outBuf {};
    const int hmacResult = PKCS5_PBKDF2_HMAC(password.c_str(), password.size()
        , reinterpret_cast<const unsigned char *>(salt.data()), static_cast<int>(sizeof(salt[0]) * salt.size())
        , this->hashIterations, this->hashMethod
        , static_cast<int>(outBuf.size()), outBuf.data());
    
    if (hmacResult != 1)
        return {};

    std::string ret = base64_encode(reinterpret_cast<unsigned char const*>(salt.data()), sizeof(salt[0]) * salt.size()) 
        + ":" + base64_encode(reinterpret_cast<unsigned char const*>(outBuf.data()), sizeof(outBuf[0]) * outBuf.size());
    
    return ret;
}
