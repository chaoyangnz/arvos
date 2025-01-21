// Utility for automatically flashing firmware onto the VisionFive 2

package main

import (
	_ "embed"
	"flag"
	"fmt"
	"github.com/jacobsa/go-serial/serial"
	"io"
	"log"
	"os"
	"xmodem"
)

func exists(f string) bool {
	_, err := os.Stat(f)
	return err == nil
}

var buf = make([]byte, 1024)

const POLL uint8 = 0x43

var autodetect = []string{
	"/dev/ttyUSB0",
	"/dev/ttyUSB1",
	"/dev/ttyACM0",
	"COM0",
	"COM1",
	"COM2",
	"COM3",
}

func waitFor(port io.ReadWriter, buf []byte, b byte) {
	for {
		n, err := port.Read(buf)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Print(string(buf))
		if n > 0 && buf[n-1] == b {
			break
		}
	}
}

func main() {
	term := false
	fw := ""
	var baud = flag.Uint("baud", 115200, "baud rate")
	var device = flag.String("d", "/dev/ttyUSB0", "UART device file or port name")
	flag.BoolVar(&term, "t", true, "keep the term opening anytime no file sending")
	flag.StringVar(&fw, "f", "", "the firmware you hope to upload")
	flag.Parse()

	if len(fw) <= 0 {
		log.Printf("no firmware file given")
	}

	autodetect = append([]string{*device}, autodetect...)

	var file string
	for _, f := range autodetect {
		if exists(f) {
			file = f
			break
		}
	}
	if file == "" {
		log.Fatal("could not autodetect serial port")
	}

	options := serial.OpenOptions{
		PortName:        file,
		BaudRate:        *baud,
		DataBits:        8,
		StopBits:        1,
		MinimumReadSize: 1,
	}

	port, err := serial.Open(options)
	if err != nil {
		log.Fatalf("uart open: %v", err)
	}

	fmt.Printf("Connected to %s, baud: %d, Please push reset button now\n", options.PortName, options.BaudRate)
	fmt.Printf("Waiting for poll sequence..\n")

	defer port.Close()

	if fw != "" {
		sendFirmware(port, fw)
	}

	if term {
		poll(port)
	}

}

func sendFirmware(port io.ReadWriter, fw string) {
	waitFor(port, buf, POLL)
	// send the firmware over xmodem
	b, err := os.ReadFile(fw)
	if err != nil {
		panic("Failed to read firmware file: " + fw)
	}

	fmt.Printf("\nStart sending firmware %s \n", fw)
	err = xmodem.ModemSend(port, b)
	if err != nil {
		panic("Failed to send firmware")
	}

	fmt.Println("Firmware updated")
}

func poll(port io.ReadWriter) {
	println()
	for {
		n, err := port.Read(buf)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Print(string(buf[:n]))
	}
}
