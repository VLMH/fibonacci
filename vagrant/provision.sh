echo '=== Start provisioning'

echo '> set LC_CTYPE locale'
echo 'export LC_CTYPE="en_US.UTF-8"' >> /etc/profile.d/locale.sh

echo '> update and install system packages'
yum -y update
yum groupinstall 'Development Tools'
yum install -y git

echo '> install php'
rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum install -y php56w

echo '> install ruby via rvm'
gpg2 --keyserver hkp://pgp.mit.edu --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.2.2

echo '> install python via pyenv'
pyenv_path='/usr/local/pyenv'
pyenv_sh='/etc/profile.d/pyenv.sh'
git clone https://github.com/yyuu/pyenv.git "$pyenv_path"
echo "export PYENV_ROOT=$pyenv_path" > "$pyenv_sh"
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$pyenv_sh"
echo 'eval "$(pyenv init -)"' >> "$pyenv_sh"
source "$pyenv_sh"
pyenv install 2.7.10
pyenv global 2.7.10
unset pyenv_path
unset pyenv_sh

echo '> install nodejs via nvm'
touch /etc/profile.d/nvm.sh
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | NVM_DIR=/usr/local/nvm PROFILE=/etc/profile.d/nvm.sh bash
source /etc/profile.d/nvm.sh
nvm install 0.12.4
nvm use 0.12.4 && nvm alias default v0.12.4
