Calculate CRC-32 checksum of zip entry

With this example we are going to demonstrate how to calculate the CRC-32 checksum of a ZipEntry. In short, to calculate the CRC-32 checksum of a ZipEntry you should:

- Create a new ZipFile and open it for reading.
- Get the Enumeration of the ZipFile entries, with entries() API method of ZipFile and iterate through each one of them.
- For each one of the entries get the long CRC-32 checksum of the uncompressed entry, using getCrc() API method of ZipEntry.
- Close the ZipFile, with close() API method of ZipFile.

Let’s take a look at the code snippet that follows: