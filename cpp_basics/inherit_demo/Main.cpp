#include <mutex>
#include <thread>
#include <iostream>

#include "Demo.h"

class Father
{
public:
    Father() {
        std::cout << "Father Const" << std::endl;
    }
    Father(Father&) {
        std::cout << "Father Const&" << std::endl;
    }
    Father(Father&&) {
        std::cout << "Father Const&&" << std::endl;
    }
};

class Children :
    public Father
{
public:
    Children() {
        std::cout << "Children Const" << std::endl;
    }
    Children(Children&) {
        std::cout << "Children Const&" << std::endl;
    }
    Children(Children&&) {
        std::cout << "Children Const&&" << std::endl;
    }
};

class Base
{
public:
    Base()
    {
        Foo();
    }

    virtual void
    Foo()
    {
        std::cout << "Base::Foo(void)" << std::endl;
    }
};

class Derived : public Base
{
public:
    Derived()
    {
        Foo();
    }

    virtual void
    Foo()
    override
    {
        std::cout << "Derived::Foo(void)" << std::endl;
    }
};

int main()
{
    Derived();

    return 0;
}
