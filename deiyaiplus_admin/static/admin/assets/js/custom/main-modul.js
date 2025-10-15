var target = document.querySelector("#kt_app_body");

var blockUI = new KTBlockUI(target, {
  message:
    '<div class="blockui-message"><span class="spinner-border text-primary"></span> Mohon tunggu...</div>',
});

console.log(blockUI);

function show_loader() {
  blockUI.block();
}

function close_notif() {
  blockUI.release();
}

attribute = {
  text: `<input type="text" name="name_atribute" id="id_atribute" class="hide form-control form-control-lg form-control-solid" isrequired placeholder="" value="">`,
  textarea: `<textarea name="name_atribute" id="id_atribute" class="hide form-control" isrequired data-kt-autosize="true"></textarea>`,
  date: `<input type="date" name="name_atribute" id="id_atribute" class="hide form-control form-control-solid" isrequired placeholder="" value="" onclick="this.showPicker()" onblur="this.closePicker()">`,
  number: `<input type="text" name="name_atribute" id="id_atribute" class="hide form-control form-control-lg form-control-solid number" isrequired placeholder="" value="">`,
  currency: `<input type="text" name="name_atribute" id="id_atribute" class="hide form-control form-control-lg form-control-solid currency" isrequired placeholder="" value="">`,
};

$(function () {
  date_initiate();
  $("body").append(modal_fullscreen);
  $("body").append(modal_large);
  $("body").append(modal_xl);
  $("body").append(modal_sm);

  var urlParams = new URLSearchParams(window.location.search);
  $(".filter").each(function (i, obj) {
    if (urlParams.has($(this).data("filter"))) {
      $(this).val(urlParams.get($(this).data("filter")));
    }
  });
});

function date_initiate() {
  $(".date").each(function (i, obj) {
    $(this).datepicker({
      format: "yyyy-mm-dd",
      clearBtn: true,
      language: "id",
      todayBtn: "linked",
      todayHighlight: true,
      autoclose: true,
    });
  });
}

function get_elemet_attribute(attribute_key, name, id, is_hide = false) {
  if (!is_hide) {
    attributnya = attribute[attribute_key]
      .replace("name_atribute", `attribute|${name}`)
      .replace("id_atribute", id)
      .replace("hide", "");
  } else {
    attributnya = attribute[attribute_key]
      .replace("name_atribute", `attribute|${name}`)
      .replace("id_atribute", id)
      .replace("hide", "hidden");
  }

  return attributnya;
}

function get_display_value(id) {
  tipe = $(`#label_${id}`).data("type");

  value = $(`#${id}`).val();
  if (tipe == "date") {
    tanggal_ = to_tgl_indo(value);
    $(`#label_${id}`).text(tanggal_);
  } else if (tipe == "currency") {
    nominal = to_currency_indo(value);
    $(`#label_${id}`).text(`Rp${nominal}`);
  } else {
    $(`#label_${id}`).text(value);
  }
}

function to_tgl_indo(value) {
  moment.locale("id");
  value_ = moment(value).format("DD MMMM YYYY");
  return value_;
}

function to_currency_indo(value) {
  var str = value.toString().replace("", ""),
    parts = false,
    output = [],
    i = 1,
    formatted = null;
  if (str.indexOf(",") > 0) {
    parts = str.split(",");
    str = parts[0];
  }
  str = str.split("").reverse();
  for (var j = 0, len = str.length; j < len; j++) {
    if (str[j] != ".") {
      output.push(str[j]);
      if (i % 3 == 0 && j < len - 1) {
        output.push(".");
      }
      i++;
    }
  }
  formatted = output.reverse().join("");
  return "" + formatted + (parts ? "," + parts[1].substr(0, 2) : "");

  // value_ = `Rp${value}`
  // return value_
}

function show_notif(meseg, jenis_icon) {
  if (jenis_icon == "error") {
    button_style = "btn-danger";
  } else {
    button_style = `btn-${jenis_icon}`;
  }

  Swal.fire({
    html: meseg,
    icon: jenis_icon,
    buttonsStyling: false,
    confirmButtonText: "Ok",
    customClass: {
      confirmButton: `btn ${button_style}`,
    },
  });
}

if ($("#msg_pesan").length) {
  show_notif($("#msg_pesan").attr("data"), $("#msg_pesan").attr("alt"));
}

