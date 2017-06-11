package com.example.user.logicuniversity.Activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.example.user.logicuniversity.Model.Staff;
import com.example.user.logicuniversity.R;

/*
 Created By Zaw Myo Htet.
 */

public class LoginActivity extends AppCompatActivity {
    Button btnLogin;
    EditText editTextUserId, editTextPassword;
    TextView txtViewLogInStatus;
    InputMethodManager inputManager;
    SharedPreferences pref;
    RelativeLayout rl;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        btnLogin = (Button) findViewById(R.id.buttonLogin);
        editTextUserId = (EditText) findViewById(R.id.editTextUserId);
        editTextUserId.setText("");
        editTextPassword = (EditText) findViewById(R.id.editTextPassword);
        editTextPassword.setText("");
        txtViewLogInStatus = (TextView) findViewById(R.id.textViewLogInStatus);
        txtViewLogInStatus.setText("");

        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                rl = (RelativeLayout) findViewById(R.id.activity_login);
                inputManager = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
                inputManager.hideSoftInputFromWindow(rl.getWindowToken(),0);

                final Animation animation = new AlphaAnimation(1,0);
                animation.setDuration(500);
                animation.setInterpolator(new LinearInterpolator());
                animation.setRepeatCount(1);

                if(!isEmpty(editTextUserId.getText().toString()) && !isEmpty(editTextPassword.getText().toString())){
                    new AsyncTask<String, Void, Staff>() {
                        @Override
                        protected Staff doInBackground(String... params) {
                            return Staff.Login(params[0], params[1]);
                        }

                        @Override
                        protected void onPostExecute(Staff result) {
                            if(result == null){
                                txtViewLogInStatus.setText("Login Fail");
                                txtViewLogInStatus.startAnimation(animation);
                            }else{
                                // Bundle data = new Bundle();
                                // data.putSerializable("USER", result);
                                if(!isEmpty(result.get("staffId"))){
                                    SharedPreferences.Editor editor = getSharedPreferences("LOGIC", MODE_PRIVATE).edit();
                                    editor.putString("DEPID", result.get("departmentId"));
                                    editor.putString("STAFFID", result.get("staffId"));
                                    editor.putString("DEPHEADID", result.get("departmentHeadId"));
                                    editor.putString("STAFFNAME", result.get("staffName"));
                                    editor.putInt("ROLEID", Integer.parseInt(result.get("roleId")));
                                    editor.putString("ROLENAME", result.get("roleName"));
                                    editor.commit();
                                    pref = getSharedPreferences("LOGIC", MODE_PRIVATE);
                                    Log.i("LoginAcitivity","onPostExecute() pref: "+ pref.getString("STAFFID", "DEFAULT"));
                                    Intent dept_head_menu = new Intent(getApplicationContext(),DepartmentHeadMainActivity.class);
                                    Intent store_clerk_menu = new Intent(getApplicationContext(),StoreClerkMainActivity.class);
                                    Intent dept_rep_menu =  new Intent(getApplicationContext(),RepMainActivity.class);

                                    switch(Integer.parseInt(result.get("roleId"))) {
                                        case 1 :
                                            Log.i("LoginActivity","department head menu");
                                            startActivity(dept_head_menu);
                                            break;

                                        case 2 :
                                            Log.i("LoginActivity","rep menu");
                                            startActivity(dept_rep_menu);
                                            break;

                                        case 4 :
                                            Log.i("LoginActivity","store clerk menu");
                                            startActivity(store_clerk_menu);
                                            break;

                                        default : // Optional
                                            // Statements
                                    }

                                }else{
                                    txtViewLogInStatus.setText("Login Fail");
                                    txtViewLogInStatus.startAnimation(animation);
                                }
                            }
                        }
                    }.execute(editTextUserId.getText().toString(), editTextPassword.getText().toString());
                }else{
                    txtViewLogInStatus.setText("Login Fail");
                    txtViewLogInStatus.startAnimation(animation);
                }
            }
        });
    }

    private boolean isEmpty(String input){
        return input.trim().length() == 0;
    }
}
