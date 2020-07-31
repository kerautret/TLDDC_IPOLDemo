{
  "archive": {
    "enable_reconstruct": true,
    "files": {
        "output.png"         : "Relief map",
        "outputSEG.png"          : "deep prediction",
        "outputSEGTRESH.off"       : "segmentation",
        "input_0.off": "Input file"
    },
    "info": {
            "run_time": "run time"
        }
  },
  "build": {
    "build1": {
      "url": "http://ker.iutsd.univ-lorraine.fr/TLDDC.tar.gz",
      "construct": "echo -----------;hostname;echo -----------;cd TLDDC;cd ext; cd DGtal;mkdir build; cd build; echo DGTAL CONSTRUCT;cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF; make;cd ../../..; mkdir build;cd build;echo OUR CONSTRUCT;cmake .. -DDGtal_DIR=\"/home/ipol/ipolDevel/ipol_demo/modules/demorunner/binaries/77777000105/src/TLDDC/ext/DGtal/build/\" -DCMAKE_BUILD_TYPE:string=\"Release\";make", 
      "move": "TLDDC/Demo/deep-segmentation.sh,TLDDC/Demo/predict.py,TLDDC/Demo/model.py,TLDDC/build/segunroll,TLDDC/build/offToObj",
       "virtualenv": "TLDDC/requirements.txt"
    }
  },
  "general": {
    "requirements":"core",
    "description": "Tree Defect Segmentation using Geometric Features and CNN. The source code can be found on this github : <a href= https://github.com/FlorianDelconte/TLDDC>here</a>", 
    "demo_title": "Tree Defect Segmentation using Geometric Features and CNN",
    "xlink_article": "https://www.ipol.im/",
    "timeout": 800
  },
  "inputs": [{
            "description": "input",
            "required": true,
            "dtype": "x",
            "ext": ".off",
            "type": "data",
            "max_pixels": "7000*7000", 
            "max_weight": "50*1024*1024"
    }],
  "results": [
    {
        "contents":"'<br>Relief map resulting from discretisation and result of segmentation by our model :<br>' ", 
        "type": "html_text"
    },
    {
            "type": "gallery",
            "contents":
            {
                "output relief map": {
                    "img": "output.png"
                },
                "model prediction": {
                    "img": "outputSEG.png"
                },
                "prediction segmentation (t=0.5)": {
                    "img": "outputSEGTRESH.png"
                }
            }
    },
    {
        "contents":"'<br>Defect segmentation on mesh :<br>' ", 
        "type": "html_text"
    },
    {
            "type": "html_text",
            "contents": "info.url"
    }
    
    ],    
  "params": [],
  
  "run":  "deep-segmentation.sh  ${virtualenv} ${demoextras}/demoExtras/Aspen2.png ${demoextras}/demoExtras/leakyReLu.hdf5 input_0.off"
}
