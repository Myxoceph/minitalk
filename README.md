# 🚀 Minitalk

[![42 School](https://img.shields.io/badge/42-School-000000?style=flat-square&logo=42&logoColor=white)](https://42.fr/)
[![C](https://img.shields.io/badge/C-00599C?style=flat-square&logo=c&logoColor=white)](https://en.wikipedia.org/wiki/C_(programming_language))
[![Unix](https://img.shields.io/badge/Unix-Signals-red?style=flat-square)](https://en.wikipedia.org/wiki/Unix_signal)

> *A sophisticated inter-process communication system built with Unix signals*

**Minitalk** is a high-performance, minimal client-server communication program that demonstrates advanced Unix signal handling and bit manipulation techniques. This project showcases efficient data transmission using only `SIGUSR1` and `SIGUSR2` signals.

## 📸 Demo

<!-- Add your demonstration GIF here -->
<img src="assets/Minitalk.mp4" style="max-width: 100%; height: auto;" />

---

## 🎯 Project Overview

Minitalk implements a robust communication protocol between two processes using Unix signals. The server receives messages bit by bit through signal handlers, while the client encodes and transmits strings using precise bit manipulation.

### ✨ Key Features

- **🔄 Real-time Communication**: Instant message transmission between client and server
- **🎯 Signal-based Protocol**: Efficient use of `SIGUSR1` and `SIGUSR2` for binary data transmission
- **⚡ Bit-level Precision**: Character encoding/decoding using bitwise operations
- **🛡️ Error Handling**: Comprehensive input validation and error management
- **🏗️ Modular Design**: Clean, maintainable code structure with custom libft integration

---

## 🏗️ Architecture

```
┌─────────────┐                    ┌─────────────┐
│   CLIENT    │                    │   SERVER    │
│             │                    │             │
│ ┌─────────┐ │     SIGUSR1/2      │ ┌─────────┐ │
│ │ Message │ ├────────────────────► │ Signal  │ │
│ │ Encoder │ │                    │ │Handler  │ │
│ └─────────┘ │                    │ └─────────┘ │
│             │                    │             │
│ • Bit-by-bit│                    │ • Decoding  │
│   encoding  │                    │ • Display   │
│ • Signal    │                    │ • PID       │
│   sending   │                    │   display   │
└─────────────┘                    └─────────────┘
```

---

## 🚀 Getting Started

### 📋 Prerequisites

- **GCC** compiler
- **Make** utility
- **Unix/Linux** environment
- **42 School** coding standards compliance

### 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Myxoceph/minitalk
   cd minitalk
   ```

2. **Compile the project**
   ```bash
   make
   ```

3. **Verify installation**
   ```bash
   ls -la server client
   ```

### 🎮 Usage

1. **Start the server**
   ```bash
   ./server
   ```
   *Note: The server will display its PID - copy this number*

2. **Send a message from client**
   ```bash
   ./client [SERVER_PID] "Your message here"
   ```

#### 💡 Example Session

```bash
# Terminal 1 (Server)
$ ./server
Server PID -> 12345
Hello 42!

# Terminal 2 (Client)
$ ./client 12345 "Hello 42!"
```

---

## 🔧 Technical Implementation

### 🎯 Signal Handling Strategy

| Signal | Binary Value | Purpose |
|--------|-------------|---------|
| `SIGUSR1` | 1 | Represents binary '1' |
| `SIGUSR2` | 0 | Represents binary '0' |

### 🔀 Bit Transmission Protocol

```c
// Client: Encodes each character bit by bit
void ft_send_bits(int pid, char character)
{
    int bit = 0;
    while (bit < 8) {
        if ((character & (0x01 << bit)) != 0)
            kill(pid, SIGUSR1);  // Send '1'
        else
            kill(pid, SIGUSR2);  // Send '0'
        usleep(100);  // Timing control
        bit++;
    }
}
```

### 📡 Server Reception Logic

```c
// Server: Reconstructs characters from received bits
void ft_handler(int signal)
{
    static int bit;
    static int character;
    
    if (signal == SIGUSR1)
        character |= (0x01 << bit);  // Set bit to '1'
    bit++;
    if (bit == 8) {  // Complete character received
        ft_printf("%c", character);
        bit = 0;
        character = 0;
    }
}
```

---

## 📁 Project Structure

```
minitalk/
├── 📄 server.c          # Server implementation
├── 📄 client.c          # Client implementation
├── 📄 Makefile          # Build configuration
├── 📂 libft/            # Custom C library
├── 📄 README.md         # This file
└── 🎬 demo.gif          # Project demonstration
```

---

## 🎓 Learning Outcomes

This project demonstrates mastery of:

- **📡 Unix Signal Handling**: Advanced inter-process communication
- **🔢 Bit Manipulation**: Low-level data encoding/decoding
- **⚙️ System Programming**: Process management and signal handling
- **🏗️ Software Architecture**: Clean, modular code design
- **🐛 Debugging Skills**: Complex multi-process debugging techniques

---

## 🌟 42 School Standards

✅ **Norm Compliant**: Follows 42 School coding standards  
✅ **Memory Management**: No memory leaks or undefined behavior  
✅ **Error Handling**: Comprehensive error checking and validation  
✅ **Performance**: Optimized for efficiency and reliability  

---

## 🔮 Future Enhancements

- 🔄 **Acknowledgment System**: Implement message confirmation
- 🗜️ **Compression**: Add data compression for large messages
- 🔐 **Security**: Implement basic encryption for secure communication
- 📊 **Statistics**: Add transmission speed and error rate metrics

---

## 🤝 Contributing

Contributions are welcome! Please ensure all code follows 42 School standards and includes appropriate error handling.

---

## 📝 License

This project is part of the 42 School curriculum. Educational use only.

---

## 👨‍💻 Author

**Ahmet Bakırcan**  
*42 Kocaeli Student*  
📧 abakirca@student.42kocaeli.com.tr  
🔗 [GitHub Profile](https://github.com/abakirca)

---

<div align="center">
  <h3>⭐ If you found this project helpful, please give it a star! ⭐</h3>
  <p><i>Built with passion at 42 School</i></p>
</div>
