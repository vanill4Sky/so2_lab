#!/usr/bin/env bash
set -e #exit on command fail
set -u #exit on undefined variable use
#set -x #trace what gets executed

temp_filename="temp.txt"
ps aux > "${temp_filename}"

#-----------------1-------------------
awk '$4>0.1 {print "Użytkownik", $1,\
     "ma uruchomiony process o PID", $2,\
     "- CPU =", $3 ,", MEM =", $4}\
     END {print ""}'\
    "${temp_filename}"

#-----------------2-------------------
# PONIŻEJ ŁĄCZNY CZAS PROCESORA
awk '{
        split($10, proc_time, ":");
        if (proc_time[2] > 5) {
            print "Proces o PID", $2, "trwa:", proc_time[1];
        }
     }
     END {
          print "";
     }'\
    "${temp_filename}"

# PONIŻEJ CZAS OD STARTU PROCESU
# current_time=`date +"%H:%M"`
# awk -v current_time=${current_time}\
#     '{
#         split($9, start_time, ":");
#         split(current_time, current_time_arr, ":")
#         delta_hour = current_time_arr[1] - start_time[1];
#         delta_minute = current_time_arr[2] - start_time[2];
#         delta_sum = delta_hour * 60 + delta_minute;

#         if (delta_sum > 5) {
#             print "Proces o PID", $2, "trwa:", delta_sum;
#         }
#     }'\
#     "${temp_filename}"

#-----------------3-------------------
awk 'BEGIN {
        cpu_sum = 0; 
        mem_sum = 0;
     }
     {
         cpu_sum = cpu_sum + $3;
         mem_sum = mem_sum + $4;
     }
     END {
        print "Suma CPU:", cpu_sum, "Suma MEM:" mem_sum "\n"
     }'\
    "${temp_filename}"

#-----------------4-------------------
awk '{
        cpu_sum[$1] = cpu_sum[$1] + $3; 
        mem_sum[$1] = mem_sum[$1] + $4;
     }\
     END {
        for (user in cpu_sum) {
            print "Użytkownik", user, "łącznie zużywa CPU:", cpu_sum[user], "i MEM:", mem_sum[user]
        }
     }'\
    "${temp_filename}"
echo ""

#-----------------5-------------------
awk 'BEGIN {
        max_cpu_sum = 0; 
        max_mem_sum = 0;
     }
     {
         cpu_sum[$1] = cpu_sum[$1] + $3; 
         mem_sum[$1] = mem_sum[$1] + $4
     }
     END {
        for (user in cpu_sum) {
            if (cpu_sum[user] > max_cpu_sum) {
                max_cpu_sum = cpu_sum[user];
                max_cpu_user = user;
            }\
            if (mem_sum[user] > max_mem_sum) {
                max_mem_sum = mem_sum[user];
                max_mem_user = user;
            }\
        }\
        print "Użytkownik", max_cpu_user,
            "zużywa najwięcej CPU:", max_cpu_sum ".",
            "Użytkownik", max_mem_user,
            "zużywa najwięcej MEM:", max_mem_sum ".";
     }'\
    "${temp_filename}"

#-------------------------------------
rm -f "${temp_filename}"