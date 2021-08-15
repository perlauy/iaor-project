function [auimds] = loadData
    imds = imageDatastore('./training-images','FileExtensions',{'.jpg'}, 'IncludeSubfolders',true,'LabelSource','foldernames' );
    augmenter = imageDataAugmenter("RandRotation",[0 360],"RandScale",[.8 1.5]);
    imageSize = [227 227 3];
    auimds = augmentedImageDatastore(imageSize,imds,'DataAugmentation',augmenter);

    ims = preview(auimds);
    montage(ims{1:6,1}) 
    
end