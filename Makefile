CC = gcc
CFLAGS = -Wall -g
OBJS = main.o emotion.o system_status.o weather.o player.o

all: program

program: $(OBJS)
    $(CC) $(CFLAGS) -o program $(OBJS)

clean:
    rm -f *.o program
