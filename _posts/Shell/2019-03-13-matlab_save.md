---
title: matlab-save
date: 2019-03-13 10:12:09
categories:
- Shell
---
## How to save data as file in MATLAB

#### 1. save with non scientific notation
**key: use fprintf**  
```matlab
iflag=fopen(formatout,'w');
for i=1:m
    fprintf(iflag,'%f %f %f  %f',data_format(i,:));
    fprintf(iflag,'\n');
end
fclose(iflag)
```

#### 2. save as ascii file, not binary
```matlab
save('file_path','variant_name', '-ascii')
```

#### 3. save as .mat(small space to store)
```matlab
save('file_path','variant_name')
```