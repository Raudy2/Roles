const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        'primary': {
          50: "#F5FCFF",
          100: "#CDECF9",
          200: "#A5DCF2",
          300: "#7DCDEC",
          400: "#54BDE6",
          500: "#2CADDF",
          600: "#049DD9",
          700: "#0489BE",
          800: "#0378A6",
          900: "#03658C"
        },
        'secondary': {
          50: "#FFFCF5",
          100: "#FDF1CD",
          200: "#FBE5A5",
          300: "#F9DA7D",
          400: "#F6CE55",
          500: "#F4C32D",
          600: "#F2B705",
          700: "#E6AE05",
          800: "#DCA604",
          900: "#D29F04"
        },
        'tertiary': {
          100: "#F9FAFB",
          200: "#C5C7CB",
          300: "#ABAEB3",
          400: "#91959B",
          500: "#787B83",
          600: "#5E626B",
          700: "#444953",
          800: "#2A2F3B",
          900: "#101623"
        },
        'danger': {
          50: '#FEF8F8',
          100: '#FEF2F2',
          200: '#FCDEDE',
          300: '#FACACA',
          400: '#F7A3A3',
          500: '#F37B7B',
          600: '#DB6F6F',
          700: '#924A4A',
          800: '#6D3737',
          900: '#492525',
        },
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
