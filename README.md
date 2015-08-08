# Fibonacci

- Calculate Fibonacci number in different programming languages with different algorithm
- Output result with processing time of each language one by one via websocket

# Requirement

- VirtualBox (https://www.virtualbox.org/wiki/Downloads)
- Vagrant (https://www.vagrantup.com/downloads.html)

# How to use

1. `git-clone` this repo
2. `vagrant up # Take about 10-15mins to create VM and install packages`
3. `vagrant ssh # ssh in VM`
4. `cd \vagrant # to shared folder`
5. `npm install # install node modules`
6. `node index.js # run application server`
7. go to `http://192.168.66.15:5000/fibonacci`