$(document).on("keydown", ".number", function (event) {
  e = event;

  // Allow: backspace, delete, tab, escape, enter and .
  if (
    $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190, 173]) !== -1 ||
    // Allow: Ctrl+A,Ctrl+C,Ctrl+V, Command+A
    ((e.keyCode == 65 ||
      e.keyCode == 86 ||
      e.keyCode == 67 ||
      e.keyCode == 88 ||
      e.keyCode == 90 ||
      e.keyCode == 89) &&
      (e.ctrlKey === true || e.metaKey === true)) ||
    // Allow: home, end, left, right, down, up
    (e.keyCode >= 35 && e.keyCode <= 40)
  ) {
    // let it happen, don't do anything
    return;
  }

  // Ensure that it is a number and stop the keypress
  if (
    (e.shiftKey || e.keyCode < 48 || e.keyCode > 57) &&
    (e.keyCode < 96 || e.keyCode > 105)
  ) {
    e.preventDefault();
  }
});

$(document).on("keydown", ".currency", function (event) {
  e = event;
  // Allow: backspace, delete, tab, escape, enter and .
  if (
    $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 188, 173]) !== -1 ||
    // Allow: Ctrl+A,Ctrl+C,Ctrl+V, Command+A
    ((e.keyCode == 65 ||
      e.keyCode == 86 ||
      e.keyCode == 67 ||
      e.keyCode == 88 ||
      e.keyCode == 90 ||
      e.keyCode == 89) &&
      (e.ctrlKey === true || e.metaKey === true)) ||
    // Allow: home, end, left, right, down, up
    (e.keyCode >= 35 && e.keyCode <= 40)
  ) {
    // let it happen, don't do anything
    return;
  }

  // Ensure that it is a number and stop the keypress
  if (
    (e.shiftKey || e.keyCode < 48 || e.keyCode > 57) &&
    (e.keyCode < 96 || e.keyCode > 105)
  ) {
    e.preventDefault();
  }
});

$(document).on("keyup", ".currency", function (event) {
  $(this).val(to_currency_indo($(this).val()));
});

$(document).on("focus", ".currency", function (event) {
  $(this).select();
});

function check_required() {
  var is_valid = true;

  $("[isrequired]").each(function (index) {
    if ($(this).val() == "") {
      is_valid = false;
      $(".feedback_error").remove();
      $(this)
        .parent()
        .append(
          '<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback feedback_error">Tidak Boleh Kosong</div>'
        );
      return is_valid;
    } else {
      $(".feedback_error").remove();
    }
  });

  return is_valid;
}

function hideModal(e) {
  e.removeClass("show");
  e.hide();
  $(".modal-backdrop").remove();
}

$(".close_modal_report").click(function () {
  var newUrl = new URL(window.location);
  newUrl.searchParams.delete("jenis");
  window.history.pushState({}, "", newUrl);
  hideModal($("#modal_report"));
});

function to_currency_indo(
  value,
  thousand_separator = ".",
  decimal_separator = ","
) {
  var str = value.toString().replace("", ""),
    parts = false,
    output = [],
    i = 1,
    formatted = null;
  if (str.indexOf(`${decimal_separator}`) > 0) {
    parts = str.split(`${decimal_separator}`);
    str = parts[0];
  }

  if (!parts) {
    parts = [str, "00"];
  }

  // console.log(parts)
  str = str.split("").reverse();
  for (var j = 0, len = str.length; j < len; j++) {
    if (str[j] != `${thousand_separator}`) {
      output.push(str[j]);
      if (i % 3 == 0 && j < len - 1) {
        output.push(`.`);
      }
      i++;
    }
  }
  formatted = output.reverse().join("");
  return "" + formatted + (parts ? `,` + parts[1].substr(0, 2) : "");

  // value_ = `Rp${value}`
  // return value_
}

function from_currency_indo(
  formattedValue,
  thousand_separator = ".",
  decimal_separator = ","
) {
  // Hapus semua pemisah ribuan (thousand_separator)
  let rawValue = formattedValue.split(thousand_separator).join("");

  // Ganti pemisah desimal dengan titik agar sesuai dengan format JavaScript
  rawValue = rawValue.replace(decimal_separator, ".");

  // Konversi ke angka desimal (float)
  return parseFloat(rawValue);
}

