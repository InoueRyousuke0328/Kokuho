document.addEventListener("DOMContentLoaded", function () {
    const description = document.getElementById("mediaDescription");
    const toggleButton = document.getElementById("descriptionToggle");

    if (description == null || toggleButton == null) {
        return;
    }

    if (description.scrollHeight <= description.clientHeight + 1) {
        toggleButton.hidden = true;
        return;
    }

    toggleButton.addEventListener("click", function () {
        const isExpanded = description.classList.contains("is-expanded");

        if (isExpanded) {
            description.classList.remove("is-expanded");
            description.classList.add("is-collapsed");
            toggleButton.textContent = "すべて表示";
            toggleButton.setAttribute("aria-expanded", "false");
        } else {
            description.classList.remove("is-collapsed");
            description.classList.add("is-expanded");
            toggleButton.textContent = "閉じる";
            toggleButton.setAttribute("aria-expanded", "true");
        }
    });
});