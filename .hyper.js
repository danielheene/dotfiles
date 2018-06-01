// -- hyper-stylesheet-hash:7a51a75fa512e441a6e42a51b99216b7 --
module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 14,
    fontFamily: 'Hack, "Droid Sans Mono for Powerline", Menlo, monospace',
    cursorColor: 'rgba(248,28,229,0.4)',
    cursorShape: 'BLOCK',
    cursorBlink: true,
    padding: '3px 10px',

    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff',
    },

    css: `
      .tab_tab > .tab_text {
        font-weight: 800;
        color: #fff;
      }
    `,

    shell: '/usr/local/bin/zsh',
    shellArgs: ['--login'],
    env: {},
    bell: false,
    copyOnSelect: false,

    hyperBorder: {
      animate: {
        duration: '6s',
      },
      borderColors: [
        'rgba(255, 106, 193, 0.2)',
        'rgba(255, 106, 193, 0.4)'
      ],
      borderWidth: '2px',
    },

    hyperTabs: {
      activityPulse: true,
      activityColor: '#ecebbd',
      border: true,
      closeAlign: 'right',
      trafficButtons: false,
      tabIcons: true,
      tabIconsColored: false,
    },
  },

  plugins: [
    // 'hyperborder',
    'hyperminimal',
    'hyper-snazzy',
    'hyper-tabs-enhanced',
  ],
};
