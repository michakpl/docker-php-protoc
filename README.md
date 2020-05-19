# michakpl/php-protoc

Docker image for compiling Google's Protocol Buffers into PHP classes.

Image use [allegro/php-protobuf](https://github.com/allegro/php-protobuf) to compile a proto file instead of official protobuf package which don't have support for proto2.

## Support

This image support compilation for proto2 and proto3.

## Usage

Currently, the only possible parameter is the path to proto file. The proto file should be in the directory from which you run the image. 

```shell script
docker run  -v `pwd`:/defs  michakpl/php-protoc  example.proto
```

Docker will produce the directory with proto compiled to PHP classes.

## TODO

- [ ] Support more options in parameters
- [ ] Optimize size of image

## Acknowledgments

- allegro/php-protobuf ([Allegro](https://github.com/allegro/php-protobuf))
