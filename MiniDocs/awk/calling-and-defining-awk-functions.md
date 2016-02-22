# User-defined awk functions and how to call them from the command line
> Definitions of functions can appear anywhere between the rules of an awk program. 
Thus, the general form of an awk program is extended to include sequences of rules and user-defined function definitions. 
There is no need to put the definition of a function before all uses of the function. This is because awk reads the entire program before starting to execute any of it.

The definition of a function named *name* looks like this:
```
function name([parameter-list])
{
  body-of-function
}
```
## Example of user-defined awk function
In the file `rev.awk` we have the `rev` function
```sh
# rev.awk
function rev(str)
{
    if (str == "")
        return ""
  
    return (rev(substr(str, 2)) substr(str, 1, 1))
}
```

Then, on the command line, we do
```sh
$ echo "Don’t Panic!" |
> gawk -e ’{ print rev($0) }’ -f rev.awk
# returns !cinaP t’noD
```