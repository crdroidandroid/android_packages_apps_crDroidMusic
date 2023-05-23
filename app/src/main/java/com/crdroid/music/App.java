package com.crdroid.music;

import android.app.Application;
import android.graphics.Color;
import com.google.android.material.color.DynamicColors;

import com.kabouzeid.appthemehelper.ThemeStore;
import com.kabouzeid.gramophone.appshortcuts.DynamicShortcutManager;

/**
 * @author Karim Abou Zeid (kabouzeid)
 */
public class App extends Application {

    private static App app;

    @Override
    public void onCreate() {
        super.onCreate();
        app = this;

        DynamicColors.applyToActivitiesIfAvailable(this);

        // default theme
        ThemeStore.editTheme(this)
                .primaryColorRes(R.color.material_dynamic_primary50)
                .accentColorRes(R.color.material_dynamic_primary50)
                .navigationBarColor(Color.TRANSPARENT)
                .commit();

        // Set up dynamic shortcuts
        new DynamicShortcutManager(this).initDynamicShortcuts();
    }

    public static App getInstance() {
        return app;
    }
}
