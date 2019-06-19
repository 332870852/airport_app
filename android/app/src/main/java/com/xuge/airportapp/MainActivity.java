package com.xuge.airportapp;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.UnknownHostException;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/battery";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

       asy();

}

void  asy(){

        new Thread(){
            @Override
            public void run() {
                try {

                    Socket socket = new Socket("111.230.9.18", 10086);
                    //设置10秒之后即认为是超时
                    socket.setSoTimeout(10000);
                    BufferedReader br = new BufferedReader(new InputStreamReader(
                            socket.getInputStream()));
                    String line = br.readLine();

                        System.out.println(line);
                    br.close();
                    socket.close();

                } catch (UnknownHostException e) {
                    // TODO Auto-generated catch block
                    Log.e("UnknownHost", "来自服务器的数据");
                    e.printStackTrace();
                } catch (IOException e) {
                    Log.e("IOException", "来自服务器的数据");
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }


            }
        }.start();
}
}
