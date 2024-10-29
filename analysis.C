#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>
#include "string.h"

class tun {
public :
  TTree          *fChain;   //!pointer to the analyzed TTree or TChain                                                                                                                    
  Int_t           fCurrent; //!current Tree number in a TChain

  // Declaration of leaf types                                                                                                                                                            
  Int_t           runID;
  Int_t           eventID;
  Int_t           save_n;
  Int_t           save_detID[1000];   //[save_n]  

  // List of branches                                                                                                                                                                     
  TBranch        *b_runID;   //!                                                                                                                                                          
  TBranch        *b_eventID;   //!
  TBranch        *b_save_n;   //!                                                                                                                                                         
  TBranch        *b_save_detID;   //!
  
  
  tun(std::string filename);
  virtual ~tun();
  virtual Int_t    GetEntry(Long64_t entry);
  virtual Long64_t LoadTree(Long64_t entry);
  virtual void Init(TTree *tree);
  virtual void Loop();
  virtual Bool_t   Notify();
  
};

// constructor
tun::tun(std::string filename) : fChain(0)
{
  // if parameter tree is not specified (or zero), connect the file
  // used to generate this class and read the Tree.

  TFile *f = new TFile(filename.c_str(),"READ");
  TTree *tree = (TTree*) f->Get("t1");
  //f->GetObject("t1",tree);
  Init(tree);
}

tun::~tun()
{
  if (!fChain) return;
  delete fChain->GetCurrentFile();
}

Int_t tun::GetEntry(Long64_t entry)
{
// Read contents of entry.                                                                                                                                                                 
   if (!fChain) return 0;
   return fChain->GetEntry(entry);
}

Long64_t tun::LoadTree(Long64_t entry)
{
// Set the environment to read one entry                                                                                                                                                   
   if (!fChain) return -5;
   Long64_t centry = fChain->LoadTree(entry);
   if (centry < 0) return centry;
   if (fChain->GetTreeNumber() != fCurrent) {
      fCurrent = fChain->GetTreeNumber();
      Notify();
   }
   return centry;
}

Bool_t tun::Notify()
{

   return kTRUE;
}

void tun::Init(TTree *tree)
{
  if (!tree) return;
  fChain = tree;
  fCurrent = -1;
  
  fChain->SetBranchAddress("runID", &runID, &b_runID);
  fChain->SetBranchAddress("eventID", &eventID, &b_eventID);
  fChain->SetBranchAddress("save_n", &save_n, &b_save_n);
  fChain->SetBranchAddress("save_detID", save_detID, &b_save_detID);
  Notify();
}


void tun::Loop()
{
  if (fChain == 0) return;

  // sea level : 9000
  // vir : 13000

  Long64_t nentries = fChain->GetEntriesFast();

  cout<<"nentries : " << nentries << endl;
  
  double norm=0;
  double det=0;
  
  Long64_t nbytes = 0, nb = 0;
  for (Long64_t jentry=0; jentry<nentries;jentry++) {
    Long64_t ientry = LoadTree(jentry);
    if (ientry < 0) break;
    nb = fChain->GetEntry(jentry);   nbytes += nb;
    // if (Cut(ientry) < 0) continue;
    // loop on save
    
    for (int i=0 ; i < save_n ; i++){
      
      if ( save_detID[i] == 9000 ) norm++;
      if ( save_detID[i] == 13000 ) det++;
      
    }
    
  }
  
  // print
  cout<<"norm : " << norm << endl;
  cout<<"det  : " << det  << endl;  
}

  
void analysis(){

  // layer1
  cout<<"layer 0 : "<<endl;
  tun layer0("musrSim_jp000_layer0.root");
  layer0.Loop();

  // layer2
  cout<<"layer 2 : "<<endl;
  tun layer2("musrSim_jp000_layer2.root");
  layer2.Loop();

  // layer5
  cout<<"layer 5 : "<<endl;
  tun layer5("musrSim_jp000_layer5.root");
  layer5.Loop();

}
