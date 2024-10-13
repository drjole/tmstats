const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/components/**/*.{erb,haml,html,slim}",
        "./app/views/**/*.{erb,haml,html,slim}",
    ],
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
    ],
};
