# :computer: Assembly
This repository is a collection of usefull functions to use in various programming languages, with the peculiarity that they have been optimized directly in **Assembly**.
<br>
<br>
This functions are the templates for more complex (or even for the exact same) implementations in higher programming languages: take as example the function *"swap.S"*, which can be take as the base for the implementation of *"array_swap.S"*, a function used specifically on arrays, but based on the general swap function.
<br>
<br>

## :question: How to use the repo
Since there is not an unique **Assembly programming language**, the repo has been divided in different subfolders, each one for a specific Architecture:<br>
  - **RISC-V :** implementation for the RISC-V Architecture of the Assembly functions.
  - **x86 :** implementation for the x86 Architecture of the Assembly functions.
<br>

## :arrows_counterclockwise: Architecture differences
Since different Systems are based on different Architectures, some functions may need to be adapted for the desired System in order to work properly.
<br>
<br>
In particular:<br>
  - **RISC-V :** this functions are compatible with both RISC-V32 and RISC-V64, but some specific operations have been calculated based on 64-bit Systems (such as offsets and addresses length).
  - **x86 :** this functions are compatible with x86_64 Architecture (since most PC's are based on it), so have been used 64-bit registers; this implies that the majority of the operations have to be recalibrated if you want to use a x86_32 Architecture.
<br>

## :heavy_plus_sign: Multiple types
Since in **Assembly** for each type must be used different operations (sometimes even different registers), each function is preceded by the macro ***"#ifdef X_TYPE"***, where *X* indicates the type.
<br>
<br>
For example, into the ***"#ifdef INT_TYPE"*** condition, takes place the implementation of *"function_int"*, wich differs from the one into the ***"#ifdef FLOAT_TYPE"*** condition.