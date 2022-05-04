package com.gertec.exemplosgertec.ExemploNFCIdRW.fragment;

import android.annotation.TargetApi;
import android.app.DialogFragment;
import android.content.Context;
import android.nfc.FormatException;
import android.nfc.tech.Ndef;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcExemplo;
import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcLeituraGravacao;
import com.gertec.exemplosgertec.R;

import java.io.IOException;

public class NFCWriteReadFragment extends DialogFragment {

    private NfcLeituraGravacao nfcLeituraGravacao;

    public static final String TAG = NFCWriteReadFragment.class.getSimpleName();

    public static NFCWriteReadFragment newInstance() {

        return new NFCWriteReadFragment();
    }

    private TextView tvStatus;

    private EditText editProcesso;
    private ProgressBar mProgress;
    private NfcExemplo mListener;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_forceteste, container, false);
        initViews(view);
        return view;
    }

    private void initViews(View view) {

        editProcesso = (EditText) view.findViewById(R.id.editProcesso);
        mProgress = (ProgressBar) view.findViewById(R.id.progress);

        tvStatus = (TextView) view.findViewById(R.id.tv_status);

    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mListener = (NfcExemplo) context;
        mListener.onDialogDisplayed();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener.onDialogDismissed();
    }

    public void onNfcDetected(Ndef ndef, String mensagem) {

        nfcLeituraGravacao = new NfcLeituraGravacao(ndef.getTag());
        if (writeToNfc(ndef, mensagem)) {
            readFromNFC(ndef);
        }
    }

    /**
     * Este método irá grava uma nova mensagem no cartão.
     *
     * @param ndef = contém as informações do cartão que acabou de ser lido.
     * @param message  = mensagem que será gravada no cartão
     *
     * @exception IOException
     * @exception FormatException
     *
     * @return boolean = Sinalize que a mensagem foi gravada
     *
     * */
    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
    private boolean writeToNfc(Ndef ndef, String message) {
        
        boolean retorno = false;
        
        try {

            retorno = nfcLeituraGravacao.gravaMensagemCartao(ndef, message);
            
            if(retorno){
                editProcesso.setText("Código ID:" + nfcLeituraGravacao.idCartaoHexadecimal() + "\nCódigo gravado: " + message + "\n");
            }else{
                editProcesso.setText("Falha ao gravar mensagem");
            }

        } catch (FormatException e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG).show();

        } catch (IOException e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG).show();

        } catch (Exception e){
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG).show();

        } finally {
            mProgress.setVisibility(View.GONE);
        }

        return retorno;
    }

    /**
     * Este método irá grava uma nova mensagem no cartão.
     *
     * @param ndef = contém as informações do cartão que acabou de ser lido.
     *
     * @exception IOException
     * @exception FormatException
     *
     *
     * */
    private void readFromNFC(Ndef ndef) {

        String editTex;
        String mensagem;
        Long tempoExecucao;

        try {

            mensagem = nfcLeituraGravacao.retornaMensagemGravadaCartao(ndef);
            tempoExecucao = nfcLeituraGravacao.retornaTempoDeExeculcaoSegundos();

            if(mensagem.equals("")){
                tvStatus.setText("Nenhuma mensagem cadastrada.");
            }else{
                tvStatus.setText("Aproxime o cartão.");
                editTex = editProcesso.getText().toString();
                editProcesso.setText(editTex + "\nCódigo ID:" + nfcLeituraGravacao.idCartaoHexadecimal() +"\nLeitura código: " + mensagem +
                                     "\n" + String.format("\nTempo de execução: %02d segundos", tempoExecucao) );
            }

        } catch (IOException | FormatException e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG).show();

        } catch (Exception e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

}
