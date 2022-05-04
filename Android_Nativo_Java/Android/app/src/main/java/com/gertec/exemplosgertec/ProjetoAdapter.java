package com.gertec.exemplosgertec;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class ProjetoAdapter extends ArrayAdapter<Projeto> {

    private List<Projeto> projetoList;

    public ProjetoAdapter(Context context, int resource, List<Projeto> projetos) {
        super(context, resource, projetos);
        this.projetoList = projetos;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View v = convertView;
        if (v == null) {
            Context ctx = getContext();
            LayoutInflater vi = (LayoutInflater)ctx.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            v = vi.inflate(R.layout.listprojetos, null);
        }
        Projeto projeto = projetoList.get(position);

        if (projeto != null) {
            ((TextView) v.findViewById(R.id.txtProjeto)).setText(projeto.getNome());
            ((ImageView) v.findViewById(R.id.imgIcon)).setImageResource(projeto.getImg());
        }
        return v;
    }
}
