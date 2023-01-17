{
  "archive": {
    "enable_reconstruct": true,
    "files": {
      "output.png": "Relief map",
      "outputSEG.png": "deep prediction",
      "outputSEGTRESH.off": "segmentation",
      "input_0.off": "Input file"
    },
    "info": {
      "run_time": "run time"
    }
  },
  "build": {
    "build1": {
      "url": "http://www.ipol.im/pub/art/2022/369/TLDDC.tar.gz",
      "construct": "echo -----------;hostname;echo -----------;cd TLDDC;cd ext; cd DGtal;mkdir build; cd build; echo DGTAL CONSTRUCT;cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF; make -j4;cd ../../..; mkdir build;cd build;echo OUR CONSTRUCT;cmake .. -DDGtal_DIR=\"/home/ipol/ipolDevel/ipol_demo/modules/demorunner/binaries/369/src/TLDDC/ext/DGtal/build/\" -DCMAKE_BUILD_TYPE:string=\"Release\";make -j4",
      "move": "TLDDC/Demo/deep-segmentation.sh,TLDDC/Demo/predict.py,TLDDC/Demo/model.py,TLDDC/build/segunroll,TLDDC/build/offToObj,TLDDC/build/segToMesh",
      "virtualenv": "TLDDC/requirements.txt"
    }
  },
  "params": [
    {
      "id": "pred_th",
      "label": "--threshold",
      "comments": "Segmentation model output's a grayscale image, you can specify treshold to make segmentation map (default = 127)",
      "type": "range",
      "values": {
        "min": 0,
        "max": 255,
        "step": 1,
        "default": 127
      }
    },
    {
      "id": "gray_pad",
      "label": "--intensity_per_cm",
      "comments": "Relief map is based on Delta distance, you can specify the number of intensity to represent 1cm (default=10)",
      "type": "range",
      "values": {
        "min": 1,
        "max": 50,
        "step": 1,
        "default": 10
      }
    },
    {
      "id": "gray_or",
      "label": "--minRV",
      "comments": "Relief map is based on Delta distance, you can specify minimal delta distance to be represent",
      "type": "range",
      "values": {
        "min": -50,
        "max": 50,
        "step": 1,
        "default": -5
      }
    },
    {
      "id": "maxDecrease",
      "label": "--MaxdF",
      "comments": "deep resolution to reach empty cells",
      "type": "range",
      "values": {
        "min": 0,
        "max": 5,
        "step": 1,
        "default": 4
      }
    },
    {
      "id": "padAngle",
      "label": "--pad",
      "comments": "angle discretisation to compute partial circumference",
      "type": "range",
      "values": {
        "min": 10,
        "max": 500,
        "step": 10,
        "default": 200
      }
    }
  ],
  "general": {
    "requirements": "core",
    "description": "",
    "demo_title": "CNN-based Method for Segmenting Tree Bark Surface Singularites",
    "xlink_article": "http://www.ipol.im/pub/art/2022/369/",
    "custom_js": "/demo/clientApp/static/369/js/extras.js",

    "timeout": 1600
  },
  "inputs": [
    {
      "description": "input",
      "required": true,
      "dtype": "x",
      "ext": ".off",
      "type": "data",
      "max_pixels": "7000*7000",
      "max_weight": "50*1024*1024"
    }
  ],
  "results": [
    {
      "contents": "'<br>Relief map resulting from discretisation and result of segmentation by our model :<br>' ",
      "type": "html_text"
    },
    {
      "type": "gallery",
      "contents": {
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
      "contents": "'<br>Defect segmentation on mesh :<br>' ",
      "type": "html_text"
    },
    {
      "type": "html_text",
      "contents": "info.url"
    }
  ],
  "run": "deep-segmentation.sh  ${virtualenv} ${demoextras}/leakyReLu.hdf5 input_0.off $pred_th $gray_pad $gray_or $maxDecrease $padAngle"
}