function check_required(form_element) {
  var is_valid = true;

  $("[required]").each(function (index) {
    if ($(this).val() == "") {
      is_valid = false;
      form_element.addClass("was-validated");
      // $('.feedback_error').remove();
      // $(this).parent().append('<div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback feedback_error">Tidak Boleh Kosong</div>')
      return is_valid;
    } else {
      form_element.removeClass("was-validated");
      // $('.feedback_error').remove();
    }
  });

  return is_valid;
}

$(document).on("keydown", ".currency", function (event) {
  e = event;
  // Allow: backspace, delete, tab, escape, enter and .
  if (
    $.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 188, 173]) !== -1 ||
    // Allow: Ctrl+A,Ctrl+C,Ctrl+V, Command+A
    ((e.keyCode == 65 ||
      e.keyCode == 86 ||
      e.keyCode == 67 ||
      e.keyCode == 88 ||
      e.keyCode == 90 ||
      e.keyCode == 89) &&
      (e.ctrlKey === true || e.metaKey === true)) ||
    // Allow: home, end, left, right, down, up
    (e.keyCode >= 35 && e.keyCode <= 40)
  ) {
    // let it happen, don't do anything
    return;
  }

  // Ensure that it is a number and stop the keypress
  if (
    (e.shiftKey || e.keyCode < 48 || e.keyCode > 57) &&
    (e.keyCode < 96 || e.keyCode > 105)
  ) {
    e.preventDefault();
  }
});

$(document).on("blur", ".currency", function (event) {
  if ($(this).val() != "") {
    $(this).val(to_currency_indo($(this).val()));
  } else {
    $(this).val(to_currency_indo("0"));
  }
});

$(document).on("focus", ".currency", function (event) {
  $(this).select();
});

function hideModal(e) {
  e.removeClass("show");
  e.modal("hide");
}

$(".close_modal_report").click(function () {
  hideModal($("#modal_report"));
});

function hideModal_this() {
  hideModal($("#modal_report"));
}

modal_report_element = `<div class="modal fade" tabindex="-1" id="modal_report" style="z-index: 1056 !important;">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title-report" id="modal-title-report">-</h5>

                        <!--begin::Close-->
                        <div class="btn btn-icon btn-sm btn-active-light-primary ms-2 close_modal_report" onclick="hideModal_this()" data-modal="modal_report" data-bs-dismiss="modal_report" aria-label="Close">
                            <!--begin::Svg Icon | path: /var/www/preview.keenthemes.com/kt-products/docs/metronic/html/releases/2022-09-15-053640/core/html/src/media/icons/duotune/general/gen034.svg-->
                              <span class="svg-icon svg-icon-muted svg-icon-2hx"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="5" fill="currentColor"/>
                              <rect x="7" y="15.3137" width="12" height="2" rx="1" transform="rotate(-45 7 15.3137)" fill="currentColor"/>
                              <rect x="8.41422" y="7" width="12" height="2" rx="1" transform="rotate(45 8.41422 7)" fill="currentColor"/>
                              </svg>
                              </span>
                              <!--end::Svg Icon-->
                                    </div>
                        <!--end::Close-->
                    </div>

                    <div class="modal-body-report">
                        <p></p>
                    </div>

                    <!-- <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Simpan</button>
                    </div> -->
                </div>
            </div>
        </div>`;

function ShowIframeReport(res, title, ev = null) {
  if (ev != null) {
    ev.preventDefault();
  }

  $("body").append(modal_report_element);

  var ifrm = document.createElement("iframe");

  ifrm.setAttribute("src", res + "");
  ifrm.setAttribute("id", "iframe_report");
  ifrm.setAttribute("frameborder", 0);
  ifrm.style.width = "100%";
  ifrm.style.height = "800px";
  // ifrm.style.background = "#F6F6F6";
  // ifrm.style.background = "url(/static/images/loading.gif) no-repeat center top";

  // var myModal_report_ = document.getElementById('modal_report');

  // var myModal_report = new bootstrap.Modal(myModal_report_, {
  //   keyboard: false,
  //   backdrop: 'static',
  //   focus:true
  // })

  $("#modal-title-report").text(title);

  $(".modal-body-report").html(ifrm);

  // myModal_report_.addEventListener('show.bs.modal', function (event) {
  //     close_notif();
  //     // show_loader();
  // })

  $("#modal_report").on("hide.bs.modal", function (e) {
    $("#modal_report").remove();
  });

  $("#modal_report").modal("show");

  $("#iframe_report").on("load", function () {
    // close_notif();
  });
}

