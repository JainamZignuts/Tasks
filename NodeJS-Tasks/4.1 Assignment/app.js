var fs = require('fs');

// Create a file with the name demo.txt and write some contents to the file using NodeJS file module.

fs.writeFileSync('demo.txt', 'Node.js is an open source server environment.');
console.log('file created!');

// Read the content of created `demo.txt` file. Take an example: a file name is demo.txt and the content `Node.js is an open source server environment.`.	

var mydemofile = fs.readFileSync('demo.txt', 'utf8');
console.log("file's data is = " + mydemofile);

// Update the created `demo.txt`  file’s content of the file in NodeJs. For example, Append the `Node.js allows you to run JavaScript on the server.` in the file.

fs.appendFileSync('demo.txt', ' Node.js allows you to run JavaScript on the server.');
console.log("file's content Updated!");

var mydemofile = fs.readFileSync('demo.txt', 'utf8');
console.log("Updated file's data is = " + mydemofile);

// Rename the created file name. For example, `demo.txt` to `final-demo.txt`.

fs.renameSync('demo.txt', 'final-demo.txt');
console.log('File Renamed!');

// Delete the created `demo.txt` file using NodeJS file module.

fs.unlinkSync('final-demo.txt');
console.log('File Deleted!');