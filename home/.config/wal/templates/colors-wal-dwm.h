static char normfgcolor[] = "{color15}";
static char normbgcolor[] = "{color0}";
static char normbordercolor[] = "{color8}";

static char selfgcolor[] = "{color15}";
static char selbgcolor[] = "{color2}";
static char selbordercolor[] = "{color15}";

static char *colors[][3]      = {{
    /*               fg           bg         border                         */
    [SchemeNorm] = {{ normfgcolor,     normbgcolor,   normbordercolor }}, // unfocused wins
    [SchemeSel]  = {{ selfgcolor,      selbgcolor,    selbordercolor }},  // the focused win
}};
