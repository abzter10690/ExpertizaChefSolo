
# Checking for the correct number of arguments
if [ $# -ne 3 ]; then
  echo "Usage: $0 <user> <ip> <port>"
  exit 1
fi

# Setting variables
USER=$1
IP=$2
PORT=$3

#Copying scrubbed db to the remote server
echo "==== Copying scrubbed db to the remote server! ===="
scp ./expertiza_scrubbed_2015_08_14.sql.tar.gz root@$IP:/home
echo "==== Scrubbed db copied to the remote server successfully! ===="

# Installing knife solo
echo "==== Initiating knife solo! ===="
cd ./chef && knife solo prepare -V root@$IP 

# Executing the run list
echo "====  Executing the runlist! ===="
knife solo cook root@$IP
