#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define DATA_SIZE 10240  // 10 KB

int main(int argc, char *argv[])
{
    if (argc != 4) {
        printf("write_file <path> <size> <option>\n");
        printf("Options are: init, default, trunc, nosync\n");
        return 1;
    }

    const char *path = argv[1];
    int size = strtol(argv[2], NULL, 0);
    const char *option = argv[3];

    int flags = O_WRONLY | O_CREAT;
    if (strcmp(option, "trunc") == 0)
        flags |= O_TRUNC | O_SYNC;
    if (strcmp(option, "nosync") == 0)
        flags |= 0;
    else
        flags |= O_SYNC;

    // Allocate and fill buffer with data
    char *buffer = malloc(size);
    if (!buffer) {
        perror("malloc");
        return 1;
    }
    memset(buffer, 0xAB, size);

    // Open file with O_SYNC for immediate sync-on-write
    int fd = open(path, flags, 0644);
    if (fd < 0) {
        perror("open");
        free(buffer);
        return 1;
    }

    // Write all 10 KB in one shot
    ssize_t written = write(fd, buffer, size);
    if (written != size) {
        perror("write");
        close(fd);
        free(buffer);
        return 1;
    }

    close(fd);
    free(buffer);
    printf("%d bytes written to %s with option %s\n", size, path, option);
    return 0;
}
