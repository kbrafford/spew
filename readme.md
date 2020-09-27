#SPEW

Spew builds a lean linux executable that simply dumps the contents of a gzipped tarball to stdout. The purpose is to allow the user to bundle up a directory structure and run it as a deployable Docker container that unbundles a directory tree with a simple command fetching it from the Dockerhub, like so:

    docker run kbrafford/spew | tar zxf -
The concept can be adapted to anything that works in the same fashion--it doesn't need to be a tarball. I've done a similar thing with a Python class that is a self-contained zip file:

[https://github.com/kbrafford/PyEmbeddedAssetManager](https://github.com/kbrafford/PyEmbeddedAssetManager)

## Requirements
|package | directions  |
|--|--|
|docker|Find more detailed docker instructions to set it up properly for use without elevated permissions

## Usage
 * make -- builds a docker container with the repo's test_dir bundled up
 * make ROOT=other_path -- builds a docker container with a different root directory bundled up

