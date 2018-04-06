$>sudo crontab -e 

###########################
## Ejecuta estadisticas  ##
###########################
00 23 * * 1-5 /backup_processmkr/shell/dba_apl_estadisticas.sh >> /backup_processmkr/shell/dba_apl_estadisticas.log
00 16 * * 6 /backup_processmkr/shell/dba_apl_estadisticas_pendu_pm.sh >> /backup_processmkr/shell/dba_apl_estadisticas_pendu_pm.log
00 20 * * 6 /backup_processmkr/shell/dba_apl_estadisticas_wf_workflow.sh >> /backup_processmkr/shell/dba_apl_estadisticas_wf_workflow.log

############################
## Procesos de Derivacion ##
############################
5 21 * * 1-6 wget -q -O - "http://quantum2.pendulum.com.mx/gastos/pro_01_derivacion_casos_deposito.php"
10 21 * * 1-6 wget -q -O - "http://quantum2.pendulum.com.mx/gastos/pro_02_derivacion_validacion_comprobacion.php"
15 21 * * 1-6 wget -q -O - "http://quantum2.pendulum.com.mx/gastos/pro_03_derivacion_finalizar_casos.php"
20 21 * * 1-6 wget -q -O - "http://quantum2.pendulum.com.mx/gastos/pro_04_derivacion_casos_comproba_auto.php"
25 21 * * 1-6 wget -q -O - "http://quantum2.pendulum.com.mx/gastos/pro_05_derivacion_casos_comproba_avion.php"

#######################################################################
## Procesos monitoreo tareas abiertas auto y avion casos finalizados ##
#######################################################################
0 20 * * * wget -q -O  -  "http://quantum2.pendulum.com.mx/gastosfact/public/planesdeviaje/monitoreo/envio-correo-monitoreo"
5 20 * * * wget -q -O  -  "http://quantum2.pendulum.com.mx/gastosfact/public/planesdeviaje/monitoreo/envio-correo-monitoreo-comprobante"
10 20 * * * wget -q -O  - "http://quantum2.pendulum.com.mx/gastosfact/public/planesdeviaje/monitoreo/envio-correo-monitoreo-comprobante-sin-prorrateo"

