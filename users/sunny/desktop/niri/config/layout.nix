{
  layout = {
    background-color = "transparent";
    gaps = 10;
    center-focused-column = "never";

    preset-column-widths._children = [
      {proportion = 0.5;}
      {proportion = 0.75;}
      {proportion = 1.0;}
    ];

    default-column-width = {
      proportion = 1.0;
    };

    focus-ring = {
      width = 2;
    };

    border = {
      off = [];
      width = 2;
    };

    shadow = {
      on = [];
      softness = 20;
      spread = 5;
      offset._props = {
        x = 0;
        y = 5;
      };
    };

    struts = {
      left = 10;
      right = 10;
    };
  };
}
