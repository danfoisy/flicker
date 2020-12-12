const fs=require('fs')

const buf=fs.readFileSync('./list.lst');

const lines=buf.toString().split('\n');


let clk=0;
let str="";
for(let i=9;i<lines.length;i++) {
    const line=lines[i].trim().split(/  +/g);

    if(clk != line[2] && line[2]=='1')
        str+=`${line[0]},${line[3]},${line[4]},${line[5]}\r`

    clk=line[2];
}

fs.writeFileSync('./list.csv',str)