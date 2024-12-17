package main

import (
	"auth/data"
	"os"
	"testing"
)

var testApp Config

func TestMain(m *testing.M) {
	repo := data.NewPostgresRepository(nil)
	testApp.Repo = repo
	os.Exit(m.Run())
}
