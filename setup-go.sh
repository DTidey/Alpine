if test -f "setup-boot.sh"; then
	rm setup-boot.sh
fi
wget https://raw.githubusercontent.com/DTidey/Alpine/master/install/setup-boot.sh
chmod +x setup-boot.sh
./setup-boot.sh
