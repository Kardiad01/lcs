function parseJwt (token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    return jsonPayload;
}
window.handleCredentialResponse = async (data) =>{
    let url = '';
    if(window.location.pathname.includes('login/loadview')){
        url = gurlLogin;
    }
    if(window.location.pathname.includes('login/singin')){
        url = gurlSinging;
    }
    const form = new FormData();
        form.append('payload', data.credential);
        form.append('data', parseJwt(data.credential))
        await fetch(url,{
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${data.credential}`
            },
            body : form
        }).then(async (response)=>{
            const json = await response.json();
            if(json.status==200){
                toastr.success("", json.msg);
                window.location.replace(json.url)
            }else{
                toastr.error("", json.msg);
            }
        })
}
window.onload = function () {
    google.accounts.id.initialize({
        client_id: id,
        callback: handleCredentialResponse
    });
    google.accounts.id.prompt();
};