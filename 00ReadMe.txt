
--- How to show the data set ---
Run the following in Matlab.
  % replace <UUN> with your UUN in the following.
  dset_dir = '/Users/azamkhan/Downloads/2b2/s1704037';
  [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
  Xtrn = double(Xtrn)/255.0;
  Xtst = double(Xtst)/255.0;
  disp_one(Xtrn, Ytrn);

