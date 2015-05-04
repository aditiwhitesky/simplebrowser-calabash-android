package com.whitesky.browser.fragments;

import android.app.Fragment;
import android.content.Context;
import android.graphics.Bitmap;
import android.media.Image;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.webkit.URLUtil;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

import com.whitesky.browser.R;

public class HomeFragment extends Fragment implements OnClickListener {

    private View layout;
    private WebView browser;
    private EditText addressBar;
    private ImageButton back;
    private ImageButton forward;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        layout = inflater.inflate(R.layout.fragment_home, null);

        // Get handle to the address bar
        addressBar = (EditText) layout.findViewById(R.id.address);
        addressBar.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (EditorInfo.IME_NULL == actionId) {
                    browser.loadUrl(URLUtil.guessUrl(addressBar.getText().toString()));
                    InputMethodManager imm = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
                    imm.hideSoftInputFromWindow(addressBar.getWindowToken(), 0);
                    return true; // indicate that we handled event, won't propagate it
                }
                return false;
            }
        });

        // Get handle to the webview.
        browser = (WebView) layout.findViewById(R.id.webview);
        browser.getSettings().setJavaScriptEnabled(true);
        browser.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                addressBar.setText(url);
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return false;
            }
        });

        // Get handle to the back icon.
        back = (ImageButton)layout.findViewById(R.id.back);
        // Get handle to the forward icon.
        forward = (ImageButton)layout.findViewById(R.id.forward);

        //Set listeners
        back.setOnClickListener(this);
        forward.setOnClickListener(this);

        return layout;
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.back:
                if (browser.canGoBack()) {
                    browser.goBack();
                }
                break;
            case R.id.forward:
                if (browser.canGoForward()) {
                    browser.goForward();
                }
                break;
        }
    }

}
