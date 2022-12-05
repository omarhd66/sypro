#!/bin/sh
 
#pno to be killed
sypro_pno=($(ps -ef  | grep SyPro | grep -v grep| grep -v $0| grep  awk '{print $2}'))
echo "Sypro to be killed : ${sypro_pno[@]}"
 
npno=${#sypro_pno[@]}
echo "there are ${npno} processes in total"
 
#kill two pro by two processes
for (( i=0; i<npno; i=i+2 ))
   do
      if [[ ${sypro_pno[$i+1]} -ge 2 ]]
        then
        `kill -9 ${sypro_pno[$i]} ${sypro_pno[$i+1]}`
        echo "kill -9 ${sypro_pno[$i]} ${sypro_pno[$i+1]}"
      else
        `kill -9 ${sypro_pno[$i]}`
         echo "kill -9 ${sypro_pno[$i]}"
      fi
      v=0
      while [ $v -eq 0 ]
         do
           sleep 10
           N=($(ps -ef  | grep SyPro |grep -v grep | grep -v $0 | awk '{print $2}'))
           M=${#N[@]}
           echo "now there are ${M} pro"
 
           if [[ $M -ge $npno ]]
              then
                  v=1
          fi
 
         done
    done
ps -ef | grep SyPro | grep -v grep
echo "restart of the SyPro finished successfully!"
