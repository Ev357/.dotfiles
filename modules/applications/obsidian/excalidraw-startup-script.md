/*
#exclude
```js*/
if (window.electron) {
	const alignElectronSpellcheckWithObsidianSettings = () => {
		const session =
			window.electron.remote.getCurrentWebContents().session;
		session.setSpellCheckerEnabled(app.vault.config.spellcheck);
		if (app.vault.config.spellcheck) {
			session.setSpellCheckerLanguages(navigator.languages);
		}
	};

	const body = document.body;
	const observer = new MutationObserver((mutationsList) => {
		for (let mutation of mutationsList) {
			if (mutation.type === "childList") {
				mutation.removedNodes.forEach((node) => {
					if (
						node.classList &&
						node.classList.contains(
							"modal-container",
						)
					) {
						alignElectronSpellcheckWithObsidianSettings();
					}
				});
			}
		}
	});
	const config = { childList: true };
	observer.observe(body, config);
	alignElectronSpellcheckWithObsidianSettings();
}
