;(function($){
	
var Carousel=function(poster){
	
	var self=this;
	//���浥����תľ�����
	this.poster=poster;
	this.posterItemMain=poster.find("ul.poster-list");
	this.nextBtn=poster.find("div.poster-next-btn");
	this.prevBtn=poster.find("div.poster-prev-btn");
	
	this.posterItems=poster.find("li.poster-item");
	if(this.posterItems.size()%2==0){
		this.posterItemMain.append(this.posterItems.eq(0).clone());
		this.posterItems=this.posterItemMain.children();
	}
	this.posterFirstItem=this.posterItems.first();
	this.posterLastItem =this.posterItems.last();
	this.rotateFlag=true;
	//����Ĭ�ϲ���
	this.setting={
					"width":1000,				//�õ�Ƭ���
					"height":270,				//�õ�Ƭ�߶�
					"posterWidth":640,			//�õ�Ƭ��һ֡�Ŀ��
					"posterHeight":270,			//�õ�Ƭ��һ֡�ĸ߶�
					"scale":0.9,				//�仯����
					"speed":500,				//�л��ٶ�
					"autoPlay":false,
					"delay":3000,
					"verticalAlign":"middle"	//ľ����ʽ����middle��,"top","bottom"
				};
	$.extend(this.setting,this.getSetting());
	
	this.setSettingValue();
	this.setPosterPos();
	
	this.nextBtn.click(function(){
		if(self.rotateFlag){
			self.rotateFlag=false;
			self.carouselRotate("left");
		}
		
	});
	
	this.prevBtn.click(function(){
		if(self.rotateFlag){
			self.rotateFlag=false;
			self.carouselRotate("right");
		}
	});
	//�Ƿ����Զ�����
	if(this.setting.autoPlay){
		this.autoPlay();
		this.poster.hover(function(){
							window.clearInterval(self.timer);
						},function(){
							self.autoPlay();
						});
	};
};
	
Carousel.prototype={
	
	//�Զ���ת
	
	autoPlay:function(){
		var self=this;
		this.timer=window.setInterval(function(){
			self.nextBtn.click();
		},self.setting.delay);
	},
	
	//��ת����
	
	carouselRotate:function(dir){
		
		var _this_=this;
		var zIndexArr=[];
		
		if(dir=="left"){
			this.posterItems.each(function(){
				
				var self=$(this),
					prev=self.prev().get(0)?self.prev():_this_.posterLastItem,
					width=prev.width(),
					height=prev.height(),
					zIndex=prev.css("zIndex"),
					opacity=prev.css("opacity"),
					left=prev.css("left"),
					top=prev.css("top");
					
					zIndexArr.push(zIndex);
					
					self.animate({
								width:width,
								height:height,
								//zIndex:zIndex,
								opacity:opacity,
								left:left,
								top:top
								},_this_.setting.speed,function(){
									_this_.rotateFlag=true;
								});
				
			});
			this.posterItems.each(function(i){
				$(this).css("zIndex",zIndexArr[i]);
			});
		}else if(dir=="right"){
			this.posterItems.each(function(){
				
				var self=$(this),
					next=self.next().get(0)?self.next():_this_.posterFirstItem,
					width=next.width(),
					height=next.height(),
					zIndex=next.css("zIndex"),
					opacity=next.css("opacity"),
					left=next.css("left"),
					top=next.css("top");
					
					zIndexArr.push(zIndex);
					self.animate({
								width:width,
								height:height,
								//zIndex:zIndex,
								opacity:opacity,
								left:left,
								top:top
								},_this_.setting.speed,function(){
									_this_.rotateFlag=true;
								});
				
			});
			this.posterItems.each(function(i){
				$(this).css("zIndex",zIndexArr[i]);
			});
		}
		
	},
	
	//����ʣ���֡��λ�ù�ϵ
	setPosterPos:function(){
		
		var self=this;
		var sliceItems =this.posterItems.slice(1),
			sliceSize  =sliceItems.size()/2,
			rightSlice =sliceItems.slice(0,sliceSize),
			level      =Math.floor(this.posterItems.size()/2),
			leftSlice  =sliceItems.slice(sliceSize);
			
		
		var rw=this.setting.posterWidth,
			rh=this.setting.posterHeight,
			gap=((this.setting.width-this.setting.posterWidth)/2)/level;
		
		var firstLeft=(this.setting.width-this.setting.posterWidth)/2;
		var fixOffsetLeft=firstLeft+rw;
		
		//�����ұ�֡��λ�ù�ϵ�Ϳ�ȸ߶�top
		rightSlice.each(function(i){
			
			level--;
			rw=rw*self.setting.scale;
			rh=rh*self.setting.scale;
			
			var j=i;
			
			$(this).css({
						zIndex:level,
						width:rw,
						height:rh,
						opacity:1/(++j),
						left:fixOffsetLeft+(++i)*gap-rw,
						top:self.setVertualAlign(rh),
						});
		})	
		//�������֡��λ�ù�ϵ
		var lw=rightSlice.last().width(),
			lh=rightSlice.last().height(),//ȡ�Ұ�����һ������Ϊ��ߵ�һ������һ��
			oloop=Math.floor(this.posterItems.size()/2);
		leftSlice.each(function(i){
			
			
			$(this).css({
						zIndex:i,
						width:lw,
						height:lh,
						opacity:1/oloop,
						left:i*gap,
						top:self.setVertualAlign(lh),
						});
			lw=lw/self.setting.scale;
			lh=lh/self.setting.scale;
			oloop--;
		})
		
	},
	
	//���ô�ֱ���ж���
	
	setVertualAlign:function(height){
		
		var verticalType=this.setting.verticalAlign,
			top=0;
		
		if(verticalType=="middle"){
			top=(this.setting.height-height)/2;
		}else if(verticalType=="top"){
			top=0;
		}else if(verticalType=="bottom"){
			top=this.setting.height-height;
		}else{
			top=(this.setting.height-height)/2;
		}
		
		return top;
	},
	
	//�������ò���ȥ���ƻ����Ŀ�ȸ߶�
	
	setSettingValue:function(){
		
		this.poster.css({
						width:this.setting.width,
						height:this.setting.height
						});
		this.posterItemMain.css({
						width:this.setting.width,
						height:this.setting.height
						});
		//���������л���ť�Ŀ��
		var w=(this.setting.width-this.setting.posterWidth)/2;	//��ť���
		
		this.nextBtn.css({
						width:w,
						height:this.setting.height,
						zIndex:Math.ceil(this.posterItems.size()/2)
						});
		this.prevBtn.css({
						width:w,
						height:this.setting.height,
						zIndex:Math.ceil(this.posterItems.size()/2)
						});
		this.posterFirstItem.css({
						width:this.setting.posterWidth,
						height:this.setting.posterHeight,
						left:w,
						zIndex:Math.floor(this.posterItems.size()/2)
						});
	},												//ע�⣬����Ķ��š��ǳ���Ҫ
	
	//��ȡ�˹����ò���
	getSetting:function(){
		var setting=this.poster.attr("data-setting");
		if(setting&&setting!=""){
			return $.parseJSON(setting);
		}else{
			return {};
		};
	}
	
};

Carousel.init=function(posters){
	var _this_=this;
	posters.each(function(){
		
		new _this_($(this));
		
	});
	
};

window["Carousel"]=Carousel;

})(jQuery);