echo "Setting up new raspberry pi"

echo "Updating..."
sudo apt update && sudo apt upgrade
sudo apt install vim
mkdir ~/.ssh && chmod 700 ~/.ssh

echo "Installing python..."
sudo apt install wget build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev openssl

# browse versions at python.org/downloads/source
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar xzf Python-3.9.1.tgz
cd Python-3.9.1
./configure --enable-optimizations
make -j `nproc`  
sudo make altinstall

echo "Installing docker"
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker ${USER}

echo "Running raspi-config to enable VNC, SSH, and GPIO"
sudo raspi-config nonint do_vnc 0 && sudo raspi-config nonint do_ssh 0 && sudo raspi-config nonint do_rgpio 0

echo "It is highly recommended that you change your password and set up SSH keys after rebooting."
sleep(3)
echo "Rebooting to apply changes in 5 seconds..."
sleep(5)
sudo reboot
