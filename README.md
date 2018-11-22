# DAQLES HDL-Design

This github repositroy is a fork from the analog devices hdl repositroy (https://github.com/analogdevicesinc/hdl). As it is not allowed to upload custom projects to their repos, as it is not possible to them to maintain custom boards, I decided to share the DAQLES project on my own github account.
However, this project was part of my master thesis in 2018.

The project does not use an Xilinx or Altera Evaluation board, as it was to expensive to me. The project uses a System on module with an zynq-7000 SoC from here (http://www.knowres.ch/products/krm-3z030-768/). This support 4 multi gigabit transceivers up to 8 Gbps. The carrier board I used for testing was the KRC3701 (http://www.knowres.ch/products/krc3600-carrier-kit/). The total costs are about 600€. Compared to an ZC706 for example, which is about 2500€ it is a low cost alternative. The project uses an AD9234 evaluation kit as well as the AD9528 evaluation kit in order to generate necessary clock signals.



In oder to build the DAQLES project (daq) make:

```
 [~] mkdir daqles-dev
 [~] git clone git@github.com:NilsMinor/hdl.git
 [~] cd hdl
 [~] git checkout daqles-dev
 [~] cd projects/daq/krm3z30
 [~] make
```
Please verify you checked out the daqles-dev branch, otherwise you can not find the project folder and also do not see any changes int the files.

To run the other projects or to understand more about the working flow please visit the analog devcies reopsitory. 

- Nils
