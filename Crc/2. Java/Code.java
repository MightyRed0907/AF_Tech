package com.javacodegeeks.snippets.core;
 
import java.io.IOException;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
 
public class CalculateCRC32ChecksumOfZipEntry {
 
    public static void main(String[] args) {
 
        ZipFile zipFile = null;
 
        try {
 
            // open a zip file for reading
            zipFile = new ZipFile("c:/archive.zip");
 
            // get an enumeration of the ZIP file entries
            Enumeration<? extends ZipEntry> e = zipFile.entries();
 
            while (e.hasMoreElements()) {
 
                ZipEntry entry = e.nextElement();
 
                // get the name of the entry
                String entryName = entry.getName();
 
                // get the CRC-32 checksum of the uncompressed entry data, or -1 if not known
                long crc = entry.getCrc();
 
                System.out.println(entryName + " with CRC-32: " + crc);
 
            }
 
        }
        catch (IOException ioe) {
            System.out.println("Error opening zip file" + ioe);
        }
         finally {
             try {
                 if (zipFile!=null) {
                     zipFile.close();
                 }
             }
             catch (IOException ioe) {
                    System.out.println("Error while closing zip file" + ioe);
             }
         }
 
    }
 
}