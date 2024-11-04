const defaultTheme = require("tailwindcss/defaultTheme");
const plugin = require("tailwindcss/plugin");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/components/**/*.{erb,haml,html,slim}",
        "./app/views/**/*.{erb,haml,html,slim}",
    ],
    theme: {
        extend: {
            backgroundImage: {
                mars: "url('mars.jpg')",
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
        plugin(function ({ addVariant }) {
            addVariant("starting", "@starting-style");
        }),
    ],
};
