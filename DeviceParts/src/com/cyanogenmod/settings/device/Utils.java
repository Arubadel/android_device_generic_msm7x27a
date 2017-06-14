package com.cyanogenmod.settings.device;

import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.SyncFailedException;
import java.lang.SecurityException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Utils
{
    private static final String TAG = "DeviceParts";

    public static void writeValue(String parameter, int value) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(new File(parameter));
            fos.write(String.valueOf(value).getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + parameter + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + parameter + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + parameter + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG, "file " + parameter + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }
    }

    public static void setWritable(String parameter) {
        File file = new File(parameter);
        try {
            file.setWritable(true);
        } catch (SecurityException ex) {
            Log.w(TAG, "unable to set permission for file " + parameter + ": " + ex);
        }
    }

    public static void setNonWritable(String parameter) {
        File file = new File(parameter);
        try {
            file.setWritable(false);
        } catch (SecurityException ex) {
            Log.w(TAG, "unable to set permission for file " + parameter + ": " + ex);
        }
    }

   public static final  String command(String parameter)
    {

        try {
            // Executes the command.
            Process process = Runtime.getRuntime().exec(parameter);
            // Reads stdout.
            // NOTE: You can write to stdin of the command using
            //       process.getOutputStream().
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));
            int read;
            char[] buffer = new char[4096];
            StringBuffer output = new StringBuffer();
            while ((read = reader.read(buffer)) > 0) {
                output.append(buffer, 0, read);
            }
            reader.close();

            // Waits for the command to finish.
            process.waitFor();

            return output.toString();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e)

        {
            throw new RuntimeException(e);
        }
    }


}
