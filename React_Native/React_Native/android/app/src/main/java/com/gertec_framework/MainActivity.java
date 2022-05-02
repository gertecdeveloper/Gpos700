package com.gertec_framework;



import android.os.Bundle;

import com.facebook.react.ReactActivity;



public class MainActivity extends ReactActivity {
 public static SatLib satLib;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    satLib = new SatLib(this);
  }

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   *
   */

  @Override
  protected String getMainComponentName() {
    return "gertec_frameWork";
  }

}
