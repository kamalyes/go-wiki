package utils

import (
	"os"
	"testing"
)

func TestZipx_Zip(t *testing.T) {

	err := Zipx.Zip("~/Code/data/go_wiki/attachment/", "/Users/kamalyes/Downloads/test.zip")
	if err != nil {
		t.Error(err)
	}
}

func TestZipx_Compress(t *testing.T) {

	osFiles := []*os.File{}
	f3, err := os.Open("/Users/kamalyes/Code/data/go_wiki/images/redis2.jpeg")
	if err != nil {
		t.Error(err)
	}
	defer f3.Close()
	osFiles = append(osFiles, f3)

	err = Zipx.Compress(osFiles, "/Users/kamalyes/Downloads/demo.zip")
	if err != nil {
		t.Error(err)
	}
}
