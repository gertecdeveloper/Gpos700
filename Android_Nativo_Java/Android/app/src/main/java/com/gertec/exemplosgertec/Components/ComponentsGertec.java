package com.gertec.exemplosgertec.Components;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;

import com.gertec.exemplosgertec.ExemploSAT.SatPages.Ativacao;

public class ComponentsGertec {

    public static void dialogoRetorno(String s, Context context) {
        AlertDialog alerta;
        //TODO Fazer algo com a String que foi retornada do sat.
        try {
            // Inicia o Alert
            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            //define o titulo
            builder.setTitle("Retorno");
            //define a mensagem
            builder.setMessage(s);
            //define um botão ok
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface arg0, int arg1) {
                }
            });
            //cria o AlertDialog
            alerta = builder.create();
            //Exibe
            alerta.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
