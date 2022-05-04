

package com.gertec.exemplosgertec.ExemploTEF;

import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.text.InputType;
import android.text.method.DigitsKeyListener;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.RadioButton;

import java.util.regex.*;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.gertec.exemplosgertec.ExemploImpressora.ConfigPrint;
import com.gertec.exemplosgertec.ExemploImpressora.GertecPrinter;
import com.gertec.exemplosgertec.R;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Tef extends AppCompatActivity {
    private final String GER7_API_VERSION = "1.04";

    private final String GER7_CREDITO = "1";
    private final String GER7_DEBITO = "2";
    private final String GER7_VOUCHER = "4";
    private final String GER7_REIMPRESSAO = "18";

    private final String GER7_SEMPARCELAMENTO = "0";
    private final String GER7_PARCELADO_LOJA = "1";
    private final String GER7_PARCELADO_ADM = "2";

    private final String GER7_DESABILITA_IMPRESSAO = "0";
    private final String GER7_HABILITA_IMPRESSAO = "1";

    private final String GER7_VENDA = "1";
    private final String GER7_CANCELAMENTO = "2";
    private final String GER7_FUNCOES = "3";
    public static String acao = "venda";
    Gson gson = new Gson();

    Intent intentGer7 = new Intent(Intent.ACTION_VIEW, Uri.parse("pos7api://pos7"));

    Venda venda = new Venda();


    private GertecPrinter gertecPrinter;
    private ConfigPrint configPrint = new ConfigPrint();
    /// Difines operação
    private Random r = new Random();
    private Date dt = new Date();
    private String op = String.valueOf(r.nextInt(99999));
    private String currentDateTimeString = DateFormat.getDateInstance().format(new Date());
    private String currentDateTimeStringT = String.valueOf(dt.getHours()) + String.valueOf(dt.getMinutes()) + String.valueOf(dt.getSeconds());
    /// Fim Defines Operação

    private Locale mLocale = new Locale("pt", "BR");


    ///  Defines tef
    private static int REQ_CODE = 4321;
    /// Fim Defines tef


    private EditText txtValorOperacao;
    private EditText txtIpServidor;
    private EditText txtParcelas;

    private Button btnEnviarTransacao;
    private Button btnCancelarTransacao;
    private Button btnFuncoes;
    private Button btnReimpressao;

    private CheckBox cbImpressao;

    private RadioButton rbTodos;
    private RadioButton rbCredito;
    private RadioButton rbDebito;
    private RadioButton rbGer7;
    private RadioButton rbLoja;
    private RadioButton rbAdm;
    private RadioButton rbMsitef;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tef);

        // Inicializa todos os EditText
        txtValorOperacao = findViewById(R.id.txtValorOperacao);
        txtIpServidor = findViewById(R.id.txtIpServidor);
        txtParcelas = findViewById(R.id.txtParcelas);

        // Inicializa todos os Buttons
        btnEnviarTransacao = findViewById(R.id.btnEnviarTransacao);
        btnCancelarTransacao = findViewById(R.id.btnCancelarTransacao);
        btnFuncoes = findViewById(R.id.btnFuncoes);
        btnReimpressao = findViewById(R.id.btnReimpressao);

        // Inicializa todos os RadioButtons

        rbCredito = findViewById(R.id.rbCredito);
        rbDebito = findViewById(R.id.rbDebito);
        rbTodos = findViewById(R.id.rbTodos);
        rbLoja = findViewById(R.id.radioLoja);
        rbAdm = findViewById(R.id.radioAdm);

        // Inicializa o CheckBox

        //* Caso seja M-sitef, este parâmetro não surge efeito (linhas comentadas na funções do M-Sitef (Abaixo)), pois na versão v3.70 está opção foi removida do Sitef **
        cbImpressao = findViewById(R.id.cbImpressao);
        cbImpressao.setEnabled(false);
        cbImpressao.setChecked(false);

        rbGer7 = findViewById(R.id.rbGer7);
        rbMsitef = findViewById(R.id.rbMsitef);
        // Adiciona mascara nos campos
        maskTextEdits();
        txtValorOperacao.setHint("");
        txtValorOperacao.setText("1000");
        txtIpServidor.setText("");
        gertecPrinter = new GertecPrinter(this);
        rbMsitef.setChecked(true);
        rbAdm.setChecked(true);
        cbImpressao.setChecked(true);
        txtIpServidor.setInputType(InputType.TYPE_CLASS_NUMBER);
        txtIpServidor.setKeyListener(DigitsKeyListener.getInstance("0123456789."));
        rbDebito.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                if (rbTodos.isChecked() || rbDebito.isChecked()) {
                    txtParcelas.setText("1");
                    txtParcelas.setEnabled(false);
                } else {
                    txtParcelas.setEnabled(true);
                }
            }
        });

        rbTodos.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                if (rbTodos.isChecked() || rbDebito.isChecked()) {
                    txtParcelas.setText("1");
                    txtParcelas.setEnabled(false);
                } else {
                    txtParcelas.setEnabled(true);
                }
            }
        });

        rbMsitef.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton arg0, boolean arg1) {
                if (rbMsitef.isChecked()) {
                    cbImpressao.setChecked(false);
                    cbImpressao.setEnabled(false);  //* Caso seja M-sitef, este parâmetro não surge efeito (linhas comentadas na funções do M-Sitef (Abaixo)), pois na versão v3.70 está opção foi removida do Sitef **
                    txtIpServidor.setEnabled(true);
                } else {
                    cbImpressao.setEnabled(true);
                    txtIpServidor.setEnabled(false);
                }
            }
        });
        btnEnviarTransacao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                acao = "venda";
                if (Mask.unmask(txtValorOperacao.getText().toString()).equals("000")) {
                    dialogoErro("O valor de venda digitado deve ser maior que 0");
                } else if (rbMsitef.isChecked() && validaIp(txtIpServidor.getText().toString()) == false) {
                    dialogoErro("Digite um IP válido");
                } else {
                    if (rbCredito.isChecked() && (txtParcelas.getText().toString().isEmpty() || txtParcelas.getText().toString().equals("0"))) {
                        dialogoErro("É necessário colocar o número de parcelas desejadas (obs.: Opção de compra por crédito marcada)");
                    } else {
                        if (rbGer7.isChecked()) {
                            execulteGer7Venda();
                        } else if (rbMsitef.isChecked()) {
                            execulteSTefVenda();
                        }
                    }
                }
            }
        });

        btnCancelarTransacao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                acao = "cancelamento";
                if (Mask.unmask(txtValorOperacao.getText().toString()).equals("000")) {
                    dialogoErro("O valor de venda digitado deve ser maior que 0");
                } else if (rbMsitef.isChecked() && validaIp(txtIpServidor.getText().toString()) == false) {
                    dialogoErro("Digite um IP válido");
                } else {
                    if (rbMsitef.isChecked()) {
                        execulteSTefCancelamento();
                    } else {
                        execulteGer7Cancelamento();
                    }
                }
            }
        });

        btnFuncoes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                acao = "funcoes";
                if (Mask.unmask(txtValorOperacao.getText().toString()).equals("000")) {
                    dialogoErro("O valor de venda digitado deve ser maior que 0");
                } else if (rbMsitef.isChecked() && validaIp(txtIpServidor.getText().toString()) == false) {
                    dialogoErro("Digite um IP válido");
                } else {
                    if (rbMsitef.isChecked()) {
                        execulteSTefFuncoes();
                    } else {
                        execulteGer7Funcoes();
                    }
                }
            }
        });

        btnReimpressao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                acao = "reimpressao";
                if (Mask.unmask(txtValorOperacao.getText().toString()).equals("000")) {
                    dialogoErro("O valor de venda digitado deve ser maior que 0");
                } else if (rbMsitef.isChecked() && validaIp(txtIpServidor.getText().toString()) == false) {
                    dialogoErro("Digite um IP válido");
                } else {
                    if (rbMsitef.isChecked()) {
                        execulteSTefReimpressao();
                    } else {
                        execulteGer7Reimpressao();
                    }
                }
            }
        });
    }

    // O M-Sitef não retorna um json como resposta, logo é criado um json com a
    // reposta do Sitef.
    public String respSitefToJson(Intent data) throws JSONException {
        JSONObject json = new JSONObject();
        json.put("CODRESP", data.getStringExtra("CODRESP"));
        json.put("COMP_DADOS_CONF", data.getStringExtra("COMP_DADOS_CONF"));
        json.put("CODTRANS", data.getStringExtra("CODTRANS"));
        json.put("VLTROCO", data.getStringExtra("VLTROCO"));
        json.put("REDE_AUT", data.getStringExtra("REDE_AUT"));
        json.put("BANDEIRA", data.getStringExtra("BANDEIRA"));
        json.put("NSU_SITEF", data.getStringExtra("NSU_SITEF"));
        json.put("NSU_HOST", data.getStringExtra("NSU_HOST"));
        json.put("COD_AUTORIZACAO", data.getStringExtra("COD_AUTORIZACAO"));
        json.put("NUM_PARC", data.getStringExtra("NUM_PARC"));
        json.put("TIPO_PARC", data.getStringExtra("TIPO_PARC"));
        json.put("VIA_ESTABELECIMENTO", data.getStringExtra("VIA_ESTABELECIMENTO"));
        json.put("VIA_CLIENTE", data.getStringExtra("VIA_CLIENTE"));
        return json.toString();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (rbMsitef.isChecked()) {
            RetornoMsiTef retornoSitef = null;
            try {
                retornoSitef = gson.fromJson(respSitefToJson(data), RetornoMsiTef.class);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            if (requestCode == REQ_CODE && resultCode == RESULT_OK) {
                if (retornoSitef.getCodResp().equals("0")) {
                    String impressao = "";
                    // Verifica se tem algo pra imprimir
                    if (!retornoSitef.textoImpressoCliente().isEmpty()) {
                        impressao += retornoSitef.textoImpressoCliente();
                    }
                    if (!retornoSitef.textoImpressoEstabelecimento().isEmpty()) {
                        impressao += "\n\n-----------------------------     \n";
                        impressao += retornoSitef.textoImpressoEstabelecimento();
                    }
                    if (!impressao.isEmpty()) {
                        dialogImpressaoGPOS(impressao, 17);
                    }
                }
                // Verifica se ocorreu um erro durante venda ou cancelamento
                if (acao.equals("venda") || acao.equals("cancelamento")) {
                    if (retornoSitef.getCodResp().isEmpty() || !retornoSitef.getCodResp().equals("0") || retornoSitef.getCodResp() == null) {
                        dialodTransacaoNegadaMsitef(retornoSitef);
                    } else {
                        dialodTransacaoAprovadaMsitef(retornoSitef);
                    }
                }
            } else {
                // ocorreu um erro
                if (acao.equals("venda") || acao.equals("cancelamento")) {
                    dialodTransacaoNegadaMsitef(retornoSitef);
                }
            }
            // Verifica se ocorreu erro na Ger7
        } else {
            if (resultCode == RESULT_OK && requestCode == REQ_CODE) {
                RetornoGer7 retornoGer7 = gson.fromJson(data.getStringExtra("jsonResp"), RetornoGer7.class);
                // Verifica se tem algo pra imprimir
                if (retornoGer7.getErrmsg() == null && retornoGer7.getPrint() != null) {
                    dialogImpressaoGPOS(retornoGer7.getPrint(), 17);
                }
                if (acao.equals("funcoes") && retornoGer7.getErrmsg() != null) {
                    dialodTransacaoNegadaGer7(retornoGer7);
                }
                // Verifica se ocorreu um erro durante venda ou cancelamento
                if (acao.equals("venda") || acao.equals("cancelamento")) {
                    if (retornoGer7.getErrmsg() != null) {
                        dialodTransacaoNegadaGer7(retornoGer7);
                    } else {
                        dialodTransacaoAprovadaGer7(retornoGer7);
                    }
                }
            } else {
                RetornoGer7 retornoGer7 = (RetornoGer7) gson.fromJson(data.getStringExtra("jsonResp"), RetornoGer7.class);
                // ocorreu um erro durante venda ou cancelamento
                if (acao.equals("venda") || acao.equals("cancelamento")) {
                    dialodTransacaoNegadaGer7(retornoGer7);
                }
            }
        }
    }

    boolean validaIp(String ipserver) {

        Pattern p = Pattern.compile("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
                "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$");
        Matcher m = p.matcher(ipserver);
        boolean b = m.matches();
        return b;
    }

    private void maskTextEdits() {
        txtValorOperacao.addTextChangedListener(new MoneyTextWatcher(txtValorOperacao));
    }

    private void dialodTransacaoAprovadaMsitef(RetornoMsiTef retornoMsiTef) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        StringBuilder cupom = new StringBuilder();
        cupom.append("CODRESP: " + retornoMsiTef.getCodResp() + "\n");
        cupom.append("COMP_DADOS_CONF: " + retornoMsiTef.getCompDadosConf() + "\n");
        cupom.append("CODTRANS: " + retornoMsiTef.getCodTrans() + "\n");
        cupom.append("CODTRANS (Name): " + retornoMsiTef.getNameTransCod() + "\n");
        cupom.append("VLTROCO: " + retornoMsiTef.getvlTroco() + "\n");
        cupom.append("REDE_AUT: " + retornoMsiTef.getRedeAut() + "\n");
        cupom.append("BANDEIRA: " + retornoMsiTef.getBandeira() + "\n");
        cupom.append("NSU_SITEF: " + retornoMsiTef.getNSUSitef() + "\n");
        cupom.append("NSU_HOST: " + retornoMsiTef.getNSUHOST() + "\n");
        cupom.append("COD_AUTORIZACAO: " + retornoMsiTef.getCodAutorizacao() + "\n");
        cupom.append("NUM_PARC: " + retornoMsiTef.getParcelas() + "\n");
        alertDialog.setTitle("Ação executada com sucesso");
        alertDialog.setMessage(cupom.toString());
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                // Não existe nenhuma ação
            }
        });
        alertDialog.show();
    }


    private void dialogoErro(String msg) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Erro ao executar função");
        alertDialog.setMessage(msg);
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                // Não existe nenhuma ação
            }
        });
        alertDialog.show();

    }

    private void dialodTransacaoAprovadaGer7(RetornoGer7 retorno) {

        AlertDialog alertDialog = new AlertDialog.Builder(this).create();

        StringBuilder cupom = new StringBuilder();

        cupom.append("version: " + retorno.getVersion() + "\n");
        cupom.append("status: " + retorno.getStatus() + "\n");
        cupom.append("config: " + retorno.getConfig() + "\n");
        cupom.append("license: " + retorno.getLicense() + "\n");
        cupom.append("terminal: " + retorno.getTerminal() + "\n");
        cupom.append("merchant: " + retorno.getMerchant() + "\n");
        cupom.append("id: " + retorno.getId() + "\n");
        cupom.append("type: " + retorno.getType() + "\n");
        cupom.append("product: " + retorno.getProduct() + "\n");
        cupom.append("response: " + retorno.getResponse() + "\n");
        cupom.append("authorization: " + retorno.getAuthorization() + "\n");
        cupom.append("amount: " + retorno.getAmount() + "\n");
        cupom.append("installments: " + retorno.getInstallments() + "\n");
        cupom.append("instmode: " + retorno.getInstmode() + "\n");
        cupom.append("stan: " + retorno.getStan() + "\n");
        cupom.append("rrn: " + retorno.getRrn() + "\n");
        cupom.append("time: " + retorno.getTime() + "\n");
        cupom.append("track2: " + retorno.getTrack2() + "\n");
        cupom.append("aid: " + retorno.getAid() + "\n");
        cupom.append("cardholder: " + retorno.getCardholder() + "\n");
        cupom.append("prefname: " + retorno.getPrefname() + "\n");
        cupom.append("errcode: " + retorno.getErrcode() + "\n");
        cupom.append("label: " + retorno.getLabel() + "\n");

        alertDialog.setTitle("Ação executada com sucesso");
        alertDialog.setMessage(cupom.toString());
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                // Não existe nenhuma ação
            }
        });
        alertDialog.show();
    }

    private void dialodTransacaoNegadaMsitef(RetornoMsiTef retornoMsiTef) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        StringBuilder cupom = new StringBuilder();
        cupom.append("CODRESP: " + retornoMsiTef.getCodResp());
        alertDialog.setTitle("Ocorreu um erro durante a realização da ação");
        alertDialog.setMessage(cupom.toString());
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                // Não existe nenhuma ação
            }
        });
        alertDialog.show();
    }

    private void dialodTransacaoNegadaGer7(RetornoGer7 retorno) {

        AlertDialog alertDialog = new AlertDialog.Builder(this).create();

        StringBuilder cupom = new StringBuilder();

        cupom.append("version: " + retorno.getVersion() + "\n");
        cupom.append("errcode: " + retorno.getErrcode() + "\n");
        cupom.append("errmsg: " + retorno.getErrmsg() + "\n");

        alertDialog.setTitle("Ocorreu um erro durante a realização da ação");
        alertDialog.setMessage(cupom.toString());
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                // Não existe nenhuma ação
            }
        });
        alertDialog.show();
    }


    public void ImprimaGer7(String CupomTEF) {

        if (!CupomTEF.isEmpty()) {


            int curPos = 0;
            int LastPos = 0;

            while (curPos >= 0) {
                //TODO: Tratar exceção ultima Linha sem \n
                curPos = CupomTEF.indexOf("\n", curPos);
                if (curPos > 0) {

                    try {
                        if (curPos != LastPos) {
                            gertecPrinter.imprimeTexto(CupomTEF.substring(LastPos, curPos));
                        } else {
                            gertecPrinter.imprimeTexto(" ");
                        }
                        curPos++;
                        LastPos = curPos;

                    } catch (Exception ex) {

                    }
                }

            }
        }
    }

    private void dialogImpressaoGPOS(String texto, int size) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        StringBuilder cupom = new StringBuilder();
        cupom.append("Deseja realizar a impressão pela aplicação ?");
        alertDialog.setTitle("Realizar Impressão");
        alertDialog.setMessage(cupom.toString());
        alertDialog.setButton(AlertDialog.BUTTON_POSITIVE, "Sim", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

                String textoEstabelecimento = "";
                String textoCliente = "";

                configPrint.setAlinhamento("LEFT");
                configPrint.setFonte("MONOSPACE");
                configPrint.setTamanho(size);
                configPrint.setNegrito(true);
                configPrint.setItalico(false);
                configPrint.setSublinhado(false);
                try {
                    gertecPrinter.getStatusImpressora();
                    if (gertecPrinter.isImpressoraOK()) {
                        gertecPrinter.setConfigImpressao(configPrint);
                        if (rbGer7.isChecked()) {

                            textoEstabelecimento = texto.substring(0, texto.indexOf("\f"));
                            textoCliente = texto.substring(texto.indexOf("\f"));

                            ImprimaGer7(textoEstabelecimento);
                            gertecPrinter.avancaLinha(100);
                            ImprimaGer7(textoCliente);
                        } else {
                            gertecPrinter.imprimeTexto(texto);
                        }
                        gertecPrinter.avancaLinha(150);
                    }
                    gertecPrinter.ImpressoraOutput();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        });
        alertDialog.setButton(AlertDialog.BUTTON_NEGATIVE, "Não", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                //        não executa nada
            }
        });
        alertDialog.show();
    }


    private void execulteSTefVenda() {

        Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

        intentSitef.putExtra("empresaSitef", "00000000");
        intentSitef.putExtra("enderecoSitef", txtIpServidor.getText().toString().replaceAll("\\s+", ""));
        intentSitef.putExtra("operador", "0001");
        intentSitef.putExtra("data", "20200324");
        intentSitef.putExtra("hora", "130358");
        intentSitef.putExtra("numeroCupom", op);

        intentSitef.putExtra("valor", Mask.unmask(txtValorOperacao.getText().toString()));
        intentSitef.putExtra("CNPJ_CPF", "03654119000176");
        intentSitef.putExtra("comExterna", "0");

        if (rbCredito.isChecked()) {
            intentSitef.putExtra("modalidade", "3");
            if (txtParcelas.getText().toString().equals("0") || txtParcelas.getText().toString().equals("1")) {
                intentSitef.putExtra("transacoesHabilitadas", "26");
            } else if (rbLoja.isChecked()) {
                // Essa informações habilida o parcelamento Loja
                intentSitef.putExtra("transacoesHabilitadas", "27");
            } else if (rbAdm.isChecked()) {
                // Essa informações habilida o parcelamento ADM
                intentSitef.putExtra("transacoesHabilitadas", "28");
            }
            intentSitef.putExtra("numParcelas", txtParcelas.getText().toString());
        }

        if (rbDebito.isChecked()) {
            intentSitef.putExtra("modalidade", "2");
            intentSitef.putExtra("transacoesHabilitadas", "16");
        }

        if (rbTodos.isChecked()) {
            intentSitef.putExtra("modalidade", "0");
            intentSitef.putExtra("restricoes", "transacoesHabilitadas=16");
        }

        intentSitef.putExtra("isDoubleValidation", "0");
        intentSitef.putExtra("caminhoCertificadoCA", "ca_cert_perm");

        // ** Removida esta opção v3.70 **

//        if (cbImpressao.isChecked()) {
//            intentSitef.putExtra("comprovante", "1");
//        } else {
//            intentSitef.putExtra("comprovante", "0");
//        }

        startActivityForResult(intentSitef, REQ_CODE);
    }

    private void execulteSTefCancelamento() {
        Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

        intentSitef.putExtra("empresaSitef", "00000000");
        intentSitef.putExtra("enderecoSitef", txtIpServidor.getText().toString().replaceAll("\\s+", ""));
        intentSitef.putExtra("operador", "0001");
        intentSitef.putExtra("data", currentDateTimeString);
        intentSitef.putExtra("hora", currentDateTimeStringT);
        intentSitef.putExtra("numeroCupom", op);

        intentSitef.putExtra("valor", Mask.unmask(txtValorOperacao.getText().toString()));
        intentSitef.putExtra("CNPJ_CPF", "03654119000176");
        intentSitef.putExtra("comExterna", "0");

        intentSitef.putExtra("modalidade", "200");

        intentSitef.putExtra("isDoubleValidation", "0");
        intentSitef.putExtra("caminhoCertificadoCA", "ca_cert_perm");

        // ** Removida esta opção v3.70 **

        //        if (cbImpressao.isChecked()) {
        //            intentSitef.putExtra("comprovante", "1");
        //        } else {
        //            intentSitef.putExtra("comprovante", "0");
        //        }

        startActivityForResult(intentSitef, REQ_CODE);
    }

    private void execulteSTefFuncoes() {
        Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

        intentSitef.putExtra("empresaSitef", "00000000");
        intentSitef.putExtra("enderecoSitef", txtIpServidor.getText().toString().replaceAll("\\s+", ""));
        intentSitef.putExtra("operador", "0001");
        intentSitef.putExtra("data", currentDateTimeString);
        intentSitef.putExtra("hora", currentDateTimeStringT);
        intentSitef.putExtra("numeroCupom", op);

        intentSitef.putExtra("valor", Mask.unmask(txtValorOperacao.getText().toString()));
        intentSitef.putExtra("CNPJ_CPF", "03654119000176");
        intentSitef.putExtra("comExterna", "0");

        intentSitef.putExtra("isDoubleValidation", "0");
        intentSitef.putExtra("caminhoCertificadoCA", "ca_cert_perm");

        // ** Removida esta opção v3.70 **

        //        if (cbImpressao.isChecked()) {
        //            intentSitef.putExtra("comprovante", "1");
        //        } else {
        //            intentSitef.putExtra("comprovante", "0");
        //        }

        intentSitef.putExtra("modalidade", "110");
        intentSitef.putExtra("restricoes", "transacoesHabilitadas=16;26;27");

        startActivityForResult(intentSitef, REQ_CODE);
    }

    private void execulteSTefReimpressao() {
        Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");

        intentSitef.putExtra("empresaSitef", "00000000");
        intentSitef.putExtra("enderecoSitef", txtIpServidor.getText().toString().replaceAll("\\s+", ""));
        intentSitef.putExtra("operador", "0001");
        intentSitef.putExtra("data", "20200324");
        intentSitef.putExtra("hora", "130358");
        intentSitef.putExtra("numeroCupom", op);

        intentSitef.putExtra("valor", Mask.unmask(txtValorOperacao.getText().toString()));
        intentSitef.putExtra("CNPJ_CPF", "03654119000176");
        intentSitef.putExtra("comExterna", "0");

        intentSitef.putExtra("modalidade", "114");

        intentSitef.putExtra("isDoubleValidation", "0");
        intentSitef.putExtra("caminhoCertificadoCA", "ca_cert_perm");
        // ** Removida esta opção v3.70 **

        //        if (cbImpressao.isChecked()) {
        //            intentSitef.putExtra("comprovante", "1");
        //        } else {
        //            intentSitef.putExtra("comprovante", "0");
        //        }
        startActivityForResult(intentSitef, REQ_CODE);
    }

    private void execulteGer7Venda() {

        venda.type = GER7_VENDA;

        venda.id = String.valueOf(new Random().nextInt(9999999));

        venda.amount = MaskGer7.unmask(txtValorOperacao.getText().toString());

        venda.installments = MaskGer7.unmask(txtParcelas.getText().toString());

        if (rbDebito.isChecked()) {
            venda.setInstmode(this.GER7_SEMPARCELAMENTO);
        } else {
            if (venda.installments.equals("0") || venda.installments.equals("1")) {
                venda.instmode = GER7_SEMPARCELAMENTO;
            } else if (this.rbLoja.isChecked()) {
                venda.instmode = GER7_PARCELADO_LOJA;
            } else if (this.rbAdm.isChecked()) {
                venda.instmode = GER7_PARCELADO_ADM;
            }
        }

        if (rbCredito.isChecked()) {
            venda.product = GER7_CREDITO;
        } else if (rbDebito.isChecked()) {
            venda.product = GER7_DEBITO;
        } else {
            venda.product = GER7_VOUCHER;
        }

        if (cbImpressao.isChecked()) {
            venda.receipt = GER7_HABILITA_IMPRESSAO;
        } else {
            venda.receipt = GER7_DESABILITA_IMPRESSAO;
        }

        venda.apiversion = GER7_API_VERSION;

        String json = gson.toJson(venda);

        intentGer7.putExtra("jsonReq", json);

        startActivityForResult(intentGer7, REQ_CODE);
    }

    private void execulteGer7Cancelamento() {

        venda.type = GER7_CANCELAMENTO;

        venda.id = String.valueOf(new Random().nextInt(9999999));

        if (cbImpressao.isChecked()) {
            venda.receipt = GER7_HABILITA_IMPRESSAO;
        } else {
            venda.receipt = GER7_DESABILITA_IMPRESSAO;
        }

        venda.apiversion = GER7_API_VERSION;

        String json = gson.toJson(venda);

        intentGer7.putExtra("jsonReq", json);

        startActivityForResult(intentGer7, REQ_CODE);
    }

    private void execulteGer7Funcoes() {

        venda.type = GER7_FUNCOES;

        venda.id = String.valueOf(new Random().nextInt(9999999));

        if (cbImpressao.isChecked()) {
            venda.receipt = GER7_HABILITA_IMPRESSAO;
        } else {
            venda.receipt = GER7_DESABILITA_IMPRESSAO;
        }

        venda.apiversion = GER7_API_VERSION;

        String json = gson.toJson(venda);

        intentGer7.putExtra("jsonReq", json);

        startActivityForResult(intentGer7, REQ_CODE);
    }

    private void execulteGer7Reimpressao() {

        venda.type = GER7_REIMPRESSAO;

        venda.id = String.valueOf(new Random().nextInt(9999999));

        if (cbImpressao.isChecked()) {
            venda.receipt = GER7_HABILITA_IMPRESSAO;
        } else {
            venda.receipt = GER7_DESABILITA_IMPRESSAO;
        }

        venda.apiversion = GER7_API_VERSION;

        String json = gson.toJson(venda);

        intentGer7.putExtra("jsonReq", json);

        startActivityForResult(intentGer7, REQ_CODE);
    }

}
