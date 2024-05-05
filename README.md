# sh-fnv1

Implementation of the FNV1 hash function for POSIX shell scripts

**Note**: These were written for the purpose of calculating hash values for multiple small strings, not files.

## Usage

```sh
echo "Hello World" | fnv1
# => 12a9a437

fnv1_str $'Hello World\n' $'Hello World\n'

echo "Hello World" | fnv1a
# => d8ea85d7

fnv1a_str $'Hello World\n' $'Hello World\n'
```
