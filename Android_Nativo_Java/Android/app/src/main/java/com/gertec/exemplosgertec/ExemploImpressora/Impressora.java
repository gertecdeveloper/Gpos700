package com.gertec.exemplosgertec.ExemploImpressora;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

import androidx.appcompat.app.AppCompatActivity;

import com.gertec.exemplosgertec.MainActivity;
import com.gertec.exemplosgertec.R;

import br.com.gertec.gedi.enums.GEDI_PRNTR_e_Status;
import br.com.gertec.gedi.exceptions.GediException;
import br.com.gertec.gedi.interfaces.IGEDI;
import br.com.gertec.gedi.interfaces.IPRNTR;

public class Impressora extends AppCompatActivity implements View.OnClickListener {

    private GertecPrinter gertecPrinter;

    private TextView txtMensagemImpressao;

    private Button btnStatusImpressora;
    private Button btnImprimir;
    private Button btnImagem;
    private Button btnBarCode;
    private Button btnTodasAsFuncoes;

    private RadioButton rbEsquerda;
    private RadioButton rbCentralizado;
    private RadioButton rbDireita;

    private ToggleButton btnNegrito;
    private ToggleButton btnItalico;
    private ToggleButton btnSublinhado;

    private Spinner spFonte;
    private Spinner spTamanho;
    private Spinner spHeight;
    private Spinner spWidth;
    private Spinner spBarCode;

    private IGEDI iGedi = null;
    private IPRNTR iPrint = null;
    private GEDI_PRNTR_e_Status status;

