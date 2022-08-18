package main

import (
	"flag"
	"fmt"
	"html/template"
	"os"
	"strconv"
)

const podString = `apiVersion: v1
kind: Pod
metadata:
  name: {{ .Name }}
  namespace: default
  labels:
    app.kubernetes.io/name: tbyb-fishfood
spec:
  containers:
  - name: webserver
    image: pizza:latest
    ports:
    - containerPort: 80
  - name: webwatcher
    image: taco:latest`

var templ *template.Template

func init() {
	// template.Must takes the reponse of template.ParseFiles and does error checking
	temp, err := template.New("bla").Parse(podString)
	if err != nil {
		panic(err)
	}
	templ = temp
}

type data struct {
	Name string
}

func main() {
	numberOfPods := flag.Int("n", 0, "numberOfPods")
	flag.Parse()

	for i := 0; i < *numberOfPods; i++ {
		// standard output to print merged data
		err := templ.Execute(os.Stdout, data{Name: "pod" + strconv.Itoa(i)})
		// if there is no error,
		// prints the output
		if err != nil {
			fmt.Println(err)
		}

		if i < *numberOfPods-1 {
			fmt.Println("\n---")
		}
	}
}
