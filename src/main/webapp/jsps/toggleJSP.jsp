<script>
    // On page load set the theme.
    (function() {
        let onpageLoad = localStorage.getItem("theme") || "";
        let element = document.body;
        element.classList.add(onpageLoad);

        document.getElementById("toggle").checked = (localStorage.getItem("checked") == "yes")
    })();

    function themeToggle() {
        $('#toggle').change(() => {
            if ($('#toggle').is(":checked")) {
                localStorage.setItem("theme", "dark-class");
                localStorage.setItem("checked", "yes")
                $("body").addClass("dark-class");
            } else {
                localStorage.setItem("theme", "");
                localStorage.setItem("checked", "")
                $("body").removeClass("dark-class");
            }
        })
    }
</script>
