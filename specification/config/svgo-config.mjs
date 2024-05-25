// Copyright 2024, The Khronos Group Inc.
//
// SPDX-License-Identifier: Apache-2.0

const regBadFonts = /Helvetica|Arial|Arimo|ArimoMT/g;

const fixFonts = {
  name: "fixFonts",
  params: {
    paramName: "paramValue",
  },
  fn: (ast, params, info) => {
    return {
      element: {
        enter: (node) => {
          if (node.attributes.style != null) {
            node.attributes.style = node.attributes.style.replace(
              regBadFonts,
              "sans-serif"
            );
          }
          if (node.attributes["font-family"] != null) {
            node.attributes["font-family"] = node.attributes[
              "font-family"
            ].replace(regBadFonts, "sans-serif");
          }
        },
      },
    };
  },
};
export default {
  multipass: true,
  plugins: [fixFonts, "preset-default", fixFonts],
};
