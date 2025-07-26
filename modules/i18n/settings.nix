{
  addons = {
    classicui.globalSection = {
      "Vertical Candidate List" = "False";
      WheelForPaging = "True";
      Font = "\"Geist 10\"";
      MenuFont = "\"Geist 10\"";
      TrayFont = "\"Geist 10\"";
      TrayOutlineColor = "#000000";
      TrayTextColor = "#ffffff";
      PreferTextIcon = "False";
      ShowLayoutNameInIcon = "True";
      UseInputMethodLanguageToDisplayText = "True";
      Theme = "catppuccin-macchiato-lavender";
      DarkTheme = "catppuccin-macchiato-lavender";
      UseDarkTheme = "False";
      UseAccentColor = "True";
      PerScreenDPI = "False";
      ForceWaylandDPI = "0";
      EnableFractionalScale = "True";
    };
    keyboard = {
      globalSection = {
        PageSize = 5;
        EnableEmoji = "True";
        EnableQuickPhraseEmoji = "True";
        "Choose Modifier" = "Alt";
        EnableHintByDefault = "False";
        "Hint Trigger" = "";
        UseNewComposeBehavior = "True";
        EnableLongPress = "False";
      };

      sections = {
        PrevCandidate = {
          "0" = "Shift+Tab";
        };
        NextCandidate = {
          "0" = "Tab";
        };
        "One Time Hint Trigger" = {
          "0" = "Control+Alt+J";
        };
        LongPressBlocklist = {
          "0" = "konsole";
          "1" = "org.kde.konsole";
        };
      };
    };
    mozc.globalSection = {
      InitialMode = "Hiragana";
      InputState = "\"Follow Global Configuration\"";
      Vertical = "True";
      ExpandMode = "\"On Focus\"";
      PreeditCursorPositionAtBeginning = "False";
      ExpandKey = "";
    };
  };

  inputMethod = {
    GroupOrder."0" = "Default";

    "Groups/0" = {
      "Name" = "Default";
      "Default Layout" = "us";
      "DefaultIM" = "mozc";
    };

    "Groups/0/Items/0" = {
      "Name" = "keyboard-us";
      "Layout" = "";
    };

    "Groups/0/Items/1" = {
      "Name" = "mozc";
      "Layout" = "";
    };
  };

  globalOptions = {
    Hotkey = {
      EnumerateWithTriggerKeys = true;
      EnumerateForwardKeys = "";
      EnumerateBackwardKeys = "";
      EnumerateSkipFirst = false;
      ModifierOnlyKeyTimeout = 250;
    };

    "Hotkey/TriggerKeys" = {
      "0" = "Control+space";
      "1" = "Zenkaku_Hankaku";
      "2" = "Hangul";
    };

    "Hotkey/AltTriggerKeys" = {
      "0" = "Shift_L";
    };

    "Hotkey/EnumerateGroupForwardKeys" = {
      "0" = "Super+space";
    };

    "Hotkey/EnumerateGroupBackwardKeys" = {
      "0" = "Shift+Super+space";
    };

    "Hotkey/ActivateKeys" = {
      "0" = "Hangul_Hanja";
    };

    "Hotkey/DeactivateKeys" = {
      "0" = "Hangul_Romaja";
    };

    "Hotkey/PrevPage" = {
      "0" = "Up";
    };

    "Hotkey/NextPage" = {
      "0" = "Down";
    };

    "Hotkey/PrevCandidate" = {
      "0" = "Shift+Tab";
    };

    "Hotkey/NextCandidate" = {
      "0" = "Tab";
    };

    "Hotkey/TogglePreedit" = {
      "0" = "Control+Alt+P";
    };

    Behavior = {
      ActiveByDefault = false;
      resetStateWhenFocusIn = "No";
      ShareInputState = "No";
      PreeditEnabledByDefault = true;
      ShowInputMethodInformation = true;
      showInputMethodInformationWhenFocusIn = false;
      CompactInputMethodInformation = true;
      ShowFirstInputMethodInformation = true;
      DefaultPageSize = 5;
      OverrideXkbOption = false;
      CustomXkbOption = "";
      EnabledAddons = "";
      DisabledAddons = "";
      PreloadInputMethod = true;
      AllowInputMethodForPassword = false;
      ShowPreeditForPassword = false;
      AutoSavePeriod = 30;
    };
  };
}
