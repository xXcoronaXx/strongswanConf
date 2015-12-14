#!/bin/bash
#
# strongswan      This shell script takes care of starting and stopping
#             standalone strongswan.
# Las lineas siguientes aunque son comentarios las utilizan
# otros programas y son necesarias.
# chkconfig: - 60 50
# description: strongswan ipsec vpn.
# processname: strongswan
# config: /etc/strongswan.conf

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ ${NETWORKING} = "no" ] && exit 0

#Valor de retorno, utilizado para indicar si hay error.
RETVAL=0
prog="strongswan"

start() {
        # Start daemons.
		echo -n $"Starting $prog: "
		strongswan start
		#Comando para arrancar el servicio, por ejemplo /bin/strongswan o usar
		# la funcion daemon definida en /etc/rc.d/init.d/functions
		RETVAL=$?
		[ $RETVAL -eq 0 ] && {
		     touch /var/lock/subsys/$prog
		     success $"$prog"
		}
		echo
		return $RETVAL
}

stop() {
        # Stop daemons.
		echo -n $"Shutting down $prog: "
		strongswan stop
		killproc $prog
		RETVAL=$?
		echo
		[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/$prog
		return $RETVAL
}

# See how we were called.
case "$1" in
	start) 
		start
		;; 
	stop)
		stop
        ;;
	restart|reload)
		stop 
		start
		RETVAL=$?
        ;;
	condrestart)
        if [ -f /var/lock/subsys/$prog ]; then
            stop
			start
			RETVAL=$? 
		fi
		;; 
	status)
        status $prog
        RETVAL=$?
        ;;
  	*)
        echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
        exit 1
esac

exit $RETVAL