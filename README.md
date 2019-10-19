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
