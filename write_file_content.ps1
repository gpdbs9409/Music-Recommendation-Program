# 프로젝트 루트 디렉토리 설정
$projectRoot = "C:\Users\gpdbs\project"

# 파일과 내용 정의
$fileContents = @{
    "$projectRoot/src/main.c" = @'
#include <stdio.h>
#include "emotion.h"
#include "system_status.h"
#include "weather.h"
#include "player.h"

int main() {
    printf("Welcome to the Music Generator Program!\n");

    char emotion[20];
    printf("기분을 입력하세요 (행복/슬픔/지침): ");
    scanf("%19s", emotion);

    if (strcmp(emotion, "행복") == 0) {
        printf("행복한 음악을 재생합니다!\n");
        play_music("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    } else if (strcmp(emotion, "슬픔") == 0) {
        printf("슬픈 음악을 재생합니다.\n");
        play_music("https://www.youtube.com/watch?v=3JZ_D3ELwOQ");
    } else if (strcmp(emotion, "지침") == 0) {
        printf("편안한 음악을 재생합니다.\n");
        play_music("https://www.youtube.com/watch?v=L_jWHffIx5E");
    } else {
        printf("알 수 없는 기분입니다. 기본 음악을 재생합니다.\n");
        play_music("https://www.youtube.com/watch?v=DLzxrzFCyOs");
    }

    return 0;
}
'@;

    "$projectRoot/src/emotion.c" = @'
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
'@;

    "$projectRoot/src/system_status.c" = @'
#include "system_status.h"
#include <stdio.h>

void read_cpu_status() {
    FILE *file = fopen("/proc/stat", "r");
    if (!file) {
        perror("Error opening /proc/stat");
        return;
    }
    char buffer[256];
    fgets(buffer, sizeof(buffer), file);
    printf("CPU Status: %s\n", buffer);
    fclose(file);
}
'@;

    "$projectRoot/src/weather.c" = @'
#include "weather.h"
#include <stdio.h>

void get_weather() {
    printf("Fetching weather data...\n");
}
'@;

    "$projectRoot/src/player.c" = @'
#include "player.h"
#include <stdlib.h>

void play_music(const char *youtube_url) {
    char command[256];
    snprintf(command, sizeof(command), "xdg-open '%s' || start '%s' || open '%s'", youtube_url, youtube_url, youtube_url);
    system(command);
}
'@;

    "$projectRoot/include/emotion.h" = @'
#ifndef EMOTION_H
#define EMOTION_H

void save_emotion(const char *emotion);

#endif
'@;

    "$projectRoot/include/system_status.h" = @'
#ifndef SYSTEM_STATUS_H
#define SYSTEM_STATUS_H

void read_cpu_status();

#endif
'@;

    "$projectRoot/include/weather.h" = @'
#ifndef WEATHER_H
#define WEATHER_H

void get_weather();

#endif
'@;

    "$projectRoot/include/player.h" = @'
#ifndef PLAYER_H
#define PLAYER_H

void play_music(const char *youtube_url);

#endif
'@;

    "$projectRoot/README.md" = @'
# Music Generator Program
This project is designed to generate music based on user input, system status, and weather data.

## Features
1. Save user emotion inputs.
2. Monitor system CPU status.
3. Fetch weather data.
4. Play appropriate music.

## How to Run
Use the Makefile to compile and execute the program.

## Contributors
Your Name
'@;

    "$projectRoot/Makefile" = @'
CC = gcc
CFLAGS = -Wall -g -Iinclude
OBJS = src/main.o src/emotion.o src/system_status.o src/weather.o src/player.o

all: program

program: $(OBJS)
	$(CC) $(CFLAGS) -o program $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f src/*.o program
'@
}

# 파일 내용 작성
foreach ($file in $fileContents.Keys) {
    $content = $fileContents[$file]
    Set-Content -Path $file -Value $content
    Write-Host "Content written to $file"
}

Write-Host "All files have been populated with content!"
