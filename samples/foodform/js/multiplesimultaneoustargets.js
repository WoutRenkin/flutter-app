var World = {
    loaded: false,

    init: function initFn() {
        this.createOverlays();
    },

    createOverlays: function createOverlaysFn() {
        //Load our file that allows wikitude to recognize our images
        this.targetCollectionResource = new AR.TargetCollectionResource("assets/foodform.wtc", {
            onError: World.onError
        });
        
        //Initializes our wikitude world
        this.tracker = new AR.ImageTracker(this.targetCollectionResource, {
            extendedRangeRecognition: AR.CONST.IMAGE_RECOGNITION_RANGE_EXTENSION.OFF,
            onTargetsLoaded: World.showInfoBar,
            onError: World.onError
        });

        //When Wikitude recognizes one of our images it will overlay an image out of our assets folder depending on the name of the recognized image
        this.orderTrackable = new AR.ImageTrackable(this.tracker, "*", {
            onImageRecognized: function(target) {
                var image = new AR.ImageResource("assets/" + target.name + ".png");
                var model = new AR.ImageDrawable(image, 1, {
                    scale: 0.8,
                    
                    //When someoen clicks on the image we will send a JSON object with the mealid to a function in flutter.
                    //This allows us to communicate with our flutter app. 
                    onClick: function() { 
                        AR.platform.sendJSONObject(
                            {
                                "meal_id":parseInt(target.name) 
                            }
                        )
                    },
                    onError: World.onError
                });
                
                //This part shows the image on top of our recognized image
                this.addImageTargetCamDrawables(target, model);

                World.hideInfoBar();
            },
            onError: World.onError
        });
    },
    onError: function onErrorFn(error) {
        alert(error);
    },

    hideInfoBar: function hideInfoBarFn() {
        document.getElementById("infoBox").style.display = "none";
    },

    showInfoBar: function worldLoadedFn() {
        document.getElementById("infoBox").style.display = "table";
        document.getElementById("loadingMessage").style.display = "none";
    }
};

World.init();