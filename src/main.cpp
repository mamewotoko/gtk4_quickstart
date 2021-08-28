#include <gtk/gtk.h>

static void on_activate(GtkApplication *app){
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv)
{
    //reference
    //https://www.gtk.org/
    GtkApplication *app = gtk_application_new ("com.example.Gtk4Quickstart",
					       G_APPLICATION_FLAGS_NONE);

    g_signal_connect(app, "activate", G_CALLBACK(on_activate), NULL);
    return g_application_run(G_APPLICATION(app), argc, argv);
}