function ShowIframeReportVerif(
  res,
  title,
  ev = null,
  return_element = false,
  id_kak
) {
  if (ev != null) {
    ev.preventDefault();
  }

  var ifrm = document.createElement("iframe");

  ifrm.setAttribute("src", res + "");
  ifrm.setAttribute("id", "iframe_report");
  ifrm.setAttribute("frameborder", 0);
  ifrm.style.width = "100%";
  ifrm.style.height = "800px";
  // ifrm.style.background = "#F6F6F6";
  // ifrm.style.background = "url(/static/images/loading.gif) no-repeat center top";
  if (return_element) {
    return ifrm;
  }

  var myModal_report_ = document.getElementById("modal_report_verifikasi");

  var myModal_report = new bootstrap.Modal(myModal_report_, {
    keyboard: false,
    backdrop: "static",
    focus: true,
  });

  $("#modal-title-report").text(title);

  $("#id-kak").val(id_kak);

  $(".modal-body-report").html(ifrm);

  myModal_report_.addEventListener("show.bs.modal", function (event) {
    close_notif();
  });

  myModal_report_.addEventListener("hidden.bs.modal", function (event) {
    $("body").css("overflow", "");
  });

  myModal_report.show();

  $("#iframe_report").on("load", function () {
    close_notif();
  });
}

// MODAL
modal_fullscreen = `<!--begin::Modal - Create App-->
                <div class="modal fade" id="modal_fullscreen" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" focus="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-centered modal-fullscreen">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header">
                                <!--begin::Modal title-->
                                <h2 id="modal_title_fullscreen">title</h2>
                                <!--end::Modal title-->
                                <!--begin::Close-->
                                <div class="btn btn-sm btn-icon btn-active-color-primary close" data-bs-dismiss="modal">
                                    <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                                    <span class="svg-icon svg-icon-1">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->
                            <!--begin::Modal body-->
                            <div class="modal-body py-lg-10 px-lg-10" id="modal_body_fullscreen">
                                
                            </div>
                            <!--end::Modal body-->
                        </div>
                        <!--end::Modal content-->
                    </div>
                    <!--end::Modal dialog-->
                </div>
                <!--end::Modal - Create App-->`;

modal_large = `<!--begin::Modal - Create App-->
                <div class="modal fade" id="modal_large" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" focus="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header">
                                <!--begin::Modal title-->
                                <h2 id="modal_title_large">title</h2>
                                <!--end::Modal title-->
                                <!--begin::Close-->
                                <div class="btn btn-sm btn-icon btn-active-color-primary close" data-bs-dismiss="modal">
                                    <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                                    <span class="svg-icon svg-icon-1">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->
                            <!--begin::Modal body-->
                            <div class="modal-body py-lg-10 px-lg-10" id="modal_body_large">
                                
                            </div>
                            <!--end::Modal body-->
                        </div>
                        <!--end::Modal content-->
                    </div>
                    <!--end::Modal dialog-->
                </div>
                <!--end::Modal - Create App-->`;

modal_xl = `<!--begin::Modal - Create App-->
                <div class="modal fade" id="modal_extra_large" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" focus="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-centered modal-xl">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header">
                                <!--begin::Modal title-->
                                <h2 id="modal_title_extra_large">title</h2>
                                <!--end::Modal title-->
                                <!--begin::Close-->
                                <div class="btn btn-sm btn-icon btn-active-color-primary close" data-bs-dismiss="modal">
                                    <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                                    <span class="svg-icon svg-icon-1">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->
                            <!--begin::Modal body-->
                            <div class="modal-body py-lg-10 px-lg-10" id="modal_body_extra_large">
                                
                            </div>
                            <!--end::Modal body-->
                        </div>
                        <!--end::Modal content-->
                    </div>
                    <!--end::Modal dialog-->
                </div>
                <!--end::Modal - Create App-->`;

modal_sm = `<!--begin::Modal - Create App-->
                <div class="modal fade" id="modal_small" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" focus="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-top mw-550px">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header">
                                <!--begin::Modal title-->
                                <h2 id="modal_title_small">title</h2>
                                <!--end::Modal title-->
                                <!--begin::Close-->
                                <div class="btn btn-sm btn-icon btn-active-color-primary close" data-bs-dismiss="modal">
                                    <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                                    <span class="svg-icon svg-icon-1">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                            <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->
                            <!--begin::Modal body-->
                            <div class="modal-body py-lg-10 px-lg-10" id="modal_body_small">
                                
                            </div>
                            <!--end::Modal body-->
                        </div>
                        <!--end::Modal content-->
                    </div>
                    <!--end::Modal dialog-->
                </div>
                <!--end::Modal - Create App-->`;

