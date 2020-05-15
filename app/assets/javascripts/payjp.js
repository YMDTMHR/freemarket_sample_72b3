document.addEventListener(
  "DOMContentLoaded", e =>{
    if (document.getElementById("token_submit") != null) { 
      Payjp.setPublicKey("pk_test_58392e1461d9d74ed1018221"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => { 
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value,
        }; 
        Payjp.createToken(card, (status, response) => {
          if (status === 200){
            $("#card_nummber").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            var token = response.id;
            $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
            $("#charge-form").get(0).submit();
          }else{
            alert("Error");
          }
        });
      });
    }
  },
  false
);