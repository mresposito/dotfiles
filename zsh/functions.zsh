# send to ews
function ewsend()
{ python $MYZSH/plugins/send.py $* }

# show external ip
function exip () {
    # gather external ip address
        echo -n "Current External IP: "
        curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

function eget () {
  curl -XGET "http://localhost:9200/"${1}"?pretty=true"
}
function eput () {
  curl -XPUT "http://localhost:9200/"${1}"?pretty=true"
}

function epost () {
  curl -XPOST "http://localhost:9200/"${1}"?pretty=true"
}

export MARKPATH=$HOME/.marks

function jump { 
  cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}

function mark { 
  mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}

function unmark { 
  rm -i $MARKPATH/$1 
}

function marks {
  ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
