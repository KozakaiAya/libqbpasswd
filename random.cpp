#include "random.h"

#include <random>

uint32_t get_rand(uint32_t min, uint32_t max)
{
    std::random_device rd;  // No need to follow the qb's original /dev/urandom implementation
                            // The std::random_device already comes with a device-dependent one
    std::mt19937 gen(rd());
    std::uniform_int_distribution<uint32_t> uniform(min, max);

    return uniform(gen);
}
