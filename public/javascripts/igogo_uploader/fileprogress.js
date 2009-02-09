/*
	A simple class for displaying file information and progress
	Note: This is a demonstration only and not part of SWFUpload.
	Note: Some have had problems adapting this class in IE7. It may not be suitable for your application.
*/

// Constructor
// file is a SWFUpload file object
// targetID is the HTML element id attribute that the Igogo_FileProgress HTML structure will be added to.
// Instantiating a new Igogo_FileProgress object with an existing file will reuse/update the existing DOM elements
function Igogo_FileProgress(file, targetID) {
	this.fileProgressID = file.id;

	this.opacity = 100;
	this.height = 0;

	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "igogoProgressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;

		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "igogoProgressBar";

		var progressCancel = document.createElement("a");
		progressCancel.className = "progressCancel";
		progressCancel.href = "#";
		progressCancel.style.visibility = "hidden";
		progressCancel.appendChild(document.createTextNode(" "));

		var progressText = document.createElement("span");
		progressText.className = "igogoProgressTop";
		progressText.appendChild(document.createTextNode(file.name));

		var progressBar = document.createElement("div");
		progressBar.className = "igogoProgressBarStatus";
		progressBar.style.width = "0%"
		
		
		
		var progressStatus = document.createElement("span");
		progressStatus.className = "igogoProgressPercent";
		progressStatus.innerHTML = "&nbsp;";

		//this.fileProgressElement.appendChild(progressCancel);
		this.fileProgressWrapper.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBar);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);

		document.getElementById(targetID).appendChild(this.fileProgressWrapper);
	} else {
		this.fileProgressElement = this.fileProgressWrapper.childNodes[1];
	}

	this.height = this.fileProgressWrapper.offsetHeight;
}
Igogo_FileProgress.prototype.setProgress = function (percentage) {
	
	//this.fileProgressElement.className = "progressContainer green";
	//this.fileProgressElement.childNodes[3].className = "progressBarInProgress";
	//alert(this.fileProgressElement.innerHTML)
	this.fileProgressElement.childNodes[0].innerHTML =  percentage + "%";
	this.fileProgressElement.childNodes[1].style.width =  (percentage-3) + "%";
	
	
};
Igogo_FileProgress.prototype.setComplete = function () {
	//this.fileProgressElement.className = "progressContainer blue";
	//this.fileProgressElement.childNodes[3].className = "progressBarComplete";
	//this.fileProgressElement.childNodes[3].style.width = "";

	var oSelf = this;
	setTimeout(function () {
		oSelf.disappear();
	}, 10000);
};
Igogo_FileProgress.prototype.setError = function () {
	//this.fileProgressElement.className = "progressContainer red";
	//this.fileProgressElement.childNodes[3].className = "progressBarError";
	//this.fileProgressElement.childNodes[3].style.width = "";

	var oSelf = this;
	setTimeout(function () {
		oSelf.disappear();
	}, 2000);
};
Igogo_FileProgress.prototype.setCancelled = function () {
	//this.fileProgressElement.className = "progressContainer";
	//this.fileProgressElement.childNodes[3].className = "progressBarError";
	//this.fileProgressElement.childNodes[3].style.width = "";

	var oSelf = this;
	setTimeout(function () {
		oSelf.disappear();
	}, 2000);
};
Igogo_FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[2].innerHTML = status;
};

// Show/Hide the cancel button
Igogo_FileProgress.prototype.toggleCancel = function (show, swfUploadInstance) {
	this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
	if (swfUploadInstance) {
		var fileID = this.fileProgressID;
		this.fileProgressElement.childNodes[0].onclick = function () {
			swfUploadInstance.cancelUpload(fileID);
			return false;
		};
	}
};

// Fades out and clips away the Igogo_FileProgress box.
Igogo_FileProgress.prototype.disappear = function () {

	var reduceOpacityBy = 15;
	var reduceHeightBy = 4;
	var rate = 30;	// 15 fps

	if (this.opacity > 0) {
		this.opacity -= reduceOpacityBy;
		if (this.opacity < 0) {
			this.opacity = 0;
		}

		if (this.fileProgressWrapper.filters) {
			try {
				this.fileProgressWrapper.filters.item("DXImageTransform.Microsoft.Alpha").opacity = this.opacity;
			} catch (e) {
				// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
				this.fileProgressWrapper.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=" + this.opacity + ")";
			}
		} else {
			this.fileProgressWrapper.style.opacity = this.opacity / 100;
		}
	}

	if (this.height > 0) {
		this.height -= reduceHeightBy;
		if (this.height < 0) {
			this.height = 0;
		}

		this.fileProgressWrapper.style.height = this.height + "px";
	}

	if (this.height > 0 || this.opacity > 0) {
		var oSelf = this;
		setTimeout(function () {
			oSelf.disappear();
		}, rate);
	} else {
		this.fileProgressWrapper.style.display = "none";
	}
};