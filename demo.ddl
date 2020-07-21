{
  "archive": {
    "enable_reconstruct": true,
    "files": {
        "input_0.png"         : "Input image",
        "src-bitmap.png"      : "Input scaled",
        "result.png"          : "Output image",
        "stdout.txt"          : "Output text file"
    },
    "param": [
        "zoomfactor"
    ],
    "info": {
            "run_time": "run time"
        }
  },
  "build": {
    "build1": {
      "url": "http://ker.iutsd.univ-lorraine.fr/HqxSrc.tar.gz",
      "construct": "cd HqxSrc; ./configure; make",
      "move": "HqxSrc/src/.libs/hqx, HqxSrc/src/.libs/libhqx.so.1"
    }
  },
  "general": {
    "description": "Tree Defect Segmentation usingGeometric Features and CNN", 
    "requirements":"DEBIAN_STABLE",
    "demo_title": "Tree Defect Segmentation usingGeometric Features and CNN <BR> (submitted to ICPR 2020)",
    "input_description": [
      "Click on an image or upload one to use it as the algorithm input."
    ],
    "param_description": [
      "You can choose the zoom parameter and run the algorithm."
    ],
    "xlink_article": "https://www.ipol.im/",
    "timeout": 600
  },
  "inputs": [
    {
            "description": "Input image (png, jpeg, (no gif nor ppm))",
            "required": true,
            "max_pixels": 100000000,
            "dtype": "x",
            "ext": ".png",
            "type": "image",
            "max_weight": "50*1024*1024"
    }
  ],

"params": [
    {
          "id": "zoomfactor",
          "label": "Choose the zoom factor",
          "type": "range",
          "visible": true,
          "comments": "Set the resulting zoom factor.",
          "values": {
                "default": 4,
                "max": 4,
                "min": 2,
                "step": 2
          }
      }
  ],
  
  "results": [
    {
            "type": "gallery",
            "contents":
            {
                "Input basic scale" : {
                    "img": "src-bitmap.png"
                },
                "output Zoomed image": {
                    "img": "result.png"
                },
                "input_src": {
                    "img": "input_0.png"
                }
            }
    },
    {
        "type": "file_download",
        "label": "<h3> You can download resulting file here:</h3>",
        "contents" : {
            "Resulting zoomed image (png)": "result.png"
        }
    },
     {
        "type": "file_download",
        "label": "<h3> You also get the source files here:</h3>",
        "contents" : {
            "Input image (png)": "input_0.png",
            "Rescaled image (by convert rescale option)": "src-bitmap.png"
        }
    },
    {
            "contents": "stdout.txt", 
            "label": "Output", 
            "type": "text_file"
    }
  ],
  "run":  "${demoextras}/DemoExtras/run.sh  ${demoextras}  input_0.png $zoomfactor result.png"
}