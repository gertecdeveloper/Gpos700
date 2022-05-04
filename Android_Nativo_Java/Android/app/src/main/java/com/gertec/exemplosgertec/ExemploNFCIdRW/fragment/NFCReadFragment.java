package com.gertec.exemplosgertec.ExemploNFCIdRW.fragment;

import android.app.DialogFragment;
import android.content.Context;
import android.nfc.FormatException;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcExemplo;
import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcLeituraGravacao;
import com.gertec.exemplosgertec.R;

import java.io.IOException;

public class NFCReadFragment extends DialogFragment {

    private NfcLeituraGravacao nfcLeituraGravacao;

    public static final String TAG = NFCReadFragment.class.getSimpleName();

    public static NFCReadFragment newInstance() {

        return new NFCReadFragment();
    }

    private TextView mTvMessage;
    private NfcExemplo mListener;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_leitura,container,false);
        initViews(view);
        return view;
    }

    private void initViews(View view) {

        mTvMessage = view.findViewById(R.id.tv_message);
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mListener = (NfcExemplo)context;
        mListener.onDialogDisplayed();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener.onDialogDismissed();
    }

    public void onNfcDetected(Ndef ndef){
        nfcLeituraGravacao = new NfcLeituraGravacao(ndef.getTag());
        readFromNFC(ndef);
    }

    public void onNfcDetected(Tag tag){
        nfcLeituraGravacao = new NfcLeituraGravacao(tag);
        readFromNFC();
    }

    /**
     * Este método irá apresentar na tela as atuais mensagens cadastadas no cartão
     *
     * @param ndef = contém as informações do cartão que acabou de ser lido.
     *
     * @exception IOException
     * @exception FormatException
     * @exception Exception
     *
     * */
    private void readFromNFC(Ndef ndef) {

        String mensagem;
        String idCarao;
        Long tempoExecucao;

        try {

           // Recebe a leitura das atuais mensagens cadastradas no cartão
           mensagem = nfcLeituraGravacao.retornaMensagemGravadaCartao(ndef);
           idCarao = nfcLeituraGravacao.idCartaoHexadecimal();

           // Recebe o tempo total de execução da operação de leitura
           tempoExecucao = nfcLeituraGravacao.retornaTempoDeExeculcaoSegundos();

           if(mensagem.equals("")){
               mTvMessage.setText("Não existe mensagem gravada no cartão");
           }else{
               mTvMessage.setText("ID Cartão: " + idCarao + "\n"+ mensagem+
                       "\n\nTempo de execução: "+String.format("%02d segundos", tempoExecucao));
           }

        } catch (IOException | FormatException e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
        } catch (Exception e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
        }
    }

    private void readFromNFC() {

        String mensagem;
        String idCarao;

        try {

            // Recebe a leitura das atuais mensagens cadastradas no cartão
            mensagem = "Esse cartão não está no formato NDef.";
            idCarao = nfcLeituraGravacao.idCartaoHexadecimal();

            if(mensagem.equals("")){
                mTvMessage.setText("Não existe mensagem gravada no cartão");
            }else{
                mTvMessage.setText("ID Cartão: " + idCarao + "\n"+ mensagem);
            }

        } catch (Exception e) {
            Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
        }
    }


}
