//demo_id=$(basename $(dirname $(pwd)))
//viewer_url="https://3dviewer.net#https://ipolcore.ipol.im/api/core/shared_folder/run/${demo_id}/${key}/${OUTPUT3}"

$(document).ready(async function () {
    
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const experiment_id = urlParams.get('archive');
    if (experiment_id) {
        const fileURL = await getArchiveURL(experiment_id);
        console.log(fileURL);
        waitForElm('3dviewerplayer').then((elm) => {
            let viewer_url = `https://3dviewer.net#https://ipolcore.ipol.im${fileURL}`;
            console.log(viewer_url);
            if (viewer_url) {
                let iframe = document.getElementById('3dviewerplayer')
                iframe.setAttribute("src", viewer_url);
            }
        });
    } else {
        waitForElm('3dviewerplayer').then((elm) => {
            let viewer_url = createURL();
            if (viewer_url) {
                let iframe = document.getElementById('3dviewerplayer')
                iframe.setAttribute("src", viewer_url);
            }
        });
    }

    $('.run-btn').click(function() {
        document.getElementById('3dviewerplayer').id = 'tmp';
        waitForElm('3dviewerplayer').then((elm) => {
            let viewer_url = createURL();
            if (viewer_url) {
                let iframe = document.getElementById('3dviewerplayer')
                iframe.setAttribute("src", viewer_url);
            }
        });
    })
});

async function getArchiveURL(experiment_id) {
    const url = `/api/archive/get_experiment?experiment_id=${experiment_id}`;
    const response = await fetch(url);
    const data = await response.json();
    if (data.status === "OK") {
        experiment = data.experiment;
        let file = experiment.files.filter(isResult);
        return file[0].url
    }
}

function isResult(file) {
    if (file.name === "segmentation") {
        return file;
    }
}

function createURL() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    const demo_id = urlParams.get('id');
    let key = urlParams.get('key');

    if (!key) {
        return;
    }
    return `https://3dviewer.net#https://ipolcore.ipol.im/api/core/shared_folder/run/${demo_id}/${key}/outputdefect.obj,https://ipolcore.ipol.im/api/core/shared_folder/run/${demo_id}/${key}/outputdefect.mtl`;
}

function waitForElm(selector) {
    return new Promise(resolve => {
        if (document.getElementById(selector)) {
            return resolve(document.getElementById(selector));
        }

        const observer = new MutationObserver(mutations => {
            if (document.getElementById(selector)) {
                resolve(document.getElementById(selector));
                observer.disconnect();
            }
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    });
}


