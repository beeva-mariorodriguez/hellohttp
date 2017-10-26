package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", index).Methods("GET")
	router.HandleFunc("/health", health).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", router))
}

func index(w http.ResponseWriter, r *http.Request) {
	log.Println(r.UserAgent())
	w.WriteHeader(http.StatusOK)
	fmt.Fprintln(w, "hello http")
}

func health(w http.ResponseWriter, r *http.Request) {
	log.Println(r.UserAgent())
	w.WriteHeader(http.StatusOK)
	fmt.Fprintln(w, "OK")
}