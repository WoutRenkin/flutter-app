var World = {
    loaded: false,

    init: function initFn() {
        this.createOverlays();
    },

    createOverlays: function createOverlaysFn() {

        this.targetCollectionResource = new AR.TargetCollectionResource("assets/foodform.wtc", {
            onError: World.onError
        });

        this.tracker = new AR.ImageTracker(this.targetCollectionResource, {
            extendedRangeRecognition: AR.CONST.IMAGE_RECOGNITION_RANGE_EXTENSION.OFF,
            onTargetsLoaded: World.showInfoBar,
            onError: World.onError
        });

        this.orderTrackable = new AR.ImageTrackable(this.tracker, "*", {
            onImageRecognized: function(target) {
                var image = new AR.ImageResource("assets/" + target.name + ".png");
                var model = new AR.ImageDrawable(image, 1, {
                    scale: 0.8,
                    onClick: function() { 
                        AR.platform.sendJSONObject(
                            {
                                "meal_id":parseInt(target.name) 
                            }
                        )
                    },
                    onError: World.onError
                });

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