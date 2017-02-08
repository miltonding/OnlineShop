<div role="upload" id="upload_${name}" action="${action}" type="${type}">
  <div class="upload-wrapper">
    <#if type?? &&  type == "image">
      <div class="image-block">
        <img src="${src}" alt="" id="image"/>
      </div>
    </#if>

    <div class="upload-tip">${tip}</div>
    <div class="btn-group">
      <button class="btn btn-primary choose-btn" type="button">
        <label>${chooseText}</label>
        <input type="file" class="upload" id="file" name="${name}"/>
      </button>
      <button class="btn btn-primary upload-btn" type="button">
        <label>${uploadText}</label>
      </button>
    </div>

    <div class="progress hidden">
      <div class="progress-bar progress-bar-striped active" 
        role="progressbar" aria-valuenow="45" aria-valuemin="0" 
        aria-valuemax="100" style="width: ${progress}">
        <span class="sr-only"></span>
      </div>
    </div>
  </div>
</div>