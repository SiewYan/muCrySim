//
// Created by Meng Lv on 2022/11/24.
//

#ifndef MUSRSIM_JP_ROOTEVENTSELECTOR_HH
#define MUSRSIM_JP_ROOTEVENTSELECTOR_HH

#include "globals.hh"
#include "musrRootOutput.hh"

class musrRootOutput;
class rootEventSelector{
public:
    friend class musrRootOutput;
    rootEventSelector();
    ~rootEventSelector();

    static rootEventSelector* GetInstance();
    void SetRootOutputPtr(musrRootOutput* ptr);

    void UseSelector();
    bool (rootEventSelector::*selector_pointer)();

private:
    static rootEventSelector* pointer_to_evtselector;
    bool AlwaysTrue() {return true;};
    bool Selector();
    musrRootOutput* root_manager;
};

#endif //MUSRSIM_JP_ROOTEVENTSELECTOR_HH
