/**
 * jQuery || Zepto Parallax Plugin
 * @author Matthew Wagerfield - @wagerfield
 * @description Creates a parallax effect between an array of layers,
 *              driving the motion from the gyroscope output of a smartdevice.
 *              If no gyroscope is available, the cursor position is used.
 */(function(e,t,n,r){"use strict";function u(t,n){this.element=t;this.$context=e(t).data("api",this);this.$layers=this.$context.find(".layer");var r={calibrateX:this.$context.data("calibrate-x")||null,calibrateY:this.$context.data("calibrate-y")||null,invertX:this.$context.data("invert-x")||null,invertY:this.$context.data("invert-y")||null,limitX:parseFloat(this.$context.data("limit-x"))||null,limitY:parseFloat(this.$context.data("limit-y"))||null,scalarX:parseFloat(this.$context.data("scalar-x"))||null,scalarY:parseFloat(this.$context.data("scalar-y"))||null,frictionX:parseFloat(this.$context.data("friction-x"))||null,frictionY:parseFloat(this.$context.data("friction-y"))||null,originX:parseFloat(this.$context.data("origin-x"))||null,originY:parseFloat(this.$context.data("origin-y"))||null};for(var i in r)r[i]===null&&delete r[i];e.extend(this,o,n,r);this.calibrationTimer=null;this.calibrationFlag=!0;this.enabled=!1;this.depths=[];this.raf=null;this.bounds=null;this.ex=0;this.ey=0;this.ew=0;this.eh=0;this.ecx=0;this.ecy=0;this.erx=0;this.ery=0;this.cx=0;this.cy=0;this.ix=0;this.iy=0;this.mx=0;this.my=0;this.vx=0;this.vy=0;this.onMouseMove=this.onMouseMove.bind(this);this.onDeviceOrientation=this.onDeviceOrientation.bind(this);this.onOrientationTimer=this.onOrientationTimer.bind(this);this.onCalibrationTimer=this.onCalibrationTimer.bind(this);this.onAnimationFrame=this.onAnimationFrame.bind(this);this.onWindowResize=this.onWindowResize.bind(this);this.initialise()}var i="parallax",s=30,o={relativeInput:!1,clipRelativeInput:!1,calibrationThreshold:100,calibrationDelay:500,supportDelay:500,calibrateX:!1,calibrateY:!0,invertX:!0,invertY:!0,limitX:!1,limitY:!1,scalarX:10,scalarY:10,frictionX:.1,frictionY:.1,originX:.5,originY:.5};u.prototype.transformSupport=function(e){var i=n.createElement("div"),s=!1,o=null,u=!1,a=null,f=null;for(var l=0,c=this.vendors.length;l<c;l++){if(this.vendors[l]!==null){a=this.vendors[l][0]+"transform";f=this.vendors[l][1]+"Transform"}else{a="transform";f="transform"}if(i.style[f]!==r){s=!0;break}}switch(e){case"2D":u=s;break;case"3D":if(s){var h=n.body||n.createElement("body"),p=n.documentElement,d=p.style.overflow;if(!n.body){p.style.overflow="hidden";p.appendChild(h);h.style.overflow="hidden";h.style.background=""}h.appendChild(i);i.style[f]="translate3d(1px,1px,1px)";o=t.getComputedStyle(i).getPropertyValue(a);u=o!==r&&o.length>0&&o!=="none";p.style.overflow=d;h.removeChild(i)}}return u};u.prototype.ww=null;u.prototype.wh=null;u.prototype.wcx=null;u.prototype.wcy=null;u.prototype.wrx=null;u.prototype.wry=null;u.prototype.portrait=null;u.prototype.desktop=!navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|BB10|mobi|tablet|opera mini|nexus 7)/i);u.prototype.vendors=[null,["-webkit-","webkit"],["-moz-","Moz"],["-o-","O"],["-ms-","ms"]];u.prototype.motionSupport=!!t.DeviceMotionEvent;u.prototype.orientationSupport=!!t.DeviceOrientationEvent;u.prototype.orientationStatus=0;u.prototype.transform2DSupport=u.prototype.transformSupport("2D");u.prototype.transform3DSupport=u.prototype.transformSupport("3D");u.prototype.propertyCache={};u.prototype.initialise=function(){this.$context.css("position")==="static"&&this.$context.css({position:"relative"});this.accelerate(this.$context);this.updateLayers();this.updateDimensions();this.enable();this.queueCalibration(this.calibrationDelay)};u.prototype.updateLayers=function(){this.$layers=this.$context.find(".layer");this.depths=[];this.$layers.css({position:"absolute",display:"block",left:0,top:0});this.$layers.first().css({position:"relative"});this.accelerate(this.$layers);this.$layers.each(e.proxy(function(t,n){this.depths.push(e(n).data("depth")||0)},this))};u.prototype.updateDimensions=function(){this.ww=t.innerWidth;this.wh=t.innerHeight;this.wcx=this.ww*this.originX;this.wcy=this.wh*this.originY;this.wrx=Math.max(this.wcx,this.ww-this.wcx);this.wry=Math.max(this.wcy,this.wh-this.wcy)};u.prototype.updateBounds=function(){this.bounds=this.element.getBoundingClientRect();this.ex=this.bounds.left;this.ey=this.bounds.top;this.ew=this.bounds.width;this.eh=this.bounds.height;this.ecx=this.ew*this.originX;this.ecy=this.eh*this.originY;this.erx=Math.max(this.ecx,this.ew-this.ecx);this.ery=Math.max(this.ecy,this.eh-this.ecy)};u.prototype.queueCalibration=function(e){clearTimeout(this.calibrationTimer);this.calibrationTimer=setTimeout(this.onCalibrationTimer,e)};u.prototype.enable=function(){if(!this.enabled){this.enabled=!0;if(this.orientationSupport){this.portrait=null;t.addEventListener("deviceorientation",this.onDeviceOrientation);setTimeout(this.onOrientationTimer,this.supportDelay)}else{this.cx=0;this.cy=0;this.portrait=!1;t.addEventListener("mousemove",this.onMouseMove)}t.addEventListener("resize",this.onWindowResize);this.raf=requestAnimationFrame(this.onAnimationFrame)}};u.prototype.disable=function(){if(this.enabled){this.enabled=!1;this.orientationSupport?t.removeEventListener("deviceorientation",this.onDeviceOrientation):t.removeEventListener("mousemove",this.onMouseMove);t.removeEventListener("resize",this.onWindowResize);cancelAnimationFrame(this.raf)}};u.prototype.calibrate=function(e,t){this.calibrateX=e===r?this.calibrateX:e;this.calibrateY=t===r?this.calibrateY:t};u.prototype.invert=function(e,t){this.invertX=e===r?this.invertX:e;this.invertY=t===r?this.invertY:t};u.prototype.friction=function(e,t){this.frictionX=e===r?this.frictionX:e;this.frictionY=t===r?this.frictionY:t};u.prototype.scalar=function(e,t){this.scalarX=e===r?this.scalarX:e;this.scalarY=t===r?this.scalarY:t};u.prototype.limit=function(e,t){this.limitX=e===r?this.limitX:e;this.limitY=t===r?this.limitY:t};u.prototype.origin=function(e,t){this.originX=e===r?this.originX:e;this.originY=t===r?this.originY:t};u.prototype.clamp=function(e,t,n){e=Math.max(e,t);e=Math.min(e,n);return e};u.prototype.css=function(t,n,i){var s=this.propertyCache[n];if(!s)for(var o=0,u=this.vendors.length;o<u;o++){this.vendors[o]!==null?s=e.camelCase(this.vendors[o][1]+"-"+n):s=n;if(t.style[s]!==r){this.propertyCache[n]=s;break}}t.style[s]=i};u.prototype.accelerate=function(e){for(var t=0,n=e.length;t<n;t++){var r=e[t];this.css(r,"transform","translate3d(0,0,0)");this.css(r,"transform-style","preserve-3d");this.css(r,"backface-visibility","hidden")}};u.prototype.setPosition=function(e,t,n){t+="px";n+="px";if(this.transform3DSupport)this.css(e,"transform","translate3d("+t+","+n+",0)");else if(this.transform2DSupport)this.css(e,"transform","translate("+t+","+n+")");else{e.style.left=t;e.style.top=n}};u.prototype.onOrientationTimer=function(e){if(this.orientationSupport&&this.orientationStatus===0){this.disable();this.orientationSupport=!1;this.enable()}};u.prototype.onCalibrationTimer=function(e){this.calibrationFlag=!0};u.prototype.onWindowResize=function(e){this.updateDimensions()};u.prototype.onAnimationFrame=function(){this.updateBounds();var e=this.ix-this.cx,t=this.iy-this.cy;(Math.abs(e)>this.calibrationThreshold||Math.abs(t)>this.calibrationThreshold)&&this.queueCalibration(0);if(this.portrait){this.mx=this.calibrateX?t:this.iy;this.my=this.calibrateY?e:this.ix}else{this.mx=this.calibrateX?e:this.ix;this.my=this.calibrateY?t:this.iy}this.mx*=this.ew*(this.scalarX/100);this.my*=this.eh*(this.scalarY/100);isNaN(parseFloat(this.limitX))||(this.mx=this.clamp(this.mx,-this.limitX,this.limitX));isNaN(parseFloat(this.limitY))||(this.my=this.clamp(this.my,-this.limitY,this.limitY));this.vx+=(this.mx-this.vx)*this.frictionX;this.vy+=(this.my-this.vy)*this.frictionY;for(var n=0,r=this.$layers.length;n<r;n++){var i=this.depths[n],s=this.$layers[n],o=this.vx*i*(this.invertX?-1:1),u=this.vy*i*(this.invertY?-1:1);this.setPosition(s,o,u)}this.raf=requestAnimationFrame(this.onAnimationFrame)};u.prototype.onDeviceOrientation=function(e){if(!this.desktop&&e.beta!==null&&e.gamma!==null){this.orientationStatus=1;var n=(e.beta||0)/s,r=(e.gamma||0)/s,i=t.innerHeight>t.innerWidth;if(this.portrait!==i){this.portrait=i;this.calibrationFlag=!0}if(this.calibrationFlag){this.calibrationFlag=!1;this.cx=n;this.cy=r}this.ix=n;this.iy=r}};u.prototype.onMouseMove=function(e){var t=e.clientX,n=e.clientY;if(!this.orientationSupport&&this.relativeInput){if(this.clipRelativeInput){t=Math.max(t,this.ex);t=Math.min(t,this.ex+this.ew);n=Math.max(n,this.ey);n=Math.min(n,this.ey+this.eh)}this.ix=(t-this.ex-this.ecx)/this.erx;this.iy=(n-this.ey-this.ecy)/this.ery}else{this.ix=(t-this.wcx)/this.wrx;this.iy=(n-this.wcy)/this.wry}};var a={enable:u.prototype.enable,disable:u.prototype.disable,updateLayers:u.prototype.updateLayers,calibrate:u.prototype.calibrate,friction:u.prototype.friction,invert:u.prototype.invert,scalar:u.prototype.scalar,limit:u.prototype.limit,origin:u.prototype.origin};e.fn[i]=function(t){var n=arguments;return this.each(function(){var r=e(this),s=r.data(i);if(!s){s=new u(this,t);r.data(i,s)}a[t]&&s[t].apply(s,Array.prototype.slice.call(n,1))})}})(window.jQuery||window.Zepto,window,document);var seconds=0,secondsT,si=setInterval(function(){seconds+=1;seconds>59&&(seconds=0);secondsT=seconds<10?"0"+seconds:seconds;$("#error-s").text(secondsT)},1e3);$(window).on("resize",function(e){$("#contents-holder").css("line-height",$(this).height()+"px")}).trigger("resize");$("#backgrounds").parallax();(function(){if("-ms-user-select"in document.documentElement.style&&navigator.userAgent.match(/IEMobile\/10\.0/)){var e=document.createElement("style");e.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}"));document.getElementsByTagName("head")[0].appendChild(e)}})();