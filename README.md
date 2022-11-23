# DataDrivenUI

*Producing Views from data since 2022*

## What is DataDrivenUI?

When did putting Classes in Structs become normal? Well, when did SwiftUI get released?

DataDrivenUI takes a data first approach, by focusing on how data is passed around. To be specific, DataDrivenUI reverses the idea of the ViewModel and View. Normally the View will own the ViewModel, a Struct owning a Class. DataDrivenUI creates a contract between the View and the object producing said View. The View determines what Content and Capabilites it needs to funciton. Then you can create objects that can create the needed Content and Capabilites the View needs. Doing this the View doesn't know what object produced it, but does have the needed Content and Capaibilites it needs to work.
