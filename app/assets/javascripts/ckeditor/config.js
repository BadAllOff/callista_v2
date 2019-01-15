CKEDITOR.editorConfig = function (config) {
  config.extraPlugins = 'wordcount';
  config.wordcount = {
    // Whether or not you want to show the Word Count
    showWordCount: true,
    // Whether or not you want to show the Char Count
    showCharCount: true,
  };

  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  config.filebrowserParams = function() {
    var csrf_param, csrf_token, i, meta, metas, params;
    csrf_token = void 0;
    csrf_param = void 0;
    meta = void 0;
    metas = document.getElementsByTagName("meta");
    params = new Object();
    i = 0;
    while (i < metas.length) {
      meta = metas[i];
      switch (meta.name) {
        case "csrf-token":
          csrf_token = meta.content;
          break;
        case "csrf-param":
          csrf_param = meta.content;
          break;
        default:
          i++;
          continue;
      }
      i++;
    }
    if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
    }
    return params;
  };

  config.addQueryString = function(url, params) {
    var i, queryString;
    queryString = [];
    if (!params) {
      return url;
    } else {
      for (i in params) {
        queryString.push(i + "=" + encodeURIComponent(params[i]));
      }
    }
    return url + (url.indexOf("?") !== -1 ? "&" : "?") + queryString.join("&");
  };

  CKEDITOR.on("dialogDefinition", function(ev) {
    var content, dialogDefinition, dialogName, upload;
    dialogName = ev.data.name;
    dialogDefinition = ev.data.definition;
    content = void 0;
    upload = void 0;
    if (CKEDITOR.tools.indexOf(["link", "image", "image2", "attachment", "flash"], dialogName) > -1) {
      content = dialogDefinition.getContents("Upload") || dialogDefinition.getContents("upload");
      upload = (content == null ? null : content.get("upload"));
      if (upload && upload.filebrowser && upload.filebrowser["params"] === undefined) {
        upload.filebrowser["params"] = config.filebrowserParams();
        upload.action = config.addQueryString(upload.action, upload.filebrowser["params"]);
      }
    }
  });
};