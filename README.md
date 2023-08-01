# Sigmathly

**The first ever advanced mathematical framework for all types of assembly languages**

# Why use Sigmathly?

Introducing Sigmathly: Revolutionizing Mathematics in Assembly Programming!

Sigmathly is an innovative assembly framework designed to enable seamless mathematical operations directly within assembly code. With the power of Sigmathly, there is no longer a requirement to rely on external languages like C++ or C to perform mathematical calculations in assembly programming. Now, you can perform complex mathematics directly in assembly!

Assembly language is widely utilized in advanced and intricate systems. However, incorporating mathematical operations into such systems has traditionally involved navigating through perplexing assembly keywords. Sigmathly eliminates this complexity by providing a straightforward and intuitive approach to integrating mathematics into assembly programming.

By leveraging Sigmathly, programmers working with assembly can effortlessly leverage a wide range of mathematical functionalities, empowering them to tackle sophisticated mathematical computations within their projects. This groundbreaking framework opens up new possibilities for mathematics in assembly, making it an indispensable tool for developers working in complex systems.

# Installation

• Go to releases tab

• Download .dll release / .so release / .a release

• Link the release to assembly file 

``` bash
gcc main.c -o program -L/path/to/release -lsigmathly 
```

OR

```bash 
gcc main.c -o program.exe -L/path/to/sigmathly -lsimgathly 
```

# Use in C++

• Get .deb release and run

``` bash
sudo dpkg -i package.deb
```

• Get .iss release and run

``` bash
iscc sigmathly.iss
```

• install from windows installer release

• From .rpm package
```bash
sudo yum install sigmathly.rpm
```

• Debian package
```bash
sudo dpkg -i sigmathly.deb
```

# Compile files to .so, .a, .dll yourself

Run build.py using

``` bash 
python3 main.py
```

# Compile source files

Compile them normally

``` bash
gcc -c file_name.cpp -o name.o
```

Compile them with fPIC flag

```bash
gcc -c -fPIC file_name.cpp -o name.o
```

fPIC compiled files are used to generate .dll and .so

### To know how to use Sigmathly in x86_64 assembly, click [here](https://github.com/aryapraneil/Sigmathly/blob/main/USAGE-x86_64.asm)
### To know how to use Sigmathly in ARM assembly, click [here](https://github.com/aryapraneil/Sigmathly/blob/main/USAGE-ARM.asm)
### To know how to use Sigmathly in C++, click [here](https://enginestein.github.io/Sigmath/)
