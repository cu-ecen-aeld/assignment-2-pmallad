#define _GNU_SOURCE     /* for basename() in <string.h> */
#include <syslog.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <libgen.h>

int main(int argc, char *argv[]) {
    openlog("Logs", LOG_PID, LOG_USER);
    syslog(LOG_INFO, "Start logging");

    if (argc < 3) {
        syslog(LOG_USER, "Please provide a file path and a string to write.\n");
        exit(1);
    }

    char *writefile = argv[1];
    char *writestr = argv[2];
    char *dirpath = dirname(strdup(writefile));

    struct stat st;
    if (stat(dirpath, &st) != 0 || !S_ISDIR(st.st_mode)) {
        if (mkdir(dirpath, 0777) != 0) {
            syslog(LOG_USER, "Failed to create the directory.\n");
            exit(1);
        }
        syslog(LOG_INFO, "Directory created successfully.\n");
    }

    FILE *file = fopen(writefile, "a+");
    if (file != NULL) {
        fprintf(file, "%s", writestr);
        fclose(file);
        syslog(LOG_INFO, "File created and written successfully.\n");
    } else {
        syslog(LOG_USER, "Failed to create the file.\n");
        exit(1);
    }

    closelog();
    return 0;
}

