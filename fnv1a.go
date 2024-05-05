// For verification purposes
package main

import (
  "os"
  "fmt"
  "hash/fnv"
  "io/ioutil"
)

func main() {
  data, err := ioutil.ReadAll(os.Stdin)

  if err != nil {
    fmt.Println("err", err)
    os.Exit(1)
  }

  h := fnv.New32a()
  h.Write(data)
  sum := h.Sum32()
  fmt.Printf("%08x\n", sum)
}
