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