function showModal(
  e,
  { size = "fullscreen", is_ajax = true, modal_content = "" },
  jenis_modal = ""
) {
  var url_load = "";
  var title = "";
  var linkLoad = $(e).data("alt");

  title = $(e).data("modal-title");
  url_load = linkLoad;

  var modal_id, modal_title, modal_body;

  if (size == "fullscreen") {
    modal_id = "modal_fullscreen";
    modal_title = $("#modal_title_fullscreen");
    modal_body = $("#modal_body_fullscreen");
  } else if (size == "large") {
    modal_id = "modal_large";
    modal_title = $("#modal_title_large");
    modal_body = $("#modal_body_large");
  } else if (size == "extra_large") {
    modal_id = "modal_extra_large";
    modal_title = $("#modal_title_extra_large");
    modal_body = $("#modal_body_extra_large");
  } else if (size == "small") {
    modal_id = "modal_small";
    modal_title = $("#modal_title_small");
    modal_body = $("#modal_body_small");
  }

  var myModal_ = document.getElementById(modal_id);

  var myModal = new bootstrap.Modal(myModal_, {
    keyboard: false,
    backdrop: "static",
    focus: true,
  });

  if (jenis_modal === "arsip") {
    $(`#${modal_id} .modal-header`).addClass("bg-warning text-white");
    console.log("arsip");
  } else {
    $(`#${modal_id} .modal-header`).removeClass("bg-warning text-white");
    console.log("arsip false");
  }

  modal_title.text(title);
  myModal.show();

  if (is_ajax) {
    modal_body.load(url_load, function () {
      // Inisialisasi Select2 setelah konten dimuat
      modal_body.find("select").each(function () {
        $(this).select2({
          dropdownParent: $(`#${modal_id}`),
        });
      });
    });
  } else {
    modal_body.html(modal_content);

    // Inisialisasi Select2 jika konten tidak menggunakan AJAX
    modal_body.find("select").each(function () {
      console.log(modal_id, "klflkefklw");
      $(this).select2({
        dropdownParent: $(`#${modal_id}`),
      });
    });
  }

  myModal_.addEventListener("shown.bs.modal", function () {
    try {
      date_initiate();
    } catch (e) {
      console.error("Error initializing date picker:", e);
    }

    try {
      console.log(modal_id, "klflkefklw");
      // Reinitialize Select2 for dropdowns inside the modal
      modal_body.find("select").each(function () {
        console.log(modal_id, "klflkefklw");
        $(this).select2({
          dropdownParent: $(`#${modal_id}`),
        });
      });

      KTComponents.init(); // Pastikan komponen lain diinisialisasi
    } catch (e) {
      console.log(e);
    }
  });
}

function copy_this(e, ev) {
  ev.preventDefault();

  navigator.clipboard.writeText($(e).data("tocopy"));
  show_notif("Data Copied !", "warning");
}

$(".btn-paginate").click(function (event) {
  set_param(this, event, "page");
});

function filter_data(e, ev, reset) {
  filtering_param = {};
  $(".filter").each(function (i, obj) {
    filtering_param[$(this).data("filter")] = $(this).val();
  });
  set_param(e, ev, filtering_param, reset);
}

function set_param(e, ev, param, reset = false) {
  ev.preventDefault();

  var urlParams = new URLSearchParams(window.location.search);
  var url_reload = "";

  if ($.type(param) == "object") {
    $.each(param, function (key, value) {
      if (reset) {
        urlParams.delete(`${key}`, value);
      } else {
        urlParams.set(`${key}`, value);
      }
    });
  } else {
    var value = $(e).val() == "" ? $(e).data("value") : $(e).val();
    urlParams.set(`${param}`, value);
  }

  window.location.search = urlParams.toString();
}

function is_param_exists(param) {
  var urlParams = new URLSearchParams(window.location.search);
  is_exist = urlParams.get(param);
  if (is_exist != null) {
    return true;
  } else {
    return false;
  }
}

function show_laporan_form(e) {
  showModal(e, { size: "large", is_ajax: true });
}
