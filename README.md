![screen shot](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/7348/versions/4/screenshot.jpg)

# MATLAB Structure Comparison
Visually compare two MATLAB structures

```STRUCTCOMPVIS(s1,s2)``` opens an HTML differencing report comparing two structures.

This is useful for quickly finding subtle differences between 2 structures. I find it particularly useful when working with large handles structures from GUI applications.

Ex:
```matlab
% Find which properties are different between two graphics objects
subplot(211);l1 = plot(1:10)
subplot(212)l2 = plot(1:10,'r')
structcompvis(get(l1),get(l2))
```

[![View STRUCTCOMPVIS on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/7348-structcompvis)
