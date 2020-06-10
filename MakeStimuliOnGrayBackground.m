%make and print stimuli of varying RGB values on a plain gray background
% asks user for number of stimuli, then ask for RGB for each stimuli
% places them at random on the gray background;
%This code was written by John A. Endler
clear;  
wcm=10.0; hcm=10.0; % a4 paper 210 × 297 mm or 1:sqrt(2)
mlt=37;
figure; set(gcf,'Position',[835 33 wcm*mlt hcm*mlt]);
set(gca,'Units','centimeters','Position',[0 0 wcm hcm]);
set(gca,'XLim',[0 wcm],'YLim',[0 hcm]);

bt=0; R=0; G=0; B=0;
while bt==0
  prompt={'Background Red [0 to 1]','Background Green [0 to 1]','Background Blue [0 to 1]'};
  an=inputdlg(prompt,'Background RGB values');
  R=str2num(char(an{1}));
  G=str2num(char(an{2}));
  B=str2num(char(an{3}));
  clr=[R G B];
  pmt=['RGB ' an{1} ' ' an{2} ' ' an{3} ' correct?'];
  ch=questdlg(pmt,'Stimulus RGB values','Yes','No','Yes'); %last one default;
  switch ch
    case 'Yes'
       bt=1;
    case 'No'
       bt=0;
  end;
end;  
patch([0 wcm wcm 0],[0 0 hcm hcm],clr,'edgecolor','none');
hold on;
 
% an=inputdlg('Number of stimuli to add','Number of stimuli');
% n=str2num(char(an));
n=1;

bt=0; R=0; G=0; B=0;
while bt==0
  prompt={'Red [0 to 1]','Green [0 to 1]','Blue [0 to 1]','Radius (cm)'};
  an=inputdlg(prompt,'Enter RGB values');
  R=str2num(char(an{1}));
  G=str2num(char(an{2}));
  B=str2num(char(an{3}));
  rd=str2num(char(an{4}));
  pmt=['RGB ' an{1} ' ' an{2} ' ' an{3} '  radius = ' an{4} ' correct?'];
  ch=questdlg(pmt,'Stimulus RGB values','Yes','No','Yes'); %last one default;
  switch ch
    case 'Yes'
       bt=1;
    case 'No'
       bt=0;
  end;
end;
fprintf(1,'Using RGB %5.3f %5.3f %5.3f, radius=%5.3f\n',R,G,B,rd);
an=inputdlg('Name of image outfile name (will add .bmp to name)','FileName');
an=char(an{1});
if length(an)>1 
    oname=[an '.bmp'];
else
    oname='Stimulus.bmp';
end;
for i=1:n
  ox=random('uniform',0.1*wcm,0.9*wcm,1,1); %to within 10% of edge
  oy=random('uniform',0.1*hcm,0.9*hcm,1,1);
  [cx,cy]=Circle(ox,oy,rd);
  patch(cx,cy,[R G B],'edgecolor','none');
end;
fprintf(1,'Saving image (takes a while)\n');
set(gcf,'PaperPositionMode','auto');
set(gcf, 'Renderer', 'painters');
print('-dbmp','-r600',oname);
fprintf(1,'Image saved in %s\n',oname);

