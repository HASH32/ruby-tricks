# install zlib1-dev
# libxslt
# libreadline-dev
# openssl
#


apt-get -y update
apt-get -y install git build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.2.2

# install postgres
sudo apt-get install postgresql postgresql-contrib

