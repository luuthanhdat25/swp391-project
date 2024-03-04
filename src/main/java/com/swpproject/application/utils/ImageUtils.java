package com.swpproject.application.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ImageUtils {

//    public static byte[] compressImage(byte[] data) throws IOException {
//        LZ4Compressor compressor = LZ4Factory.fastestInstance().fastCompressor();
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//        LZ4BlockOutputStream compressedOutputStream = new LZ4BlockOutputStream(outputStream, 4096, compressor);
//        compressedOutputStream.write(data);
//        compressedOutputStream.close();
//        return outputStream.toByteArray();
//    }
//
//    public static byte[] decompressImage(byte[] data) throws DataFormatException, IOException {
//        LZ4FastDecompressor decompressor = LZ4Factory.fastestInstance().fastDecompressor();
//        ByteArrayInputStream inputStream = new ByteArrayInputStream(data);
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//        LZ4BlockInputStream compressedInputStream = new LZ4BlockInputStream(inputStream, decompressor);
//        byte[] buffer = new byte[4096];
//        int bytesRead;
//        while ((bytesRead = compressedInputStream.read(buffer)) != -1) {
//            outputStream.write(buffer, 0, bytesRead);
//        }
//        compressedInputStream.close();
//        return outputStream.toByteArray();
//    }
}
