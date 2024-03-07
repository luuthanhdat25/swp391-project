<%@ include file="../common/header.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <div class="container" style="position: relative">
        <div class="form">
            <h2>Personal Trainer must upload 3 lastest certificates</h2>
            <div class="grid">
                <div class="form-element">
                    <input type="file" id="file-1" accept="image/*">
                    <label for="file-1" id="file-1-preview">
                        <img src="" alt="" id="file-1-img" style="border-style: none">
                        <div style="border-radius: 10px">
                            <span>+ Upload Here</span>
                        </div>
                    </label>
                </div>
                <div class="form-element">
                    <input type="file" id="file-2" accept="image/*">
                    <label for="file-2" id="file-2-preview">
                        <img src="" alt="" id="file-2-img" style="border-style: none">
                        <div style="border-radius: 10px">
                            <span>+ Upload Here</span>
                        </div>
                    </label>
                </div>
                <div class="form-element">
                    <input type="file" id="file-3" accept="image/*">
                    <label for="file-3" id="file-3-preview">
                        <img class="profile-bg-img" src="" alt="" id="file-3-img" style="border-style: none">
                        <div style="border-radius: 10px">
                            <span>+ Upload Here</span>
                        </div>
                    </label>
                </div>
            </div>
        </div>
        <button class="btn btn-primary" style="position: absolute; right: 0; top: 0 ; float: right" id="uploadBtn" type="submit">Upload Images</button>
    </div>

</body>
</html>
<script type="text/javascript">
    function previewBeforeUpload(id){
        document.querySelector("#"+id).addEventListener("change",function(e){
            if(e.target.files.length == 0){
                return;
            }
            let file = e.target.files[0];
            let url = URL.createObjectURL(file);
            document.querySelector("#"+id+"-preview div").innerText = file.name;
            document.querySelector("#"+id+"-preview img").src = url;
        });
    }

    previewBeforeUpload("file-1");
    previewBeforeUpload("file-2");
    previewBeforeUpload("file-3");

    const toBase64 = file => new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
    });

    $('#uploadBtn').click(function () {
        let files = ["file-1", "file-2", "file-3"];
        let base64Strings = [];

        Promise.all(files.map(id => toBase64(document.querySelector("#" + id))))
            .then(results => {
                base64Strings = results.map(res => ({ res }));
                console.log("base64Strings:", base64Strings);
                sendToServer(base64Strings);
            })
            .catch(err => {
                console.log("Error converting to base64:", err);
            });
    });

    function sendToServer(base64Strings) {
        let endpoint = 'certificate';
        const base64Data = base64Strings.map(item => item.res);
        console.log("base64Data: ", base64Data)
        fetch(endpoint, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                base64Strings: base64Data,
            }),
        })
            .then(response => {
                response.json();
                if(base64Strings.length==3) {
                    window.location.href = "/auth/login?inactive";
                }
            })
            .then(data => {
                console.log(data);
            })
            .catch(error => {
                console.error('Error sending data to the server:', error);
            });
    }
</script>
