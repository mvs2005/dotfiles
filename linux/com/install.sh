ln -sfn ~/dotfiles/linux/com/.config/ ~/.config

sudo apt-get update --yes
# Install dotnet-sdk-3
ubuntuReleace=$(lsb_release -r -s)
echo $ubuntuReleace
dotnetSdkURL="https://packages.microsoft.com/config/ubuntu/$ubuntuReleace/packages-microsoft-prod.deb"
echo $dotnetSdkURL
wget "${dotnetSdkURL}" -O /tmp/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb
sudo apt-get update --yes
yes | sudo apt-get install -y apt-transport-https software-properties-common dotnet-sdk-3.1
# Install python3.7
sudo apt-get update --yes
yes | sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update --yes
yes | sudo apt-get install -y make python3.8 python3.8-dev vim-gtk git gcc libncurses5-dev libncursesw5-dev python3-pip
ls -lh /usr/bin/ | grep python3
python3ConfigDir="/usr/lib/python3.8/"$(ls /usr/lib/python3.8/ | grep config-)
echo $python3ConfigDir
yes | sudo update-alternatives /usr/bin/python3 python3 /usr/bin/python3.8 8
#./configure --enable-python3interp --with-python3-command=/usr/bin/python3.8 -with-python3-config-dir=$python3ConfigDir
sudo ln -sfn /usr/bin/python3.8 /usr/bin/python3

sudo apt-get update --yes
sudo apt-get install -y mono-devel

#Install netcoredbg
mkdir ~/netcoredbg/ && mkdir ~/netcoredbg/bin/ && cd ~/netcoredbg/bin/
wget https://github.com/lextudio/monodevelop.netcoredbg/releases/download/v1.0/netcoredbg.linux.zip
unzip ~/netcoredbg/bin/netcoredbg.linux.zip
rm -rf ~/netcoredbg/bin/netcoredbg.linux.zip
sudo ln -sfn ~/netcoredbg/bin/netcoredbg /usr/bin/netcoredbg

# Install neovim
sudo apt-get install -y curl nodejs npm
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update --yes
sudo apt-get install -y neovim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo npm install --global yarn

yes | nvim +PlugInstall +qa

#git clone https://github.com/ryanoasis/nerd-fonts
#~/nerd-fonts/install.sh fira-code

