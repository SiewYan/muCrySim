//
// Created by Meng Lv on 2022/11/24.
//

#include "rootEventSelector.hh"

rootEventSelector* rootEventSelector::pointer_to_evtselector=0;

rootEventSelector::rootEventSelector() {
    selector_pointer = &rootEventSelector::AlwaysTrue;
    pointer_to_evtselector = this;
}

rootEventSelector* rootEventSelector::GetInstance() {
    return pointer_to_evtselector;
}

void rootEventSelector::UseSelector() {
    selector_pointer = &rootEventSelector::Selector;
}

bool rootEventSelector::Selector() {
    bool if_save = true;

    // ******************* fill your conditions here ********************
    if_save = (root_manager->eventID == 5);

    // ******************************************************************

    return if_save;
}

void rootEventSelector::SetRootOutputPtr(musrRootOutput *ptr) {
    root_manager = ptr;
}

rootEventSelector::~rootEventSelector(){
    std::cout << "Deconstruct" << std::endl;
}