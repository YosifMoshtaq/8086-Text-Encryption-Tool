# 8086 Assembly Text Encryption & Decryption Tool

An interactive console-based text encryption and decryption application written in **8086 Assembly Language**. The project uses character shifting based on a user-provided numeric key and utilizes DOS `INT 21h` system interrupts for I/O operations.

## Features

- **Text Encryption:** Encrypts user input string using character shift arithmetic with a numeric key (0-9).
- **Text Decryption:** Restores encrypted text back to original form using the same numeric key.
- **Interactive Menu:** Console interface built using DOS display interrupts.
- **Dynamic Input Length:** Handles custom text input up to 50 characters.

## Technical Details & Concepts

- **Architecture:** x86 / 8086 Assembly.
- **Emulator:** Compatible with `emu8086` and MASM/TASM environments.
- **Interrupts Used:**
  - `INT 21h / AH=09h` : Print string.
  - `INT 21h / AH=01h` : Read single character input.
  - `INT 21h / AH=02h` : Print single character output.
  - `INT 21h / AH=4Ch` : Terminate program.
- **Data Structures:** Byte arrays and index pointers (`SI` register).

## How to Run

1. Download and install **[emu8086](https://emu8086.com/)** or any 8086 Assembly emulator.
2. Open `TextEncryption.asm` in the emulator.
3. Click **Compile & Run** (Emulate).
4. Select `1` to Encrypt or `2` to Decrypt, enter your text, and provide a numeric key (0-9).
