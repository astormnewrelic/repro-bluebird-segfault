# repro-bluebird-segfault
Reproduction for the Bluebird + Tap Node 10 Segmentation Fault

Install node 10 from nvm and then run the following.

```
$ npm install
//...
$ npm run repro
```

Script will eventually segfault.

## Reproduction in Amazon Linux via docker

If you're Docker inclined, this repo also has a Dockerfile, which should let you see the segmentation fault in 4 easy steps.

```
$ cd /path/to/this/repro                    # go to the folder
$ docker build --no-cache -t bb-repro .     # build a tagged image from the Dockerfile
$ docker run -it bb-repro bash              # "bash into" the built container
bash-4.2# npm run repro                     # run the reproduction
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker build -t bb-repro .
Sending build context to Docker daemon  88.43MB
Step 1/14 : FROM amazonlinux:2.0.20190823.1
 ---> dc34c260f454
Step 2/14 : RUN yum -y install tar gzip git
 ---> Using cache
 ---> 00e6a9194d7b
Step 3/14 : RUN touch ~/.profile
 ---> Running in f9e47ff3abc1
Removing intermediate container f9e47ff3abc1
 ---> dfd28d61d8a1
Step 4/14 : RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault
 ---> Running in 9dda26752952
Cloning into 'repro-bluebird-segfault'...
Removing intermediate container 9dda26752952
 ---> 145fe6286bdf
Step 5/14 : RUN cd repro-bluebird-segfault
 ---> Running in b2cca7d6c5e1
Removing intermediate container b2cca7d6c5e1
 ---> 3cf36fd53da1
Step 6/14 : RUN mkdir -p /usr/local/nvm
 ---> Running in 4a092fa15d3a
Removing intermediate container 4a092fa15d3a
 ---> ef2a308393ee
Step 7/14 : ENV NVM_DIR /usr/local/nvm
 ---> Running in 6738e09a80cf
Removing intermediate container 6738e09a80cf
 ---> 2df286c39cd7
Step 8/14 : ENV NODE_VERSION 10.16.3
 ---> Running in ed437a98c8b5
Removing intermediate container ed437a98c8b5
 ---> b08329b0b937
Step 9/14 : RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
 ---> Running in be383367816f
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0  65665      0 --:--:-- --:--:-- --:--:-- 65665
=> Downloading nvm from git to '/usr/local/nvm'
=> Cloning into '/usr/local/nvm'...
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.profile
=> bash_completion source string already in /root/.profile
=> Installing Node.js version 10.16.3
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

Creating default alias: default -> 10.16.3 (-> v10.16.3 *)
Failed to install Node.js 10.16.3
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
Removing intermediate container be383367816f
 ---> 66b611f3dea1
Step 10/14 : RUN source $NVM_DIR/nvm.sh     && nvm install $NODE_VERSION     && nvm alias default $NODE_VERSION     && nvm use default
 ---> Running in cb52b618286d
v10.16.3 is already installed.
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

default -> 10.16.3 (-> v10.16.3 *)
Now using node v10.16.3 (npm v6.9.0)
Removing intermediate container cb52b618286d
 ---> e95560cf03a0
Step 11/14 : ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
 ---> Running in 19deb848d144
Removing intermediate container 19deb848d144
 ---> e2fb6ee2a617
Step 12/14 : ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
 ---> Running in 7ca22db3d74d
Removing intermediate container 7ca22db3d74d
 ---> ed4ef4076020
Step 13/14 : RUN node -v
 ---> Running in 7ac2603f1d67
v10.16.3
Removing intermediate container 7ac2603f1d67
 ---> ce5d66369900
Step 14/14 : RUN npm -v
 ---> Running in ff34addfbc53
6.9.0
Removing intermediate container ff34addfbc53
 ---> 9e923dd6d61d
Successfully built 9e923dd6d61d
Successfully tagged bb-repro:latest
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker build --no-cache -t bb-repro .
Sending build context to Docker daemon  88.43MB
Step 1/14 : FROM amazonlinux:2.0.20190823.1
 ---> dc34c260f454
Step 2/14 : RUN yum -y install tar gzip git
 ---> Running in 83ffbd270874
Loaded plugins: ovl, priorities
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl-Git = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core-doc = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl >= 5.008 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: emacs-filesystem >= 25.3 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(warnings) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(strict) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(lib) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Term::ReadKey) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(IPC::Open2) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git::I18N) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Spec) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Find) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Basename) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: /usr/bin/perl for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libsecret-1.so.0()(64bit) for package: git-2.17.2-2.amzn2.x86_64
---> Package gzip.x86_64 0:1.5-10.amzn2 will be installed
---> Package tar.x86_64 2:1.26-34.amzn2 will be installed
--> Running transaction check
---> Package emacs-filesystem.noarch 1:25.3-3.amzn2.0.1 will be installed
---> Package git-core.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: openssh-clients for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: less for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libpcre2-8.so.0()(64bit) for package: git-core-2.17.2-2.amzn2.x86_64
---> Package git-core-doc.noarch 0:2.17.2-2.amzn2 will be installed
---> Package libsecret.x86_64 0:0.18.5-2.amzn2.0.2 will be installed
---> Package perl.x86_64 4:5.16.3-294.amzn2 will be installed
--> Processing Dependency: perl-libs = 4:5.16.3-294.amzn2 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-294.amzn2.x86_64
---> Package perl-Getopt-Long.noarch 0:2.40-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.amzn2.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.amzn2.noarch
---> Package perl-Git.noarch 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl(Error) for package: perl-Git-2.17.2-2.amzn2.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.amzn2.0.2 will be installed
---> Package perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2 will be installed
--> Running transaction check
---> Package less.x86_64 0:458-9.amzn2.0.2 will be installed
--> Processing Dependency: groff-base for package: less-458-9.amzn2.0.2.x86_64
---> Package openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: openssh = 7.4p1-16.amzn2.0.6 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: fipscheck-lib(x86-64) >= 1.3.0 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libfipscheck.so.1()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
---> Package pcre2.x86_64 0:10.23-2.amzn2.0.2 will be installed
---> Package perl-Carp.noarch 0:1.26-244.amzn2 will be installed
---> Package perl-Error.noarch 1:0.17020-2.amzn2 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.amzn2 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.amzn2 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.amzn2 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.amzn2.0.2 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.amzn2 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
---> Package perl-Pod-Usage.noarch 0:1.63-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.amzn2.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.amzn2.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.amzn2.0.2 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.amzn2.0.2 will be installed
---> Package perl-Text-ParseWords.noarch 0:3.29-4.amzn2 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.amzn2 will be installed
---> Package perl-constant.noarch 0:1.27-2.amzn2.0.1 will be installed
---> Package perl-libs.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-macros.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-threads.x86_64 0:1.87-4.amzn2.0.2 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2 will be installed
--> Running transaction check
---> Package fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
--> Processing Dependency: /usr/bin/fipscheck for package: fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64
---> Package groff-base.x86_64 0:1.22.2-8.amzn2.0.2 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2 will be installed
---> Package openssh.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: audit-libs >= 1.0.8 for package: openssh-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: /sbin/nologin for package: openssh-7.4p1-16.amzn2.0.6.x86_64
---> Package perl-Encode.x86_64 0:2.51-7.amzn2.0.2 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-294.amzn2 will be installed
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.amzn2 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.amzn2.0.1 will be installed
--> Running transaction check
---> Package audit-libs.x86_64 0:2.8.1-3.amzn2.1 will be installed
--> Processing Dependency: libcap-ng.so.0()(64bit) for package: audit-libs-2.8.1-3.amzn2.1.x86_64
---> Package fipscheck.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.amzn2 will be installed
---> Package perl-parent.noarch 1:0.225-244.amzn2.0.1 will be installed
---> Package util-linux.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
--> Processing Dependency: libsmartcols = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: pam >= 1.1.3-7 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0(UTEMPTER_1.1)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1(LIBUDEV_183)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0(LIBSYSTEMD_209)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.25)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0(LIBPAM_MISC_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0(LIBPAM_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.26)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: /etc/pam.d/system-auth for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Running transaction check
---> Package libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4 will be installed
---> Package libfdisk.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libutempter.x86_64 0:1.1.6-4.amzn2.0.2 will be installed
--> Processing Dependency: shadow-utils for package: libutempter-1.1.6-4.amzn2.0.2.x86_64
---> Package pam.x86_64 0:1.1.8-22.amzn2 will be installed
--> Processing Dependency: libpwquality >= 0.9.9 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: cracklib-dicts >= 2.8 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: libcrack.so.2()(64bit) for package: pam-1.1.8-22.amzn2.x86_64
---> Package systemd-libs.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: liblz4.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libdw.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Running transaction check
---> Package cracklib.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package elfutils-libs.x86_64 0:0.170-4.amzn2 will be installed
--> Processing Dependency: default-yama-scope for package: elfutils-libs-0.170-4.amzn2.x86_64
---> Package libpwquality.x86_64 0:1.2.3-5.amzn2 will be installed
---> Package lz4.x86_64 0:1.7.5-2.amzn2.0.1 will be installed
---> Package shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2 will be installed
--> Processing Dependency: libsemanage.so.1(LIBSEMANAGE_1.0)(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Processing Dependency: libsemanage.so.1()(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Running transaction check
---> Package elfutils-default-yama-scope.noarch 0:0.170-4.amzn2 will be installed
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
---> Package libsemanage.x86_64 0:2.5-11.amzn2 will be installed
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0.1)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1()(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Running transaction check
---> Package systemd.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: kmod >= 18-4 for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2(LIBKMOD_5)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4(CRYPTSETUP_1.0)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: dbus for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: acl for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libqrencode.so.3()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
---> Package ustr.x86_64 0:1.0.4-16.amzn2.0.3 will be installed
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.amzn2 will be installed
---> Package cryptsetup-libs.x86_64 0:1.7.4-4.amzn2 will be installed
--> Processing Dependency: libdevmapper.so.1.02(DM_1_02_97)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02(Base)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02()(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
---> Package dbus.x86_64 1:1.10.24-7.amzn2 will be installed
--> Processing Dependency: dbus-libs(x86-64) = 1:1.10.24-7.amzn2 for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_PRIVATE_1.10.24)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_1_3)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3()(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
---> Package kmod.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package kmod-libs.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2 will be installed
--> Running transaction check
---> Package dbus-libs.x86_64 1:1.10.24-7.amzn2 will be installed
---> Package device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Processing Dependency: device-mapper = 7:1.02.146-4.amzn2.0.2 for package: 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64
--> Running transaction check
---> Package device-mapper.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                   Arch   Version                      Repository  Size
================================================================================
Installing:
 git                       x86_64 2.17.2-2.amzn2               amzn2-core 217 k
 gzip                      x86_64 1.5-10.amzn2                 amzn2-core 130 k
 tar                       x86_64 2:1.26-34.amzn2              amzn2-core 849 k
Installing for dependencies:
 acl                       x86_64 2.2.51-14.amzn2              amzn2-core  82 k
 audit-libs                x86_64 2.8.1-3.amzn2.1              amzn2-core  99 k
 cracklib                  x86_64 2.9.0-11.amzn2.0.2           amzn2-core  80 k
 cracklib-dicts            x86_64 2.9.0-11.amzn2.0.2           amzn2-core 3.6 M
 cryptsetup-libs           x86_64 1.7.4-4.amzn2                amzn2-core 224 k
 dbus                      x86_64 1:1.10.24-7.amzn2            amzn2-core 247 k
 dbus-libs                 x86_64 1:1.10.24-7.amzn2            amzn2-core 169 k
 device-mapper             x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 289 k
 device-mapper-libs        x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 320 k
 elfutils-default-yama-scope
                           noarch 0.170-4.amzn2                amzn2-core  31 k
 elfutils-libs             x86_64 0.170-4.amzn2                amzn2-core 270 k
 emacs-filesystem          noarch 1:25.3-3.amzn2.0.1           amzn2-core  64 k
 fipscheck                 x86_64 1.4.1-6.amzn2.0.2            amzn2-core  21 k
 fipscheck-lib             x86_64 1.4.1-6.amzn2.0.2            amzn2-core  11 k
 git-core                  x86_64 2.17.2-2.amzn2               amzn2-core 4.0 M
 git-core-doc              noarch 2.17.2-2.amzn2               amzn2-core 2.3 M
 groff-base                x86_64 1.22.2-8.amzn2.0.2           amzn2-core 948 k
 kmod                      x86_64 25-3.amzn2.0.2               amzn2-core 111 k
 kmod-libs                 x86_64 25-3.amzn2.0.2               amzn2-core  59 k
 less                      x86_64 458-9.amzn2.0.2              amzn2-core 121 k
 libcap-ng                 x86_64 0.7.5-4.amzn2.0.4            amzn2-core  25 k
 libedit                   x86_64 3.0-12.20121213cvs.amzn2.0.2 amzn2-core  93 k
 libfdisk                  x86_64 2.30.2-2.amzn2.0.4           amzn2-core 240 k
 libpwquality              x86_64 1.2.3-5.amzn2                amzn2-core  84 k
 libsecret                 x86_64 0.18.5-2.amzn2.0.2           amzn2-core 153 k
 libsemanage               x86_64 2.5-11.amzn2                 amzn2-core 152 k
 libsmartcols              x86_64 2.30.2-2.amzn2.0.4           amzn2-core 156 k
 libutempter               x86_64 1.1.6-4.amzn2.0.2            amzn2-core  25 k
 lz4                       x86_64 1.7.5-2.amzn2.0.1            amzn2-core  99 k
 openssh                   x86_64 7.4p1-16.amzn2.0.6           amzn2-core 509 k
 openssh-clients           x86_64 7.4p1-16.amzn2.0.6           amzn2-core 657 k
 pam                       x86_64 1.1.8-22.amzn2               amzn2-core 718 k
 pcre2                     x86_64 10.23-2.amzn2.0.2            amzn2-core 209 k
 perl                      x86_64 4:5.16.3-294.amzn2           amzn2-core 8.0 M
 perl-Carp                 noarch 1.26-244.amzn2               amzn2-core  19 k
 perl-Encode               x86_64 2.51-7.amzn2.0.2             amzn2-core 1.5 M
 perl-Error                noarch 1:0.17020-2.amzn2            amzn2-core  32 k
 perl-Exporter             noarch 5.68-3.amzn2                 amzn2-core  29 k
 perl-File-Path            noarch 2.09-2.amzn2                 amzn2-core  27 k
 perl-File-Temp            noarch 0.23.01-3.amzn2              amzn2-core  56 k
 perl-Filter               x86_64 1.49-3.amzn2.0.2             amzn2-core  76 k
 perl-Getopt-Long          noarch 2.40-3.amzn2                 amzn2-core  56 k
 perl-Git                  noarch 2.17.2-2.amzn2               amzn2-core  70 k
 perl-HTTP-Tiny            noarch 0.033-3.amzn2                amzn2-core  38 k
 perl-PathTools            x86_64 3.40-5.amzn2.0.2             amzn2-core  83 k
 perl-Pod-Escapes          noarch 1:1.04-294.amzn2             amzn2-core  51 k
 perl-Pod-Perldoc          noarch 3.20-4.amzn2                 amzn2-core  87 k
 perl-Pod-Simple           noarch 1:3.28-4.amzn2               amzn2-core 216 k
 perl-Pod-Usage            noarch 1.63-3.amzn2                 amzn2-core  27 k
 perl-Scalar-List-Utils    x86_64 1.27-248.amzn2.0.2           amzn2-core  36 k
 perl-Socket               x86_64 2.010-4.amzn2.0.2            amzn2-core  49 k
 perl-Storable             x86_64 2.45-3.amzn2.0.2             amzn2-core  78 k
 perl-TermReadKey          x86_64 2.30-20.amzn2.0.2            amzn2-core  31 k
 perl-Text-ParseWords      noarch 3.29-4.amzn2                 amzn2-core  14 k
 perl-Time-HiRes           x86_64 4:1.9725-3.amzn2.0.2         amzn2-core  45 k
 perl-Time-Local           noarch 1.2300-2.amzn2               amzn2-core  24 k
 perl-constant             noarch 1.27-2.amzn2.0.1             amzn2-core  19 k
 perl-libs                 x86_64 4:5.16.3-294.amzn2           amzn2-core 700 k
 perl-macros               x86_64 4:5.16.3-294.amzn2           amzn2-core  44 k
 perl-parent               noarch 1:0.225-244.amzn2.0.1        amzn2-core  12 k
 perl-podlators            noarch 2.5.1-3.amzn2.0.1            amzn2-core 112 k
 perl-threads              x86_64 1.87-4.amzn2.0.2             amzn2-core  50 k
 perl-threads-shared       x86_64 1.43-6.amzn2.0.2             amzn2-core  39 k
 qrencode-libs             x86_64 3.4.1-3.amzn2.0.2            amzn2-core  50 k
 shadow-utils              x86_64 2:4.1.5.1-24.amzn2.0.2       amzn2-core 1.1 M
 systemd                   x86_64 219-57.amzn2.0.9             amzn2-core 5.0 M
 systemd-libs              x86_64 219-57.amzn2.0.9             amzn2-core 396 k
 ustr                      x86_64 1.0.4-16.amzn2.0.3           amzn2-core  96 k
 util-linux                x86_64 2.30.2-2.amzn2.0.4           amzn2-core 2.3 M

Transaction Summary
================================================================================
Install  3 Packages (+69 Dependent packages)

Total download size: 38 M
Installed size: 140 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                               22 MB/s |  38 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                          1/72
  Installing : audit-libs-2.8.1-3.amzn2.1.x86_64                           2/72
  Installing : groff-base-1.22.2-8.amzn2.0.2.x86_64                        3/72
  Installing : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Installing : less-458-9.amzn2.0.2.x86_64                                 5/72
  Installing : perl-HTTP-Tiny-0.033-3.amzn2.noarch                         6/72
  Installing : 1:perl-parent-0.225-244.amzn2.0.1.noarch                    7/72
  Installing : perl-podlators-2.5.1-3.amzn2.0.1.noarch                     8/72
  Installing : perl-Pod-Perldoc-3.20-4.amzn2.noarch                        9/72
  Installing : perl-Encode-2.51-7.amzn2.0.2.x86_64                        10/72
  Installing : perl-Text-ParseWords-3.29-4.amzn2.noarch                   11/72
  Installing : perl-Pod-Usage-1.63-3.amzn2.noarch                         12/72
  Installing : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   13/72
  Installing : 4:perl-macros-5.16.3-294.amzn2.x86_64                      14/72
  Installing : 4:perl-libs-5.16.3-294.amzn2.x86_64                        15/72
  Installing : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Installing : perl-constant-1.27-2.amzn2.0.1.noarch                      17/72
  Installing : perl-Time-Local-1.2300-2.amzn2.noarch                      18/72
  Installing : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           19/72
  Installing : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                20/72
  Installing : perl-threads-1.87-4.amzn2.0.2.x86_64                       21/72
  Installing : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     22/72
  Installing : perl-Socket-2.010-4.amzn2.0.2.x86_64                       23/72
  Installing : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                24/72
  Installing : perl-Carp-1.26-244.amzn2.noarch                            25/72
  Installing : perl-File-Temp-0.23.01-3.amzn2.noarch                      26/72
  Installing : perl-File-Path-2.09-2.amzn2.noarch                         27/72
  Installing : perl-Storable-2.45-3.amzn2.0.2.x86_64                      28/72
  Installing : perl-Getopt-Long-2.40-3.amzn2.noarch                       29/72
  Installing : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      30/72
  Installing : perl-Exporter-5.68-3.amzn2.noarch                          31/72
  Installing : 4:perl-5.16.3-294.amzn2.x86_64                             32/72
  Installing : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  33/72
  Installing : 1:perl-Error-0.17020-2.amzn2.noarch                        34/72
  Installing : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     35/72
  Installing : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         36/72
  Installing : acl-2.2.51-14.amzn2.x86_64                                 37/72
  Installing : kmod-25-3.amzn2.0.2.x86_64                                 38/72
  Installing : pcre2-10.23-2.amzn2.0.2.x86_64                             39/72
  Installing : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     40/72
  Installing : kmod-libs-25-3.amzn2.0.2.x86_64                            41/72
  Installing : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         42/72
  Installing : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                43/72
  Installing : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     44/72
  Installing : ustr-1.0.4-16.amzn2.0.3.x86_64                             45/72
  Installing : libsemanage-2.5-11.amzn2.x86_64                            46/72
  Installing : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 47/72
  Installing : libutempter-1.1.6-4.amzn2.0.2.x86_64                       48/72
  Installing : gzip-1.5-10.amzn2.x86_64                                   49/72
  Installing : cracklib-2.9.0-11.amzn2.0.2.x86_64                         50/72
  Installing : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   51/72
  Installing : pam-1.1.8-22.amzn2.x86_64                                  52/72
  Installing : libpwquality-1.2.3-5.amzn2.x86_64                          53/72
  Installing : util-linux-2.30.2-2.amzn2.0.4.x86_64                       54/72
  Installing : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                55/72
  Installing : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           56/72
  Installing : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       57/72
  Installing : elfutils-libs-0.170-4.amzn2.x86_64                         58/72
  Installing : systemd-libs-219-57.amzn2.0.9.x86_64                       59/72
  Installing : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         60/72
  Installing : systemd-219-57.amzn2.0.9.x86_64                            61/72
  Installing : elfutils-default-yama-scope-0.170-4.amzn2.noarch           62/72
  Installing : 1:dbus-1.10.24-7.amzn2.x86_64                              63/72
  Installing : openssh-7.4p1-16.amzn2.0.6.x86_64                          64/72
  Installing : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  65/72
  Installing : git-core-2.17.2-2.amzn2.x86_64                             66/72
  Installing : git-core-doc-2.17.2-2.amzn2.noarch                         67/72
  Installing : libsecret-0.18.5-2.amzn2.0.2.x86_64                        68/72
  Installing : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                 69/72
  Installing : perl-Git-2.17.2-2.amzn2.noarch                             70/72
  Installing : git-2.17.2-2.amzn2.x86_64                                  71/72
  Installing : 2:tar-1.26-34.amzn2.x86_64                                 72/72
  Verifying  : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  1/72
  Verifying  : libsecret-0.18.5-2.amzn2.0.2.x86_64                         2/72
  Verifying  : perl-Exporter-5.68-3.amzn2.noarch                           3/72
  Verifying  : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Verifying  : git-core-2.17.2-2.amzn2.x86_64                              5/72
  Verifying  : gzip-1.5-10.amzn2.x86_64                                    6/72
  Verifying  : perl-Pod-Usage-1.63-3.amzn2.noarch                          7/72
  Verifying  : git-2.17.2-2.amzn2.x86_64                                   8/72
  Verifying  : cracklib-2.9.0-11.amzn2.0.2.x86_64                          9/72
  Verifying  : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         10/72
  Verifying  : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           11/72
  Verifying  : ustr-1.0.4-16.amzn2.0.3.x86_64                             12/72
  Verifying  : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     13/72
  Verifying  : 2:tar-1.26-34.amzn2.x86_64                                 14/72
  Verifying  : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       15/72
  Verifying  : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Verifying  : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                17/72
  Verifying  : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         18/72
  Verifying  : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                19/72
  Verifying  : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      20/72
  Verifying  : libsemanage-2.5-11.amzn2.x86_64                            21/72
  Verifying  : libutempter-1.1.6-4.amzn2.0.2.x86_64                       22/72
  Verifying  : 4:perl-macros-5.16.3-294.amzn2.x86_64                      23/72
  Verifying  : systemd-libs-219-57.amzn2.0.9.x86_64                       24/72
  Verifying  : perl-constant-1.27-2.amzn2.0.1.noarch                      25/72
  Verifying  : perl-Time-Local-1.2300-2.amzn2.noarch                      26/72
  Verifying  : kmod-libs-25-3.amzn2.0.2.x86_64                            27/72
  Verifying  : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     28/72
  Verifying  : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           29/72
  Verifying  : perl-Git-2.17.2-2.amzn2.noarch                             30/72
  Verifying  : systemd-219-57.amzn2.0.9.x86_64                            31/72
  Verifying  : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         32/72
  Verifying  : perl-threads-1.87-4.amzn2.0.2.x86_64                       33/72
  Verifying  : 4:perl-libs-5.16.3-294.amzn2.x86_64                        34/72
  Verifying  : perl-podlators-2.5.1-3.amzn2.0.1.noarch                    35/72
  Verifying  : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   36/72
  Verifying  : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  37/72
  Verifying  : elfutils-default-yama-scope-0.170-4.amzn2.noarch           38/72
  Verifying  : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     39/72
  Verifying  : perl-HTTP-Tiny-0.033-3.amzn2.noarch                        40/72
  Verifying  : util-linux-2.30.2-2.amzn2.0.4.x86_64                       41/72
  Verifying  : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                         42/72
  Verifying  : pcre2-10.23-2.amzn2.0.2.x86_64                             43/72
  Verifying  : perl-Getopt-Long-2.40-3.amzn2.noarch                       44/72
  Verifying  : perl-Encode-2.51-7.amzn2.0.2.x86_64                        45/72
  Verifying  : 4:perl-5.16.3-294.amzn2.x86_64                             46/72
  Verifying  : less-458-9.amzn2.0.2.x86_64                                47/72
  Verifying  : pam-1.1.8-22.amzn2.x86_64                                  48/72
  Verifying  : 1:perl-Error-0.17020-2.amzn2.noarch                        49/72
  Verifying  : perl-Socket-2.010-4.amzn2.0.2.x86_64                       50/72
  Verifying  : kmod-25-3.amzn2.0.2.x86_64                                 51/72
  Verifying  : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                52/72
  Verifying  : perl-Carp-1.26-244.amzn2.noarch                            53/72
  Verifying  : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     54/72
  Verifying  : 1:perl-parent-0.225-244.amzn2.0.1.noarch                   55/72
  Verifying  : libpwquality-1.2.3-5.amzn2.x86_64                          56/72
  Verifying  : perl-File-Temp-0.23.01-3.amzn2.noarch                      57/72
  Verifying  : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 58/72
  Verifying  : perl-Pod-Perldoc-3.20-4.amzn2.noarch                       59/72
  Verifying  : acl-2.2.51-14.amzn2.x86_64                                 60/72
  Verifying  : 1:dbus-1.10.24-7.amzn2.x86_64                              61/72
  Verifying  : audit-libs-2.8.1-3.amzn2.1.x86_64                          62/72
  Verifying  : elfutils-libs-0.170-4.amzn2.x86_64                         63/72
  Verifying  : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                64/72
  Verifying  : openssh-7.4p1-16.amzn2.0.6.x86_64                          65/72
  Verifying  : groff-base-1.22.2-8.amzn2.0.2.x86_64                       66/72
  Verifying  : perl-Text-ParseWords-3.29-4.amzn2.noarch                   67/72
  Verifying  : perl-File-Path-2.09-2.amzn2.noarch                         68/72
  Verifying  : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  69/72
  Verifying  : perl-Storable-2.45-3.amzn2.0.2.x86_64                      70/72
  Verifying  : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   71/72
  Verifying  : git-core-doc-2.17.2-2.amzn2.noarch                         72/72

Installed:
  git.x86_64 0:2.17.2-2.amzn2             gzip.x86_64 0:1.5-10.amzn2
  tar.x86_64 2:1.26-34.amzn2

Dependency Installed:
  acl.x86_64 0:2.2.51-14.amzn2
  audit-libs.x86_64 0:2.8.1-3.amzn2.1
  cracklib.x86_64 0:2.9.0-11.amzn2.0.2
  cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2
  cryptsetup-libs.x86_64 0:1.7.4-4.amzn2
  dbus.x86_64 1:1.10.24-7.amzn2
  dbus-libs.x86_64 1:1.10.24-7.amzn2
  device-mapper.x86_64 7:1.02.146-4.amzn2.0.2
  device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  elfutils-default-yama-scope.noarch 0:0.170-4.amzn2
  elfutils-libs.x86_64 0:0.170-4.amzn2
  emacs-filesystem.noarch 1:25.3-3.amzn2.0.1
  fipscheck.x86_64 0:1.4.1-6.amzn2.0.2
  fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2
  git-core.x86_64 0:2.17.2-2.amzn2
  git-core-doc.noarch 0:2.17.2-2.amzn2
  groff-base.x86_64 0:1.22.2-8.amzn2.0.2
  kmod.x86_64 0:25-3.amzn2.0.2
  kmod-libs.x86_64 0:25-3.amzn2.0.2
  less.x86_64 0:458-9.amzn2.0.2
  libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4
  libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2
  libfdisk.x86_64 0:2.30.2-2.amzn2.0.4
  libpwquality.x86_64 0:1.2.3-5.amzn2
  libsecret.x86_64 0:0.18.5-2.amzn2.0.2
  libsemanage.x86_64 0:2.5-11.amzn2
  libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4
  libutempter.x86_64 0:1.1.6-4.amzn2.0.2
  lz4.x86_64 0:1.7.5-2.amzn2.0.1
  openssh.x86_64 0:7.4p1-16.amzn2.0.6
  openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6
  pam.x86_64 0:1.1.8-22.amzn2
  pcre2.x86_64 0:10.23-2.amzn2.0.2
  perl.x86_64 4:5.16.3-294.amzn2
  perl-Carp.noarch 0:1.26-244.amzn2
  perl-Encode.x86_64 0:2.51-7.amzn2.0.2
  perl-Error.noarch 1:0.17020-2.amzn2
  perl-Exporter.noarch 0:5.68-3.amzn2
  perl-File-Path.noarch 0:2.09-2.amzn2
  perl-File-Temp.noarch 0:0.23.01-3.amzn2
  perl-Filter.x86_64 0:1.49-3.amzn2.0.2
  perl-Getopt-Long.noarch 0:2.40-3.amzn2
  perl-Git.noarch 0:2.17.2-2.amzn2
  perl-HTTP-Tiny.noarch 0:0.033-3.amzn2
  perl-PathTools.x86_64 0:3.40-5.amzn2.0.2
  perl-Pod-Escapes.noarch 1:1.04-294.amzn2
  perl-Pod-Perldoc.noarch 0:3.20-4.amzn2
  perl-Pod-Simple.noarch 1:3.28-4.amzn2
  perl-Pod-Usage.noarch 0:1.63-3.amzn2
  perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2
  perl-Socket.x86_64 0:2.010-4.amzn2.0.2
  perl-Storable.x86_64 0:2.45-3.amzn2.0.2
  perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2
  perl-Text-ParseWords.noarch 0:3.29-4.amzn2
  perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2
  perl-Time-Local.noarch 0:1.2300-2.amzn2
  perl-constant.noarch 0:1.27-2.amzn2.0.1
  perl-libs.x86_64 4:5.16.3-294.amzn2
  perl-macros.x86_64 4:5.16.3-294.amzn2
  perl-parent.noarch 1:0.225-244.amzn2.0.1
  perl-podlators.noarch 0:2.5.1-3.amzn2.0.1
  perl-threads.x86_64 0:1.87-4.amzn2.0.2
  perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2
  qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2
  shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2
  systemd.x86_64 0:219-57.amzn2.0.9
  systemd-libs.x86_64 0:219-57.amzn2.0.9
  ustr.x86_64 0:1.0.4-16.amzn2.0.3
  util-linux.x86_64 0:2.30.2-2.amzn2.0.4

Complete!
Removing intermediate container 83ffbd270874
 ---> 7f7ec575693b
Step 3/14 : RUN touch ~/.profile
 ---> Running in f185831bea03
Removing intermediate container f185831bea03
 ---> bcacff5db5c9
Step 4/14 : RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault
 ---> Running in ba333fe0d0a3
Cloning into 'repro-bluebird-segfault'...
Removing intermediate container ba333fe0d0a3
 ---> a4ba5038a25f
Step 5/14 : RUN cd repro-bluebird-segfault
 ---> Running in 73f3fa5d9395
Removing intermediate container 73f3fa5d9395
 ---> 5d528e20a990
Step 6/14 : RUN mkdir -p /usr/local/nvm
 ---> Running in 62458bf89505
Removing intermediate container 62458bf89505
 ---> f65612e9fbd8
Step 7/14 : ENV NVM_DIR /usr/local/nvm
 ---> Running in fefa3dbb77b1
Removing intermediate container fefa3dbb77b1
 ---> 60dc5e6260cb
Step 8/14 : ENV NODE_VERSION 10.16.3
 ---> Running in 5e0c38abd1bc
Removing intermediate container 5e0c38abd1bc
 ---> e835c69112fb
Step 9/14 : RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
 ---> Running in e0110debd162
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0   150k      0 --:--:-- --:--:-- --:--:--  151k
=> Downloading nvm from git to '/usr/local/nvm'
=> Cloning into '/usr/local/nvm'...
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.profile
=> bash_completion source string already in /root/.profile
=> Installing Node.js version 10.16.3
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

Creating default alias: default -> 10.16.3 (-> v10.16.3 *)
Failed to install Node.js 10.16.3
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
Removing intermediate container e0110debd162
 ---> 5d5eecfb2e2d
Step 10/14 : RUN source $NVM_DIR/nvm.sh     && nvm install $NODE_VERSION     && nvm alias default $NODE_VERSION     && nvm use default
 ---> Running in 1c2e9fad1205
v10.16.3 is already installed.
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

default -> 10.16.3 (-> v10.16.3 *)
Now using node v10.16.3 (npm v6.9.0)
Removing intermediate container 1c2e9fad1205
 ---> d53bfd1475dd
Step 11/14 : ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
 ---> Running in b94f6890b84d
Removing intermediate container b94f6890b84d
 ---> bd7c4f87a6bf
Step 12/14 : ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
 ---> Running in d79713dfeb51
Removing intermediate container d79713dfeb51
 ---> 7918046b71db
Step 13/14 : RUN node -v
 ---> Running in 619d5d327646
v10.16.3
Removing intermediate container 619d5d327646
 ---> 7864818c3192
Step 14/14 : RUN npm -v
 ---> Running in f82c279f73bb
6.9.0
Removing intermediate container f82c279f73bb
 ---> ef7a6ad052d2
Successfully built ef7a6ad052d2
Successfully tagged bb-repro:latest
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker run -it bb-repro bash
bash-4.2# ls
bin   dev  home  lib64	media  opt   repro-bluebird-segfault  run   srv  tmp  var
boot  etc  lib	 local	mnt    proc  root		      sbin  sys  usr
bash-4.2# cd repro-bluebird-segfault/
bash-4.2# npm run repro

> repro@1.0.0 repro /repro-bluebird-segfault
> ./run-until-fail.sh node methods.tap.js

internal/modules/cjs/loader.js:638
    throw err;
    ^

Error: Cannot find module 'tap'
    at Function.Module._resolveFilename (internal/modules/cjs/loader.js:636:15)
    at Function.Module._load (internal/modules/cjs/loader.js:562:25)
    at Module.require (internal/modules/cjs/loader.js:692:17)
    at require (internal/modules/cjs/helpers.js:25:18)
    at Object.<anonymous> (/repro-bluebird-segfault/methods.tap.js:3:11)
    at Module._compile (internal/modules/cjs/loader.js:778:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:789:10)
    at Module.load (internal/modules/cjs/loader.js:653:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:593:12)
    at Function.Module._load (internal/modules/cjs/loader.js:585:3)
bash-4.2# exit
exit
^[[AC02V30M6HTDG:repro-bluebird-segfault astorm$ docker build --no-cache -t bb-repro .
Sending build context to Docker daemon  88.43MB
Step 1/15 : FROM amazonlinux:2.0.20190823.1
 ---> dc34c260f454
Step 2/15 : RUN yum -y install tar gzip git
 ---> Running in 279aff1daf2e
Loaded plugins: ovl, priorities
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl-Git = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core-doc = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl >= 5.008 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: emacs-filesystem >= 25.3 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(warnings) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(strict) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(lib) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Term::ReadKey) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(IPC::Open2) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git::I18N) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Spec) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Find) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Basename) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: /usr/bin/perl for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libsecret-1.so.0()(64bit) for package: git-2.17.2-2.amzn2.x86_64
---> Package gzip.x86_64 0:1.5-10.amzn2 will be installed
---> Package tar.x86_64 2:1.26-34.amzn2 will be installed
--> Running transaction check
---> Package emacs-filesystem.noarch 1:25.3-3.amzn2.0.1 will be installed
---> Package git-core.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: openssh-clients for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: less for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libpcre2-8.so.0()(64bit) for package: git-core-2.17.2-2.amzn2.x86_64
---> Package git-core-doc.noarch 0:2.17.2-2.amzn2 will be installed
---> Package libsecret.x86_64 0:0.18.5-2.amzn2.0.2 will be installed
---> Package perl.x86_64 4:5.16.3-294.amzn2 will be installed
--> Processing Dependency: perl-libs = 4:5.16.3-294.amzn2 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-294.amzn2.x86_64
---> Package perl-Getopt-Long.noarch 0:2.40-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.amzn2.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.amzn2.noarch
---> Package perl-Git.noarch 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl(Error) for package: perl-Git-2.17.2-2.amzn2.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.amzn2.0.2 will be installed
---> Package perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2 will be installed
--> Running transaction check
---> Package less.x86_64 0:458-9.amzn2.0.2 will be installed
--> Processing Dependency: groff-base for package: less-458-9.amzn2.0.2.x86_64
---> Package openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: openssh = 7.4p1-16.amzn2.0.6 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: fipscheck-lib(x86-64) >= 1.3.0 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libfipscheck.so.1()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
---> Package pcre2.x86_64 0:10.23-2.amzn2.0.2 will be installed
---> Package perl-Carp.noarch 0:1.26-244.amzn2 will be installed
---> Package perl-Error.noarch 1:0.17020-2.amzn2 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.amzn2 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.amzn2 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.amzn2 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.amzn2.0.2 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.amzn2 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
---> Package perl-Pod-Usage.noarch 0:1.63-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.amzn2.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.amzn2.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.amzn2.0.2 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.amzn2.0.2 will be installed
---> Package perl-Text-ParseWords.noarch 0:3.29-4.amzn2 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.amzn2 will be installed
---> Package perl-constant.noarch 0:1.27-2.amzn2.0.1 will be installed
---> Package perl-libs.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-macros.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-threads.x86_64 0:1.87-4.amzn2.0.2 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2 will be installed
--> Running transaction check
---> Package fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
--> Processing Dependency: /usr/bin/fipscheck for package: fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64
---> Package groff-base.x86_64 0:1.22.2-8.amzn2.0.2 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2 will be installed
---> Package openssh.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: audit-libs >= 1.0.8 for package: openssh-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: /sbin/nologin for package: openssh-7.4p1-16.amzn2.0.6.x86_64
---> Package perl-Encode.x86_64 0:2.51-7.amzn2.0.2 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-294.amzn2 will be installed
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.amzn2 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.amzn2.0.1 will be installed
--> Running transaction check
---> Package audit-libs.x86_64 0:2.8.1-3.amzn2.1 will be installed
--> Processing Dependency: libcap-ng.so.0()(64bit) for package: audit-libs-2.8.1-3.amzn2.1.x86_64
---> Package fipscheck.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.amzn2 will be installed
---> Package perl-parent.noarch 1:0.225-244.amzn2.0.1 will be installed
---> Package util-linux.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
--> Processing Dependency: libsmartcols = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: pam >= 1.1.3-7 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0(UTEMPTER_1.1)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1(LIBUDEV_183)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0(LIBSYSTEMD_209)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.25)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0(LIBPAM_MISC_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0(LIBPAM_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.26)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: /etc/pam.d/system-auth for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Running transaction check
---> Package libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4 will be installed
---> Package libfdisk.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libutempter.x86_64 0:1.1.6-4.amzn2.0.2 will be installed
--> Processing Dependency: shadow-utils for package: libutempter-1.1.6-4.amzn2.0.2.x86_64
---> Package pam.x86_64 0:1.1.8-22.amzn2 will be installed
--> Processing Dependency: libpwquality >= 0.9.9 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: cracklib-dicts >= 2.8 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: libcrack.so.2()(64bit) for package: pam-1.1.8-22.amzn2.x86_64
---> Package systemd-libs.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: liblz4.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libdw.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Running transaction check
---> Package cracklib.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package elfutils-libs.x86_64 0:0.170-4.amzn2 will be installed
--> Processing Dependency: default-yama-scope for package: elfutils-libs-0.170-4.amzn2.x86_64
---> Package libpwquality.x86_64 0:1.2.3-5.amzn2 will be installed
---> Package lz4.x86_64 0:1.7.5-2.amzn2.0.1 will be installed
---> Package shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2 will be installed
--> Processing Dependency: libsemanage.so.1(LIBSEMANAGE_1.0)(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Processing Dependency: libsemanage.so.1()(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Running transaction check
---> Package elfutils-default-yama-scope.noarch 0:0.170-4.amzn2 will be installed
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
---> Package libsemanage.x86_64 0:2.5-11.amzn2 will be installed
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0.1)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1()(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Running transaction check
---> Package systemd.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: kmod >= 18-4 for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2(LIBKMOD_5)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4(CRYPTSETUP_1.0)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: dbus for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: acl for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libqrencode.so.3()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
---> Package ustr.x86_64 0:1.0.4-16.amzn2.0.3 will be installed
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.amzn2 will be installed
---> Package cryptsetup-libs.x86_64 0:1.7.4-4.amzn2 will be installed
--> Processing Dependency: libdevmapper.so.1.02(DM_1_02_97)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02(Base)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02()(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
---> Package dbus.x86_64 1:1.10.24-7.amzn2 will be installed
--> Processing Dependency: dbus-libs(x86-64) = 1:1.10.24-7.amzn2 for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_PRIVATE_1.10.24)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_1_3)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3()(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
---> Package kmod.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package kmod-libs.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2 will be installed
--> Running transaction check
---> Package dbus-libs.x86_64 1:1.10.24-7.amzn2 will be installed
---> Package device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Processing Dependency: device-mapper = 7:1.02.146-4.amzn2.0.2 for package: 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64
--> Running transaction check
---> Package device-mapper.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                   Arch   Version                      Repository  Size
================================================================================
Installing:
 git                       x86_64 2.17.2-2.amzn2               amzn2-core 217 k
 gzip                      x86_64 1.5-10.amzn2                 amzn2-core 130 k
 tar                       x86_64 2:1.26-34.amzn2              amzn2-core 849 k
Installing for dependencies:
 acl                       x86_64 2.2.51-14.amzn2              amzn2-core  82 k
 audit-libs                x86_64 2.8.1-3.amzn2.1              amzn2-core  99 k
 cracklib                  x86_64 2.9.0-11.amzn2.0.2           amzn2-core  80 k
 cracklib-dicts            x86_64 2.9.0-11.amzn2.0.2           amzn2-core 3.6 M
 cryptsetup-libs           x86_64 1.7.4-4.amzn2                amzn2-core 224 k
 dbus                      x86_64 1:1.10.24-7.amzn2            amzn2-core 247 k
 dbus-libs                 x86_64 1:1.10.24-7.amzn2            amzn2-core 169 k
 device-mapper             x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 289 k
 device-mapper-libs        x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 320 k
 elfutils-default-yama-scope
                           noarch 0.170-4.amzn2                amzn2-core  31 k
 elfutils-libs             x86_64 0.170-4.amzn2                amzn2-core 270 k
 emacs-filesystem          noarch 1:25.3-3.amzn2.0.1           amzn2-core  64 k
 fipscheck                 x86_64 1.4.1-6.amzn2.0.2            amzn2-core  21 k
 fipscheck-lib             x86_64 1.4.1-6.amzn2.0.2            amzn2-core  11 k
 git-core                  x86_64 2.17.2-2.amzn2               amzn2-core 4.0 M
 git-core-doc              noarch 2.17.2-2.amzn2               amzn2-core 2.3 M
 groff-base                x86_64 1.22.2-8.amzn2.0.2           amzn2-core 948 k
 kmod                      x86_64 25-3.amzn2.0.2               amzn2-core 111 k
 kmod-libs                 x86_64 25-3.amzn2.0.2               amzn2-core  59 k
 less                      x86_64 458-9.amzn2.0.2              amzn2-core 121 k
 libcap-ng                 x86_64 0.7.5-4.amzn2.0.4            amzn2-core  25 k
 libedit                   x86_64 3.0-12.20121213cvs.amzn2.0.2 amzn2-core  93 k
 libfdisk                  x86_64 2.30.2-2.amzn2.0.4           amzn2-core 240 k
 libpwquality              x86_64 1.2.3-5.amzn2                amzn2-core  84 k
 libsecret                 x86_64 0.18.5-2.amzn2.0.2           amzn2-core 153 k
 libsemanage               x86_64 2.5-11.amzn2                 amzn2-core 152 k
 libsmartcols              x86_64 2.30.2-2.amzn2.0.4           amzn2-core 156 k
 libutempter               x86_64 1.1.6-4.amzn2.0.2            amzn2-core  25 k
 lz4                       x86_64 1.7.5-2.amzn2.0.1            amzn2-core  99 k
 openssh                   x86_64 7.4p1-16.amzn2.0.6           amzn2-core 509 k
 openssh-clients           x86_64 7.4p1-16.amzn2.0.6           amzn2-core 657 k
 pam                       x86_64 1.1.8-22.amzn2               amzn2-core 718 k
 pcre2                     x86_64 10.23-2.amzn2.0.2            amzn2-core 209 k
 perl                      x86_64 4:5.16.3-294.amzn2           amzn2-core 8.0 M
 perl-Carp                 noarch 1.26-244.amzn2               amzn2-core  19 k
 perl-Encode               x86_64 2.51-7.amzn2.0.2             amzn2-core 1.5 M
 perl-Error                noarch 1:0.17020-2.amzn2            amzn2-core  32 k
 perl-Exporter             noarch 5.68-3.amzn2                 amzn2-core  29 k
 perl-File-Path            noarch 2.09-2.amzn2                 amzn2-core  27 k
 perl-File-Temp            noarch 0.23.01-3.amzn2              amzn2-core  56 k
 perl-Filter               x86_64 1.49-3.amzn2.0.2             amzn2-core  76 k
 perl-Getopt-Long          noarch 2.40-3.amzn2                 amzn2-core  56 k
 perl-Git                  noarch 2.17.2-2.amzn2               amzn2-core  70 k
 perl-HTTP-Tiny            noarch 0.033-3.amzn2                amzn2-core  38 k
 perl-PathTools            x86_64 3.40-5.amzn2.0.2             amzn2-core  83 k
 perl-Pod-Escapes          noarch 1:1.04-294.amzn2             amzn2-core  51 k
 perl-Pod-Perldoc          noarch 3.20-4.amzn2                 amzn2-core  87 k
 perl-Pod-Simple           noarch 1:3.28-4.amzn2               amzn2-core 216 k
 perl-Pod-Usage            noarch 1.63-3.amzn2                 amzn2-core  27 k
 perl-Scalar-List-Utils    x86_64 1.27-248.amzn2.0.2           amzn2-core  36 k
 perl-Socket               x86_64 2.010-4.amzn2.0.2            amzn2-core  49 k
 perl-Storable             x86_64 2.45-3.amzn2.0.2             amzn2-core  78 k
 perl-TermReadKey          x86_64 2.30-20.amzn2.0.2            amzn2-core  31 k
 perl-Text-ParseWords      noarch 3.29-4.amzn2                 amzn2-core  14 k
 perl-Time-HiRes           x86_64 4:1.9725-3.amzn2.0.2         amzn2-core  45 k
 perl-Time-Local           noarch 1.2300-2.amzn2               amzn2-core  24 k
 perl-constant             noarch 1.27-2.amzn2.0.1             amzn2-core  19 k
 perl-libs                 x86_64 4:5.16.3-294.amzn2           amzn2-core 700 k
 perl-macros               x86_64 4:5.16.3-294.amzn2           amzn2-core  44 k
 perl-parent               noarch 1:0.225-244.amzn2.0.1        amzn2-core  12 k
 perl-podlators            noarch 2.5.1-3.amzn2.0.1            amzn2-core 112 k
 perl-threads              x86_64 1.87-4.amzn2.0.2             amzn2-core  50 k
 perl-threads-shared       x86_64 1.43-6.amzn2.0.2             amzn2-core  39 k
 qrencode-libs             x86_64 3.4.1-3.amzn2.0.2            amzn2-core  50 k
 shadow-utils              x86_64 2:4.1.5.1-24.amzn2.0.2       amzn2-core 1.1 M
 systemd                   x86_64 219-57.amzn2.0.9             amzn2-core 5.0 M
 systemd-libs              x86_64 219-57.amzn2.0.9             amzn2-core 396 k
 ustr                      x86_64 1.0.4-16.amzn2.0.3           amzn2-core  96 k
 util-linux                x86_64 2.30.2-2.amzn2.0.4           amzn2-core 2.3 M

Transaction Summary
================================================================================
Install  3 Packages (+69 Dependent packages)

Total download size: 38 M
Installed size: 140 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                               22 MB/s |  38 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                          1/72
  Installing : audit-libs-2.8.1-3.amzn2.1.x86_64                           2/72
  Installing : groff-base-1.22.2-8.amzn2.0.2.x86_64                        3/72
  Installing : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Installing : less-458-9.amzn2.0.2.x86_64                                 5/72
  Installing : perl-HTTP-Tiny-0.033-3.amzn2.noarch                         6/72
  Installing : 1:perl-parent-0.225-244.amzn2.0.1.noarch                    7/72
  Installing : perl-podlators-2.5.1-3.amzn2.0.1.noarch                     8/72
  Installing : perl-Pod-Perldoc-3.20-4.amzn2.noarch                        9/72
  Installing : perl-Encode-2.51-7.amzn2.0.2.x86_64                        10/72
  Installing : perl-Text-ParseWords-3.29-4.amzn2.noarch                   11/72
  Installing : perl-Pod-Usage-1.63-3.amzn2.noarch                         12/72
  Installing : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   13/72
  Installing : 4:perl-macros-5.16.3-294.amzn2.x86_64                      14/72
  Installing : 4:perl-libs-5.16.3-294.amzn2.x86_64                        15/72
  Installing : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Installing : perl-constant-1.27-2.amzn2.0.1.noarch                      17/72
  Installing : perl-Time-Local-1.2300-2.amzn2.noarch                      18/72
  Installing : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           19/72
  Installing : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                20/72
  Installing : perl-threads-1.87-4.amzn2.0.2.x86_64                       21/72
  Installing : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     22/72
  Installing : perl-Socket-2.010-4.amzn2.0.2.x86_64                       23/72
  Installing : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                24/72
  Installing : perl-Carp-1.26-244.amzn2.noarch                            25/72
  Installing : perl-File-Temp-0.23.01-3.amzn2.noarch                      26/72
  Installing : perl-File-Path-2.09-2.amzn2.noarch                         27/72
  Installing : perl-Storable-2.45-3.amzn2.0.2.x86_64                      28/72
  Installing : perl-Getopt-Long-2.40-3.amzn2.noarch                       29/72
  Installing : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      30/72
  Installing : perl-Exporter-5.68-3.amzn2.noarch                          31/72
  Installing : 4:perl-5.16.3-294.amzn2.x86_64                             32/72
  Installing : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  33/72
  Installing : 1:perl-Error-0.17020-2.amzn2.noarch                        34/72
  Installing : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     35/72
  Installing : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         36/72
  Installing : acl-2.2.51-14.amzn2.x86_64                                 37/72
  Installing : kmod-25-3.amzn2.0.2.x86_64                                 38/72
  Installing : pcre2-10.23-2.amzn2.0.2.x86_64                             39/72
  Installing : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     40/72
  Installing : kmod-libs-25-3.amzn2.0.2.x86_64                            41/72
  Installing : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         42/72
  Installing : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                43/72
  Installing : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     44/72
  Installing : ustr-1.0.4-16.amzn2.0.3.x86_64                             45/72
  Installing : libsemanage-2.5-11.amzn2.x86_64                            46/72
  Installing : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 47/72
  Installing : libutempter-1.1.6-4.amzn2.0.2.x86_64                       48/72
  Installing : gzip-1.5-10.amzn2.x86_64                                   49/72
  Installing : cracklib-2.9.0-11.amzn2.0.2.x86_64                         50/72
  Installing : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   51/72
  Installing : pam-1.1.8-22.amzn2.x86_64                                  52/72
  Installing : libpwquality-1.2.3-5.amzn2.x86_64                          53/72
  Installing : util-linux-2.30.2-2.amzn2.0.4.x86_64                       54/72
  Installing : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                55/72
  Installing : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           56/72
  Installing : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       57/72
  Installing : elfutils-libs-0.170-4.amzn2.x86_64                         58/72
  Installing : systemd-libs-219-57.amzn2.0.9.x86_64                       59/72
  Installing : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         60/72
  Installing : systemd-219-57.amzn2.0.9.x86_64                            61/72
  Installing : elfutils-default-yama-scope-0.170-4.amzn2.noarch           62/72
  Installing : 1:dbus-1.10.24-7.amzn2.x86_64                              63/72
  Installing : openssh-7.4p1-16.amzn2.0.6.x86_64                          64/72
  Installing : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  65/72
  Installing : git-core-2.17.2-2.amzn2.x86_64                             66/72
  Installing : git-core-doc-2.17.2-2.amzn2.noarch                         67/72
  Installing : libsecret-0.18.5-2.amzn2.0.2.x86_64                        68/72
  Installing : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                 69/72
  Installing : perl-Git-2.17.2-2.amzn2.noarch                             70/72
  Installing : git-2.17.2-2.amzn2.x86_64                                  71/72
  Installing : 2:tar-1.26-34.amzn2.x86_64                                 72/72
  Verifying  : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  1/72
  Verifying  : libsecret-0.18.5-2.amzn2.0.2.x86_64                         2/72
  Verifying  : perl-Exporter-5.68-3.amzn2.noarch                           3/72
  Verifying  : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Verifying  : git-core-2.17.2-2.amzn2.x86_64                              5/72
  Verifying  : gzip-1.5-10.amzn2.x86_64                                    6/72
  Verifying  : perl-Pod-Usage-1.63-3.amzn2.noarch                          7/72
  Verifying  : git-2.17.2-2.amzn2.x86_64                                   8/72
  Verifying  : cracklib-2.9.0-11.amzn2.0.2.x86_64                          9/72
  Verifying  : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         10/72
  Verifying  : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           11/72
  Verifying  : ustr-1.0.4-16.amzn2.0.3.x86_64                             12/72
  Verifying  : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     13/72
  Verifying  : 2:tar-1.26-34.amzn2.x86_64                                 14/72
  Verifying  : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       15/72
  Verifying  : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Verifying  : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                17/72
  Verifying  : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         18/72
  Verifying  : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                19/72
  Verifying  : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      20/72
  Verifying  : libsemanage-2.5-11.amzn2.x86_64                            21/72
  Verifying  : libutempter-1.1.6-4.amzn2.0.2.x86_64                       22/72
  Verifying  : 4:perl-macros-5.16.3-294.amzn2.x86_64                      23/72
  Verifying  : systemd-libs-219-57.amzn2.0.9.x86_64                       24/72
  Verifying  : perl-constant-1.27-2.amzn2.0.1.noarch                      25/72
  Verifying  : perl-Time-Local-1.2300-2.amzn2.noarch                      26/72
  Verifying  : kmod-libs-25-3.amzn2.0.2.x86_64                            27/72
  Verifying  : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     28/72
  Verifying  : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           29/72
  Verifying  : perl-Git-2.17.2-2.amzn2.noarch                             30/72
  Verifying  : systemd-219-57.amzn2.0.9.x86_64                            31/72
  Verifying  : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         32/72
  Verifying  : perl-threads-1.87-4.amzn2.0.2.x86_64                       33/72
  Verifying  : 4:perl-libs-5.16.3-294.amzn2.x86_64                        34/72
  Verifying  : perl-podlators-2.5.1-3.amzn2.0.1.noarch                    35/72
  Verifying  : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   36/72
  Verifying  : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  37/72
  Verifying  : elfutils-default-yama-scope-0.170-4.amzn2.noarch           38/72
  Verifying  : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     39/72
  Verifying  : perl-HTTP-Tiny-0.033-3.amzn2.noarch                        40/72
  Verifying  : util-linux-2.30.2-2.amzn2.0.4.x86_64                       41/72
  Verifying  : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                         42/72
  Verifying  : pcre2-10.23-2.amzn2.0.2.x86_64                             43/72
  Verifying  : perl-Getopt-Long-2.40-3.amzn2.noarch                       44/72
  Verifying  : perl-Encode-2.51-7.amzn2.0.2.x86_64                        45/72
  Verifying  : 4:perl-5.16.3-294.amzn2.x86_64                             46/72
  Verifying  : less-458-9.amzn2.0.2.x86_64                                47/72
  Verifying  : pam-1.1.8-22.amzn2.x86_64                                  48/72
  Verifying  : 1:perl-Error-0.17020-2.amzn2.noarch                        49/72
  Verifying  : perl-Socket-2.010-4.amzn2.0.2.x86_64                       50/72
  Verifying  : kmod-25-3.amzn2.0.2.x86_64                                 51/72
  Verifying  : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                52/72
  Verifying  : perl-Carp-1.26-244.amzn2.noarch                            53/72
  Verifying  : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     54/72
  Verifying  : 1:perl-parent-0.225-244.amzn2.0.1.noarch                   55/72
  Verifying  : libpwquality-1.2.3-5.amzn2.x86_64                          56/72
  Verifying  : perl-File-Temp-0.23.01-3.amzn2.noarch                      57/72
  Verifying  : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 58/72
  Verifying  : perl-Pod-Perldoc-3.20-4.amzn2.noarch                       59/72
  Verifying  : acl-2.2.51-14.amzn2.x86_64                                 60/72
  Verifying  : 1:dbus-1.10.24-7.amzn2.x86_64                              61/72
  Verifying  : audit-libs-2.8.1-3.amzn2.1.x86_64                          62/72
  Verifying  : elfutils-libs-0.170-4.amzn2.x86_64                         63/72
  Verifying  : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                64/72
  Verifying  : openssh-7.4p1-16.amzn2.0.6.x86_64                          65/72
  Verifying  : groff-base-1.22.2-8.amzn2.0.2.x86_64                       66/72
  Verifying  : perl-Text-ParseWords-3.29-4.amzn2.noarch                   67/72
  Verifying  : perl-File-Path-2.09-2.amzn2.noarch                         68/72
  Verifying  : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  69/72
  Verifying  : perl-Storable-2.45-3.amzn2.0.2.x86_64                      70/72
  Verifying  : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   71/72
  Verifying  : git-core-doc-2.17.2-2.amzn2.noarch                         72/72

Installed:
  git.x86_64 0:2.17.2-2.amzn2             gzip.x86_64 0:1.5-10.amzn2
  tar.x86_64 2:1.26-34.amzn2

Dependency Installed:
  acl.x86_64 0:2.2.51-14.amzn2
  audit-libs.x86_64 0:2.8.1-3.amzn2.1
  cracklib.x86_64 0:2.9.0-11.amzn2.0.2
  cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2
  cryptsetup-libs.x86_64 0:1.7.4-4.amzn2
  dbus.x86_64 1:1.10.24-7.amzn2
  dbus-libs.x86_64 1:1.10.24-7.amzn2
  device-mapper.x86_64 7:1.02.146-4.amzn2.0.2
  device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  elfutils-default-yama-scope.noarch 0:0.170-4.amzn2
  elfutils-libs.x86_64 0:0.170-4.amzn2
  emacs-filesystem.noarch 1:25.3-3.amzn2.0.1
  fipscheck.x86_64 0:1.4.1-6.amzn2.0.2
  fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2
  git-core.x86_64 0:2.17.2-2.amzn2
  git-core-doc.noarch 0:2.17.2-2.amzn2
  groff-base.x86_64 0:1.22.2-8.amzn2.0.2
  kmod.x86_64 0:25-3.amzn2.0.2
  kmod-libs.x86_64 0:25-3.amzn2.0.2
  less.x86_64 0:458-9.amzn2.0.2
  libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4
  libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2
  libfdisk.x86_64 0:2.30.2-2.amzn2.0.4
  libpwquality.x86_64 0:1.2.3-5.amzn2
  libsecret.x86_64 0:0.18.5-2.amzn2.0.2
  libsemanage.x86_64 0:2.5-11.amzn2
  libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4
  libutempter.x86_64 0:1.1.6-4.amzn2.0.2
  lz4.x86_64 0:1.7.5-2.amzn2.0.1
  openssh.x86_64 0:7.4p1-16.amzn2.0.6
  openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6
  pam.x86_64 0:1.1.8-22.amzn2
  pcre2.x86_64 0:10.23-2.amzn2.0.2
  perl.x86_64 4:5.16.3-294.amzn2
  perl-Carp.noarch 0:1.26-244.amzn2
  perl-Encode.x86_64 0:2.51-7.amzn2.0.2
  perl-Error.noarch 1:0.17020-2.amzn2
  perl-Exporter.noarch 0:5.68-3.amzn2
  perl-File-Path.noarch 0:2.09-2.amzn2
  perl-File-Temp.noarch 0:0.23.01-3.amzn2
  perl-Filter.x86_64 0:1.49-3.amzn2.0.2
  perl-Getopt-Long.noarch 0:2.40-3.amzn2
  perl-Git.noarch 0:2.17.2-2.amzn2
  perl-HTTP-Tiny.noarch 0:0.033-3.amzn2
  perl-PathTools.x86_64 0:3.40-5.amzn2.0.2
  perl-Pod-Escapes.noarch 1:1.04-294.amzn2
  perl-Pod-Perldoc.noarch 0:3.20-4.amzn2
  perl-Pod-Simple.noarch 1:3.28-4.amzn2
  perl-Pod-Usage.noarch 0:1.63-3.amzn2
  perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2
  perl-Socket.x86_64 0:2.010-4.amzn2.0.2
  perl-Storable.x86_64 0:2.45-3.amzn2.0.2
  perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2
  perl-Text-ParseWords.noarch 0:3.29-4.amzn2
  perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2
  perl-Time-Local.noarch 0:1.2300-2.amzn2
  perl-constant.noarch 0:1.27-2.amzn2.0.1
  perl-libs.x86_64 4:5.16.3-294.amzn2
  perl-macros.x86_64 4:5.16.3-294.amzn2
  perl-parent.noarch 1:0.225-244.amzn2.0.1
  perl-podlators.noarch 0:2.5.1-3.amzn2.0.1
  perl-threads.x86_64 0:1.87-4.amzn2.0.2
  perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2
  qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2
  shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2
  systemd.x86_64 0:219-57.amzn2.0.9
  systemd-libs.x86_64 0:219-57.amzn2.0.9
  ustr.x86_64 0:1.0.4-16.amzn2.0.3
  util-linux.x86_64 0:2.30.2-2.amzn2.0.4

Complete!
Removing intermediate container 279aff1daf2e
 ---> b67efe012672
Step 3/15 : RUN touch ~/.profile
 ---> Running in cce6aecc0705
Removing intermediate container cce6aecc0705
 ---> 3dde948f2d5e
Step 4/15 : RUN mkdir -p /usr/local/nvm
 ---> Running in b091a395f941
Removing intermediate container b091a395f941
 ---> 7b468d290929
Step 5/15 : ENV NVM_DIR /usr/local/nvm
 ---> Running in ec3b8b40a044
Removing intermediate container ec3b8b40a044
 ---> 48ef1e6c629a
Step 6/15 : ENV NODE_VERSION 10.16.3
 ---> Running in 27457d083814
Removing intermediate container 27457d083814
 ---> 558744618ebb
Step 7/15 : RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
 ---> Running in 63bf88f01002
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0  43217      0 --:--:-- --:--:-- --:--:-- 43355
=> Downloading nvm from git to '/usr/local/nvm'
=> Cloning into '/usr/local/nvm'...
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.profile
=> bash_completion source string already in /root/.profile
=> Installing Node.js version 10.16.3
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

Creating default alias: default -> 10.16.3 (-> v10.16.3 *)
Failed to install Node.js 10.16.3
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
Removing intermediate container 63bf88f01002
 ---> 8f29cc8f00f5
Step 8/15 : RUN source $NVM_DIR/nvm.sh     && nvm install $NODE_VERSION     && nvm alias default $NODE_VERSION     && nvm use default
 ---> Running in b2d700a07a64
v10.16.3 is already installed.
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

default -> 10.16.3 (-> v10.16.3 *)
Now using node v10.16.3 (npm v6.9.0)
Removing intermediate container b2d700a07a64
 ---> 3aa52216eded
Step 9/15 : ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
 ---> Running in 6116af5a7e11
Removing intermediate container 6116af5a7e11
 ---> 61406a213398
Step 10/15 : ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
 ---> Running in 1977836bd97c
Removing intermediate container 1977836bd97c
 ---> 071be0c38f61
Step 11/15 : RUN node -v
 ---> Running in 860d5fc6f741
v10.16.3
Removing intermediate container 860d5fc6f741
 ---> 0bc6afac2f95
Step 12/15 : RUN npm -v
 ---> Running in 75c3eaa5190a
6.9.0
Removing intermediate container 75c3eaa5190a
 ---> 4a9c98fdcfc6
Step 13/15 : RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault
 ---> Running in be9df7e5eb98
Cloning into 'repro-bluebird-segfault'...
Removing intermediate container be9df7e5eb98
 ---> e0f143b94b3d
Step 14/15 : RUN cd repro-bluebird-segfault
 ---> Running in 86a9c7565be5
Removing intermediate container 86a9c7565be5
 ---> 9625746a96c8
Step 15/15 : RUN npm install
 ---> Running in 997e6586d6f9
npm WARN saveError ENOENT: no such file or directory, open '/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/package.json'
npm WARN !invalid#2 No description
npm WARN !invalid#2 No repository field.
npm WARN !invalid#2 No README data
npm WARN !invalid#2 No license field.

up to date in 0.272s
found 0 vulnerabilities

Removing intermediate container 997e6586d6f9
 ---> 3bb3cf34a518
Successfully built 3bb3cf34a518
Successfully tagged bb-repro:latest
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker run -it bb-repro bash
bash-4.2# ls
bin   dev  home  lib64	media  opt		  proc			   root  sbin  sys  usr
boot  etc  lib	 local	mnt    package-lock.json  repro-bluebird-segfault  run	 srv   tmp  var
bash-4.2# cd repro-bluebird-segfault/
bash-4.2# ls
README.md  methods.tap.js  package-lock.json  package.json  run-until-fail.sh
bash-4.2# node --version
v10.16.3
bash-4.2# npm install
npm WARN repro@1.0.0 No repository field.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.0 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.0: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 415 packages from 233 contributors and audited 1363 packages in 7.933s
found 0 vulnerabilities

bash-4.2# npm run repro

> repro@1.0.0 repro /repro-bluebird-segfault
> ./run-until-fail.sh node methods.tap.js

TAP version 13
# Subtest: bluebird
    # Subtest: new Promise() throw
        1..0
    ok 1 - new Promise() throw # time=9.096ms

    1..1
ok 1 - bluebird # time=50.511ms

1..1
# time=57.243ms
TAP version 13
# Subtest: bluebird
    # Subtest: new Promise() throw
        1..0
    ok 1 - new Promise() throw # time=8.117ms

./run-until-fail.sh: line 3:    40 Segmentation fault      $@
bash-4.2# exit
exit
lC02V30M6HTDG:repro-bluebird-segfault astorm$ ls
Dockerfile		bin			package-lock.json
README.md		methods.tap.js		package.json
README.md.mine		node_modules		run-until-fail.sh
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker build --no-cache -t bb-repro .
Sending build context to Docker daemon  88.43MB
Step 1/15 : FROM amazonlinux:2.0.20190823.1
 ---> dc34c260f454
Step 2/15 : RUN yum -y install tar gzip git
 ---> Running in 9edbd61aeeee
Loaded plugins: ovl, priorities
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl-Git = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core-doc = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl >= 5.008 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: emacs-filesystem >= 25.3 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(warnings) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(strict) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(lib) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Term::ReadKey) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(IPC::Open2) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git::I18N) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Spec) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Find) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Basename) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: /usr/bin/perl for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libsecret-1.so.0()(64bit) for package: git-2.17.2-2.amzn2.x86_64
---> Package gzip.x86_64 0:1.5-10.amzn2 will be installed
---> Package tar.x86_64 2:1.26-34.amzn2 will be installed
--> Running transaction check
---> Package emacs-filesystem.noarch 1:25.3-3.amzn2.0.1 will be installed
---> Package git-core.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: openssh-clients for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: less for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libpcre2-8.so.0()(64bit) for package: git-core-2.17.2-2.amzn2.x86_64
---> Package git-core-doc.noarch 0:2.17.2-2.amzn2 will be installed
---> Package libsecret.x86_64 0:0.18.5-2.amzn2.0.2 will be installed
---> Package perl.x86_64 4:5.16.3-294.amzn2 will be installed
--> Processing Dependency: perl-libs = 4:5.16.3-294.amzn2 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-294.amzn2.x86_64
---> Package perl-Getopt-Long.noarch 0:2.40-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.amzn2.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.amzn2.noarch
---> Package perl-Git.noarch 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl(Error) for package: perl-Git-2.17.2-2.amzn2.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.amzn2.0.2 will be installed
---> Package perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2 will be installed
--> Running transaction check
---> Package less.x86_64 0:458-9.amzn2.0.2 will be installed
--> Processing Dependency: groff-base for package: less-458-9.amzn2.0.2.x86_64
---> Package openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: openssh = 7.4p1-16.amzn2.0.6 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: fipscheck-lib(x86-64) >= 1.3.0 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libfipscheck.so.1()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
---> Package pcre2.x86_64 0:10.23-2.amzn2.0.2 will be installed
---> Package perl-Carp.noarch 0:1.26-244.amzn2 will be installed
---> Package perl-Error.noarch 1:0.17020-2.amzn2 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.amzn2 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.amzn2 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.amzn2 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.amzn2.0.2 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.amzn2 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
---> Package perl-Pod-Usage.noarch 0:1.63-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.amzn2.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.amzn2.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.amzn2.0.2 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.amzn2.0.2 will be installed
---> Package perl-Text-ParseWords.noarch 0:3.29-4.amzn2 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.amzn2 will be installed
---> Package perl-constant.noarch 0:1.27-2.amzn2.0.1 will be installed
---> Package perl-libs.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-macros.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-threads.x86_64 0:1.87-4.amzn2.0.2 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2 will be installed
--> Running transaction check
---> Package fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
--> Processing Dependency: /usr/bin/fipscheck for package: fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64
---> Package groff-base.x86_64 0:1.22.2-8.amzn2.0.2 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2 will be installed
---> Package openssh.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: audit-libs >= 1.0.8 for package: openssh-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: /sbin/nologin for package: openssh-7.4p1-16.amzn2.0.6.x86_64
---> Package perl-Encode.x86_64 0:2.51-7.amzn2.0.2 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-294.amzn2 will be installed
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.amzn2 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.amzn2.0.1 will be installed
--> Running transaction check
---> Package audit-libs.x86_64 0:2.8.1-3.amzn2.1 will be installed
--> Processing Dependency: libcap-ng.so.0()(64bit) for package: audit-libs-2.8.1-3.amzn2.1.x86_64
---> Package fipscheck.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.amzn2 will be installed
---> Package perl-parent.noarch 1:0.225-244.amzn2.0.1 will be installed
---> Package util-linux.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
--> Processing Dependency: libsmartcols = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: pam >= 1.1.3-7 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0(UTEMPTER_1.1)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1(LIBUDEV_183)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0(LIBSYSTEMD_209)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.25)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0(LIBPAM_MISC_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0(LIBPAM_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.26)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: /etc/pam.d/system-auth for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Running transaction check
---> Package libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4 will be installed
---> Package libfdisk.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libutempter.x86_64 0:1.1.6-4.amzn2.0.2 will be installed
--> Processing Dependency: shadow-utils for package: libutempter-1.1.6-4.amzn2.0.2.x86_64
---> Package pam.x86_64 0:1.1.8-22.amzn2 will be installed
--> Processing Dependency: libpwquality >= 0.9.9 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: cracklib-dicts >= 2.8 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: libcrack.so.2()(64bit) for package: pam-1.1.8-22.amzn2.x86_64
---> Package systemd-libs.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: liblz4.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libdw.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Running transaction check
---> Package cracklib.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package elfutils-libs.x86_64 0:0.170-4.amzn2 will be installed
--> Processing Dependency: default-yama-scope for package: elfutils-libs-0.170-4.amzn2.x86_64
---> Package libpwquality.x86_64 0:1.2.3-5.amzn2 will be installed
---> Package lz4.x86_64 0:1.7.5-2.amzn2.0.1 will be installed
---> Package shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2 will be installed
--> Processing Dependency: libsemanage.so.1(LIBSEMANAGE_1.0)(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Processing Dependency: libsemanage.so.1()(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Running transaction check
---> Package elfutils-default-yama-scope.noarch 0:0.170-4.amzn2 will be installed
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
---> Package libsemanage.x86_64 0:2.5-11.amzn2 will be installed
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0.1)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1()(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Running transaction check
---> Package systemd.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: kmod >= 18-4 for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2(LIBKMOD_5)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4(CRYPTSETUP_1.0)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: dbus for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: acl for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libqrencode.so.3()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
---> Package ustr.x86_64 0:1.0.4-16.amzn2.0.3 will be installed
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.amzn2 will be installed
---> Package cryptsetup-libs.x86_64 0:1.7.4-4.amzn2 will be installed
--> Processing Dependency: libdevmapper.so.1.02(DM_1_02_97)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02(Base)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02()(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
---> Package dbus.x86_64 1:1.10.24-7.amzn2 will be installed
--> Processing Dependency: dbus-libs(x86-64) = 1:1.10.24-7.amzn2 for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_PRIVATE_1.10.24)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_1_3)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3()(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
---> Package kmod.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package kmod-libs.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2 will be installed
--> Running transaction check
---> Package dbus-libs.x86_64 1:1.10.24-7.amzn2 will be installed
---> Package device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Processing Dependency: device-mapper = 7:1.02.146-4.amzn2.0.2 for package: 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64
--> Running transaction check
---> Package device-mapper.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                   Arch   Version                      Repository  Size
================================================================================
Installing:
 git                       x86_64 2.17.2-2.amzn2               amzn2-core 217 k
 gzip                      x86_64 1.5-10.amzn2                 amzn2-core 130 k
 tar                       x86_64 2:1.26-34.amzn2              amzn2-core 849 k
Installing for dependencies:
 acl                       x86_64 2.2.51-14.amzn2              amzn2-core  82 k
 audit-libs                x86_64 2.8.1-3.amzn2.1              amzn2-core  99 k
 cracklib                  x86_64 2.9.0-11.amzn2.0.2           amzn2-core  80 k
 cracklib-dicts            x86_64 2.9.0-11.amzn2.0.2           amzn2-core 3.6 M
 cryptsetup-libs           x86_64 1.7.4-4.amzn2                amzn2-core 224 k
 dbus                      x86_64 1:1.10.24-7.amzn2            amzn2-core 247 k
 dbus-libs                 x86_64 1:1.10.24-7.amzn2            amzn2-core 169 k
 device-mapper             x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 289 k
 device-mapper-libs        x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 320 k
 elfutils-default-yama-scope
                           noarch 0.170-4.amzn2                amzn2-core  31 k
 elfutils-libs             x86_64 0.170-4.amzn2                amzn2-core 270 k
 emacs-filesystem          noarch 1:25.3-3.amzn2.0.1           amzn2-core  64 k
 fipscheck                 x86_64 1.4.1-6.amzn2.0.2            amzn2-core  21 k
 fipscheck-lib             x86_64 1.4.1-6.amzn2.0.2            amzn2-core  11 k
 git-core                  x86_64 2.17.2-2.amzn2               amzn2-core 4.0 M
 git-core-doc              noarch 2.17.2-2.amzn2               amzn2-core 2.3 M
 groff-base                x86_64 1.22.2-8.amzn2.0.2           amzn2-core 948 k
 kmod                      x86_64 25-3.amzn2.0.2               amzn2-core 111 k
 kmod-libs                 x86_64 25-3.amzn2.0.2               amzn2-core  59 k
 less                      x86_64 458-9.amzn2.0.2              amzn2-core 121 k
 libcap-ng                 x86_64 0.7.5-4.amzn2.0.4            amzn2-core  25 k
 libedit                   x86_64 3.0-12.20121213cvs.amzn2.0.2 amzn2-core  93 k
 libfdisk                  x86_64 2.30.2-2.amzn2.0.4           amzn2-core 240 k
 libpwquality              x86_64 1.2.3-5.amzn2                amzn2-core  84 k
 libsecret                 x86_64 0.18.5-2.amzn2.0.2           amzn2-core 153 k
 libsemanage               x86_64 2.5-11.amzn2                 amzn2-core 152 k
 libsmartcols              x86_64 2.30.2-2.amzn2.0.4           amzn2-core 156 k
 libutempter               x86_64 1.1.6-4.amzn2.0.2            amzn2-core  25 k
 lz4                       x86_64 1.7.5-2.amzn2.0.1            amzn2-core  99 k
 openssh                   x86_64 7.4p1-16.amzn2.0.6           amzn2-core 509 k
 openssh-clients           x86_64 7.4p1-16.amzn2.0.6           amzn2-core 657 k
 pam                       x86_64 1.1.8-22.amzn2               amzn2-core 718 k
 pcre2                     x86_64 10.23-2.amzn2.0.2            amzn2-core 209 k
 perl                      x86_64 4:5.16.3-294.amzn2           amzn2-core 8.0 M
 perl-Carp                 noarch 1.26-244.amzn2               amzn2-core  19 k
 perl-Encode               x86_64 2.51-7.amzn2.0.2             amzn2-core 1.5 M
 perl-Error                noarch 1:0.17020-2.amzn2            amzn2-core  32 k
 perl-Exporter             noarch 5.68-3.amzn2                 amzn2-core  29 k
 perl-File-Path            noarch 2.09-2.amzn2                 amzn2-core  27 k
 perl-File-Temp            noarch 0.23.01-3.amzn2              amzn2-core  56 k
 perl-Filter               x86_64 1.49-3.amzn2.0.2             amzn2-core  76 k
 perl-Getopt-Long          noarch 2.40-3.amzn2                 amzn2-core  56 k
 perl-Git                  noarch 2.17.2-2.amzn2               amzn2-core  70 k
 perl-HTTP-Tiny            noarch 0.033-3.amzn2                amzn2-core  38 k
 perl-PathTools            x86_64 3.40-5.amzn2.0.2             amzn2-core  83 k
 perl-Pod-Escapes          noarch 1:1.04-294.amzn2             amzn2-core  51 k
 perl-Pod-Perldoc          noarch 3.20-4.amzn2                 amzn2-core  87 k
 perl-Pod-Simple           noarch 1:3.28-4.amzn2               amzn2-core 216 k
 perl-Pod-Usage            noarch 1.63-3.amzn2                 amzn2-core  27 k
 perl-Scalar-List-Utils    x86_64 1.27-248.amzn2.0.2           amzn2-core  36 k
 perl-Socket               x86_64 2.010-4.amzn2.0.2            amzn2-core  49 k
 perl-Storable             x86_64 2.45-3.amzn2.0.2             amzn2-core  78 k
 perl-TermReadKey          x86_64 2.30-20.amzn2.0.2            amzn2-core  31 k
 perl-Text-ParseWords      noarch 3.29-4.amzn2                 amzn2-core  14 k
 perl-Time-HiRes           x86_64 4:1.9725-3.amzn2.0.2         amzn2-core  45 k
 perl-Time-Local           noarch 1.2300-2.amzn2               amzn2-core  24 k
 perl-constant             noarch 1.27-2.amzn2.0.1             amzn2-core  19 k
 perl-libs                 x86_64 4:5.16.3-294.amzn2           amzn2-core 700 k
 perl-macros               x86_64 4:5.16.3-294.amzn2           amzn2-core  44 k
 perl-parent               noarch 1:0.225-244.amzn2.0.1        amzn2-core  12 k
 perl-podlators            noarch 2.5.1-3.amzn2.0.1            amzn2-core 112 k
 perl-threads              x86_64 1.87-4.amzn2.0.2             amzn2-core  50 k
 perl-threads-shared       x86_64 1.43-6.amzn2.0.2             amzn2-core  39 k
 qrencode-libs             x86_64 3.4.1-3.amzn2.0.2            amzn2-core  50 k
 shadow-utils              x86_64 2:4.1.5.1-24.amzn2.0.2       amzn2-core 1.1 M
 systemd                   x86_64 219-57.amzn2.0.9             amzn2-core 5.0 M
 systemd-libs              x86_64 219-57.amzn2.0.9             amzn2-core 396 k
 ustr                      x86_64 1.0.4-16.amzn2.0.3           amzn2-core  96 k
 util-linux                x86_64 2.30.2-2.amzn2.0.4           amzn2-core 2.3 M

Transaction Summary
================================================================================
Install  3 Packages (+69 Dependent packages)

Total download size: 38 M
Installed size: 140 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                               20 MB/s |  38 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                          1/72
  Installing : audit-libs-2.8.1-3.amzn2.1.x86_64                           2/72
  Installing : groff-base-1.22.2-8.amzn2.0.2.x86_64                        3/72
  Installing : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Installing : less-458-9.amzn2.0.2.x86_64                                 5/72
  Installing : perl-HTTP-Tiny-0.033-3.amzn2.noarch                         6/72
  Installing : 1:perl-parent-0.225-244.amzn2.0.1.noarch                    7/72
  Installing : perl-podlators-2.5.1-3.amzn2.0.1.noarch                     8/72
  Installing : perl-Pod-Perldoc-3.20-4.amzn2.noarch                        9/72
  Installing : perl-Encode-2.51-7.amzn2.0.2.x86_64                        10/72
  Installing : perl-Text-ParseWords-3.29-4.amzn2.noarch                   11/72
  Installing : perl-Pod-Usage-1.63-3.amzn2.noarch                         12/72
  Installing : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   13/72
  Installing : 4:perl-macros-5.16.3-294.amzn2.x86_64                      14/72
  Installing : 4:perl-libs-5.16.3-294.amzn2.x86_64                        15/72
  Installing : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Installing : perl-constant-1.27-2.amzn2.0.1.noarch                      17/72
  Installing : perl-Time-Local-1.2300-2.amzn2.noarch                      18/72
  Installing : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           19/72
  Installing : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                20/72
  Installing : perl-threads-1.87-4.amzn2.0.2.x86_64                       21/72
  Installing : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     22/72
  Installing : perl-Socket-2.010-4.amzn2.0.2.x86_64                       23/72
  Installing : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                24/72
  Installing : perl-Carp-1.26-244.amzn2.noarch                            25/72
  Installing : perl-File-Temp-0.23.01-3.amzn2.noarch                      26/72
  Installing : perl-File-Path-2.09-2.amzn2.noarch                         27/72
  Installing : perl-Storable-2.45-3.amzn2.0.2.x86_64                      28/72
  Installing : perl-Getopt-Long-2.40-3.amzn2.noarch                       29/72
  Installing : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      30/72
  Installing : perl-Exporter-5.68-3.amzn2.noarch                          31/72
  Installing : 4:perl-5.16.3-294.amzn2.x86_64                             32/72
  Installing : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  33/72
  Installing : 1:perl-Error-0.17020-2.amzn2.noarch                        34/72
  Installing : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     35/72
  Installing : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         36/72
  Installing : acl-2.2.51-14.amzn2.x86_64                                 37/72
  Installing : kmod-25-3.amzn2.0.2.x86_64                                 38/72
  Installing : pcre2-10.23-2.amzn2.0.2.x86_64                             39/72
  Installing : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     40/72
  Installing : kmod-libs-25-3.amzn2.0.2.x86_64                            41/72
  Installing : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         42/72
  Installing : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                43/72
  Installing : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     44/72
  Installing : ustr-1.0.4-16.amzn2.0.3.x86_64                             45/72
  Installing : libsemanage-2.5-11.amzn2.x86_64                            46/72
  Installing : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 47/72
  Installing : libutempter-1.1.6-4.amzn2.0.2.x86_64                       48/72
  Installing : gzip-1.5-10.amzn2.x86_64                                   49/72
  Installing : cracklib-2.9.0-11.amzn2.0.2.x86_64                         50/72
  Installing : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   51/72
  Installing : pam-1.1.8-22.amzn2.x86_64                                  52/72
  Installing : libpwquality-1.2.3-5.amzn2.x86_64                          53/72
  Installing : util-linux-2.30.2-2.amzn2.0.4.x86_64                       54/72
  Installing : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                55/72
  Installing : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           56/72
  Installing : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       57/72
  Installing : elfutils-libs-0.170-4.amzn2.x86_64                         58/72
  Installing : systemd-libs-219-57.amzn2.0.9.x86_64                       59/72
  Installing : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         60/72
  Installing : systemd-219-57.amzn2.0.9.x86_64                            61/72
  Installing : elfutils-default-yama-scope-0.170-4.amzn2.noarch           62/72
  Installing : 1:dbus-1.10.24-7.amzn2.x86_64                              63/72
  Installing : openssh-7.4p1-16.amzn2.0.6.x86_64                          64/72
  Installing : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  65/72
  Installing : git-core-2.17.2-2.amzn2.x86_64                             66/72
  Installing : git-core-doc-2.17.2-2.amzn2.noarch                         67/72
  Installing : libsecret-0.18.5-2.amzn2.0.2.x86_64                        68/72
  Installing : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                 69/72
  Installing : perl-Git-2.17.2-2.amzn2.noarch                             70/72
  Installing : git-2.17.2-2.amzn2.x86_64                                  71/72
  Installing : 2:tar-1.26-34.amzn2.x86_64                                 72/72
  Verifying  : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  1/72
  Verifying  : libsecret-0.18.5-2.amzn2.0.2.x86_64                         2/72
  Verifying  : perl-Exporter-5.68-3.amzn2.noarch                           3/72
  Verifying  : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Verifying  : git-core-2.17.2-2.amzn2.x86_64                              5/72
  Verifying  : gzip-1.5-10.amzn2.x86_64                                    6/72
  Verifying  : perl-Pod-Usage-1.63-3.amzn2.noarch                          7/72
  Verifying  : git-2.17.2-2.amzn2.x86_64                                   8/72
  Verifying  : cracklib-2.9.0-11.amzn2.0.2.x86_64                          9/72
  Verifying  : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         10/72
  Verifying  : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           11/72
  Verifying  : ustr-1.0.4-16.amzn2.0.3.x86_64                             12/72
  Verifying  : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     13/72
  Verifying  : 2:tar-1.26-34.amzn2.x86_64                                 14/72
  Verifying  : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       15/72
  Verifying  : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Verifying  : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                17/72
  Verifying  : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         18/72
  Verifying  : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                19/72
  Verifying  : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      20/72
  Verifying  : libsemanage-2.5-11.amzn2.x86_64                            21/72
  Verifying  : libutempter-1.1.6-4.amzn2.0.2.x86_64                       22/72
  Verifying  : 4:perl-macros-5.16.3-294.amzn2.x86_64                      23/72
  Verifying  : systemd-libs-219-57.amzn2.0.9.x86_64                       24/72
  Verifying  : perl-constant-1.27-2.amzn2.0.1.noarch                      25/72
  Verifying  : perl-Time-Local-1.2300-2.amzn2.noarch                      26/72
  Verifying  : kmod-libs-25-3.amzn2.0.2.x86_64                            27/72
  Verifying  : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     28/72
  Verifying  : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           29/72
  Verifying  : perl-Git-2.17.2-2.amzn2.noarch                             30/72
  Verifying  : systemd-219-57.amzn2.0.9.x86_64                            31/72
  Verifying  : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         32/72
  Verifying  : perl-threads-1.87-4.amzn2.0.2.x86_64                       33/72
  Verifying  : 4:perl-libs-5.16.3-294.amzn2.x86_64                        34/72
  Verifying  : perl-podlators-2.5.1-3.amzn2.0.1.noarch                    35/72
  Verifying  : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   36/72
  Verifying  : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  37/72
  Verifying  : elfutils-default-yama-scope-0.170-4.amzn2.noarch           38/72
  Verifying  : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     39/72
  Verifying  : perl-HTTP-Tiny-0.033-3.amzn2.noarch                        40/72
  Verifying  : util-linux-2.30.2-2.amzn2.0.4.x86_64                       41/72
  Verifying  : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                         42/72
  Verifying  : pcre2-10.23-2.amzn2.0.2.x86_64                             43/72
  Verifying  : perl-Getopt-Long-2.40-3.amzn2.noarch                       44/72
  Verifying  : perl-Encode-2.51-7.amzn2.0.2.x86_64                        45/72
  Verifying  : 4:perl-5.16.3-294.amzn2.x86_64                             46/72
  Verifying  : less-458-9.amzn2.0.2.x86_64                                47/72
  Verifying  : pam-1.1.8-22.amzn2.x86_64                                  48/72
  Verifying  : 1:perl-Error-0.17020-2.amzn2.noarch                        49/72
  Verifying  : perl-Socket-2.010-4.amzn2.0.2.x86_64                       50/72
  Verifying  : kmod-25-3.amzn2.0.2.x86_64                                 51/72
  Verifying  : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                52/72
  Verifying  : perl-Carp-1.26-244.amzn2.noarch                            53/72
  Verifying  : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     54/72
  Verifying  : 1:perl-parent-0.225-244.amzn2.0.1.noarch                   55/72
  Verifying  : libpwquality-1.2.3-5.amzn2.x86_64                          56/72
  Verifying  : perl-File-Temp-0.23.01-3.amzn2.noarch                      57/72
  Verifying  : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 58/72
  Verifying  : perl-Pod-Perldoc-3.20-4.amzn2.noarch                       59/72
  Verifying  : acl-2.2.51-14.amzn2.x86_64                                 60/72
  Verifying  : 1:dbus-1.10.24-7.amzn2.x86_64                              61/72
  Verifying  : audit-libs-2.8.1-3.amzn2.1.x86_64                          62/72
  Verifying  : elfutils-libs-0.170-4.amzn2.x86_64                         63/72
  Verifying  : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                64/72
  Verifying  : openssh-7.4p1-16.amzn2.0.6.x86_64                          65/72
  Verifying  : groff-base-1.22.2-8.amzn2.0.2.x86_64                       66/72
  Verifying  : perl-Text-ParseWords-3.29-4.amzn2.noarch                   67/72
  Verifying  : perl-File-Path-2.09-2.amzn2.noarch                         68/72
  Verifying  : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  69/72
  Verifying  : perl-Storable-2.45-3.amzn2.0.2.x86_64                      70/72
  Verifying  : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   71/72
  Verifying  : git-core-doc-2.17.2-2.amzn2.noarch                         72/72

Installed:
  git.x86_64 0:2.17.2-2.amzn2             gzip.x86_64 0:1.5-10.amzn2
  tar.x86_64 2:1.26-34.amzn2

Dependency Installed:
  acl.x86_64 0:2.2.51-14.amzn2
  audit-libs.x86_64 0:2.8.1-3.amzn2.1
  cracklib.x86_64 0:2.9.0-11.amzn2.0.2
  cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2
  cryptsetup-libs.x86_64 0:1.7.4-4.amzn2
  dbus.x86_64 1:1.10.24-7.amzn2
  dbus-libs.x86_64 1:1.10.24-7.amzn2
  device-mapper.x86_64 7:1.02.146-4.amzn2.0.2
  device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  elfutils-default-yama-scope.noarch 0:0.170-4.amzn2
  elfutils-libs.x86_64 0:0.170-4.amzn2
  emacs-filesystem.noarch 1:25.3-3.amzn2.0.1
  fipscheck.x86_64 0:1.4.1-6.amzn2.0.2
  fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2
  git-core.x86_64 0:2.17.2-2.amzn2
  git-core-doc.noarch 0:2.17.2-2.amzn2
  groff-base.x86_64 0:1.22.2-8.amzn2.0.2
  kmod.x86_64 0:25-3.amzn2.0.2
  kmod-libs.x86_64 0:25-3.amzn2.0.2
  less.x86_64 0:458-9.amzn2.0.2
  libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4
  libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2
  libfdisk.x86_64 0:2.30.2-2.amzn2.0.4
  libpwquality.x86_64 0:1.2.3-5.amzn2
  libsecret.x86_64 0:0.18.5-2.amzn2.0.2
  libsemanage.x86_64 0:2.5-11.amzn2
  libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4
  libutempter.x86_64 0:1.1.6-4.amzn2.0.2
  lz4.x86_64 0:1.7.5-2.amzn2.0.1
  openssh.x86_64 0:7.4p1-16.amzn2.0.6
  openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6
  pam.x86_64 0:1.1.8-22.amzn2
  pcre2.x86_64 0:10.23-2.amzn2.0.2
  perl.x86_64 4:5.16.3-294.amzn2
  perl-Carp.noarch 0:1.26-244.amzn2
  perl-Encode.x86_64 0:2.51-7.amzn2.0.2
  perl-Error.noarch 1:0.17020-2.amzn2
  perl-Exporter.noarch 0:5.68-3.amzn2
  perl-File-Path.noarch 0:2.09-2.amzn2
  perl-File-Temp.noarch 0:0.23.01-3.amzn2
  perl-Filter.x86_64 0:1.49-3.amzn2.0.2
  perl-Getopt-Long.noarch 0:2.40-3.amzn2
  perl-Git.noarch 0:2.17.2-2.amzn2
  perl-HTTP-Tiny.noarch 0:0.033-3.amzn2
  perl-PathTools.x86_64 0:3.40-5.amzn2.0.2
  perl-Pod-Escapes.noarch 1:1.04-294.amzn2
  perl-Pod-Perldoc.noarch 0:3.20-4.amzn2
  perl-Pod-Simple.noarch 1:3.28-4.amzn2
  perl-Pod-Usage.noarch 0:1.63-3.amzn2
  perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2
  perl-Socket.x86_64 0:2.010-4.amzn2.0.2
  perl-Storable.x86_64 0:2.45-3.amzn2.0.2
  perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2
  perl-Text-ParseWords.noarch 0:3.29-4.amzn2
  perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2
  perl-Time-Local.noarch 0:1.2300-2.amzn2
  perl-constant.noarch 0:1.27-2.amzn2.0.1
  perl-libs.x86_64 4:5.16.3-294.amzn2
  perl-macros.x86_64 4:5.16.3-294.amzn2
  perl-parent.noarch 1:0.225-244.amzn2.0.1
  perl-podlators.noarch 0:2.5.1-3.amzn2.0.1
  perl-threads.x86_64 0:1.87-4.amzn2.0.2
  perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2
  qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2
  shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2
  systemd.x86_64 0:219-57.amzn2.0.9
  systemd-libs.x86_64 0:219-57.amzn2.0.9
  ustr.x86_64 0:1.0.4-16.amzn2.0.3
  util-linux.x86_64 0:2.30.2-2.amzn2.0.4

Complete!
Removing intermediate container 9edbd61aeeee
 ---> a3c4b7831b1a
Step 3/15 : RUN touch ~/.profile
 ---> Running in 047a942f5bf4
Removing intermediate container 047a942f5bf4
 ---> a0402560a625
Step 4/15 : RUN mkdir -p /usr/local/nvm
 ---> Running in d6505235c754
Removing intermediate container d6505235c754
 ---> 6ed06b41344a
Step 5/15 : ENV NVM_DIR /usr/local/nvm
 ---> Running in 17f248550bdc
Removing intermediate container 17f248550bdc
 ---> d625783a69c1
Step 6/15 : ENV NODE_VERSION 10.16.3
 ---> Running in 5284904a79ed
Removing intermediate container 5284904a79ed
 ---> 3fe6a49678af
Step 7/15 : RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
 ---> Running in 1df94bfa9091
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0  56362      0 --:--:-- --:--:-- --:--:-- 56598
=> Downloading nvm from git to '/usr/local/nvm'
=> Cloning into '/usr/local/nvm'...
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.profile
=> bash_completion source string already in /root/.profile
=> Installing Node.js version 10.16.3
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

Creating default alias: default -> 10.16.3 (-> v10.16.3 *)
Failed to install Node.js 10.16.3
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
Removing intermediate container 1df94bfa9091
 ---> 7016f56f5d54
Step 8/15 : RUN source $NVM_DIR/nvm.sh     && nvm install $NODE_VERSION     && nvm alias default $NODE_VERSION     && nvm use default
 ---> Running in 49ae334cb08a
v10.16.3 is already installed.
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

default -> 10.16.3 (-> v10.16.3 *)
Now using node v10.16.3 (npm v6.9.0)
Removing intermediate container 49ae334cb08a
 ---> 03dd568b2568
Step 9/15 : ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
 ---> Running in 694df143e64c
Removing intermediate container 694df143e64c
 ---> 16b814c413b0
Step 10/15 : ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
 ---> Running in d55bdefcce42
Removing intermediate container d55bdefcce42
 ---> 5ac948cd7756
Step 11/15 : RUN node -v
 ---> Running in a585c02c0602
v10.16.3
Removing intermediate container a585c02c0602
 ---> e9eecd18da23
Step 12/15 : RUN npm -v
 ---> Running in 2a8f206a67e0
6.9.0
Removing intermediate container 2a8f206a67e0
 ---> 1347c0dd6262
Step 13/15 : RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault
 ---> Running in c326be56e655
Cloning into 'repro-bluebird-segfault'...
^C
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker build --no-cache -t bb-repro .
Sending build context to Docker daemon  88.43MB
Step 1/15 : FROM amazonlinux:2.0.20190823.1
 ---> dc34c260f454
Step 2/15 : RUN yum -y install tar gzip git
 ---> Running in 2317b46a1351
Loaded plugins: ovl, priorities
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl-Git = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core-doc = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: git-core = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl >= 5.008 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: emacs-filesystem >= 25.3 for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(warnings) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(strict) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(lib) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Term::ReadKey) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(IPC::Open2) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git::I18N) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Git) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Spec) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Find) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: perl(File::Basename) for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: /usr/bin/perl for package: git-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libsecret-1.so.0()(64bit) for package: git-2.17.2-2.amzn2.x86_64
---> Package gzip.x86_64 0:1.5-10.amzn2 will be installed
---> Package tar.x86_64 2:1.26-34.amzn2 will be installed
--> Running transaction check
---> Package emacs-filesystem.noarch 1:25.3-3.amzn2.0.1 will be installed
---> Package git-core.x86_64 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: openssh-clients for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: less for package: git-core-2.17.2-2.amzn2.x86_64
--> Processing Dependency: libpcre2-8.so.0()(64bit) for package: git-core-2.17.2-2.amzn2.x86_64
---> Package git-core-doc.noarch 0:2.17.2-2.amzn2 will be installed
---> Package libsecret.x86_64 0:0.18.5-2.amzn2.0.2 will be installed
---> Package perl.x86_64 4:5.16.3-294.amzn2 will be installed
--> Processing Dependency: perl-libs = 4:5.16.3-294.amzn2 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-294.amzn2.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-294.amzn2.x86_64
---> Package perl-Getopt-Long.noarch 0:2.40-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.amzn2.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.amzn2.noarch
---> Package perl-Git.noarch 0:2.17.2-2.amzn2 will be installed
--> Processing Dependency: perl(Error) for package: perl-Git-2.17.2-2.amzn2.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.amzn2.0.2 will be installed
---> Package perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2 will be installed
--> Running transaction check
---> Package less.x86_64 0:458-9.amzn2.0.2 will be installed
--> Processing Dependency: groff-base for package: less-458-9.amzn2.0.2.x86_64
---> Package openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: openssh = 7.4p1-16.amzn2.0.6 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: fipscheck-lib(x86-64) >= 1.3.0 for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libfipscheck.so.1()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: openssh-clients-7.4p1-16.amzn2.0.6.x86_64
---> Package pcre2.x86_64 0:10.23-2.amzn2.0.2 will be installed
---> Package perl-Carp.noarch 0:1.26-244.amzn2 will be installed
---> Package perl-Error.noarch 1:0.17020-2.amzn2 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.amzn2 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.amzn2 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.amzn2 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.amzn2.0.2 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.amzn2 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.amzn2.noarch
---> Package perl-Pod-Usage.noarch 0:1.63-3.amzn2 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.amzn2.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.amzn2.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.amzn2.0.2 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.amzn2.0.2 will be installed
---> Package perl-Text-ParseWords.noarch 0:3.29-4.amzn2 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.amzn2 will be installed
---> Package perl-constant.noarch 0:1.27-2.amzn2.0.1 will be installed
---> Package perl-libs.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-macros.x86_64 4:5.16.3-294.amzn2 will be installed
---> Package perl-threads.x86_64 0:1.87-4.amzn2.0.2 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2 will be installed
--> Running transaction check
---> Package fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
--> Processing Dependency: /usr/bin/fipscheck for package: fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64
---> Package groff-base.x86_64 0:1.22.2-8.amzn2.0.2 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2 will be installed
---> Package openssh.x86_64 0:7.4p1-16.amzn2.0.6 will be installed
--> Processing Dependency: audit-libs >= 1.0.8 for package: openssh-7.4p1-16.amzn2.0.6.x86_64
--> Processing Dependency: /sbin/nologin for package: openssh-7.4p1-16.amzn2.0.6.x86_64
---> Package perl-Encode.x86_64 0:2.51-7.amzn2.0.2 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-294.amzn2 will be installed
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.amzn2 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.amzn2.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.amzn2.0.1 will be installed
--> Running transaction check
---> Package audit-libs.x86_64 0:2.8.1-3.amzn2.1 will be installed
--> Processing Dependency: libcap-ng.so.0()(64bit) for package: audit-libs-2.8.1-3.amzn2.1.x86_64
---> Package fipscheck.x86_64 0:1.4.1-6.amzn2.0.2 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.amzn2 will be installed
---> Package perl-parent.noarch 1:0.225-244.amzn2.0.1 will be installed
---> Package util-linux.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
--> Processing Dependency: libsmartcols = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk = 2.30.2-2.amzn2.0.4 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: pam >= 1.1.3-7 for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0(UTEMPTER_1.1)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1(LIBUDEV_183)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0(LIBSYSTEMD_209)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1(SMARTCOLS_2.25)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0(LIBPAM_MISC_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0(LIBPAM_1.0)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.30)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.29)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.28)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.27)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1(FDISK_2.26)(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: /etc/pam.d/system-auth for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libutempter.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libudev.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsystemd.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libsmartcols.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam_misc.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libpam.so.0()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Processing Dependency: libfdisk.so.1()(64bit) for package: util-linux-2.30.2-2.amzn2.0.4.x86_64
--> Running transaction check
---> Package libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4 will be installed
---> Package libfdisk.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4 will be installed
---> Package libutempter.x86_64 0:1.1.6-4.amzn2.0.2 will be installed
--> Processing Dependency: shadow-utils for package: libutempter-1.1.6-4.amzn2.0.2.x86_64
---> Package pam.x86_64 0:1.1.8-22.amzn2 will be installed
--> Processing Dependency: libpwquality >= 0.9.9 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: cracklib-dicts >= 2.8 for package: pam-1.1.8-22.amzn2.x86_64
--> Processing Dependency: libcrack.so.2()(64bit) for package: pam-1.1.8-22.amzn2.x86_64
---> Package systemd-libs.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: liblz4.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libdw.so.1()(64bit) for package: systemd-libs-219-57.amzn2.0.9.x86_64
--> Running transaction check
---> Package cracklib.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2 will be installed
---> Package elfutils-libs.x86_64 0:0.170-4.amzn2 will be installed
--> Processing Dependency: default-yama-scope for package: elfutils-libs-0.170-4.amzn2.x86_64
---> Package libpwquality.x86_64 0:1.2.3-5.amzn2 will be installed
---> Package lz4.x86_64 0:1.7.5-2.amzn2.0.1 will be installed
---> Package shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2 will be installed
--> Processing Dependency: libsemanage.so.1(LIBSEMANAGE_1.0)(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Processing Dependency: libsemanage.so.1()(64bit) for package: 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64
--> Running transaction check
---> Package elfutils-default-yama-scope.noarch 0:0.170-4.amzn2 will be installed
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
--> Processing Dependency: systemd for package: elfutils-default-yama-scope-0.170-4.amzn2.noarch
---> Package libsemanage.x86_64 0:2.5-11.amzn2 will be installed
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0.1)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1(USTR_1.0)(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Processing Dependency: libustr-1.0.so.1()(64bit) for package: libsemanage-2.5-11.amzn2.x86_64
--> Running transaction check
---> Package systemd.x86_64 0:219-57.amzn2.0.9 will be installed
--> Processing Dependency: kmod >= 18-4 for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2(LIBKMOD_5)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4(CRYPTSETUP_1.0)(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: dbus for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: acl for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libqrencode.so.3()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libkmod.so.2()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
--> Processing Dependency: libcryptsetup.so.4()(64bit) for package: systemd-219-57.amzn2.0.9.x86_64
---> Package ustr.x86_64 0:1.0.4-16.amzn2.0.3 will be installed
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.amzn2 will be installed
---> Package cryptsetup-libs.x86_64 0:1.7.4-4.amzn2 will be installed
--> Processing Dependency: libdevmapper.so.1.02(DM_1_02_97)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02(Base)(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
--> Processing Dependency: libdevmapper.so.1.02()(64bit) for package: cryptsetup-libs-1.7.4-4.amzn2.x86_64
---> Package dbus.x86_64 1:1.10.24-7.amzn2 will be installed
--> Processing Dependency: dbus-libs(x86-64) = 1:1.10.24-7.amzn2 for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_PRIVATE_1.10.24)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3(LIBDBUS_1_3)(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
--> Processing Dependency: libdbus-1.so.3()(64bit) for package: 1:dbus-1.10.24-7.amzn2.x86_64
---> Package kmod.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package kmod-libs.x86_64 0:25-3.amzn2.0.2 will be installed
---> Package qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2 will be installed
--> Running transaction check
---> Package dbus-libs.x86_64 1:1.10.24-7.amzn2 will be installed
---> Package device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Processing Dependency: device-mapper = 7:1.02.146-4.amzn2.0.2 for package: 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64
--> Running transaction check
---> Package device-mapper.x86_64 7:1.02.146-4.amzn2.0.2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                   Arch   Version                      Repository  Size
================================================================================
Installing:
 git                       x86_64 2.17.2-2.amzn2               amzn2-core 217 k
 gzip                      x86_64 1.5-10.amzn2                 amzn2-core 130 k
 tar                       x86_64 2:1.26-34.amzn2              amzn2-core 849 k
Installing for dependencies:
 acl                       x86_64 2.2.51-14.amzn2              amzn2-core  82 k
 audit-libs                x86_64 2.8.1-3.amzn2.1              amzn2-core  99 k
 cracklib                  x86_64 2.9.0-11.amzn2.0.2           amzn2-core  80 k
 cracklib-dicts            x86_64 2.9.0-11.amzn2.0.2           amzn2-core 3.6 M
 cryptsetup-libs           x86_64 1.7.4-4.amzn2                amzn2-core 224 k
 dbus                      x86_64 1:1.10.24-7.amzn2            amzn2-core 247 k
 dbus-libs                 x86_64 1:1.10.24-7.amzn2            amzn2-core 169 k
 device-mapper             x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 289 k
 device-mapper-libs        x86_64 7:1.02.146-4.amzn2.0.2       amzn2-core 320 k
 elfutils-default-yama-scope
                           noarch 0.170-4.amzn2                amzn2-core  31 k
 elfutils-libs             x86_64 0.170-4.amzn2                amzn2-core 270 k
 emacs-filesystem          noarch 1:25.3-3.amzn2.0.1           amzn2-core  64 k
 fipscheck                 x86_64 1.4.1-6.amzn2.0.2            amzn2-core  21 k
 fipscheck-lib             x86_64 1.4.1-6.amzn2.0.2            amzn2-core  11 k
 git-core                  x86_64 2.17.2-2.amzn2               amzn2-core 4.0 M
 git-core-doc              noarch 2.17.2-2.amzn2               amzn2-core 2.3 M
 groff-base                x86_64 1.22.2-8.amzn2.0.2           amzn2-core 948 k
 kmod                      x86_64 25-3.amzn2.0.2               amzn2-core 111 k
 kmod-libs                 x86_64 25-3.amzn2.0.2               amzn2-core  59 k
 less                      x86_64 458-9.amzn2.0.2              amzn2-core 121 k
 libcap-ng                 x86_64 0.7.5-4.amzn2.0.4            amzn2-core  25 k
 libedit                   x86_64 3.0-12.20121213cvs.amzn2.0.2 amzn2-core  93 k
 libfdisk                  x86_64 2.30.2-2.amzn2.0.4           amzn2-core 240 k
 libpwquality              x86_64 1.2.3-5.amzn2                amzn2-core  84 k
 libsecret                 x86_64 0.18.5-2.amzn2.0.2           amzn2-core 153 k
 libsemanage               x86_64 2.5-11.amzn2                 amzn2-core 152 k
 libsmartcols              x86_64 2.30.2-2.amzn2.0.4           amzn2-core 156 k
 libutempter               x86_64 1.1.6-4.amzn2.0.2            amzn2-core  25 k
 lz4                       x86_64 1.7.5-2.amzn2.0.1            amzn2-core  99 k
 openssh                   x86_64 7.4p1-16.amzn2.0.6           amzn2-core 509 k
 openssh-clients           x86_64 7.4p1-16.amzn2.0.6           amzn2-core 657 k
 pam                       x86_64 1.1.8-22.amzn2               amzn2-core 718 k
 pcre2                     x86_64 10.23-2.amzn2.0.2            amzn2-core 209 k
 perl                      x86_64 4:5.16.3-294.amzn2           amzn2-core 8.0 M
 perl-Carp                 noarch 1.26-244.amzn2               amzn2-core  19 k
 perl-Encode               x86_64 2.51-7.amzn2.0.2             amzn2-core 1.5 M
 perl-Error                noarch 1:0.17020-2.amzn2            amzn2-core  32 k
 perl-Exporter             noarch 5.68-3.amzn2                 amzn2-core  29 k
 perl-File-Path            noarch 2.09-2.amzn2                 amzn2-core  27 k
 perl-File-Temp            noarch 0.23.01-3.amzn2              amzn2-core  56 k
 perl-Filter               x86_64 1.49-3.amzn2.0.2             amzn2-core  76 k
 perl-Getopt-Long          noarch 2.40-3.amzn2                 amzn2-core  56 k
 perl-Git                  noarch 2.17.2-2.amzn2               amzn2-core  70 k
 perl-HTTP-Tiny            noarch 0.033-3.amzn2                amzn2-core  38 k
 perl-PathTools            x86_64 3.40-5.amzn2.0.2             amzn2-core  83 k
 perl-Pod-Escapes          noarch 1:1.04-294.amzn2             amzn2-core  51 k
 perl-Pod-Perldoc          noarch 3.20-4.amzn2                 amzn2-core  87 k
 perl-Pod-Simple           noarch 1:3.28-4.amzn2               amzn2-core 216 k
 perl-Pod-Usage            noarch 1.63-3.amzn2                 amzn2-core  27 k
 perl-Scalar-List-Utils    x86_64 1.27-248.amzn2.0.2           amzn2-core  36 k
 perl-Socket               x86_64 2.010-4.amzn2.0.2            amzn2-core  49 k
 perl-Storable             x86_64 2.45-3.amzn2.0.2             amzn2-core  78 k
 perl-TermReadKey          x86_64 2.30-20.amzn2.0.2            amzn2-core  31 k
 perl-Text-ParseWords      noarch 3.29-4.amzn2                 amzn2-core  14 k
 perl-Time-HiRes           x86_64 4:1.9725-3.amzn2.0.2         amzn2-core  45 k
 perl-Time-Local           noarch 1.2300-2.amzn2               amzn2-core  24 k
 perl-constant             noarch 1.27-2.amzn2.0.1             amzn2-core  19 k
 perl-libs                 x86_64 4:5.16.3-294.amzn2           amzn2-core 700 k
 perl-macros               x86_64 4:5.16.3-294.amzn2           amzn2-core  44 k
 perl-parent               noarch 1:0.225-244.amzn2.0.1        amzn2-core  12 k
 perl-podlators            noarch 2.5.1-3.amzn2.0.1            amzn2-core 112 k
 perl-threads              x86_64 1.87-4.amzn2.0.2             amzn2-core  50 k
 perl-threads-shared       x86_64 1.43-6.amzn2.0.2             amzn2-core  39 k
 qrencode-libs             x86_64 3.4.1-3.amzn2.0.2            amzn2-core  50 k
 shadow-utils              x86_64 2:4.1.5.1-24.amzn2.0.2       amzn2-core 1.1 M
 systemd                   x86_64 219-57.amzn2.0.9             amzn2-core 5.0 M
 systemd-libs              x86_64 219-57.amzn2.0.9             amzn2-core 396 k
 ustr                      x86_64 1.0.4-16.amzn2.0.3           amzn2-core  96 k
 util-linux                x86_64 2.30.2-2.amzn2.0.4           amzn2-core 2.3 M

Transaction Summary
================================================================================
Install  3 Packages (+69 Dependent packages)

Total download size: 38 M
Installed size: 140 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                               21 MB/s |  38 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                          1/72
  Installing : audit-libs-2.8.1-3.amzn2.1.x86_64                           2/72
  Installing : groff-base-1.22.2-8.amzn2.0.2.x86_64                        3/72
  Installing : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Installing : less-458-9.amzn2.0.2.x86_64                                 5/72
  Installing : perl-HTTP-Tiny-0.033-3.amzn2.noarch                         6/72
  Installing : 1:perl-parent-0.225-244.amzn2.0.1.noarch                    7/72
  Installing : perl-podlators-2.5.1-3.amzn2.0.1.noarch                     8/72
  Installing : perl-Pod-Perldoc-3.20-4.amzn2.noarch                        9/72
  Installing : perl-Encode-2.51-7.amzn2.0.2.x86_64                        10/72
  Installing : perl-Text-ParseWords-3.29-4.amzn2.noarch                   11/72
  Installing : perl-Pod-Usage-1.63-3.amzn2.noarch                         12/72
  Installing : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   13/72
  Installing : 4:perl-macros-5.16.3-294.amzn2.x86_64                      14/72
  Installing : 4:perl-libs-5.16.3-294.amzn2.x86_64                        15/72
  Installing : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Installing : perl-constant-1.27-2.amzn2.0.1.noarch                      17/72
  Installing : perl-Time-Local-1.2300-2.amzn2.noarch                      18/72
  Installing : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           19/72
  Installing : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                20/72
  Installing : perl-threads-1.87-4.amzn2.0.2.x86_64                       21/72
  Installing : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     22/72
  Installing : perl-Socket-2.010-4.amzn2.0.2.x86_64                       23/72
  Installing : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                24/72
  Installing : perl-Carp-1.26-244.amzn2.noarch                            25/72
  Installing : perl-File-Temp-0.23.01-3.amzn2.noarch                      26/72
  Installing : perl-File-Path-2.09-2.amzn2.noarch                         27/72
  Installing : perl-Storable-2.45-3.amzn2.0.2.x86_64                      28/72
  Installing : perl-Getopt-Long-2.40-3.amzn2.noarch                       29/72
  Installing : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      30/72
  Installing : perl-Exporter-5.68-3.amzn2.noarch                          31/72
  Installing : 4:perl-5.16.3-294.amzn2.x86_64                             32/72
  Installing : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  33/72
  Installing : 1:perl-Error-0.17020-2.amzn2.noarch                        34/72
  Installing : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     35/72
  Installing : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         36/72
  Installing : acl-2.2.51-14.amzn2.x86_64                                 37/72
  Installing : kmod-25-3.amzn2.0.2.x86_64                                 38/72
  Installing : pcre2-10.23-2.amzn2.0.2.x86_64                             39/72
  Installing : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     40/72
  Installing : kmod-libs-25-3.amzn2.0.2.x86_64                            41/72
  Installing : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         42/72
  Installing : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                43/72
  Installing : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     44/72
  Installing : ustr-1.0.4-16.amzn2.0.3.x86_64                             45/72
  Installing : libsemanage-2.5-11.amzn2.x86_64                            46/72
  Installing : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 47/72
  Installing : libutempter-1.1.6-4.amzn2.0.2.x86_64                       48/72
  Installing : gzip-1.5-10.amzn2.x86_64                                   49/72
  Installing : cracklib-2.9.0-11.amzn2.0.2.x86_64                         50/72
  Installing : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   51/72
  Installing : pam-1.1.8-22.amzn2.x86_64                                  52/72
  Installing : libpwquality-1.2.3-5.amzn2.x86_64                          53/72
  Installing : util-linux-2.30.2-2.amzn2.0.4.x86_64                       54/72
  Installing : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                55/72
  Installing : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           56/72
  Installing : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       57/72
  Installing : elfutils-libs-0.170-4.amzn2.x86_64                         58/72
  Installing : systemd-libs-219-57.amzn2.0.9.x86_64                       59/72
  Installing : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         60/72
  Installing : systemd-219-57.amzn2.0.9.x86_64                            61/72
  Installing : elfutils-default-yama-scope-0.170-4.amzn2.noarch           62/72
  Installing : 1:dbus-1.10.24-7.amzn2.x86_64                              63/72
  Installing : openssh-7.4p1-16.amzn2.0.6.x86_64                          64/72
  Installing : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  65/72
  Installing : git-core-2.17.2-2.amzn2.x86_64                             66/72
  Installing : git-core-doc-2.17.2-2.amzn2.noarch                         67/72
  Installing : libsecret-0.18.5-2.amzn2.0.2.x86_64                        68/72
  Installing : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                 69/72
  Installing : perl-Git-2.17.2-2.amzn2.noarch                             70/72
  Installing : git-2.17.2-2.amzn2.x86_64                                  71/72
  Installing : 2:tar-1.26-34.amzn2.x86_64                                 72/72
  Verifying  : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  1/72
  Verifying  : libsecret-0.18.5-2.amzn2.0.2.x86_64                         2/72
  Verifying  : perl-Exporter-5.68-3.amzn2.noarch                           3/72
  Verifying  : lz4-1.7.5-2.amzn2.0.1.x86_64                                4/72
  Verifying  : git-core-2.17.2-2.amzn2.x86_64                              5/72
  Verifying  : gzip-1.5-10.amzn2.x86_64                                    6/72
  Verifying  : perl-Pod-Usage-1.63-3.amzn2.noarch                          7/72
  Verifying  : git-2.17.2-2.amzn2.x86_64                                   8/72
  Verifying  : cracklib-2.9.0-11.amzn2.0.2.x86_64                          9/72
  Verifying  : 1:dbus-libs-1.10.24-7.amzn2.x86_64                         10/72
  Verifying  : 7:device-mapper-libs-1.02.146-4.amzn2.0.2.x86_64           11/72
  Verifying  : ustr-1.0.4-16.amzn2.0.3.x86_64                             12/72
  Verifying  : qrencode-libs-3.4.1-3.amzn2.0.2.x86_64                     13/72
  Verifying  : 2:tar-1.26-34.amzn2.x86_64                                 14/72
  Verifying  : cryptsetup-libs-1.7.4-4.amzn2.x86_64                       15/72
  Verifying  : perl-Filter-1.49-3.amzn2.0.2.x86_64                        16/72
  Verifying  : libedit-3.0-12.20121213cvs.amzn2.0.2.x86_64                17/72
  Verifying  : libfdisk-2.30.2-2.amzn2.0.4.x86_64                         18/72
  Verifying  : perl-threads-shared-1.43-6.amzn2.0.2.x86_64                19/72
  Verifying  : 1:perl-Pod-Simple-3.28-4.amzn2.noarch                      20/72
  Verifying  : libsemanage-2.5-11.amzn2.x86_64                            21/72
  Verifying  : libutempter-1.1.6-4.amzn2.0.2.x86_64                       22/72
  Verifying  : 4:perl-macros-5.16.3-294.amzn2.x86_64                      23/72
  Verifying  : systemd-libs-219-57.amzn2.0.9.x86_64                       24/72
  Verifying  : perl-constant-1.27-2.amzn2.0.1.noarch                      25/72
  Verifying  : perl-Time-Local-1.2300-2.amzn2.noarch                      26/72
  Verifying  : kmod-libs-25-3.amzn2.0.2.x86_64                            27/72
  Verifying  : libsmartcols-2.30.2-2.amzn2.0.4.x86_64                     28/72
  Verifying  : perl-Scalar-List-Utils-1.27-248.amzn2.0.2.x86_64           29/72
  Verifying  : perl-Git-2.17.2-2.amzn2.noarch                             30/72
  Verifying  : systemd-219-57.amzn2.0.9.x86_64                            31/72
  Verifying  : fipscheck-1.4.1-6.amzn2.0.2.x86_64                         32/72
  Verifying  : perl-threads-1.87-4.amzn2.0.2.x86_64                       33/72
  Verifying  : 4:perl-libs-5.16.3-294.amzn2.x86_64                        34/72
  Verifying  : perl-podlators-2.5.1-3.amzn2.0.1.noarch                    35/72
  Verifying  : cracklib-dicts-2.9.0-11.amzn2.0.2.x86_64                   36/72
  Verifying  : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                  37/72
  Verifying  : elfutils-default-yama-scope-0.170-4.amzn2.noarch           38/72
  Verifying  : perl-PathTools-3.40-5.amzn2.0.2.x86_64                     39/72
  Verifying  : perl-HTTP-Tiny-0.033-3.amzn2.noarch                        40/72
  Verifying  : util-linux-2.30.2-2.amzn2.0.4.x86_64                       41/72
  Verifying  : libcap-ng-0.7.5-4.amzn2.0.4.x86_64                         42/72
  Verifying  : pcre2-10.23-2.amzn2.0.2.x86_64                             43/72
  Verifying  : perl-Getopt-Long-2.40-3.amzn2.noarch                       44/72
  Verifying  : perl-Encode-2.51-7.amzn2.0.2.x86_64                        45/72
  Verifying  : 4:perl-5.16.3-294.amzn2.x86_64                             46/72
  Verifying  : less-458-9.amzn2.0.2.x86_64                                47/72
  Verifying  : pam-1.1.8-22.amzn2.x86_64                                  48/72
  Verifying  : 1:perl-Error-0.17020-2.amzn2.noarch                        49/72
  Verifying  : perl-Socket-2.010-4.amzn2.0.2.x86_64                       50/72
  Verifying  : kmod-25-3.amzn2.0.2.x86_64                                 51/72
  Verifying  : 4:perl-Time-HiRes-1.9725-3.amzn2.0.2.x86_64                52/72
  Verifying  : perl-Carp-1.26-244.amzn2.noarch                            53/72
  Verifying  : fipscheck-lib-1.4.1-6.amzn2.0.2.x86_64                     54/72
  Verifying  : 1:perl-parent-0.225-244.amzn2.0.1.noarch                   55/72
  Verifying  : libpwquality-1.2.3-5.amzn2.x86_64                          56/72
  Verifying  : perl-File-Temp-0.23.01-3.amzn2.noarch                      57/72
  Verifying  : 2:shadow-utils-4.1.5.1-24.amzn2.0.2.x86_64                 58/72
  Verifying  : perl-Pod-Perldoc-3.20-4.amzn2.noarch                       59/72
  Verifying  : acl-2.2.51-14.amzn2.x86_64                                 60/72
  Verifying  : 1:dbus-1.10.24-7.amzn2.x86_64                              61/72
  Verifying  : audit-libs-2.8.1-3.amzn2.1.x86_64                          62/72
  Verifying  : elfutils-libs-0.170-4.amzn2.x86_64                         63/72
  Verifying  : 7:device-mapper-1.02.146-4.amzn2.0.2.x86_64                64/72
  Verifying  : openssh-7.4p1-16.amzn2.0.6.x86_64                          65/72
  Verifying  : groff-base-1.22.2-8.amzn2.0.2.x86_64                       66/72
  Verifying  : perl-Text-ParseWords-3.29-4.amzn2.noarch                   67/72
  Verifying  : perl-File-Path-2.09-2.amzn2.noarch                         68/72
  Verifying  : openssh-clients-7.4p1-16.amzn2.0.6.x86_64                  69/72
  Verifying  : perl-Storable-2.45-3.amzn2.0.2.x86_64                      70/72
  Verifying  : 1:perl-Pod-Escapes-1.04-294.amzn2.noarch                   71/72
  Verifying  : git-core-doc-2.17.2-2.amzn2.noarch                         72/72

Installed:
  git.x86_64 0:2.17.2-2.amzn2             gzip.x86_64 0:1.5-10.amzn2
  tar.x86_64 2:1.26-34.amzn2

Dependency Installed:
  acl.x86_64 0:2.2.51-14.amzn2
  audit-libs.x86_64 0:2.8.1-3.amzn2.1
  cracklib.x86_64 0:2.9.0-11.amzn2.0.2
  cracklib-dicts.x86_64 0:2.9.0-11.amzn2.0.2
  cryptsetup-libs.x86_64 0:1.7.4-4.amzn2
  dbus.x86_64 1:1.10.24-7.amzn2
  dbus-libs.x86_64 1:1.10.24-7.amzn2
  device-mapper.x86_64 7:1.02.146-4.amzn2.0.2
  device-mapper-libs.x86_64 7:1.02.146-4.amzn2.0.2
  elfutils-default-yama-scope.noarch 0:0.170-4.amzn2
  elfutils-libs.x86_64 0:0.170-4.amzn2
  emacs-filesystem.noarch 1:25.3-3.amzn2.0.1
  fipscheck.x86_64 0:1.4.1-6.amzn2.0.2
  fipscheck-lib.x86_64 0:1.4.1-6.amzn2.0.2
  git-core.x86_64 0:2.17.2-2.amzn2
  git-core-doc.noarch 0:2.17.2-2.amzn2
  groff-base.x86_64 0:1.22.2-8.amzn2.0.2
  kmod.x86_64 0:25-3.amzn2.0.2
  kmod-libs.x86_64 0:25-3.amzn2.0.2
  less.x86_64 0:458-9.amzn2.0.2
  libcap-ng.x86_64 0:0.7.5-4.amzn2.0.4
  libedit.x86_64 0:3.0-12.20121213cvs.amzn2.0.2
  libfdisk.x86_64 0:2.30.2-2.amzn2.0.4
  libpwquality.x86_64 0:1.2.3-5.amzn2
  libsecret.x86_64 0:0.18.5-2.amzn2.0.2
  libsemanage.x86_64 0:2.5-11.amzn2
  libsmartcols.x86_64 0:2.30.2-2.amzn2.0.4
  libutempter.x86_64 0:1.1.6-4.amzn2.0.2
  lz4.x86_64 0:1.7.5-2.amzn2.0.1
  openssh.x86_64 0:7.4p1-16.amzn2.0.6
  openssh-clients.x86_64 0:7.4p1-16.amzn2.0.6
  pam.x86_64 0:1.1.8-22.amzn2
  pcre2.x86_64 0:10.23-2.amzn2.0.2
  perl.x86_64 4:5.16.3-294.amzn2
  perl-Carp.noarch 0:1.26-244.amzn2
  perl-Encode.x86_64 0:2.51-7.amzn2.0.2
  perl-Error.noarch 1:0.17020-2.amzn2
  perl-Exporter.noarch 0:5.68-3.amzn2
  perl-File-Path.noarch 0:2.09-2.amzn2
  perl-File-Temp.noarch 0:0.23.01-3.amzn2
  perl-Filter.x86_64 0:1.49-3.amzn2.0.2
  perl-Getopt-Long.noarch 0:2.40-3.amzn2
  perl-Git.noarch 0:2.17.2-2.amzn2
  perl-HTTP-Tiny.noarch 0:0.033-3.amzn2
  perl-PathTools.x86_64 0:3.40-5.amzn2.0.2
  perl-Pod-Escapes.noarch 1:1.04-294.amzn2
  perl-Pod-Perldoc.noarch 0:3.20-4.amzn2
  perl-Pod-Simple.noarch 1:3.28-4.amzn2
  perl-Pod-Usage.noarch 0:1.63-3.amzn2
  perl-Scalar-List-Utils.x86_64 0:1.27-248.amzn2.0.2
  perl-Socket.x86_64 0:2.010-4.amzn2.0.2
  perl-Storable.x86_64 0:2.45-3.amzn2.0.2
  perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2
  perl-Text-ParseWords.noarch 0:3.29-4.amzn2
  perl-Time-HiRes.x86_64 4:1.9725-3.amzn2.0.2
  perl-Time-Local.noarch 0:1.2300-2.amzn2
  perl-constant.noarch 0:1.27-2.amzn2.0.1
  perl-libs.x86_64 4:5.16.3-294.amzn2
  perl-macros.x86_64 4:5.16.3-294.amzn2
  perl-parent.noarch 1:0.225-244.amzn2.0.1
  perl-podlators.noarch 0:2.5.1-3.amzn2.0.1
  perl-threads.x86_64 0:1.87-4.amzn2.0.2
  perl-threads-shared.x86_64 0:1.43-6.amzn2.0.2
  qrencode-libs.x86_64 0:3.4.1-3.amzn2.0.2
  shadow-utils.x86_64 2:4.1.5.1-24.amzn2.0.2
  systemd.x86_64 0:219-57.amzn2.0.9
  systemd-libs.x86_64 0:219-57.amzn2.0.9
  ustr.x86_64 0:1.0.4-16.amzn2.0.3
  util-linux.x86_64 0:2.30.2-2.amzn2.0.4

Complete!
Removing intermediate container 2317b46a1351
 ---> b3910e59e82b
Step 3/15 : RUN touch ~/.profile
 ---> Running in c6b93dd119f2
Removing intermediate container c6b93dd119f2
 ---> b8605117d2eb
Step 4/15 : RUN mkdir -p /usr/local/nvm
 ---> Running in 8596d522a0eb
Removing intermediate container 8596d522a0eb
 ---> 1e70dfa53258
Step 5/15 : ENV NVM_DIR /usr/local/nvm
 ---> Running in 89260188d65c
Removing intermediate container 89260188d65c
 ---> 21a3592b2ae4
Step 6/15 : ENV NODE_VERSION 10.16.3
 ---> Running in d5c517ec8804
Removing intermediate container d5c517ec8804
 ---> 4ef1a3b8e52a
Step 7/15 : RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
 ---> Running in c7c6af08834b
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13527  100 13527    0     0   130k      0 --:--:-- --:--:-- --:--:--  132k
=> Downloading nvm from git to '/usr/local/nvm'
=> Cloning into '/usr/local/nvm'...
=> Compressing and cleaning up git repository

=> Appending nvm source string to /root/.profile
=> bash_completion source string already in /root/.profile
=> Installing Node.js version 10.16.3
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

Creating default alias: default -> 10.16.3 (-> v10.16.3 *)
Failed to install Node.js 10.16.3
=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
Removing intermediate container c7c6af08834b
 ---> 7d839f72a7a5
Step 8/15 : RUN source $NVM_DIR/nvm.sh     && nvm install $NODE_VERSION     && nvm alias default $NODE_VERSION     && nvm use default
 ---> Running in eeb804f0f4a9
v10.16.3 is already installed.
Now using node v10.16.3 (npm v6.9.0)
tput: terminal attributes: No such device or address

default -> 10.16.3 (-> v10.16.3 *)
Now using node v10.16.3 (npm v6.9.0)
Removing intermediate container eeb804f0f4a9
 ---> 516356c48b91
Step 9/15 : ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
 ---> Running in 412be10dfad2
Removing intermediate container 412be10dfad2
 ---> 5f3ed96bf349
Step 10/15 : ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
 ---> Running in 43edd578afbd
Removing intermediate container 43edd578afbd
 ---> ba2550cceed2
Step 11/15 : RUN node -v
 ---> Running in 76bd1fbb0e6c
v10.16.3
Removing intermediate container 76bd1fbb0e6c
 ---> 8b2499f386b6
Step 12/15 : RUN npm -v
 ---> Running in 9cf33a74f909
6.9.0
Removing intermediate container 9cf33a74f909
 ---> 666e3ca77d83
Step 13/15 : RUN git clone https://github.com/astormnewrelic/repro-bluebird-segfault
 ---> Running in 4c5e89ea3cf2
Cloning into 'repro-bluebird-segfault'...
Removing intermediate container 4c5e89ea3cf2
 ---> 6b2915feadd0
Step 14/15 : WORKDIR /repro-bluebird-segfault
 ---> Running in ada0bf98a55a
Removing intermediate container ada0bf98a55a
 ---> d22b4c948848
Step 15/15 : RUN npm install
 ---> Running in 9ec4f46b6474
npm WARN repro@1.0.0 No repository field.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.0 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.0: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

added 415 packages from 233 contributors and audited 1363 packages in 8.539s
found 0 vulnerabilities

Removing intermediate container 9ec4f46b6474
 ---> 58219cc1c70a
Successfully built 58219cc1c70a
Successfully tagged bb-repro:latest
C02V30M6HTDG:repro-bluebird-segfault astorm$ docker run -it bb-repro bash
bash-4.2# ls
README.md  methods.tap.js  node_modules  package-lock.json  package.json  run-until-fail.sh
bash-4.2# npm run repro


> repro@1.0.0 repro /repro-bluebird-segfault
> ./run-until-fail.sh node methods.tap.js

TAP version 13
# Subtest: bluebird
    # Subtest: new Promise() throw
        1..0
    ok 1 - new Promise() throw # time=8.243ms

./run-until-fail.sh: line 3:    19 Segmentation fault      $@
bash-4.2# npm run repro

> repro@1.0.0 repro /repro-bluebird-segfault
> ./run-until-fail.sh node methods.tap.js

TAP version 13
# Subtest: bluebird
    # Subtest: new Promise() throw
        1..0
    ok 1 - new Promise() throw # time=9.123ms

./run-until-fail.sh: line 3:    38 Segmentation fault      $@
bash-4.2#
```
