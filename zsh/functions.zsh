# send to ews
function ewsend()
{ python $MYZSH/plugins/send.py $* }

# show external ip
function exip () {
    # gather external ip address
        echo -n "Current External IP: "
        curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}
