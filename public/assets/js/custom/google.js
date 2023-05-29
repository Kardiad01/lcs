function parseJwt (token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(window.atob(base64).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    return jsonPayload;
}
async function handleCredentialResponse (data){
    let url = '';
    const urlclass = window.location;
    if(window.location.pathname.includes('login/loadview')){
        url = urlclass.origin+'/index.php/master/landing/login/googleoauthlogin';
    }
    if(window.location.pathname.includes('login/singin')){
        url = urlclass.origin+'/index.php/master/landing/login/googleoauthsignin';
    }
    const form = new FormData();
    console.log(JSON.parse(parseJwt(data)))
    form.append('data', parseJwt(data));
    await fetch(url,{
        method: 'POST',
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
export {handleCredentialResponse};
