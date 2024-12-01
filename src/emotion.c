#include "emotion.h"
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

void save_emotion(const char *emotion) {
    int fd = open("emotion_log.txt", O_WRONLY | O_CREAT | O_APPEND, 0644);
    if (fd == -1) {
        perror("Error opening file");
        return;
    }
    write(fd, emotion, sizeof(emotion));
    close(fd);
}
