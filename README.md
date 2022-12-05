# sypro
restart processes two by two for critical mission

Deploy a new script to restart SyPro two processes two by two to avoid impact on data user.
We are used to restart SyPro processes after each switch cluster on all OCSs.., the restart of SyPro by killing all of them at the same time (there are 10PSyPro by OCS) have a huge impact on charging. The aim of this script is to kill processes two by the two. Kill the first two processes, wait until they are restarted then kill another two processes until finished which will avoid the visible charging impact.
