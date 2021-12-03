There are five folders in the released database.

Five folders are "Image", "ASD", "ASD_FixMaps", "TD", "TD_FixMaps", respectively.
1. "Image" contains the raw images.
2. "ASD" contains the fixation & scanpath data of Autism Spectrum Disorder (ASD) children.
3. "ASD_FixMaps" contains the fixation map after filtering with a 1 degree Gaussian filter.
4. "TD" contains the fixation & scanpath data of the Typically Developing (TD) children.
5. "TD_FixMaps" contains the fixation map after filtering with a 1 degree Gaussian filter.

Notice that for each image, we selected 14 subjects as ASD group, and 14 subjects as TD group. However, for some images, some subjects with ASD DO NOT look at the screen, instead, they paid attention to some other places away from the screen. Hence, the fixation points of some images in ASD group are less than 14 subjects. Although we have tried our best to collect commensurate data for each image, we still need to remind the participants to pay attention to this Data Imbalance Problem when you design your objective models.

We also provide a pre-processing code (i.e. "ICME_DataPreparation.m") to transfer the ".txt" files as ".png" files, for better visualization. 
Notice that if you want to use this pre-processing code, you need to change the file path as your own paths, and create the new folders to store the generated images.

The Original Images of this dataset are selected from MIT1003 Dataset, thanks to Tilke Judd et. al. (i.e. "Learning to predict where humans look" in ICCV 2009). 

-------------
Details on Experimental Setup

-------------

- Eye tracker: Tobii T120 17 inches, Resolution 1280x1024

- Tobbi Studio SW was used to obtain directly the eye fixations.

- Viewing/Tracking distance: 65 cm (approx.)

- The images were displayed in their original full resolution.

- Viewing time: 3s, Grey interval between images: 1s. 

- Stimuli: 300 images were shuffled into a random sequence. The experiment was split into ten recording sessions. Each session had 30 randomly selected images.

- The age of the children with ASD ranged from 5 years old to 12 years old (mean age of 8 years old). The mean age of healthy controls was 8 years old. 


