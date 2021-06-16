// -- hyper-stylesheet-hash:7a51a75fa512e441a6e42a51b99216b7 --
module.exports = {

  config: {
    updateChannel: 'stable',
    fontSize: 14,
    fontFamily: '"JetBrainsMono Nerd Font", monospace',
    cursorColor: 'rgba(248,28,229,0.4)',
    cursorShape: 'BLOCK',
    cursorBlink: true,
    padding: '3px 10px',

    css: `
      .tab_tab > .tab_text {
        font-weight: 800;
        color: #fff;
      }
      .xterm .xterm-screen {
        // margin-top: -0.8em;
      }

      .hyper_main ~ div .line {
        display: flex;
        justify-content: center;
        background-color: rgba(0,0,0,0.2);
        height: 2.5em;
        padding-bottom: 2px;
        margin-bottom: -2px;  
      }
      .hyper_main ~ div .line .wrapper {
        margin-right: 0px;
      }

      .tab_tab {
        box-sizing: border-box;
        transform: translateY(-1px);
      }
      .tab_tab:not(.tab_active) {
        background: rgba(0,0,0,0.05) !important;
      }
      .tab_tab:not(.tab_active) > * {
        opacity: 0.45;
      }

      // .draggable > div {
      //   display: none !important;
      // }
    `,

    shell: '/usr/local/bin/fish',
    // shellArgs: ['--login'],
    // commands: ['clear'],
    shellArgs: ['--login'],
    commands: [],

    env: {},
    bell: false,
    copyOnSelect: false,

    hyperWindowSize: {
      width: 880,
      height: 560,
    },
  },

  plugins: [
    'hypercwd',
    'hyper-window-size',
    'hyperlinks',
    'hyper-startup',
    'hyper-tab-icons',
    // 'hyperline',
    'hyperterm-panda',
    "hyper-dnd-tabs",
    "hyperalfred"
  ],
};