    private ConfigPrint configPrint = new ConfigPrint();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.impressora);

        // Inicializa os componentes de Texto
        iniTextView();

        // Inicializa os RadioButtons
        iniRbButton();

        // Inicializa os Spinner
        iniSpinner();

        // Inicializa os Buttons
        initButtons();

        // Atribui as funções aos buttons
        initButtonsOnClick();

        // Inicializa a class de impressão
        if(MainActivity.Model.equals(MainActivity.G700)){
            gertecPrinter = new GertecPrinter(this.getApplicationContext());
        }else{
            // gertecPrinter = new GertecPrinter(this);
        }

        gertecPrinter.setConfigImpressao(configPrint);

    }

    void ShowFalha(String sStatus){
        showMessagem("Falha Impressor",sStatus);
    }

    @Override
    public void onClick(View view) {

        switch (view.getId()){

            case R.id.btnStatusImpressora:
                try {
                    showMessagem("Status Impressora", gertecPrinter.getStatusImpressora());
                } catch (GediException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }
                break;

            case R.id.btnImprimir:
                try{
                    if(txtMensagemImpressao.getText().toString().equals("")){
                        Toast.makeText(getApplicationContext(), "Escreva uma mensagem", Toast.LENGTH_LONG).show();
                        return;
                    }
                    imprimir();
                } catch (Exception e) {
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }
                break;
            case R.id.btnImagem:
                try{
                    String sStatus = gertecPrinter.getStatusImpressora();
                    if(gertecPrinter.isImpressoraOK()) {
                        configPrint = new ConfigPrint();
                        gertecPrinter.setConfigImpressao(configPrint);
                        gertecPrinter.imprimeImagem("invoice");
                        gertecPrinter.avancaLinha(150);
                        gertecPrinter.ImpressoraOutput();
                    }else{
                        ShowFalha(sStatus);
                    }

                } catch (GediException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }
                break;

            case R.id.btnBarCode:
                try{

                    if(txtMensagemImpressao.getText().toString().equals("")){
                        Toast.makeText(getApplicationContext(), "Escreva uma mensagem", Toast.LENGTH_LONG).show();
                    }else{
                        String sStatus = gertecPrinter.getStatusImpressora();
                        if(gertecPrinter.isImpressoraOK()) {
                            configPrint = new ConfigPrint();
                            gertecPrinter.setConfigImpressao(configPrint);
                            gertecPrinter.imprimeBarCode(txtMensagemImpressao.getText().toString(),
                                    Integer.parseInt(spHeight.getSelectedItem().toString()),
                                    Integer.parseInt(spWidth.getSelectedItem().toString()),
                                    spBarCode.getSelectedItem().toString());
                            // Usado apenas no exemplo, esse pratica não deve
                            // ser repetida na impressão em produção
                            gertecPrinter.avancaLinha(100);
                            gertecPrinter.ImpressoraOutput();
                        }else{
                            ShowFalha(sStatus);
                        }
                    }

                } catch (GediException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
                }
                break;

            case R.id.btnTodasAsFuncoes:
                ImprimeTodasAsFucoes();

        }
    }

    protected void iniRbButton(){
        rbEsquerda = findViewById(R.id.rbEsquerda);
        rbCentralizado = findViewById(R.id.rbCentralizado);
        rbDireita = findViewById(R.id.rbDireita);
    }

    protected void iniTextView(){
        txtMensagemImpressao = findViewById(R.id.txtMensagemImpressao);
    }

    protected void initButtons(){

        btnStatusImpressora = findViewById(R.id.btnStatusImpressora);

        btnImprimir = findViewById(R.id.btnImprimir);

        btnImagem = findViewById(R.id.btnImagem);

        btnNegrito = findViewById(R.id.btnNegrito);
        btnItalico = findViewById(R.id.btnItalico);
        btnSublinhado = findViewById(R.id.btnSublinhado);

        btnBarCode = findViewById(R.id.btnBarCode);

        btnTodasAsFuncoes = findViewById(R.id.btnTodasAsFuncoes);
    }

    protected void initButtonsOnClick(){
        btnStatusImpressora.setOnClickListener(this);
        btnImprimir.setOnClickListener(this);
        btnImagem.setOnClickListener(this);
        btnBarCode.setOnClickListener(this);
        btnTodasAsFuncoes.setOnClickListener(this);

    }

    protected void iniSpinner(){
        spFonte = findViewById(R.id.spFont);
        spTamanho = findViewById(R.id.spTamanho);

        spHeight = findViewById(R.id.spHeight);
        spWidth = findViewById(R.id.spWidth);
        spBarCode = findViewById(R.id.spBarType);

    }

    @TargetApi(Build.VERSION_CODES.O)
    protected void imprimir() throws Exception {

        // Configura o alinhamento da impressão
        if (rbEsquerda.isChecked()){
            configPrint.setAlinhamento("LEFT");
        }else if(rbCentralizado.isChecked()){
            configPrint.setAlinhamento("CENTER");
        }else if(rbDireita.isChecked()){
            configPrint.setAlinhamento("RIGHT");
        }

        // Configura o tipo de impressão
        configPrint.setNegrito(btnNegrito.isChecked());
        configPrint.setItalico(btnItalico.isChecked());
        configPrint.setSublinhado(btnSublinhado.isChecked());

        // Configura a fonte a ser impresa
        configPrint.setFonte(spFonte.getSelectedItem().toString());

        // Configra o tamanho da fonte
        configPrint.setTamanho(Integer.parseInt(spTamanho.getSelectedItem().toString()));

        // Aplica as novas configurações
        gertecPrinter.setConfigImpressao(configPrint);

        // Faz a impressão
        String sStatus = gertecPrinter.getStatusImpressora();
        if(gertecPrinter.isImpressoraOK()) {
            gertecPrinter.imprimeTexto(txtMensagemImpressao.getText().toString());
            // Usado apenas no exemplo, esse pratica não deve
            // ser repetida na impressão em produção
            gertecPrinter.avancaLinha(150);
            gertecPrinter.ImpressoraOutput();
        }else{
            ShowFalha(sStatus);
        }



    }

    protected void showMessagem(String titulo, String mensagem){
        AlertDialog alertDialog = new AlertDialog.Builder(Impressora.this).create();
        alertDialog.setTitle(titulo);
        alertDialog.setMessage(mensagem);
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
        alertDialog.show();
    }


    private void ImprimeTodasAsFucoes(){
        configPrint.setItalico(false);
        configPrint.setNegrito(true);
        configPrint.setTamanho(20);
        configPrint.setFonte("MONOSPACE");
        gertecPrinter.setConfigImpressao(configPrint);

        try {
            gertecPrinter.getStatusImpressora();
            // Imprimindo Imagem
            configPrint.setiWidth(300);
            configPrint.setiHeight(130);
            configPrint.setAlinhamento("CENTER");
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("==[Iniciando Impressao Imagem]==");
            gertecPrinter.imprimeImagem("gertec_2");
            gertecPrinter.avancaLinha(10);
            gertecPrinter.imprimeTexto("====[Fim Impressão Imagem]====");
            gertecPrinter.avancaLinha(10);
            // Fim Imagem

            // Impressão Centralizada
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(30);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("CENTRALIZADO");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Centralizada

            // Impressão Esquerda
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(40);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("ESQUERDA");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Esquerda

            // Impressão Direita
            configPrint.setAlinhamento("RIGHT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("DIREITA");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Direita

            // Impressão Negrito
            configPrint.setNegrito(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Netrigo]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Negrito

            // Impressão Italico
            configPrint.setNegrito(false);
            configPrint.setItalico(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Italico]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Italico

            // Impressão Italico
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("======[Escrita Sublinhado]=====");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Italico

            // Impressão BarCode 128
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("====[Codigo Barras CODE 128]====");
            gertecPrinter.imprimeBarCode("12345678901234567890", 120,120,"CODE_128");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão BarCode 128

            // Impressão Normal
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Normal]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Normal

            // Impressão Normal
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=========[BlankLine 50]=========");
            gertecPrinter.avancaLinha(50);
            gertecPrinter.imprimeTexto("=======[Fim BlankLine 50]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Normal

            // Impressão BarCode 13
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=====[Codigo Barras EAN13]=====");
            gertecPrinter.imprimeBarCode("7891234567895", 120,120,"EAN_13");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão BarCode 128

            // Impressão BarCode 13
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("===[Codigo QrCode Gertec LIB]==");
            gertecPrinter.avancaLinha(10);
            gertecPrinter.imprimeBarCode("Gertec Developer Partner LIB", 240,240,"QR_CODE");

            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.imprimeTexto("===[Codigo QrCode Gertec IMG]==");
            gertecPrinter.imprimeBarCodeIMG("Gertec Developer Partner IMG", 240,240,"QR_CODE");

            gertecPrinter.avancaLinha(100);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                gertecPrinter.ImpressoraOutput();
            } catch (GediException e) {
                e.printStackTrace();
            }
        }
    }
}
