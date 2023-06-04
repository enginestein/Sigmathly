# Sigmathly

**The first ever advanced mathematical framework for assembly**

# Installation

• Go to releases tab

• Download .dll release / .so release / .a release

• Link the release to assembly file 

``` bash
gcc main.c -o program -L/path/to/release -lsigmathly 
```

OR

```bash 
gcc main.c -o program.exe -L/path/to/library -lmylibrary 
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

# Why use Sigmathly?

Sigmathly is an advanced assembly framework which can be used to perform mathematics in assembly programming. With this framework, there is no need to use C++ or C to perform mathematics in assembly code. You can directly perform maths in assembly. As assembly is used in advanced and complex systems, now mathematics can be used in those systems too without using confusing assembly keywords. 
