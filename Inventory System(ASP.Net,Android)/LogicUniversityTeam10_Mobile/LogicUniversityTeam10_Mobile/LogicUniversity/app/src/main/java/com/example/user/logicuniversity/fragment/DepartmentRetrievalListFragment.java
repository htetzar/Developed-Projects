package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.user.logicuniversity.Activity.DepartmentHeadMainActivity;
import com.example.user.logicuniversity.Activity.StoreClerkMainActivity;
import com.example.user.logicuniversity.Model.StationeryRetrieval;
import com.example.user.logicuniversity.R;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import static android.R.attr.key;
import static com.example.user.logicuniversity.R.id.tvActual;
import static com.example.user.logicuniversity.R.id.tvBinId;
import static com.example.user.logicuniversity.R.id.tvDept;
import static com.example.user.logicuniversity.R.id.tvItemName;
import static com.example.user.logicuniversity.R.id.tvQuantity;

/**
 * Created by Htet Zar Chi Aung.
 */

public class DepartmentRetrievalListFragment extends Fragment {
    List<StationeryRetrieval> stationeryRetrievalList;

    String itemName;
    View v;
    ListView lv;
    RecyclerView rvItems;
    LinearLayoutManager llm;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.department_retrieval_recycler_fragment, container, false);

        Bundle bundle = getArguments();
        if(bundle != null){
            itemName  = bundle.getString("ITEM_NAME");
            Log.i("Department Retrieval","onCreateView() itemName: " + itemName);
        }

        new AsyncTask<Void, Void, List<StationeryRetrieval>>() {
            @Override
            protected List<StationeryRetrieval> doInBackground(Void... params) {
                Log.i("Department Retrieval","doInBackground() requisitionId: " );
                return StationeryRetrieval.listDepartmentItems(itemName);
            }

            @Override
            protected void onPostExecute(List<StationeryRetrieval> result) {
                Log.i("Requisition_detail_frag","onPostExecute() result: " + result);
                stationeryRetrievalList = result;
                rvItems = (RecyclerView) v.findViewById(R.id.r3_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute();

        Button btnSubmit = (Button)v.findViewById(R.id.btnSubmit);


        btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    Log.i("Dept_Retri_ListFragment","btnSubmit() stationeryRetrievalList: "+ stationeryRetrievalList);

                new AsyncTask<List<StationeryRetrieval>, Void, Void>() {
                    @Override
                    protected Void doInBackground(List<StationeryRetrieval>... params) {
                        Log.i("Dept_Retri_ListFragment","doInBackground" + params[0]);
                        StationeryRetrieval.updateRetrievalList(params[0],itemName);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        Log.i("Dept_Retri_ListFragment","onPostExecute" + result);
                        Toast.makeText(getActivity(),"Submit Successfull", Toast.LENGTH_SHORT).show();
                        Intent i = new Intent(getActivity(), StoreClerkMainActivity.class);
                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(i);
                    }
                }.execute(stationeryRetrievalList);
            }
        });

        return(v);
    }

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            Log.i("Requisition_detail_frag","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.item_department_retrieval_list_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }

        @Override
        public void onBindViewHolder(final ItemsHolder holder, final int position) {
            Log.i("Requisition_detail_frag","onBindViewHolder() position: " + position + " stationeryRetrievalList: " + stationeryRetrievalList);
            holder.tvDept.setText(stationeryRetrievalList.get(position).get("deptId"));
            holder.tvNeeded.setText(stationeryRetrievalList.get(position).get("needed"));
            holder.tvActual.setText(stationeryRetrievalList.get(position).get("actual"));
            // selectedPosition = position;
            holder.tvActual.addTextChangedListener(new TextWatcher() {

                public void afterTextChanged(Editable s) {
                }

                public void beforeTextChanged(CharSequence s, int start,
                                              int count, int after) {
                }

                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    Log.i("Requisition_detail_frag","onTextChanged() s: "+ s.toString());
                    stationeryRetrievalList.get(position).put("actual", s.toString());
                }
            });
        }

        @Override
        public int getItemCount() {
            return stationeryRetrievalList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView tvDept, tvNeeded;
            EditText tvActual;

            public ItemsHolder(View itemView) {
                super(itemView);
                tvDept = (TextView) itemView.findViewById(R.id.tvDept);
                tvNeeded = (TextView) itemView.findViewById(R.id.tvNeeded);
                tvActual = (EditText) itemView.findViewById(R.id.tvActual);
            }
        }
    }
}
