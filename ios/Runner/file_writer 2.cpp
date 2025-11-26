#include <fstream>

extern "C" {

void write_text_to_file(const char *path, const char *text) {
    std::ofstream file(path, std::ios::app);
    if (!file.is_open())
        return;
    file << text;
}
}
