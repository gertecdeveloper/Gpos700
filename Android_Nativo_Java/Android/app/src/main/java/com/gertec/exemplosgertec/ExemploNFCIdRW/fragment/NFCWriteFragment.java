package com.gertec.exemplosgertec.ExemploNFCIdRW.fragment;

import android.app.DialogFragment;
import android.content.Context;
import android.nfc.FormatException;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcExemplo;
import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcLeituraGravacao;
import com.gertec.exemplosgertec.R;

import java.io.IOException;

public class NFCWriteFragment extends DialogFragment {

    private NfcLeituraGravacao nfcLeituraGravacao;

    public static final String TAG = NFCWriteFragment.class.getSimpleName();


    public static NFCWriteFragment newInstance() {

        return new NFCWriteFragment();
    }

    private TextView mTvMessage;
    private ProgressBar mProgress;
    private NfcExemplo mListener;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_gravacao,container,false);
        initViews(view);
        return view;
    }

    private void initViews(View view) {

        mTvMessage = (TextView) view.findViewById(R.id.tv_message);
        mProgress = (ProgressBar) view.findViewById(R.id.progress);
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

    public void onNfcDetected(Ndef ndef, String messageToWrite){

        nfcLeituraGravacao = new NfcLeituraGravacao(ndef.getTag());
        mProgress.setVisibility(View.VISIBLE);
        writeToNfc(ndef,messageToWrite);
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
     * */
    private void writeToNfc(Ndef ndef, String message){

        Long tempoExecucao;

        mTvMessage.setText(getString(R.string.message_write_progress));

        if (ndef != null) {

            try {

                nfcLeituraGravacao.gravaMensagemCartao(ndef, message);
                tempoExecucao = nfcLeituraGravacao.retornaTempoDeExeculcaoSegundos();

                mTvMessage.setText(getString(R.string.message_write_success) +
                                   "\n\nTempo de execução: "+String.format("%02d segundos", tempoExecucao));

            } catch (IOException e) {
                Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
                e.printStackTrace();
                mTvMessage.setText(getString(R.string.message_write_error));


            } catch (FormatException e) {
                Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_LONG ).show();
                e.printStackTrace();
            } finally {
                mProgress.setVisibility(View.GONE);
            }
        }else{
            Toast.makeText(getActivity(),"Não foi possível ler este cartão", Toast.LENGTH_LONG ).show();
        }
    }

}
