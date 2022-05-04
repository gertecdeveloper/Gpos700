package com.gertec.exemplosgertec.ExemploTEF;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;

import java.lang.ref.WeakReference;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class MoneyTextWatcher implements TextWatcher {
    private final WeakReference<EditText> editTextWeakReference;

    public MoneyTextWatcher(EditText editText, Locale locale) {
        this.editTextWeakReference = new WeakReference<EditText>(editText);
    }

    public MoneyTextWatcher(EditText editText) {
        System.out.println(editText.getText().toString());
        this.editTextWeakReference = new WeakReference<EditText>(editText);
    }

    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {

    }

    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {

    }

    @Override
    public void afterTextChanged(Editable editable) {
        EditText editText = editTextWeakReference.get();
        if (editText == null) return;
        editText.removeTextChangedListener(this);
        BigDecimal parsed = parseToBigDecimal(editable.toString().replaceAll("R\\$", ""));
        String formatted = NumberFormat.getCurrencyInstance().format(parsed);
        // NumberFormat.getNumberInstance(locale).format(parsed); // sem o simbolo de moeda
        editText.setText(formatted.replaceAll("R\\$", ""));
        editText.setSelection(formatted.length()-2);
        editText.addTextChangedListener(this);
    }

    private BigDecimal parseToBigDecimal(String value) {
        String replaceable = String.format("[%s,.\\s]", NumberFormat.getCurrencyInstance().getCurrency().getSymbol());
        String cleanString = value.replaceAll(replaceable, "");
        return new BigDecimal(cleanString).setScale(
                2, BigDecimal.ROUND_FLOOR).divide(new BigDecimal(100), BigDecimal.ROUND_FLOOR
        );
    }
}
