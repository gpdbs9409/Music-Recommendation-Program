CC = gcc
CFLAGS = -Wall -g
OBJS = src/main.o src/emotion.o src/system_status.o src/weather.o src/player.o

all: program

program: $(OBJS)
    $(CC) $(CFLAGS) -o program $(OBJS)

%.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@

clean:
    rm -f src/*.o program
