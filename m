Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBZEO6LYQKGQE77SCI4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B91154E19
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 22:38:46 +0100 (CET)
Received: by mail-oi1-x23d.google.com with SMTP id l19sf41896oil.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 13:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nfQseC4lWM4ZhPybX/KZlmzMlhOvKEUUoqqV9xTduiE=;
        b=BSTe1hYXTG7n/NxSvGeuAohOhkKGJiXFmDf6+m1kVmYJ9mz05MNIz5DXOsohB8UVC+
         9a0D5uXFWbfIT/19288bXeRz1OwDOOGBfDrKO20va6RK0q403UK/g5NlrGs4UQ1d99s3
         VNIDtr9DkUA+/+h0wASSZIhtgSl+v+wsQc58atuPJb5MRSgcdSgYQbCppyOfeVHy+r5o
         s9WlQhUbx2cpO1Xo1dT0wXTXPVkhgUgKMhgvS22cWYqJT63lGz8fgioxsZIRhFVnozei
         VsC47MOn1vK193EaZX+kMjNqWmtmUlzHj48YzizwVpquBPhT6xV4m79EURHX9/21O3u+
         v+lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nfQseC4lWM4ZhPybX/KZlmzMlhOvKEUUoqqV9xTduiE=;
        b=JbvbJqUFuD51fs+9RPyA9Tz4vMTwBGnHDkOITuBfYeA4mhYa3DjyJncYQsb/QKOSxC
         k6yZ79l/XE68xOP5muI8+vEUeJ2cp+Kv8Ootv8J4GAQD6hc1w/oFMQx0SvQYxCxUv4dk
         KzcGKm+XoH7RRsX59bMOEfLFUv/N0YiKT/GrBT8dvqg7ZZx5ONA6g40clH+3F4rS2dlR
         lEZtmEkQhItpTw8HjPpb0dgJKu8nHa2RQJqn1qxc3D2E8xYUSPyOncmGC2jXXf3xGqnR
         AEMhz6BvxP2N1NWfpUSnRA2uDDTExcyfsPS99NhPOW03sLgSro+3577z5MLVRk7/6DFx
         pedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nfQseC4lWM4ZhPybX/KZlmzMlhOvKEUUoqqV9xTduiE=;
        b=KUaFA2FB4bJn0tenjZfkNNNjlL3Y3T1lNz8djSM4m1JWVuW3Af4mXXnN8eSII6hWFX
         eDL8PivHcAjIhRvA3KfdE7yUY3CDudtNAyPgIucsd1/1GRDkOs1elk0xQ42MyU2VXM1U
         lyzlQxIa0CADFJA5mTJXqFw93Ozy27l+rZYsOZnDZfZxLu2H7vk2S/3nl1bG312HdeOv
         mazwF05pKZYMRALc7m4x5F9y19xUDhQTeMg5onuvZcl1CqSeG+3OrtlYnYubrsMHcS9V
         X25EXSzDeGT7bJvVNzybYUIuZ1ne3897xMdB+GEdtk2c4epvTyLx+Vq6nQtqjnM9GleJ
         zRDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6AfRmG/F4matlCrFcK5BVuCGiQ775o73yrNl5DhJW6RFkIsc5
	Hfs/ch5/ytl0D9D6KVuodk0=
X-Google-Smtp-Source: APXvYqxsHK8dWBfZoXWhtp8dlYMhQtHkQ7FhXDaeExKQsRm18Q529kgRpgcAl0TRYRFfcpImRvL01g==
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr117103otl.71.1581025124935;
        Thu, 06 Feb 2020 13:38:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d549:: with SMTP id m70ls2057655oig.10.gmail; Thu, 06
 Feb 2020 13:38:44 -0800 (PST)
X-Received: by 2002:a05:6808:3ae:: with SMTP id n14mr86572oie.63.1581025124018;
        Thu, 06 Feb 2020 13:38:44 -0800 (PST)
Date: Thu, 6 Feb 2020 13:38:42 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <581d5b56-08d8-4df5-abf5-67d2856a930e@googlegroups.com>
In-Reply-To: <593714bf-cfbc-4a41-05b5-ef06f6d1d8ae@siemens.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
 <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
 <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
 <251365ff-7d39-451c-2b85-e6be4567d3b0@web.de>
 <262dbcd3-986b-4e42-9427-00b6fcd0e567@googlegroups.com>
 <593714bf-cfbc-4a41-05b5-ef06f6d1d8ae@siemens.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_103_685221992.1581025123163"
X-Original-Sender: samirroj2016@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_103_685221992.1581025123163
Content-Type: multipart/alternative; 
	boundary="----=_Part_104_1210446197.1581025123164"

------=_Part_104_1210446197.1581025123164
Content-Type: text/plain; charset="UTF-8"

Greeting Jan,
Thank you for your continuous support and help.

previously I was trying to enable jailhouse in 4.9 generic version of 
kernel and I downgraded it to 4.4 as suggested in 
-github-jailhouse-evidence-tx1-tx2 and try to enble jailhouse and I 
obtained the following results.
Now what the error seems different. I can't figure it out as it shows 
btb:smc_failed err(----) and opening jailhouse and when i tried to create 
cell system hangs.
please help me through this.

[1]-terminal command with serial console output:
[2]-cat /proc/iomem
[3]-cat /proc/cmdline
[4] extlinux.conf
[5]-jetson-tx2.c

[1]#####
==>command on jetson terminal:
nvidia@jetson-0320218169735:~/linux-jailhouse-jetson$ sudo insmod 
driver/jailhouse.ko
####
output on serial console:
[  512.182327] jailhouse: loading out-of-tree module taints kernel.

#####
==>command on jetson terminal
nvidia@jetson-0320218169735::~/linux-jailhouse-jetson$ sudo jailhouse 
enable configs/arm64/jetson-tx2.cell
####
output on serial console:
Initializing Jailhouse hypervisor  on CPU 0
Code location: 0x0000ffffc0200060
Page pool usage after early setup: mem 67/16355, remap 96/131072
Initializing processors:
 CPU 0... OK
 CPU 4... OK
 CPU 3... OK
 CPU 5... OK
Initializing unit: irqchip
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Jetson-TX2"
Adding virtual PCI device 00:0f.0 to cell "Jetson-TX2"
Page pool usage after late setup: mem 101/16355, remap 101/131072
Ac[t iv a5t7i4n.g5 7h7y5p2e1rv]is oirn




*validate_btb: smc failed, err (0xffffffff)[  574.581009] jailhouse: 
CONFIG_OF_OVERLAY disabled[  574.581011] jailhouse: failed to add virtual 
host controller[  574.581012] The Jailhouse is opening.####*
==>command on jetson terminal
nvidia@jetson-0320218169735:~/linux-jailhouse-jetson$ sudo jailhouse cell 
create configs/arm64/jetson-tx2-demo.cell

###
output on serial console:
[  910.699278] IRQ44 no longer affine to CPU0
[  910.703377] IRQ45 no longer affine to CPU0
[  910.707939] CPU0: shutdown
[  910.710747] psci: CPU0 killed.
Adding virtual PCI device 00:00.0 to cell "jetson-tx2-demo"
Shared memory connection established: "jetson-tx2-demo" <--> "Jetson-TX2"
Adding virtual PCI device 00:0f.0 to cell "jetson-tx2-demo"
Shared memory connection established: "jetson-tx2-demo" <--> "Jetson-TX2"
Created cell "jetson-tx2-demo"
Page pool usage after cell creation: mem 118/16355, remap 101/131072
Unhandled data read at 0x3100004(1)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffffffc0004b58f8   lr: ffffffc0004b8f90 spsr: 200000c5     EL1
 sp: ffffffc187bdfa50  esr: 24 1 1000007
 x0: ffffff800033c004   x1: 0000000000000004   x2: 0000000000000002
 x3: 0000000000000000   x4: 0000000000000000   x5: ffffffc0012c09c8
 x6: ffffffc0014a2872   x7: 742d6e6f7374656a   x8: 226f6d65642d3278
 x9: 00000000000003ef  x10: 0000000000000000  x11: 0000000000000006
x12: ffffffc0012d9000  x13: 0000000000000038  x14: 0ffffffffffffffe
x15: 0000000000153ef8  x16: 0000000000000001  x17: ffffffc000bd6a60
x18: 0000000000008090  x19: ffffffc0014f25a8  x20: 0000000000000001
x21: 0000000000000000  x22: ffffffc0014a2c38  x23: ffffffc001482400
x24: 0000000000000038  x25: 00000000000000c0  x26: ffffffc001482400
x27: ffffffc0014a1c88  x28: ffffffc001481e88  x29: ffffffc187bdfa50

Parking CPU 4 (Cell: "Jetson-TX2")

then the system hangs

[2]
Output of cat /proc/iomem:
02100000-02100fff : /axip2p@2100000
02110000-02110fff : /axip2p@2110000
02120000-02120fff : /axip2p@2120000
02130000-02130fff : /axip2p@2130000
02140000-02140fff : /axip2p@2140000
02150000-02150fff : /axip2p@2150000
02160000-02160fff : /axip2p@2160000
02170000-02170fff : /axip2p@2170000
02180000-02180fff : /axip2p@2180000
02190000-02190fff : /axip2p@2190000
02200000-0220ffff : security
02210000-0221ffff : gpio
02390000-02390fff : /axi2apb@2390000
023a0000-023a0fff : /axi2apb@23a0000
023b0000-023b0fff : /axi2apb@23b0000
023c0000-023c0fff : /axi2apb@23c0000
023d0000-023d0fff : /axi2apb@23d0000
02430000-02444fff : /pinmux@2430000
02600000-0280ffff : /dma@2600000
02900800-02900fff : /ahub
02901000-029010ff : tegra210-i2s.0
02901100-029011ff : tegra210-i2s.1
02901200-029012ff : tegra210-i2s.2
02901300-029013ff : tegra210-i2s.3
02901400-029014ff : tegra210-i2s.4
02901500-029015ff : tegra210-i2s.5
02902000-029021ff : tegra210-sfc.0
02902200-029023ff : tegra210-sfc.1
02902400-029025ff : tegra210-sfc.2
02902600-029027ff : tegra210-sfc.3
02903000-029030ff : tegra210-amx
02903100-029031ff : tegra210-amx
02903200-029032ff : tegra210-amx
02903300-029033ff : tegra210-amx
02903800-029038ff : tegra210-adx
02903900-029039ff : tegra210-adx
02903a00-02903aff : tegra210-adx
02903b00-02903bff : tegra210-adx
02904000-029040ff : tegra210-dmic.0
02904100-029041ff : tegra210-dmic.1
02904200-029042ff : tegra210-dmic.2
02904300-029043ff : tegra210-dmic.3
02905000-029050ff : tegra186-dspk.0
02905100-029051ff : tegra186-dspk.1
02906000-029061ff : tegra210-spdif
02907000-029070ff : tegra210-afc.0
02907100-029071ff : tegra210-afc.1
02907200-029072ff : tegra210-afc.2
02907300-029073ff : tegra210-afc.3
02907400-029074ff : tegra210-afc.4
02907500-029075ff : tegra210-afc.5
02908000-029080ff : tegra210-ope.0
02908100-029081ff : tegra210-ope.0
02908200-029083ff : tegra210-ope.0
0290a000-0290a1ff : tegra210-mvc.0
0290a200-0290a3ff : tegra210-mvc.1
0290bb00-0290c2ff : tegra210_mixer
0290f000-0290ffff : /ahub/admaif@290f000
02910000-02911fff : tegra186-asrc
02930000-0293ffff : /adma@2930000
02940000-0294ffff : /adma@2930000
02950000-0295ffff : /adma@2930000
02960000-0296ffff : /adma@2930000
02970000-0297ffff : /adma@2930000
02996000-02997fff : /adma@2930000
02c00000-02c0ffff : /mc_sid@2c00000
02c10000-02c1ffff : /mc_sid@2c00000
03010000-0301ffff : /watchdog@30c0000
03090000-0309ffff : /watchdog@30c0000
030c0000-030cffff : /watchdog@30c0000
03100000-0310003f : serial
03110000-0311003f : /serial@3110000
03130000-0313003f : /serial@3130000
03160000-031600ff : /i2c@3160000
03180000-031800ff : /i2c@3180000
03190000-031900ff : /i2c@3190000
031b0000-031b00ff : /i2c@31b0000
031c0000-031c00ff : /i2c@31c0000
031e0000-031e00ff : /i2c@31e0000
03210000-0321ffff : /spi@3210000
03240000-0324ffff : /spi@3240000
03280000-0328ffff : /pwm@3280000
03290000-0329ffff : /pwm@3290000
032a0000-032affff : /pwm@32a0000
03400000-0340020f : mmc2
03440000-0344020f : mmc1
03460000-0346020f : mmc0
03500000-03500fff : sata-ipfs
03501000-03506fff : sata-config
03507000-03508fff : sata-ahci
03510000-0351ffff : /hda@3510000
03520000-03520fff : padctl
03530000-03537fff : /xhci@3530000
03538000-03538fff : /xhci@3530000
03540000-03540fff : ao
03550000-03557fff : /xudc@3550000
03558000-03558fff : /xudc@3550000
03820000-038205ff : /efuse@3820000
03830000-0383ffff : /kfuse@0x3830000
03990000-0399ffff : 3990000.mipical
039c0000-039c000f : /tachometer@39c0000
03a90000-03a9ffff : sata-aux
03ad0000-03adffff : /se_elp@3ad0000
03ae0000-03aeffff : /se_elp@3ad0000
08010000-08010fff : /funnel_major@8010000
  08010000-08010fff : /funnel_major@8010000
08030000-08030fff : /etf@8030000
  08030000-08030fff : /etf@8030000
08050000-08050fff : /etr@8050000
  08050000-08050fff : /etr@8050000
08060000-08060fff : /tpiu@8060000
  08060000-08060fff : /tpiu@8060000
08070000-08070fff : stm-base
08820000-08820fff : /funnel_minor@8820000
  08820000-08820fff : /funnel_minor@8820000
08a1c000-08a1cfff : /ptm_bpmp@8a1c000
09010000-09010fff : /funnel_bccplex@9010000
  09010000-09010fff : /funnel_bccplex@9010000
09840000-09840fff : /ptm@9840000
  09840000-09840fff : /ptm@9840000
09940000-09940fff : /ptm@9940000
  09940000-09940fff : /ptm@9940000
09a40000-09a40fff : /ptm@9a40000
  09a40000-09a40fff : /ptm@9a40000
09b40000-09b40fff : /ptm@9b40000
  09b40000-09b40fff : /ptm@9b40000
0b1f0000-0b22ffff : sce-pm
0b230000-0b23ffff : sce-cfg
0c240000-0c2400ff : /i2c@c240000
0c250000-0c2500ff : /i2c@c250000
0c260000-0c26ffff : /spi@c260000
0c280000-0c28003f : /serial@c280000
0c2a0000-0c2a00ff : /rtc@c2a0000
0c2f0000-0c2f0fff : security
0c2f1000-0c2f1fff : gpio
0c300000-0c303fff : /pinmux@2430000
0c340000-0c34ffff : /pwm@c340000
0c360000-0c3603ff : /pmc@c360000
0c370000-0c3705ff : /pmc@c370000
0c390000-0c392ffe : /pmc@c360000
0d230000-0d230fff : /actmon@d230000
0e090000-0e09ffef : /cluster_clk_priv@e090000
0e0a0000-0e0affef : /cluster_clk_priv@e090000
0e0b0000-0e0bffef : /cluster_clk_priv@e090000
0e0c0000-0e0cffef : /cluster_clk_priv@e090000
0e0d0000-0e0dffef : /cluster_clk_priv@e090000
10000000-10000fff : /pcie-controller@10003000/pci@1,0
10004000-10004fff : /pcie-controller@10003000/pci@3,0
12000000-12ffffff : /iommu@12000000
13e00000-13e0ffff : /host1x
13e10000-13e1ffff : /host1x
13ec0000-13efffff : /host1x
150c0000-150fffff : /host1x/nvcsi@150c0000
15100000-1513ffff : /host1x/tsecb@15100000
15340000-1537ffff : /host1x/vic@15340000
15380000-153bffff : /host1x/nvjpg@15380000
15480000-154bffff : /host1x/nvdec@15480000
154c0000-154fffff : /host1x/nvenc@154c0000
15500000-1553ffff : /host1x/tsec@15500000
15600000-1563ffff : /host1x/isp@15600000
15700000-157fffff : /host1x/vi@15700000
15810000-1581ffff : /host1x/se@15810000
15820000-1582ffff : /host1x/se@15820000
15830000-1583ffff : /host1x/se@15830000
15840000-1584ffff : /host1x/se@15840000
17000000-17ffffff : /gp10b
18000000-18ffffff : /gp10b
80000000-d82fffff : System RAM
  80080000-8116efff : Kernel code
  812b6000-8152cfff : Kernel data
d9300000-efffffff : System RAM
f0200000-2681fffff : System RAM
277080000-27708ffff : persistent_ram
277090000-27709ffff : persistent_ram
2770a0000-2770affff : persistent_ram
2770b0000-2770bffff : persistent_ram
2770c0000-2770cffff : persistent_ram
2770d0000-2770dffff : persistent_ram
2770e0000-2770effff : persistent_ram
2770f0000-2770fffff : persistent_ram
277100000-27710ffff : persistent_ram
277110000-27711ffff : persistent_ram
277120000-27712ffff : persistent_ram
277130000-27713ffff : persistent_ram
277140000-27714ffff : persistent_ram
277150000-27715ffff : persistent_ram
277160000-27716ffff : persistent_ram
277170000-27717ffff : persistent_ram
277180000-27718ffff : persistent_ram
277190000-27719ffff : persistent_ram
2771a0000-2771affff : persistent_ram
2771b0000-2771bffff : persistent_ram
2771c0000-2771cffff : persistent_ram
2771d0000-2771dffff : persistent_ram
2771e0000-2771effff : persistent_ram
2771f0000-2771fffff : persistent_ram
277200000-27727ffff : persistent_ram

[3]
cat /proc/cmdline
root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t 
fbcon=map:0 net.ifnames=0 memtype=0 video=tegrafb no_console_suspend=1 
earlycon=uart8250,mmio32,0x03100000 nvdumper_reserved=0x2772e0000 gpt 
tegra_fbmem2=0x140000@0x969f0000 lut_mem2=0x2008@0x969ed000 
tegraid=18.1.2.0.0 tegra_keep_boot_clocks maxcpus=6 boot.slot_suffix= 
boot.ratchetvalues=0.2.1 androidboot.serialno=0320218169735 
bl_prof_dataptr=0x10000@0x277040000 sdhci_tegra.en_boot_part_access=1 
root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 mem=7808M

[4] 
extlinux.conf
TIMEOUT 30
DEFAULT primary

MENU TITLE p2771-0000 eMMC boot options

LABEL primary
      MENU LABEL primary kernel
      LINUX /boot/Image
      APPEND ${cbootargs} root=/dev/mmcblk0p1 rw rootwait rootfstype=ext4 
mem=7808M
[5]
jetson-tx2.c






On Tuesday, February 4, 2020 at 1:49:11 AM UTC-6, Jan Kiszka wrote:
>
> On 03.02.20 19:53, Saroj Sapkota wrote: 
> > Thank you heartily for providing and guiding. As per your suggestion, 
> > I changed the configuration file according to /proc/iomem  (edittx2.c) 
> > and tried to enable jailhouse with it hypervisor still continue to 
> > crash. Please have a look at this file serial console output, edittx2.c 
>
> Actually, it looks like it's still Linux that crashes, no hypervisor 
> output visible anywhere (you can see the normal output pattern when 
> trying the qemu-arm64 target of jailhouse-images). 
>
> > and iomemtx2.txt 
> > what are the mistakes? what will be the easiest way to enable jailhouse 
> > in tx2? 
>
> Is there regular RAM at 0x271000000 when you start Linux without mem=...? 
>
> Jan 
>
> > Thank you 
> > 
> > 
> > On Saturday, February 1, 2020 at 3:34:55 AM UTC-6, Jan Kiszka wrote: 
> > 
> >     On 30.01.20 22:00, Saroj Sapkota wrote: 
> >      > Thank you for the prompt reply Jan. 
> >      > 
> >      > ##>This means I have to compare jetson-tx2.c with /proc/iomem 
> >     addresses 
> >      > and change if there is any deviation? 
> > 
> >     Yep. 
> > 
> >      > 
> >      > ##>How the address for inmate is allocated, its the spaces of 
> >     system RAM? 
> > 
> >     That's what mem= or device tree reservations are for: Keep root 
> Linux 
> >     away from some memory that can then be used for non-root inmates and 
> >     the 
> >     hypervisor itself. 
> > 
> >      > 
> >      > ##>where and how can i find the .gicd_base = 
> 0x03881000,(.gicc_base, 
> >      > .gich_base, .gicv_base) addresses of the board? 
> >      > 
> > 
> >     Check the device tree of your target. 
> > 
> >      > ##> last thing how to define .irqchip; pin_base and pin_bitmap? 
> >      > 
> > 
> >     pin_base for the first gicd is always 32 (first SPI). The pin_bitmap 
> of 
> >     the root cell should cover all possible SPIs. If those do not fit 
> into 
> >     one irqchip, add another one with an appropriate pin_base. 
> > 
> >     For non-root cells, you only specify the SPIs that those should 
> "steal" 
> >     from the root cell. 
> > 
> >     Jan 
> > 
> > -- 
> > You received this message because you are subscribed to the Google 
> > Groups "Jailhouse" group. 
> > To unsubscribe from this group and stop receiving emails from it, send 
> > an email to jailho...@googlegroups.com <javascript:> 
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>. 
> > To view this discussion on the web visit 
> > 
> https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com 
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>
>
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/581d5b56-08d8-4df5-abf5-67d2856a930e%40googlegroups.com.

------=_Part_104_1210446197.1581025123164
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greeting Jan,</div><div>Thank you for your continuous=
 support and help.</div><div><br></div><div>previously I was trying to enab=
le jailhouse in 4.9 generic version of kernel and I downgraded it to 4.4 as=
 suggested in -github-jailhouse-evidence-tx1-tx2 and try to enble jailhouse=
 and I obtained the following results.</div><div>Now what the error seems d=
ifferent. I can&#39;t figure it out as it shows btb:smc_failed err(----) an=
d opening jailhouse and when i tried to create cell system hangs.</div><div=
>please help me through this.<br></div><div><br></div>[1]-terminal command =
with serial console output:<br>[2]-cat /proc/iomem<br>[3]-cat /proc/cmdline=
<br>[4] extlinux.conf<br>[5]-jetson-tx2.c<br><br>[1]#####<br>=3D=3D&gt;comm=
and on jetson terminal:<br>nvidia@jetson-0320218169735:~/linux-jailhouse-je=
tson$ sudo insmod driver/jailhouse.ko<br>####<br>output on serial console:<=
br>[=C2=A0 512.182327] jailhouse: loading out-of-tree module taints kernel.=
<br><br>#####<br>=3D=3D&gt;command on jetson terminal<br>nvidia@jetson-0320=
218169735::~/linux-jailhouse-jetson$ sudo jailhouse enable configs/arm64/je=
tson-tx2.cell<br>####<br>output on serial console:<br>Initializing Jailhous=
e hypervisor=C2=A0 on CPU 0<br>Code location: 0x0000ffffc0200060<br>Page po=
ol usage after early setup: mem 67/16355, remap 96/131072<br>Initializing p=
rocessors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 4... OK<br>=C2=A0CPU 3... OK<b=
r>=C2=A0CPU 5... OK<br>Initializing unit: irqchip<br>Initializing unit: PCI=
<br>Adding virtual PCI device 00:00.0 to cell &quot;Jetson-TX2&quot;<br>Add=
ing virtual PCI device 00:0f.0 to cell &quot;Jetson-TX2&quot;<br>Page pool =
usage after late setup: mem 101/16355, remap 101/131072<br>Ac[t iv a5t7i4n.=
g5 7h7y5p2e1rv]is oirn<br><b>validate_btb: smc failed, err (0xffffffff)<br>=
[=C2=A0 574.581009] jailhouse: CONFIG_OF_OVERLAY disabled<br>[=C2=A0 574.58=
1011] jailhouse: failed to add virtual host controller<br>[=C2=A0 574.58101=
2] The Jailhouse is opening.<br>####</b><br>=3D=3D&gt;command on jetson ter=
minal<br>nvidia@jetson-0320218169735:~/linux-jailhouse-jetson$ sudo jailhou=
se cell create configs/arm64/jetson-tx2-demo.cell<br><br>###<br>output on s=
erial console:<br>[=C2=A0 910.699278] IRQ44 no longer affine to CPU0<br>[=
=C2=A0 910.703377] IRQ45 no longer affine to CPU0<br>[=C2=A0 910.707939] CP=
U0: shutdown<br>[=C2=A0 910.710747] psci: CPU0 killed.<br>Adding virtual PC=
I device 00:00.0 to cell &quot;jetson-tx2-demo&quot;<br>Shared memory conne=
ction established: &quot;jetson-tx2-demo&quot; &lt;--&gt; &quot;Jetson-TX2&=
quot;<br>Adding virtual PCI device 00:0f.0 to cell &quot;jetson-tx2-demo&qu=
ot;<br>Shared memory connection established: &quot;jetson-tx2-demo&quot; &l=
t;--&gt; &quot;Jetson-TX2&quot;<br>Created cell &quot;jetson-tx2-demo&quot;=
<br>Page pool usage after cell creation: mem 118/16355, remap 101/131072<br=
>Unhandled data read at 0x3100004(1)<br><br>FATAL: unhandled trap (exceptio=
n class 0x24)<br>Cell state before exception:<br>=C2=A0pc: ffffffc0004b58f8=
=C2=A0=C2=A0 lr: ffffffc0004b8f90 spsr: 200000c5=C2=A0=C2=A0=C2=A0=C2=A0 EL=
1<br>=C2=A0sp: ffffffc187bdfa50=C2=A0 esr: 24 1 1000007<br>=C2=A0x0: ffffff=
800033c004=C2=A0=C2=A0 x1: 0000000000000004=C2=A0=C2=A0 x2: 000000000000000=
2<br>=C2=A0x3: 0000000000000000=C2=A0=C2=A0 x4: 0000000000000000=C2=A0=C2=
=A0 x5: ffffffc0012c09c8<br>=C2=A0x6: ffffffc0014a2872=C2=A0=C2=A0 x7: 742d=
6e6f7374656a=C2=A0=C2=A0 x8: 226f6d65642d3278<br>=C2=A0x9: 00000000000003ef=
=C2=A0 x10: 0000000000000000=C2=A0 x11: 0000000000000006<br>x12: ffffffc001=
2d9000=C2=A0 x13: 0000000000000038=C2=A0 x14: 0ffffffffffffffe<br>x15: 0000=
000000153ef8=C2=A0 x16: 0000000000000001=C2=A0 x17: ffffffc000bd6a60<br>x18=
: 0000000000008090=C2=A0 x19: ffffffc0014f25a8=C2=A0 x20: 0000000000000001<=
br>x21: 0000000000000000=C2=A0 x22: ffffffc0014a2c38=C2=A0 x23: ffffffc0014=
82400<br>x24: 0000000000000038=C2=A0 x25: 00000000000000c0=C2=A0 x26: fffff=
fc001482400<br>x27: ffffffc0014a1c88=C2=A0 x28: ffffffc001481e88=C2=A0 x29:=
 ffffffc187bdfa50<br><br>Parking CPU 4 (Cell: &quot;Jetson-TX2&quot;)<br><b=
r>then the system hangs<br><br>[2]<br>Output of cat /proc/iomem:<br>0210000=
0-02100fff : /axip2p@2100000<br>02110000-02110fff : /axip2p@2110000<br>0212=
0000-02120fff : /axip2p@2120000<br>02130000-02130fff : /axip2p@2130000<br>0=
2140000-02140fff : /axip2p@2140000<br>02150000-02150fff : /axip2p@2150000<b=
r>02160000-02160fff : /axip2p@2160000<br>02170000-02170fff : /axip2p@217000=
0<br>02180000-02180fff : /axip2p@2180000<br>02190000-02190fff : /axip2p@219=
0000<br>02200000-0220ffff : security<br>02210000-0221ffff : gpio<br>0239000=
0-02390fff : /axi2apb@2390000<br>023a0000-023a0fff : /axi2apb@23a0000<br>02=
3b0000-023b0fff : /axi2apb@23b0000<br>023c0000-023c0fff : /axi2apb@23c0000<=
br>023d0000-023d0fff : /axi2apb@23d0000<br>02430000-02444fff : /pinmux@2430=
000<br>02600000-0280ffff : /dma@2600000<br>02900800-02900fff : /ahub<br>029=
01000-029010ff : tegra210-i2s.0<br>02901100-029011ff : tegra210-i2s.1<br>02=
901200-029012ff : tegra210-i2s.2<br>02901300-029013ff : tegra210-i2s.3<br>0=
2901400-029014ff : tegra210-i2s.4<br>02901500-029015ff : tegra210-i2s.5<br>=
02902000-029021ff : tegra210-sfc.0<br>02902200-029023ff : tegra210-sfc.1<br=
>02902400-029025ff : tegra210-sfc.2<br>02902600-029027ff : tegra210-sfc.3<b=
r>02903000-029030ff : tegra210-amx<br>02903100-029031ff : tegra210-amx<br>0=
2903200-029032ff : tegra210-amx<br>02903300-029033ff : tegra210-amx<br>0290=
3800-029038ff : tegra210-adx<br>02903900-029039ff : tegra210-adx<br>02903a0=
0-02903aff : tegra210-adx<br>02903b00-02903bff : tegra210-adx<br>02904000-0=
29040ff : tegra210-dmic.0<br>02904100-029041ff : tegra210-dmic.1<br>0290420=
0-029042ff : tegra210-dmic.2<br>02904300-029043ff : tegra210-dmic.3<br>0290=
5000-029050ff : tegra186-dspk.0<br>02905100-029051ff : tegra186-dspk.1<br>0=
2906000-029061ff : tegra210-spdif<br>02907000-029070ff : tegra210-afc.0<br>=
02907100-029071ff : tegra210-afc.1<br>02907200-029072ff : tegra210-afc.2<br=
>02907300-029073ff : tegra210-afc.3<br>02907400-029074ff : tegra210-afc.4<b=
r>02907500-029075ff : tegra210-afc.5<br>02908000-029080ff : tegra210-ope.0<=
br>02908100-029081ff : tegra210-ope.0<br>02908200-029083ff : tegra210-ope.0=
<br>0290a000-0290a1ff : tegra210-mvc.0<br>0290a200-0290a3ff : tegra210-mvc.=
1<br>0290bb00-0290c2ff : tegra210_mixer<br>0290f000-0290ffff : /ahub/admaif=
@290f000<br>02910000-02911fff : tegra186-asrc<br>02930000-0293ffff : /adma@=
2930000<br>02940000-0294ffff : /adma@2930000<br>02950000-0295ffff : /adma@2=
930000<br>02960000-0296ffff : /adma@2930000<br>02970000-0297ffff : /adma@29=
30000<br>02996000-02997fff : /adma@2930000<br>02c00000-02c0ffff : /mc_sid@2=
c00000<br>02c10000-02c1ffff : /mc_sid@2c00000<br>03010000-0301ffff : /watch=
dog@30c0000<br>03090000-0309ffff : /watchdog@30c0000<br>030c0000-030cffff :=
 /watchdog@30c0000<br>03100000-0310003f : serial<br>03110000-0311003f : /se=
rial@3110000<br>03130000-0313003f : /serial@3130000<br>03160000-031600ff : =
/i2c@3160000<br>03180000-031800ff : /i2c@3180000<br>03190000-031900ff : /i2=
c@3190000<br>031b0000-031b00ff : /i2c@31b0000<br>031c0000-031c00ff : /i2c@3=
1c0000<br>031e0000-031e00ff : /i2c@31e0000<br>03210000-0321ffff : /spi@3210=
000<br>03240000-0324ffff : /spi@3240000<br>03280000-0328ffff : /pwm@3280000=
<br>03290000-0329ffff : /pwm@3290000<br>032a0000-032affff : /pwm@32a0000<br=
>03400000-0340020f : mmc2<br>03440000-0344020f : mmc1<br>03460000-0346020f =
: mmc0<br>03500000-03500fff : sata-ipfs<br>03501000-03506fff : sata-config<=
br>03507000-03508fff : sata-ahci<br>03510000-0351ffff : /hda@3510000<br>035=
20000-03520fff : padctl<br>03530000-03537fff : /xhci@3530000<br>03538000-03=
538fff : /xhci@3530000<br>03540000-03540fff : ao<br>03550000-03557fff : /xu=
dc@3550000<br>03558000-03558fff : /xudc@3550000<br>03820000-038205ff : /efu=
se@3820000<br>03830000-0383ffff : /kfuse@0x3830000<br>03990000-0399ffff : 3=
990000.mipical<br>039c0000-039c000f : /tachometer@39c0000<br>03a90000-03a9f=
fff : sata-aux<br>03ad0000-03adffff : /se_elp@3ad0000<br>03ae0000-03aeffff =
: /se_elp@3ad0000<br>08010000-08010fff : /funnel_major@8010000<br>=C2=A0 08=
010000-08010fff : /funnel_major@8010000<br>08030000-08030fff : /etf@8030000=
<br>=C2=A0 08030000-08030fff : /etf@8030000<br>08050000-08050fff : /etr@805=
0000<br>=C2=A0 08050000-08050fff : /etr@8050000<br>08060000-08060fff : /tpi=
u@8060000<br>=C2=A0 08060000-08060fff : /tpiu@8060000<br>08070000-08070fff =
: stm-base<br>08820000-08820fff : /funnel_minor@8820000<br>=C2=A0 08820000-=
08820fff : /funnel_minor@8820000<br>08a1c000-08a1cfff : /ptm_bpmp@8a1c000<b=
r>09010000-09010fff : /funnel_bccplex@9010000<br>=C2=A0 09010000-09010fff :=
 /funnel_bccplex@9010000<br>09840000-09840fff : /ptm@9840000<br>=C2=A0 0984=
0000-09840fff : /ptm@9840000<br>09940000-09940fff : /ptm@9940000<br>=C2=A0 =
09940000-09940fff : /ptm@9940000<br>09a40000-09a40fff : /ptm@9a40000<br>=C2=
=A0 09a40000-09a40fff : /ptm@9a40000<br>09b40000-09b40fff : /ptm@9b40000<br=
>=C2=A0 09b40000-09b40fff : /ptm@9b40000<br>0b1f0000-0b22ffff : sce-pm<br>0=
b230000-0b23ffff : sce-cfg<br>0c240000-0c2400ff : /i2c@c240000<br>0c250000-=
0c2500ff : /i2c@c250000<br>0c260000-0c26ffff : /spi@c260000<br>0c280000-0c2=
8003f : /serial@c280000<br>0c2a0000-0c2a00ff : /rtc@c2a0000<br>0c2f0000-0c2=
f0fff : security<br>0c2f1000-0c2f1fff : gpio<br>0c300000-0c303fff : /pinmux=
@2430000<br>0c340000-0c34ffff : /pwm@c340000<br>0c360000-0c3603ff : /pmc@c3=
60000<br>0c370000-0c3705ff : /pmc@c370000<br>0c390000-0c392ffe : /pmc@c3600=
00<br>0d230000-0d230fff : /actmon@d230000<br>0e090000-0e09ffef : /cluster_c=
lk_priv@e090000<br>0e0a0000-0e0affef : /cluster_clk_priv@e090000<br>0e0b000=
0-0e0bffef : /cluster_clk_priv@e090000<br>0e0c0000-0e0cffef : /cluster_clk_=
priv@e090000<br>0e0d0000-0e0dffef : /cluster_clk_priv@e090000<br>10000000-1=
0000fff : /pcie-controller@10003000/pci@1,0<br>10004000-10004fff : /pcie-co=
ntroller@10003000/pci@3,0<br>12000000-12ffffff : /iommu@12000000<br>13e0000=
0-13e0ffff : /host1x<br>13e10000-13e1ffff : /host1x<br>13ec0000-13efffff : =
/host1x<br>150c0000-150fffff : /host1x/nvcsi@150c0000<br>15100000-1513ffff =
: /host1x/tsecb@15100000<br>15340000-1537ffff : /host1x/vic@15340000<br>153=
80000-153bffff : /host1x/nvjpg@15380000<br>15480000-154bffff : /host1x/nvde=
c@15480000<br>154c0000-154fffff : /host1x/nvenc@154c0000<br>15500000-1553ff=
ff : /host1x/tsec@15500000<br>15600000-1563ffff : /host1x/isp@15600000<br>1=
5700000-157fffff : /host1x/vi@15700000<br>15810000-1581ffff : /host1x/se@15=
810000<br>15820000-1582ffff : /host1x/se@15820000<br>15830000-1583ffff : /h=
ost1x/se@15830000<br>15840000-1584ffff : /host1x/se@15840000<br>17000000-17=
ffffff : /gp10b<br>18000000-18ffffff : /gp10b<br>80000000-d82fffff : System=
 RAM<br>=C2=A0 80080000-8116efff : Kernel code<br>=C2=A0 812b6000-8152cfff =
: Kernel data<br>d9300000-efffffff : System RAM<br>f0200000-2681fffff : Sys=
tem RAM<br>277080000-27708ffff : persistent_ram<br>277090000-27709ffff : pe=
rsistent_ram<br>2770a0000-2770affff : persistent_ram<br>2770b0000-2770bffff=
 : persistent_ram<br>2770c0000-2770cffff : persistent_ram<br>2770d0000-2770=
dffff : persistent_ram<br>2770e0000-2770effff : persistent_ram<br>2770f0000=
-2770fffff : persistent_ram<br>277100000-27710ffff : persistent_ram<br>2771=
10000-27711ffff : persistent_ram<br>277120000-27712ffff : persistent_ram<br=
>277130000-27713ffff : persistent_ram<br>277140000-27714ffff : persistent_r=
am<br>277150000-27715ffff : persistent_ram<br>277160000-27716ffff : persist=
ent_ram<br>277170000-27717ffff : persistent_ram<br>277180000-27718ffff : pe=
rsistent_ram<br>277190000-27719ffff : persistent_ram<br>2771a0000-2771affff=
 : persistent_ram<br>2771b0000-2771bffff : persistent_ram<br>2771c0000-2771=
cffff : persistent_ram<br>2771d0000-2771dffff : persistent_ram<br>2771e0000=
-2771effff : persistent_ram<br>2771f0000-2771fffff : persistent_ram<br>2772=
00000-27727ffff : persistent_ram<br><br>[3]<br>cat /proc/cmdline<br>root=3D=
/dev/mmcblk0p1 rw rootwait console=3DttyS0,115200n8 console=3Dtty0 OS=3Dl4t=
 fbcon=3Dmap:0 net.ifnames=3D0 memtype=3D0 video=3Dtegrafb no_console_suspe=
nd=3D1 earlycon=3Duart8250,mmio32,0x03100000 nvdumper_reserved=3D0x2772e000=
0 gpt tegra_fbmem2=3D0x140000@0x969f0000 lut_mem2=3D0x2008@0x969ed000 tegra=
id=3D18.1.2.0.0 tegra_keep_boot_clocks maxcpus=3D6 boot.slot_suffix=3D boot=
.ratchetvalues=3D0.2.1 androidboot.serialno=3D0320218169735 bl_prof_dataptr=
=3D0x10000@0x277040000 sdhci_tegra.en_boot_part_access=3D1 root=3D/dev/mmcb=
lk0p1 rw rootwait rootfstype=3Dext4 mem=3D7808M<br><br>[4] <br>extlinux.con=
f<br>TIMEOUT 30<br>DEFAULT primary<br><br>MENU TITLE p2771-0000 eMMC boot o=
ptions<br><br>LABEL primary<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MENU LABEL pr=
imary kernel<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX /boot/Image<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 APPEND ${cbootargs} root=3D/dev/mmcblk0p1 rw rootw=
ait rootfstype=3Dext4 mem=3D7808M<br>[5]<br>jetson-tx2.c<br><br><br><br><br=
><br><br>On Tuesday, February 4, 2020 at 1:49:11 AM UTC-6, Jan Kiszka wrote=
:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bo=
rder-left: 1px #ccc solid;padding-left: 1ex;">On 03.02.20 19:53, Saroj Sapk=
ota wrote:
<br>&gt; Thank you heartily for providing and guiding. As per your suggesti=
on,
<br>&gt; I changed the configuration file according to /proc/iomem=C2=A0 (e=
dittx2.c)=20
<br>&gt; and tried to enable jailhouse with it hypervisor still continue to=
=20
<br>&gt; crash. Please have a look at this file serial console output, edit=
tx2.c=20
<br>
<br>Actually, it looks like it&#39;s still Linux that crashes, no hyperviso=
r=20
<br>output visible anywhere (you can see the normal output pattern when=20
<br>trying the qemu-arm64 target of jailhouse-images).
<br>
<br>&gt; and iomemtx2.txt
<br>&gt; what are the mistakes? what will be the easiest way to enable jail=
house=20
<br>&gt; in tx2?
<br>
<br>Is there regular RAM at 0x271000000 when you start Linux without mem=3D=
...?
<br>
<br>Jan
<br>
<br>&gt; Thank you
<br>&gt;=20
<br>&gt;=20
<br>&gt; On Saturday, February 1, 2020 at 3:34:55 AM UTC-6, Jan Kiszka wrot=
e:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 30.01.20 22:00, Saroj Sapkota wrote:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Thank you for the prompt reply Jan.
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ##&gt;This means I have to compare jetson=
-tx2.c with /proc/iomem
<br>&gt; =C2=A0 =C2=A0 addresses
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; and change if there is any deviation?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Yep.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ##&gt;How the address for inmate is alloc=
ated, its the spaces of
<br>&gt; =C2=A0 =C2=A0 system RAM?
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 That&#39;s what mem=3D or device tree reservations a=
re for: Keep root Linux
<br>&gt; =C2=A0 =C2=A0 away from some memory that can then be used for non-=
root inmates and
<br>&gt; =C2=A0 =C2=A0 the
<br>&gt; =C2=A0 =C2=A0 hypervisor itself.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ##&gt;where and how can i find the .gicd_=
base =3D 0x03881000,(.gicc_base,
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; .gich_base, .gicv_base) addresses of the =
board?
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Check the device tree of your target.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; ##&gt; last thing how to define .irqchip;=
 pin_base and pin_bitmap?
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 pin_base for the first gicd is always 32 (first SPI)=
. The pin_bitmap of
<br>&gt; =C2=A0 =C2=A0 the root cell should cover all possible SPIs. If tho=
se do not fit into
<br>&gt; =C2=A0 =C2=A0 one irqchip, add another one with an appropriate pin=
_base.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 For non-root cells, you only specify the SPIs that t=
hose should &quot;steal&quot;
<br>&gt; =C2=A0 =C2=A0 from the root cell.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscat=
ed-mailto=3D"AP9_me0pEwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39=
;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39=
;;return true;">jailho...@<wbr>googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"AP9_me0pEwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/262dbcd=
3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/262dbc=
d3-<wbr>986b-4e42-9427-00b6fcd0e567%<wbr>40googlegroups.com</a>=20
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/262=
dbcd3-986b-4e42-9427-00b6fcd0e567%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b=
-4e42-9427-00b6fcd0e567%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-00b6fcd0e567%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/262dbcd3-<wbr>986b-4e=
42-9427-00b6fcd0e567%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br>
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/581d5b56-08d8-4df5-abf5-67d2856a930e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/581d5b56-08d8-4df5-abf5-67d2856a930e%40googlegroups.com<=
/a>.<br />

------=_Part_104_1210446197.1581025123164--

------=_Part_103_685221992.1581025123163
Content-Type: text/x-csrc; charset=US-ASCII; name=jetson-tx2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jetson-tx2.c
X-Attachment-Id: 1d57fdc1-17af-4b43-8073-4eb4468de83a
Content-ID: <1d57fdc1-17af-4b43-8073-4eb4468de83a>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Jailhouse Jetson TX2 board
 *
 * Copyright (C) 2018 Evidence Srl
 *
 * Authors:
 *  Claudio Scordino <claudio@evidence.eu.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * NOTE: Add "mem=7808M vmalloc=512M" to the kernel command line.
 *
 *	2:7000:0000 inmate (size: 100:0000 = 16 MB)
 *	2:7100:0000 hypervisor (size: 400:0000 = 64 MB)
 *
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[66];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pci_device pci_devices[2];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.hypervisor_memory = {
			.phys_start = 0x271000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x3100000,
			.size = 0x10000,
			.flags = JAILHOUSE_CON1_TYPE_8250 |
				 JAILHOUSE_CON1_ACCESS_MMIO |
				 JAILHOUSE_CON1_REGDIST_4 |
				 JAILHOUSE_CON2_TYPE_ROOTPAGE,
		},
		.platform_info = {
			/* .pci_mmconfig_base is fixed; if you change it,
                         update the value in inmates/lib/arm-common/pci.c
                         (PCI_CFG_BASE) and regenerate the inmate library*/
                        .pci_mmconfig_base = 0x40000000, 
                        .pci_mmconfig_end_bus = 0x0,
                        .pci_is_virtual = 1,

			.arm = {
				.gicd_base = 0x03881000,
				.gicc_base = 0x03882000,
				.gich_base = 0x03884000,
				.gicv_base = 0x03886000,
				.gic_version = 2,
				.maintenance_irq = 25,
			}
		},
		.root_cell = {
			.name = "Jetson-TX2",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.vpci_irq_base = 288,
		},
	},

	.cpus = {
		0x39,
	},


	.mem_regions = {
		/* BPMP_ATCM */ {
                        .phys_start = 0x00000000,
                        .virt_start = 0x00000000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* MISC */ {
                        .phys_start = 0x00100000,
                        .virt_start = 0x00100000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* AXIP2P */ {
			.phys_start = 0x02100000,
			.virt_start = 0x02100000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPIO_CTL */ {
			.phys_start = 0x02200000,
			.virt_start = 0x02200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AXI2APB */ {
			.phys_start = 0x02300000,
			.virt_start = 0x02300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},

		/* TSA */ {
			.phys_start = 0x2400000,
			.virt_start = 0x2400000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PADCTL_A (PINMUX) */ {
			.phys_start = 0x02430000,
			.virt_start = 0x02430000,
			.size = 0x15000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UFSHC */ {
			.phys_start = 0x02450000,
			.virt_start = 0x02450000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ETHER_QOS */ {
			.phys_start = 0x02490000,
			.virt_start = 0x02490000,
			.size = 0x50000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPCDMA */ {
			.phys_start = 0x02600000,
			.virt_start = 0x02600000,
			.size = 0x210000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* APE */ {
			.phys_start = 0x02900000,
			.virt_start = 0x02900000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MSS */ {
			.phys_start = 0x02c00000,
			.virt_start = 0x02c00000,
			.size = 0xb0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* LIC */ {
                        .phys_start = 0x03000000,
                        .virt_start = 0x03000000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* TOP_TKE */ {
			.phys_start = 0x03010000,
			.virt_start = 0x03010000,
			.size = 0xe0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TIMER */ {
                        .phys_start = 0x03020000,
                        .virt_start = 0x03020000,
                        .size = 0xa0000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* UARTA */ {
			.phys_start = 0x03100000,
			.virt_start = 0x03100000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				     JAILHOUSE_MEM_EXECUTE,
		},
		/* UART-B */ {
			.phys_start = 0x03110000,
			.virt_start = 0x03110000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* I2C */ {
			.phys_start = 0x03160000,
			.virt_start = 0x03160000,
			.size = 0x90000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PWM1 + PWM2 */ {
			.phys_start = 0x03280000,
			.virt_start = 0x03280000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PWM3 - PWM8 */ {
			.phys_start = 0x032a0000,
			.virt_start = 0x032a0000,
			.size = 0x60000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SDMMC */ {
			.phys_start = 0x3400000,
			.virt_start = 0x3400000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SATA */ {
			.phys_start = 0x3500000,
			.virt_start = 0x3500000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HDA */ {
			.phys_start = 0x3510000,
			.virt_start = 0x3510000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB_PADCTL + XUSB_HOST */ {
			.phys_start = 0x3520000,
			.virt_start = 0x3520000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* XUSB */ {
			.phys_start = 0x03540000,
			.virt_start = 0x03540000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* FUSE + KFUSE */ {
			.phys_start = 0x03820000,
			.virt_start = 0x03820000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MIPICAL */ {
			.phys_start = 0x03990000,
			.virt_start = 0x03990000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TACH_0 */ {
			.phys_start = 0x039c0000,
			.virt_start = 0x039c0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE0 */ {
			.phys_start = 0x03ac0000,
			.virt_start = 0x03ac0000,
			.size = 0x30000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TOP0_HSP */{
                        .phys_start = 0x03c00000,
                        .virt_start = 0x03c00000,
                        .size = 0xa0000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* VIC CAR */{
                        .phys_start = 0x05560000,
                        .virt_start = 0x05560000,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* CSITE */ {
			.phys_start = 0x08000000,
			.virt_start = 0x08000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE VIC registers */ {
			.phys_start = 0x0b020000,
			.virt_start = 0x0b020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_PM */ {
			.phys_start = 0x0b1f0000,
			.virt_start = 0x0b1f0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SCE_CFG */ {
			.phys_start = 0x0b230000,
			.virt_start = 0x0b230000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON VIC registers */ {
			.phys_start = 0x0c020000,
			.virt_start = 0x0c020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* More I2C + SPI2 */ {
			.phys_start = 0x0c230000,
			.virt_start = 0x0c230000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* UARTC, UARTG, RTC, TSC */ {
			.phys_start = 0x0c280000,
			.virt_start = 0x0c280000,
			.size = 0x70000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON_GPIO_0 */ {
			.phys_start = 0x0c2f0000,
			.virt_start = 0x0c2f0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* AON_PADCTL_0 (PINMUX) */ {
			.phys_start = 0x0c300000,
			.virt_start = 0x0c300000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CAN 1, CAN2 */ {
			.phys_start = 0x0c310000,
			.virt_start = 0x0c310000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*PWM4 (FAN) */ {
			.phys_start = 0x0c340000,
			.virt_start = 0x0c340000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* PMC */ {
			.phys_start = 0x0c360000,
			.virt_start = 0x0c360000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* BPMP VIC registers */ {
			.phys_start = 0x0d020000,
			.virt_start = 0x0d020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* ACTMON  + SIMON + SOC_THERM */ {
			.phys_start = 0x0d230000,
			.virt_start = 0x0d230000,
			.size = 0x70000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/*CCPLEX CLUSTER*/{
                        .phys_start = 0x0e000000,
                        .virt_start = 0x0e000000,
                        .size = 0x400000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* PCIE0 */ {
			.phys_start = 0x10000000,
			.virt_start = 0x10000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SMMU0 */ {
			.phys_start = 0x12000000,
			.virt_start = 0x12000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HOST1X */ {
			.phys_start = 0x13e00000,
			.virt_start = 0x13e00000,
			.size = 0x90000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* HOST1X_ACTMON */ {
			.phys_start = 0x13ec0000,
			.virt_start = 0x13ec0000,
			.size = 0x50000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DPAUX1 */ {
			.phys_start = 0x15040000,
			.virt_start = 0x15040000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVCSI */ {
			.phys_start = 0x150c0000,
			.virt_start = 0x150c0000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* TSECB */ {
			.phys_start = 0x15100000,
			.virt_start = 0x15100000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVDISPLAY */ {
                        .phys_start = 0x15200000,
                        .virt_start = 0x15200000,
                        .size = 0x40000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },
		/* VIC */ {
			.phys_start = 0x15340000,
			.virt_start = 0x15340000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVJPG */ {
			.phys_start = 0x15380000,
			.virt_start = 0x15380000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NVDEC + NVENC + TSEC + ISP  + SOR */ {
			.phys_start = 0x15480000,
			.virt_start = 0x15480000,
			.size = 0x1c0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* NI */ {
			.phys_start = 0x15700000,
			.virt_start = 0x15700000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SE1-SE4 */ {
			.phys_start = 0x15810000,
			.virt_start = 0x15810000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* GPU */ {
			.phys_start = 0x17000000,
			.virt_start = 0x17000000,
			.size = 0x9000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* SYSRAM_0 */{
                        .phys_start = 0x30000000,
                        .virt_start = 0x30000000,
                        .size = 0x10000000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE,
                },

		/* System RAM */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x1F0000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Inmate */ {
			.phys_start = 0x270000000,
			.virt_start = 0x270000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* Persistent RAM */ {
			.phys_start = 0x277080000,
			.virt_start = 0x277080000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVHSMEM  1*/ {
                        .phys_start = 0x275000000,
                        .virt_start = 0x275000000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,

                },

                /* IVHSMEM  2*/ {
                        .phys_start = 0x275200000,
                        .virt_start = 0x275200000,
                        .size = 0x1000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
                },
	},
	.irqchips = {
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 160,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* GIC */ {
			.address = 0x03881000,
			.pin_base = 288,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0x0 << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 64,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
                        .domain = 0x0,

                },

                {
                        .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
                        .bdf = 0xf << 3,
                        .bar_mask = {
                                0xffffff00, 0xffffffff, 0x00000000,
                                0x00000000, 0x00000000, 0x00000000,
                        },

                        /*num_msix_vectors needs to be 0 for INTx operation*/
                        .num_msix_vectors = 0,
                        .shmem_region = 65,
                        .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
			.domain = 0x0,

                },
        },


};

------=_Part_103_685221992.1581025123163
Content-Type: text/plain; charset=US-ASCII; name=linux_boot.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=linux_boot.txt
X-Attachment-Id: 121906e6-43eb-4d0b-916b-fc887e5d9810
Content-ID: <121906e6-43eb-4d0b-916b-fc887e5d9810>

[0000.266] I> Welcome to MB2(TBoot-BPMP)(version: 01.00.160913-t186-M-00.00-mobile-bcc33104)
[0000.274] I> Default Heap @ [0xd486400 - 0xd488400]
[0000.279] I> DMA Heap @ [0x85200000 - 0x86200000]
[0000.284] I> bit @ 0xd480000
[0000.287] I> BR-BCT relocated to 0xd7020000
[0000.291] I> Boot-device: eMMC
[0000.295] I> sdmmc bdev is already initialized
[0000.299] I> pmic: reset reason (nverc)        : 0x80
[0000.304] I> Reading GPT from 512 for device 00000003
[0000.310] I> Reading GPT from 8388096 for device 00000003
[0000.317] I> Found 14 partitions in 00000003 device
[0000.322] I> Reading GPT from 512 for device 00010003
[0000.328] I> Found 29 partitions in 00010003 device
[0000.334] W> No valid slot number is found in scratch register
[0000.339] W> Return default slot: _a
[0000.343] I> A/B: bin_type (16) slot 0
[0000.346] I> Loading partition bpmp-fw at 0xd7800000
[0000.351] I> Reading two headers - addr:0xd7800000 blocks:1
[0000.357] I> Addr: 0xd7800000, start-block: 58761224, num_blocks: 1
[0000.372] I> Binary(16) of size 532656 is loaded @ 0xd7800000
[0000.377] W> No valid slot number is found in scratch register
[0000.383] W> Return default slot: _a
[0000.386] I> A/B: bin_type (17) slot 0
[0000.390] I> Loading partition bpmp-fw-dtb at 0xd79f0000
[0000.395] I> Reading two headers - addr:0xd79f0000 blocks:1
[0000.401] I> Addr: 0xd79f0000, start-block: 58763640, num_blocks: 1
[0000.414] I> Binary(17) of size 465760 is loaded @ 0xd798e200
[0000.592] I> BPMP-FW load address = 0xd7800000
[0000.597] I> BPMP-FW DTB load address = 0x5018e200
[0000.601] I> Loading SCE-FW ...
[0000.604] W> No valid slot number is found in scratch register
[0000.610] W> Return default slot: _a
[0000.614] I> A/B: bin_type (12) slot 0
[0000.617] I> Loading partition sce-fw at 0xd7300000
[0000.622] I> Reading two headers - addr:0xd7300000 blocks:1
[0000.627] I> Addr: 0xd7300000, start-block: 58765640, num_blocks: 1
[0000.636] I> Binary(12) of size 76592 is loaded @ 0xd7300000
[0000.642] I> Init SCE
[0000.644] I> Copy BTCM section
[0000.647] W> No valid slot number is found in scratch register
[0000.653] W> Return default slot: _a
[0000.656] I> A/B: bin_type (13) slot 0
[0000.660] I> Loading partition cpu-bootloader at 0x96000000
[0000.665] I> Reading two headers - addr:0x96000000 blocks:1
[0000.671] I> Addr: 0x96000000, start-block: 58740744, num_blocks: 1
[0000.682] I> Binary(13) of size 294880 is loaded @ 0x96000000
[0000.688] W> No valid slot number is found in scratch register
[0000.693] W> Return default slot: _a
[0000.697] I> A/B: bin_type (20) slot 0
[0000.700] I> Loading partition bootloader-dtb at 0x8520f400
[0000.706] I> Reading two headers - addr:0x8520f400 blocks:1
[0000.711] I> Addr: 0x8520f400, start-block: 58742792, num_blocks: 1
[0000.723] I> Binary(20) of size 280256 is loaded @ 0x8520f400
[0000.728] I> MB2-params(VA) @ 0xd7000000
[0000.732] I> CPUBL-params(VA) @ 0xd7000000
[0000.736] I> CPUBL-params(PA) @ 0x277000000
[0000.740] I> CPU-BL loaded @ PA 0x96000000
[0000.744] I> Loading TOS ...
[0000.747] W> No valid slot number is found in scratch register
[0000.753] W> Return default slot: _a
[0000.756] I> A/B: bin_type (14) slot 0
[0000.760] I> Loading partition secure-os at 0x8530f600
[0000.765] I> Reading two headers - addr:0x8530f600 blocks:1
[0000.770] I> Addr: 0x8530f600, start-block: 58744840, num_blocks: 1
[0000.779] I> Binary(14) of size 62688 is loaded @ 0x8530f600
[0000.784] I> Copying Monitor (length: 0xf2e0) from 0x8530f800 to 0x40000000
[0000.792] I> Erasing Monitor @ 0x8530f800
[0000.796] I> Unhalting SCE
[0000.799] I> Primary Memory Start:80000000 Size:70000000
[0000.804] I> Extended Memory Start:f0110000 Size:185ef0000
[0000.810] I> Waypoint2-ACK: 0x52013158
[0000.814] I> MB2(TBoot-BPMP) done

NOTICE:  BL31: v1.2(release):27881aa0a
NOTICE:  BL31: Built : 14:08:00, Oct 31 2019
NOTICE:  Trusty image missing.
ERROR:   Error initializing runtime service trusty_fast
[0001.173] I> Welcome to Cboot
[0001.176] I> Cboot Version: 00.00.2014.50-t186-32166d5f
[0001.181] I> CPU-BL Params @ 0x277000000
[0001.185] I>  0) Base:0x00000000 Size:0x00000000
[0001.189] I>  1) Base:0x277f00000 Size:0x00100000
[0001.194] I>  2) Base:0x277e00000 Size:0x00100000
[0001.198] I>  3) Base:0x277d00000 Size:0x00100000
[0001.203] I>  4) Base:0x277c00000 Size:0x00100000
[0001.207] I>  5) Base:0x277b00000 Size:0x00100000
[0001.212] I>  6) Base:0x277800000 Size:0x00200000
[0001.216] I>  7) Base:0x277400000 Size:0x00400000
[0001.221] I>  8) Base:0x277a00000 Size:0x00100000
[0001.225] I>  9) Base:0x277300000 Size:0x00100000
[0001.230] I> 10) Base:0x276800000 Size:0x00800000
[0001.234] I> 11) Base:0x30000000 Size:0x00040000
[0001.239] I> 12) Base:0xf0000000 Size:0x00100000
[0001.243] I> 13) Base:0x30040000 Size:0x00001000
[0001.248] I> 14) Base:0x30048000 Size:0x00001000
[0001.252] I> 15) Base:0x30049000 Size:0x00001000
[0001.256] I> 16) Base:0x3004a000 Size:0x00001000
[0001.261] I> 17) Base:0x3004b000 Size:0x00001000
[0001.265] I> 18) Base:0x3004c000 Size:0x00001000
[0001.270] I> 19) Base:0x3004d000 Size:0x00001000
[0001.274] I> 20) Base:0x3004e000 Size:0x00001000
[0001.279] I> 21) Base:0x3004f000 Size:0x00001000
[0001.283] I> 22) Base:0x00000000 Size:0x00000000
[0001.287] I> 23) Base:0xf0100000 Size:0x00010000
[0001.292] I> 24) Base:0x00000000 Size:0x00000000
[0001.296] I> 25) Base:0x00000000 Size:0x00000000
[0001.301] I> 26) Base:0x00000000 Size:0x00000000
[0001.305] I> 27) Base:0x00000000 Size:0x00000000
[0001.310] I> 28) Base:0x84400000 Size:0x00400000
[0001.314] I> 29) Base:0x30000000 Size:0x00010000
[0001.318] I> 30) Base:0x278000000 Size:0x08000000
[0001.323] I> 31) Base:0x00000000 Size:0x00000000
[0001.327] I> 32) Base:0x276000000 Size:0x00600000
[0001.332] I> 33) Base:0x80000000 Size:0x70000000
[0001.336] I> 34) Base:0xf0110000 Size:0x185ef0000
[0001.341] I> 35) Base:0x00000000 Size:0x00000000
[0001.345] I> 36) Base:0x00000000 Size:0x00000000
[0001.350] I> 37) Base:0x2772e0000 Size:0x00020000
[0001.354] I> 38) Base:0x84000000 Size:0x00400000
[0001.359] I> 39) Base:0x96000000 Size:0x02400000
[0001.363] I> 40) Base:0x85000000 Size:0x01200000
[0001.367] I> 41) Base:0x277000000 Size:0x00280000
[0001.372] I> 42) Base:0x00000000 Size:0x00000000
[0001.376] I> 43) Base:0x00000000 Size:0x00000000
[0001.381] GIC-SPI Target CPU: 4
[0001.384] Interrupts Init done
[0001.387] calling constructors
[0001.391] initializing heap
[0001.393] initializing threads
[0001.396] initializing timers
[0001.400] creating bootstrap completion thread
[0001.404] top of bootstrap2()
[0001.407] CPU: ARM Cortex A57
[0001.410] CPU: MIDR: 0x411FD073, MPIDR: 0x80000100
[0001.416] initializing platform
[0001.419] I> Boot-device: eMMC
[0001.423] I> sdmmc bdev is already initialized
[0001.427] I> Reading GPT from 512 for device 00000003
[0001.433] I> Reading GPT from 8388096 for device 00000003
[0001.439] I> Found 14 partitions in 00000003 device
[0001.444] I> Reading GPT from 512 for device 00010003
[0001.450] I> Found 29 partitions in 00010003 device
[0001.454] W> opt-in fuse is not set, skip fuse_burning
[0001.459] I> Bl_dtb @0x8520f400
[0001.462] I> gpio framework initialized
[0001.466] I> tegrabl_gpio_driver_register: register 'tegra_gpio_main_driver' driver
[0001.473] I> tegrabl_gpio_driver_register: register 'tegra_gpio_aon_driver' driver
[0001.481] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xee
[0001.490] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.497] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xe8
[0001.505] I> tegrabl_gpio_driver_register: register 'tca9539_gpio_driver' driver
[0001.512] I> tegrabl_tca9539_init: i2c bus: 0, slave addr: 0xec
[0001.519] E> i2c dev write failed
[0001.522] E> tca9539_device_init: failed to write polar reg
[0001.527] E> tegrabl_tca9539_init: failed to init device!
[0001.532] E> GPIO TCA9539 driver init failed
[0001.649] I> decompressor handler not found
[0001.656] I> fixed regulator driver initialized
[0001.691] I> register 'maxim' power off handle
[0001.697] I> virtual i2c enabled
[0001.700] I> registered 'maxim,max77620' pmic
[0001.705] I> tegrabl_gpio_driver_register: register 'max77620-gpio' driver
[0001.715] I> Find /i2c@c250000's alias i2c7
[0001.719] I> Reading eeprom i2c=7 address=0x50
[0001.750] I> Device at /i2c@c250000:0x50
[0001.754] I> Reading eeprom i2c=7 address=0x57
[0001.783] I> Device at /i2c@c250000:0x57
[0001.787] I> Find /i2c@c240000's alias i2c1
[0001.791] I> Reading eeprom i2c=1 address=0x51
[0001.797] E> i2c dev read failed
[0001.800] E> eeprom: Retry to read I2C slave device.
[0001.805] E> i2c dev read failed
[0001.808] E> eeprom: Failed to read I2C slave device
[0001.813] I> Eeprom read failed 0x1a89800d
[0001.818] I> Find /i2c@3160000's alias i2c0
[0001.822] I> Reading eeprom i2c=0 address=0x50
[0001.826] E> i2c dev read failed
[0001.829] E> eeprom: Failed to read I2C slave device
[0001.834] I> Eeprom read failed 0x1a89800d
[0001.839] I> Find /i2c@3180000's alias i2c2
[0001.843] I> Reading eeprom i2c=2 address=0x54
[0001.847] I> Enabling gpio chip_id = 2, gpio pin = 9
[0001.879] I> Disabling gpio chip_id = 2, gpio pin = 9
[0001.884] I> Device at /i2c@3180000:0x54
[0001.888] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0001.893] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0001.904] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0001.909] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0001.920] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0001.925] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0001.940] I> found one nvdisp nodes at offset = 104424
[0001.945] I> found one nvdisp nodes at offset = 105340
[0001.955] I> enabling 'vdd-hdmi' regulator
[0001.969] I> regulator 'vdd-hdmi' already enabled
[0001.974] I> hdmi cable connected
[0001.981] I> setting 'vdd-pex-1v00' regulator to 1000000 micro volts
[0001.991] I> setting 'vdd-1v8' regulator to 1800000 micro volts
[0001.997] I> found one nvdisp nodes at offset = 106144
[0002.017] I> edid read success
[0002.020] I> width = 640, height = 480, frequency = 25174825
[0002.025] I> width = 640, height = 480, frequency = 25174825
[0002.031] I> width = 1600, height = 1200, frequency = 162000000
[0002.036] I> Best mode Width = 640, Height = 480, freq = 25174825
[0002.046] I> hdmi_enable, starting HDMI initialisation
[0002.454] I> hdmi_enable, HDMI initialisation complete
[0002.460] initializing target
[0002.463] calling apps_init()
[0002.466] starting app android_boot_app
[0002.470] I> Gpio keyboard init success
[0002.474] I> Kernel type = Normal
[0002.477] I> Loading kernel/boot.img from storage ...
[0002.482] W> No valid slot number is found in scratch register
[0002.487] W> Return default slot: _a
[0002.491] I> A/B: bin_type (0) slot 0
[0002.494] I> Loading partition kernel at 0xa8000000
[0003.254] I> tegrabl_auth_payload: partition kernel (bin_type 0)
[0003.261] W> No valid slot number is found in scratch register
[0003.267] W> Return default slot: _a
[0003.270] I> A/B: bin_type (1) slot 0
[0003.274] I> Loading partition kernel-dtb at 0x92000000
[0003.286] I> tegrabl_auth_payload: partition kernel-dtb (bin_type 1)
[0003.292] I> Kernel DTB @ 0x92000000
[0003.296] I> Checking boot.img header magic ... [0003.300] I> [OK]
[0003.302] I> Verify header fields
[0003.305] I> Valid boot.img @ 0xa8000000
[0003.309] I> decompressor handler not found
[0003.313] I> Copying kernel image (488506 bytes) from 0xa8000800 to 0x80080000 ... [0003.320] I> Done
[0003.322] I> Move ramdisk (len: 0) from 0xa8078000 to 0x9d000000
[0003.329] I> Updated bpmp info to DTB
[0003.335] I> Ramdisk: Base: 0x9d000000; Size: 0x0
[0003.339] I> Updated initrd info to DTB
[0003.343] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.350] E> tegrabl_linuxboot_add_disp_param, du 1 failed to get display params
[0003.357] I> disabled_core_mask: 0xffffff0c
[0003.361] W> No valid slot number is found in scratch register
[0003.367] W> Return default slot: _a
[0003.370] I> Active slot suffix: 
[0003.373] I> add_boot_slot_suffix: slot_suffix = 
[0003.378] I> add_serialno: Serial Num = 0320218169735
[0003.383] I> Linux Cmdline: root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0 memtype=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mm 
[0003.427] I> Updated bootarg info to DTB
[0003.430] E> "plugin-manager" doesn't exist, creating
[0003.435] E> "odm-data" doesn't exist, creating
[0003.441] I> eeprom_get_mac_addr: MAC (type: 0): 00:04:4b:a8:11:d7
[0003.447] I> eeprom_get_mac_addr: MAC (type: 1): 00:04:4b:a8:11:d8
[0003.454] I> eeprom_get_mac_addr: MAC (type: 2): 00:04:4b:a8:11:d9
[0003.460] E> "ids" doesn't exist, creating
[0003.464] E> "connection" doesn't exist, creating
[0003.468] E> "configs" doesn't exist, creating
[0003.472] I> create_pm_ids: id: 3310-1000-B02-D, len: 15
[0003.478] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.489] I> create_pm_ids: id: 2597-0000-501-C, len: 15
[0003.494] I> config: mem-type:00,power-config:00,misc-config:00,modem-config:00,touch-config:00,display-config:00,, len: 93
[0003.505] I> create_pm_ids: id: 3326-1000-100-M, len: 15
[0003.510] I> config: mem-type:ff,power-config:ff,misc-config:ff,modem-config:ff,touch-config:ff,display-config:ff,, len: 93
[0003.521] I> Adding plugin-manager/ids/3310-1000-B02=/i2c@c250000:module@0x50
[0003.528] E> "i2c@c250000" doesn't exist, creating
[0003.532] E> "module@0x50" doesn't exist, creating
[0003.537] I> Adding plugin-manager/ids/2597-0000-501=/i2c@c250000:module@0x57
[0003.544] E> "module@0x57" doesn't exist, creating
[0003.549] I> Adding plugin-manager/ids/3326-1000-100=/i2c@3180000:module@0x54
[0003.556] E> "i2c@3180000" doesn't exist, creating
[0003.561] E> "module@0x54" doesn't exist, creating
[0003.567] I> Adding plugin-manager/ids/3310-1000-B02-D
[0003.574] I> Adding plugin-manager/configs/3310-mem-type 00
[0003.580] I> Adding plugin-manager/configs/3310-power-config 00
[0003.586] I> Adding plugin-manager/configs/3310-misc-config 00
[0003.592] I> Adding plugin-manager/configs/3310-modem-config 00
[0003.597] I> Adding plugin-manager/configs/3310-touch-config 00
[0003.603] I> Adding plugin-manager/configs/3310-display-config 00
[0003.609] E> "chip-id" doesn't exist, creating
[0003.613] I> Adding plugin-manager/chip-id/A02P
[0003.620] I> added [base:0x80000000, size:0x70000000] to /memory
[0003.626] I> added [base:0xf0200000, size:0x185e00000] to /memory
[0003.632] I> added [base:0x276600000, size:0x200000] to /memory
[0003.637] E> WARNING: Failed to pass NS DRAM ranges to TOS
[0003.643] I> Updated memory info to DTB
[0003.648] E> "reset" doesn't exist, creating
[0003.652] E> "pmc-reset-reason" doesn't exist, creating
[0003.658] E> "pmic-reset-reason" doesn't exist, creating
[0003.663] I> disabled_core_mask: 0xffffff0c
[0003.675] I> Add serial number as DT property
[0003.680] I> tegrabl_load_kernel_and_dtb: Done


U-Boot 2016.07-geb5c15bec5 (Oct 31 2019 - 14:08:07 -0700)

TEGRA186
Model: NVIDIA P2771-0000-500
DRAM:  7.8 GiB
MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@2490000
Hit any key to stop autoboot:  0 
MMC: no card present
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
223 bytes read in 82 ms (2 KiB/s)
p2771-0000 eMMC boot options
1:      primary kernel
Enter choice: 1:        primary kernel
Retrieving file: /boot/Image
20947216 bytes read in 552 ms (36.2 MiB/s)
append: root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0 memtype=0 video=tegrafb no_console_suspend=1 earlycon=uart8250,mmio32,0x03100000 nvdumM
## Flattened Device Tree blob at 92000000
   Booting using the fdt blob at 0x92000000
   reserving fdt memory region: addr=80000000 size=10000
   Using Device Tree in place at 0000000092000000, end 0000000092049655

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x100
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.4.159-tegra (buildbrain@mobile-u64-3130) (gcc version 4.8.5 (GCC) ) #1 SMP PREEMPT Thu Oct 31 14:11:23 PDT 2019
[    0.000000] Boot CPU: AArch64 Processor [411fd073]
[    0.000000] earlycon: Early serial console at MMIO32 0x3100000 (options '')
[    0.000000] bootconsole [uart0] enabled
[    0.000000] Found tegra_fbmem2: 00140000@969f0000
[    0.000000] Found lut_mem2: 00002008@969ed000
[    0.000000] Memory limited to 7808MB
[    0.000000] Reserved memory: initialized node ramoops_carveout, compatible id nvidia,ramoops
[    0.000000] cma: Reserved 64 MiB at 0x00000000fc000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] PERCPU: Embedded 17 pages/cpu @ffffffc1e7fe4000 s31232 r8192 d30208 u69632
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1963512
[    0.000000] Kernel command line: root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0 memtype=0 video=tegrafb no_console_suspend=1 earlycon=uartM
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 7745084K/7979008K available (11612K kernel code, 1808K rwdata, 5724K rodata, 1168K init, 693K bss, 168388K reserved, 65536K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vmalloc : 0xffffff8000000000 - 0xffffffbdbfff0000   (   246 GB)
[    0.000000]     vmemmap : 0xffffffbdc0000000 - 0xffffffbfc0000000   (     8 GB maximum)
[    0.000000]               0xffffffbdc2000000 - 0xffffffbdc9a08000   (   122 MB actual)
[    0.000000]     fixed   : 0xffffffbffa7fd000 - 0xffffffbffac00000   (  4108 KB)
[    0.000000]     PCI I/O : 0xffffffbffae00000 - 0xffffffbffbe00000   (    16 MB)
[    0.000000]     modules : 0xffffffbffc000000 - 0xffffffc000000000   (    64 MB)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc1e8200000   (  7810 MB)
[    0.000000]       .init : 0xffffffc00116f000 - 0xffffffc001293000   (  1168 KB)
[    0.000000]       .text : 0xffffffc000080000 - 0xffffffc00116f000   ( 17340 KB)
[    0.000000]       .data : 0xffffffc0012b6000 - 0xffffffc00147a110   (  1809 KB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=6.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=6
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] Architected cp15 timer(s) running at 31.25MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xe6a171046, max_idle_ns: 881590405314 ns
[    0.000002] sched_clock: 56 bits at 31MHz, resolution 32ns, wraps every 4398046511088ns
[    0.009821] Console: colour dummy device 80x25
[    0.014478] console [tty0] enabled
[    0.018036] bootconsole [uart0] disabled
[    0.000000] Booting Linux on physical CPU 0x100
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.4.159-tegra (buildbrain@mobile-u64-3130) (gcc version 4.8.5 (GCC) ) #1 SMP PREEMPT Thu Oct 31 14:11:23 PDT 2019
[    0.000000] Boot CPU: AArch64 Processor [411fd073]
[    0.000000] earlycon: Early serial console at MMIO32 0x3100000 (options '')
[    0.000000] bootconsole [uart0] enabled
[    0.000000] Found tegra_fbmem2: 00140000@969f0000
[    0.000000] Found lut_mem2: 00002008@969ed000
[    0.000000] Memory limited to 7808MB
[    0.000000] Reserved memory: initialized node ramoops_carveout, compatible id nvidia,ramoops
[    0.000000] cma: Reserved 64 MiB at 0x00000000fc000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] PERCPU: Embedded 17 pages/cpu @ffffffc1e7fe4000 s31232 r8192 d30208 u69632
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1963512
[    0.000000] Kernel command line: root=/dev/mmcblk0p1 rw rootwait console=ttyS0,115200n8 console=tty0 OS=l4t fbcon=map:0 net.ifnames=0 memtype=0 video=tegrafb no_console_suspend=1 earlycon=uartM
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 7745084K/7979008K available (11612K kernel code, 1808K rwdata, 5724K rodata, 1168K init, 693K bss, 168388K reserved, 65536K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vmalloc : 0xffffff8000000000 - 0xffffffbdbfff0000   (   246 GB)
[    0.000000]     vmemmap : 0xffffffbdc0000000 - 0xffffffbfc0000000   (     8 GB maximum)
[    0.000000]               0xffffffbdc2000000 - 0xffffffbdc9a08000   (   122 MB actual)
[    0.000000]     fixed   : 0xffffffbffa7fd000 - 0xffffffbffac00000   (  4108 KB)
[    0.000000]     PCI I/O : 0xffffffbffae00000 - 0xffffffbffbe00000   (    16 MB)
[    0.000000]     modules : 0xffffffbffc000000 - 0xffffffc000000000   (    64 MB)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc1e8200000   (  7810 MB)
[    0.000000]       .init : 0xffffffc00116f000 - 0xffffffc001293000   (  1168 KB)
[    0.000000]       .text : 0xffffffc000080000 - 0xffffffc00116f000   ( 17340 KB)
[    0.000000]       .data : 0xffffffc0012b6000 - 0xffffffc00147a110   (  1809 KB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=6.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=6
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] Architected cp15 timer(s) running at 31.25MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xe6a171046, max_idle_ns: 881590405314 ns
[    0.000002] sched_clock: 56 bits at 31MHz, resolution 32ns, wraps every 4398046511088ns
[    0.009821] Console: colour dummy device 80x25
[    0.014478] console [tty0] enabled
[    0.018036] bootconsole [uart0] disabled
[    0.022137] kmemleak: Kernel memory leak detector disabled
[    0.022150] Calibrating delay loop (skipped), value calculated using timer frequency.. 62.50 BogoMIPS (lpj=125000)
[    0.022163] pid_max: default: 32768 minimum: 301
[    0.022213] Security Framework initialized
[    0.022255] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.022266] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.022635] Initializing cgroup subsys io
[    0.022648] Initializing cgroup subsys memory
[    0.022666] Initializing cgroup subsys devices
[    0.022675] Initializing cgroup subsys freezer
[    0.022685] Initializing cgroup subsys net_cls
[    0.022694] Initializing cgroup subsys perf_event
[    0.022703] Initializing cgroup subsys net_prio
[    0.022714] Initializing cgroup subsys pids
[    0.022723] Initializing cgroup subsys debug
[    0.022873] CPU0 ipc=752
[    0.022884] CPU1 ipc=1024
[    0.022892] CPU2 ipc=1024
[    0.022903] CPU3 ipc=752
[    0.022913] CPU4 ipc=752
[    0.022923] CPU5 ipc=752
[    0.022964] ASID allocator initialised with 65536 entries
[    0.046286] tegra-id: chipid=21817.
[    0.046304] tegra-id: opt_subrevision=1.
[    0.046317] Tegra Revision: A02p SKU: 0xdc CPU Process: 0 SoC Process: 0
[    0.046978] DTS File Name: /dvs/git/dirty/git-master_linux/kernel/kernel-4.4/arch/arm64/boot/dts/../../../../../../hardware/nvidia/platform/t18x/quill/kernel-dts/tegra186-quill-p3310-1000-c03-s
[    0.047004] DTB Build time: Oct 31 2019 14:13:43
[    0.062452] CPU1: Booted secondary processor [4e0f0030]
[    0.074088] CPU2: Booted secondary processor [4e0f0030]
[    0.085807] CPU3: Booted secondary processor [411fd073]
[    0.097855] CPU4: Booted secondary processor [411fd073]
[    0.109866] CPU5: Booted secondary processor [411fd073]
[    0.109937] Brought up 6 CPUs
[    0.110002] SMP: Total of 6 processors activated.
[    0.110017] CPU: All CPU(s) started at EL2
[    0.110485] devtmpfs: initialized
[    0.139104] Initilizing CustomIPI irq domain
[    0.139327] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.139359] futex hash table entries: 2048 (order: 6, 262144 bytes)
[    0.140430] pinctrl core: initialized pinctrl subsystem
[    0.140614] OS set in device tree is not L4T.
[    0.140825] regulator-dummy: no parameters
[    0.140941] Initializing plugin-manager
[    0.141000] Plugin module not found
[    0.141480] node /plugin-manager/soc-prod-a02-fragment match with chip-id A02P
[    0.141838] node /plugin-manager/fragement@0 match with odm-data enable-denver-wdt
[    0.142446] node /plugin-manager/fragement@4 match with odm-data enable-denver-wdt
[    0.143596] node /plugin-manager/fragment-sdwake-p3310-1000-300 match with board >=3310-1000-300
[    0.143947] node /plugin-manager/fragement-pmon-p3310-1000-300 match with board >=3310-1000-300
[    0.144198] node /plugin-manager/fragement-pmon-p3310-1000-800 match with board >=3310-1000-800
[    0.144419] node /plugin-manager/fragment-devslp@0 match with board >=3310-1000-200
[    0.144865] node /plugin-manager/fragment-500-pcie-config match with board >=3310-1000-500
[    0.145399] node /plugin-manager/fragment-500-xusb-config match with board >=3310-1000-500
[    0.145720] node /plugin-manager/fragment-500-e3325-pcie match with board >=3310-1000-500
[    0.146166] node /plugin-manager/fragment-p3310-c00-comm match with board >=3310-1000-800
[    0.146453] node /plugin-manager/fragment-p3310-c00-pmic match with board >=3310-1000-800
[    0.146708] node /plugin-manager/fragment-p3310-c01 match with board >=3310-1000-900
[    0.147026] node /plugin-manager/fragment-p3310-c03 match with board >=3310-1000-B00
[    0.148754] node /plugin-manager/fragment-e3326@0 match with board 3326-*
[    0.149985] node /plugin-manager/fragment-p3310-c00-camera match with board >=3310-1000-800
[    0.151932] Adding domain adsp-pd to PM domain ape-pd
[    0.154422] NET: Registered protocol family 16
[    0.155350] console [pstore-1] enabled
[    0.155363] pstore: Registered ramoops as persistent store backend
[    0.155378] ramoops: attached 0x200000@0x277080000, ecc: 0/0
[    0.165332] cpuidle: using governor ladder
[    0.169808] cpuidle: using governor menu
[    0.170933] bpmp: waiting for handshake
[    0.170948] bpmp: handshake completed
[    0.170989] bpmp: synchronizing channels
[    0.171016] bpmp: channels synchronized
[    0.171027] bpmp: mail init ok
[    0.171394] vdso: 2 pages (1 code @ ffffffc0012bd000, 1 data @ ffffffc0012bc000)
[    0.171426] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.172414] atomic_pool_init():526: DMA: preallocated 1024 KiB pool for atomic allocations
[    0.173886] tegra_powergate_init: DONE
[    0.173909] DTS File Name: /dvs/git/dirty/git-master_linux/kernel/kernel-4.4/arch/arm64/boot/dts/../../../../../../hardware/nvidia/platform/t18x/quill/kernel-dts/tegra186-quill-p3310-1000-c03-s
[    0.173938] DTB Build time: Oct 31 2019 14:13:43
[    0.174849] Tegra reboot handler registered.
[    0.175919] Registering Tegra186 clocks (this may take a while)...done
[    0.178063] arm-smmu 12000000.iommu: probing hardware configuration...
[    0.178082] arm-smmu 12000000.iommu: SMMUv2 with:
[    0.178096] arm-smmu 12000000.iommu:         stage 1 translation
[    0.178109] arm-smmu 12000000.iommu:         stage 2 translation
[    0.178122] arm-smmu 12000000.iommu:         nested translation
[    0.178137] arm-smmu 12000000.iommu:         stream matching with 128 register groups, mask 0x7f80
[    0.178157] arm-smmu 12000000.iommu: SMMU address space size (0x800000) differs from mapped region size (0x1000000)!
[    0.178177] arm-smmu 12000000.iommu:         64 context banks (0 stage-2 only)
[    0.178192] arm-smmu 12000000.iommu:         Stage-1: 39-bit VA -> 48-bit IPA
[    0.178206] arm-smmu 12000000.iommu:         Stage-2: 39-bit IPA -> 48-bit PA
[    0.228177] arm-smmu 12000000.iommu: registered 67 master devices
[    0.233883] iommu: Adding device 3460000.sdhci to group 0
[    0.234889] iommu: Adding device 3400000.sdhci to group 1
[    0.238497] iommu: Adding device 3507000.ahci-sata to group 2
[    0.238932] iommu: Adding device 3160000.i2c to group 3
[    0.239341] iommu: Adding device c240000.i2c to group 4
[    0.239666] iommu: Adding device 3180000.i2c to group 5
[    0.240157] iommu: Adding device 3190000.i2c to group 6
[    0.240596] iommu: Adding device 31b0000.i2c to group 7
[    0.240922] iommu: Adding device 31c0000.i2c to group 8
[    0.241259] iommu: Adding device c250000.i2c to group 9
[    0.241570] iommu: Adding device 31e0000.i2c to group 10
[    0.243577] iommu: Adding device 3210000.spi to group 11
[    0.243884] iommu: Adding device c260000.spi to group 12
[    0.244230] iommu: Adding device 3240000.spi to group 13
[    0.244990] iommu: Adding device 3100000.serial to group 14
[    0.245317] iommu: Adding device 3110000.serial to group 15
[    0.245659] iommu: Adding device c280000.serial to group 16
[    0.245959] iommu: Adding device 3130000.serial to group 17
[    0.247225] iommu: Adding device 2490000.ether_qos to group 18
[    0.247847] iommu: Adding device b000000.rtcpu to group 19
[    0.248332] iommu: Adding device c1a0000.aon to group 20
[    0.249187] Wake73 for irq=42
[    0.249533] iommu: Adding device smmu_test to group 21
[    0.250069] mc: mapped MMIO address: 0xffffff8000560000 -> 0x2c10000
[    0.250111] mc: mapped MMIO address: 0xffffff8000640000 -> 0x2c20000
[    0.250175] mc: mapped MMIO address: 0xffffff8000660000 -> 0x2c30000
[    0.250211] mc: mapped MMIO address: 0xffffff8000fa0000 -> 0x2c40000
[    0.250246] mc: mapped MMIO address: 0xffffff8000fc0000 -> 0x2c50000
[    0.250515] ecc-err: dram ecc disabled-MC_ECC_CONTROL:0x0000000c
[    0.251344] Wake76 for irq=199
[    0.251369] Wake77 for irq=199
[    0.251390] Wake78 for irq=199
[    0.251410] Wake79 for irq=199
[    0.251430] Wake80 for irq=199
[    0.251471] Wake81 for irq=199
[    0.251490] Wake82 for irq=199
[    0.251604] iommu: Adding device 3530000.xhci to group 22
[    0.251940] iommu: Adding device 3550000.xudc to group 23
[    0.252720] tegra-pmc c360000.pmc: scratch reg offset dts data not present
[    0.254106] tegra-pmc: get_secure_pmc_setting: done secure_pmc=0
[    0.254148] tegra-pmc: ### PMC reset source: TEGRA_POWER_ON_RESET
[    0.254172] tegra-pmc: ### PMC reset level: TEGRA_RESET_LEVEL_L0
[    0.254196] tegra-pmc: ### PMC reset status reg: 0x0
[    0.254500] padctrl padctrl.0: Pad control driver tegra-pmc-padctrl registered
[    0.254541] tegra-pmc c360000.pmc: IO padctrl driver initialized
[    0.254751] tegra186-aowake c370000.pmc: WAKE_AOWAKE_CTRL_0 = 3
[    0.254781] tegra186-aowake c370000.pmc: WAKE_AOWAKE_CNTRL_24(PMU_INT) = 256
[    0.255256] iommu: Adding device 13e10000.host1x to group 24
[    0.255510] iommu: Adding device 13e10000.host1x:ctx0 to group 25
[    0.255780] iommu: Adding device 13e10000.host1x:ctx1 to group 26
[    0.256020] iommu: Adding device 13e10000.host1x:ctx2 to group 27
[    0.256276] iommu: Adding device 13e10000.host1x:ctx3 to group 28
[    0.256486] iommu: Adding device 13e10000.host1x:ctx4 to group 29
[    0.256722] iommu: Adding device 13e10000.host1x:ctx5 to group 30
[    0.256930] iommu: Adding device 13e10000.host1x:ctx6 to group 31
[    0.257147] iommu: Adding device 13e10000.host1x:ctx7 to group 32
[    0.257569] iommu: Adding device 150c0000.nvcsi to group 33
[    0.258086] iommu: Adding device 15700000.vi to group 34
[    0.258408] iommu: Adding device 15600000.isp to group 35
[    0.258796] iommu: Adding device 15210000.nvdisplay to group 36
[    0.258908] platform 15210000.nvdisplay: IOVA linear map 0x00000000969f0000(140000)
[    0.258951] platform 15210000.nvdisplay: IOVA linear map 0x00000000969ed000(3000)
[    0.259154] iommu: Adding device 15340000.vic to group 37
[    0.259354] iommu: Adding device 154c0000.nvenc to group 38
[    0.259588] iommu: Adding device 15480000.nvdec to group 39
[    0.259920] iommu: Adding device 15380000.nvjpg to group 40
[    0.260117] iommu: Adding device 15500000.tsec to group 41
[    0.260315] iommu: Adding device 15100000.tsecb to group 42
[    0.261043] iommu: Adding device 15810000.se to group 43
[    0.261272] iommu: Adding device 15820000.se to group 44
[    0.261490] iommu: Adding device 15830000.se to group 45
[    0.261674] iommu: Adding device 15840000.se to group 46
[    0.262181] iommu: Adding device 17000000.gp10b to group 47
[    0.263573] tegra-reset 5000000.clock: registered 193 resets.
[    0.265571] iommu: Adding device d000000.bpmp to group 48
[    0.265813] bpmp: ping status is 0
[    0.265991] bpmp d000000.bpmp: firmware tag is 69fa4e41a01fc02a4db1adf71922a54c
[    0.266349] bpmp d000000.bpmp: probe ok
[    0.268905] iommu: Adding device 2600000.dma to group 49
[    0.269735] GPIO line 461 (cam0-rst) hogged as output/low
[    0.269794] GPIO line 456 (cam0-pwdn) hogged as output/low
[    0.269880] GPIO line 457 (cam1-rst) hogged as output/low
[    0.269926] GPIO line 426 (cam1-pwdn) hogged as output/low
[    0.269973] GPIO line 424 (wifi-enable) hogged as output/high
[    0.270018] GPIO line 445 (sdmmc-wake-input) hogged as input
[    0.270063] GPIO line 446 (sdmmc-wake-output) hogged as output/low
[    0.270164] gpiochip_add_data: registered GPIOs 320 to 511 on device: tegra-gpio
[    0.272043] GPIO line 315 (wifi-wake-ap) hogged as input
[    0.272159] gpiochip_add_data: registered GPIOs 256 to 319 on device: tegra-gpio-aon
[    0.273041] iommu: Adding device 10003000.pcie-controller to group 50
[    0.273307] iommu: Adding device sound to group 51
[    0.275325] iommu: Adding device 3510000.hda to group 52
[    0.276497] iommu: Adding device adsp_audio to group 53
[    0.278021] iommu: Adding device 2993000.adsp to group 54
[    0.287383] vdd-ac-bat: 5000 mV 
[    0.289468] vdd-1v8-ap: 1800 mV 
[    0.308931] SCSI subsystem initialized
[    0.309286] usbcore: registered new interface driver usbfs
[    0.309348] usbcore: registered new interface driver hub
[    0.309478] usbcore: registered new device driver usb
[    0.313228] GPIO line 241 (touch-rail-1) hogged as output/high
[    0.313681] GPIO line 242 (touch-rail-2) hogged as output/high
[    0.313781] gpiochip_add_data: registered GPIOs 240 to 255 on device: tca9539
[    0.315224] GPIO line 228 (lcd-bias-en-rail) hogged as output/high
[    0.315324] gpiochip_add_data: registered GPIOs 224 to 239 on device: tca9539
[    0.326217] media: Linux media interface: v0.10
[    0.326279] Linux video capture interface: v2.00
[    0.329298] pps_core: LinuxPPS API ver. 1 registered
[    0.329324] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.329371] PTP clock support registered
[    0.330288] tegra_wdt_t18x 30c0000.watchdog: Tegra WDT init timeout = 120 sec
[    0.330336] tegra_wdt_t18x 30c0000.watchdog: Registered successfully
[    0.331852] max77620 4-003c: PMIC Version OTP:0x45 and ES:0x8
[    0.333981] GPIO line 221 (spmic_gpio_input_5) hogged as input
[    0.334172] GPIO line 222 (spmic_gpio_input_6) hogged as input
[    0.334303] gpiochip_add_data: registered GPIOs 216 to 223 on device: max77620-gpio
[    0.338266] vddio-ddr: at 1125 mV 
[    0.342131] avdd_dsi_csi: 1200 mV 
[    0.346099] vdd-1v8: 1800 mV 
[    0.350100] vdd-3v3-sys: 3300 mV 
[    0.351186] spmic-ldo0: at 1800 mV 
[    0.351969] spmic-ldo1: at 800 mV 
[    0.354100] vddio-3v3: 3300 mV 
[    0.354744] vddio-sdmmc1: 1800 <--> 3300 mV at 3300 mV 
[    0.358100] vdd-rtc: at 800 mV 
[    0.358924] avdd-ts-hv: 1800 <--> 3300 mV at 1800 mV 
[    0.362102] spmic-ldo6: at 1500 mV 
[    0.366099] vdd-pex-1v00: 1000 mV 
[    0.366753] dvdd-pex: 1000 mV 
[    0.367047] max77620 4-003c: max77620 probe successful
[    0.367326] Advanced Linux Sound Architecture Driver Initialized.
[    0.367659] Bluetooth: Core ver 2.21
[    0.367687] NET: Registered protocol family 31
[    0.367699] Bluetooth: HCI device and connection manager initialized
[    0.367715] Bluetooth: HCI socket layer initialized
[    0.367730] Bluetooth: L2CAP socket layer initialized
[    0.367751] Bluetooth: SCO socket layer initialized
[    0.368410] en-vdd-sd: 3300 mV 
[    0.369068] en-vdd-cam: 1800 mV 
[    0.373857] vdd-hdmi: 5000 mV 
[    0.374033] vdd-usb0-5v: 5000 mV 
[    0.374202] vdd-usb1-5v: 5000 mV 
[    0.377858] en-vdd-ts-1v8: 1800 mV 
[    0.381858] en-vdd-ts-hv-3v3: 3300 mV 
[    0.382378] en-vdd-disp-3v3: 3300 mV 
[    0.382890] en-mdm-pwr-3v7: 3700 mV 
[    0.383408] en-vdd-disp-1v8: 1800 mV 
[    0.383925] en-vdd-cam-hv-2v8: 2800 mV 
[    0.384440] en-vdd-cam-1v2: 1200 mV 
[    0.384963] vdd-fan: 5000 mV 
[    0.385070] vdd-3v3: 3300 mV 
[    0.385793] dis-vdd-1v2: 1200 mV 
[    0.385911] en-vdd-vcm-2v8: 2800 mV 
[    0.386432] vdd-usb2-5v: 5000 mV 
[    0.386547] vdd-sys-bl: 3300 mV 
[    0.387066] en-vdd-sys: 1200 mV 
[    0.390397] extcon-gpio-states external-connection:extcon@1: Cable state 0
[    0.390819] clocksource: Switched to clocksource arch_sys_counter
[    0.409797] nvmap_heap_init: nvmap_heap_init: created heap block cache
[    0.410048] nvmap: nvmap_override_cache_ops() set roc flush ops to replace cache ops by set/ways
[    0.410520] nvmap_page_pool_init: Total RAM pages: 1952655
[    0.410538] nvmap_page_pool_init: nvmap page pool size: 244081 pages (953 MB)
[    0.410754] nvmap_background_zero_thread: PP zeroing thread starting.
[    0.415232] Wake76 for irq=199
[    0.415247] Wake77 for irq=199
[    0.415257] Wake78 for irq=199
[    0.415268] Wake79 for irq=199
[    0.415278] Wake80 for irq=199
[    0.415288] Wake81 for irq=199
[    0.415298] Wake82 for irq=199
[    0.416041] thermal thermal_zone0: Registering thermal zone thermal_zone0 for type BCPU-therm
[    0.416243] thermal thermal_zone1: Registering thermal zone thermal_zone1 for type MCPU-therm
[    0.416630] thermal thermal_zone2: Registering thermal zone thermal_zone2 for type GPU-therm
[    0.416706] thermal thermal_zone3: Registering thermal zone thermal_zone3 for type PLL-therm
[    0.416851] thermal thermal_zone4: Registering thermal zone thermal_zone4 for type Tboard_tegra
[    0.416994] thermal thermal_zone5: Registering thermal zone thermal_zone5 for type Tdiode_tegra
[    0.417144] thermal thermal_zone6: Registering thermal zone thermal_zone6 for type PMIC-Die
[    0.417443] isomgr_init(): iso emc max clk=1866000KHz
[    0.417456] isomgr_init(): max_iso_bw=26870400KB
[    0.417544] NET: Registered protocol family 2
[    0.417848] TCP established hash table entries: 65536 (order: 7, 524288 bytes)
[    0.418168] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.418848] TCP: Hash tables configured (established 65536 bind 65536)
[    0.418909] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.419040] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.419280] NET: Registered protocol family 1
[    0.419462] RPC: Registered named UNIX socket transport module.
[    0.419477] RPC: Registered udp transport module.
[    0.419490] RPC: Registered tcp transport module.
[    0.419502] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.419618] Trying to unpack rootfs image as initramfs...
[    0.433755] host1x 13e10000.host1x: initialized
[    0.434634] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counters available
[    0.436512] audit: initializing netlink subsys (disabled)
[    0.436546] audit: type=2000 audit(0.424:1): initialized
[    0.444796] io scheduler noop registered
[    0.444908] io scheduler cfq registered (default)
[    0.447873] tegra-pwm 3280000.pwm: PWM clk can sleep in ops
[    0.449067] tegra-pwm 3290000.pwm: PWM clk can sleep in ops
[    0.450142] tegra-pwm 32a0000.pwm: PWM clk can sleep in ops
[    0.451217] tegra-pwm c340000.pwm: PWM clk can sleep in ops
[    0.454602] tsec 15500000.tsec: initialized
[    0.455732] tsec 15100000.tsecb: initialized
[    0.458051] nvdec 15480000.nvdec: initialized
[    0.461656] falcon 15340000.vic: initialized
[    0.462650] falcon 154c0000.nvenc: initialized
[    0.463674] falcon 15380000.nvjpg: initialized
[    0.464451] iommu_context_dev 13e10000.host1x:ctx0: initialized (streamid=56)
[    0.464956] iommu_context_dev 13e10000.host1x:ctx1: initialized (streamid=57)
[    0.465462] iommu_context_dev 13e10000.host1x:ctx2: initialized (streamid=58)
[    0.465964] iommu_context_dev 13e10000.host1x:ctx3: initialized (streamid=59)
[    0.466489] iommu_context_dev 13e10000.host1x:ctx4: initialized (streamid=60)
[    0.467033] iommu_context_dev 13e10000.host1x:ctx5: initialized (streamid=61)
[    0.467552] iommu_context_dev 13e10000.host1x:ctx6: initialized (streamid=62)
[    0.468054] iommu_context_dev 13e10000.host1x:ctx7: initialized (streamid=63)
[    0.470657] DC OR NODE connected to /host1x/sor1
[    0.470815] tegra_camera_platform tegra-camera-platform: tegra_camera_probe:camera_platform_driver probe
[    0.470821] generic_infoframe_type: 0x87
[    0.470922] tegradc 15210000.nvdisplay: DT parsed successfully
[    0.470931] misc tegra_camera_ctrl: tegra_camera_isomgr_register tpg_max_iso = 3916800KBs
[    0.470935] misc tegra_camera_ctrl: tegra_camera_isomgr_register isp_iso_bw=4687500, vi_iso_bw=1500000, max_bw=4687500
[    0.471002] tegradc 15210000.nvdisplay: Display dc.ffffff8002320000 registered with id=0
[    0.478798] tegra_nvdisp_bandwidth_register_max_config: max config iso bw = 16727000 KB/s
[    0.478820] tegra_nvdisp_bandwidth_register_max_config: max config EMC floor = 665600000 Hz
[    0.478836] tegra_nvdisp_bandwidth_register_max_config: max config hubclk = 357620000 Hz
[    0.478851] tegra-adma 2930000.adma: Tegra ADMA driver register 10 channels
[    0.478891] tegradc 15210000.nvdisplay: vblank syncpt # 7 for dc 1
[    0.478907] tegradc 15210000.nvdisplay: vpulse3 syncpt # 8 for dc 1
[    0.479816] tegradc 15210000.nvdisplay: Bootloader disp_param detected. Detected mode: 640x480 (on 0x0mm) pclk=50347983
[    0.480756] tegra-fuse-burn 3820000.efuse:efuse-burn: Fuse burn driver initialized
[    0.481221] kfuse 3830000.kfuse: initialized
[    0.482124] tegradc 15210000.nvdisplay: hdmi: no prod_list_hdmi_board, use default range
[    0.483056] tegra-pmc-iopower pmc-iopower: NO_IOPOWER setting 0x0
[    0.483514] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.483807] tegradc 15210000.nvdisplay: probed
[    0.485510] console [ttyS0] disabled
[    0.485563] 3100000.serial: ttyS0 at MMIO 0x3100000 (irq = 37, base_baud = 25500000) is a Tegra
[    2.650762] console [ttyS0] enabled
[    2.652745] 3110000.serial: ttyTHS1 at MMIO 0x3110000 (irq = 38, base_baud = 0) is a TEGRA_UART
[    2.653008] Console: switching to colour frame buffer device 80x30
[    2.653795] c280000.serial: ttyTHS2 at MMIO 0xc280000 (irq = 39, base_baud = 0) is a TEGRA_UART
[    2.654018] serial-tegra 3130000.serial: RX in PIO mode
[    2.654918] 3130000.serial: ttyTHS3 at MMIO 0x3130000 (irq = 40, base_baud = 0) is a TEGRA_UART
[    2.669884] brd: module loaded
[    2.674162] loop: module loaded
[    2.674409] nct1008_nct72 7-004c: find device tree node, parsing dt
[    2.674413] nct1008_nct72 7-004c: starting parse dt
[    2.674495] nct1008_nct72 7-004c: success parsing dt
[    2.674609] nct1008_nct72 7-004c: success in enabling tmp451 VDD rail
[    2.731676] gk20a 17000000.gp10b: failed to allocate secure buffer -12
[    2.754944] tegradc 15210000.nvdisplay: fb registered
[    2.761209] PD DISP0 index2 UP
[    2.765861] PD DISP1 index3 UP
[    2.769825] PD DISP2 index4 UP
[    2.779391] tmp451: Enabled overheat logging at 104.00C
[    2.782971] Parent Clock set for DC plld2
[    2.790988] nct1008_nct72 7-004c: nct1008_probe: initialized
[    2.799811] THERMAL EST: found 3 subdevs
[    2.804799] THERMAL EST num_resources: 0
[    2.809748] [THERMAL EST subdev 0]
[    2.814146] [THERMAL EST subdev 1]
[    2.818075] tegradc 15210000.nvdisplay: hdmi: pclk:50349K, set prod-setting:prod_c_54M
[    2.818363] tegradc 15210000.nvdisplay: hdmi: BL set VIC 0
[    2.834742] [THERMAL EST subdev 2]
[    2.839313] thermal thermal_zone7: Registering thermal zone thermal_zone7 for type thermal-fan-est
[    2.850177] THERMAL EST: thz register success.
[    2.855731] THERMAL EST: end of probe, return err: 0
[    2.861572] tegra_profiler: Branch: Dev
[    2.866110] tegra_profiler: Version: 1.121
[    2.870911] tegra_profiler: Samples version: 42
[    2.876133] tegra_profiler: IO version: 24
[    2.880964] armv8_pmu: [0] arch: AA64 PmuV3 ARM CORTEX-A57, pmuver: 0x1
[    2.888244] armv8_pmu: [1] arch: AA64 PmuV3 NVIDIA (Denver), pmuver: 0x1
[    2.895616] armv8_pmu: [2] arch: AA64 PmuV3 NVIDIA (Denver), pmuver: 0x1
[    2.902971] armv8_pmu: [3] arch: AA64 PmuV3 ARM CORTEX-A57, pmuver: 0x1
[    2.910285] armv8_pmu: [4] arch: AA64 PmuV3 ARM CORTEX-A57, pmuver: 0x1
[    2.917599] armv8_pmu: [5] arch: AA64 PmuV3 ARM CORTEX-A57, pmuver: 0x1
[    2.925112] tegra_profiler: auth: init
[    2.934185] tegra-ahci 3507000.ahci-sata: AHCI 0001.0301 32 slots 2 ports 3 Gbps 0x1 impl platform mode
[    2.944894] tegra-ahci 3507000.ahci-sata: flags: 64bit ncq sntf pm led pmp pio slum part deso sadm apst 
[    2.955715] tegradc 15210000.nvdisplay: blank - normal
[    2.956820] scsi host0: tegra_ahci
[    2.957181] scsi host1: tegra_ahci
[    2.957318] ata1: SATA max UDMA/133 mmio [mem 0x03507000-0x03508fff] port 0x100 irq 25
[    2.957321] ata2: DUMMY
[    2.958363] spi-tegra114 3210000.spi: Static pin configuration used
[    2.958852] spi-tegra114 c260000.spi: Static pin configuration used
[    2.959272] spi-tegra114 3240000.spi: Static pin configuration used
[    2.960117] tun: Universal TUN/TAP device driver, 1.6
[    2.960120] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    2.960290] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    2.960293] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.960331] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.3.0-k
[    2.960333] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.961373] PPP generic driver version 2.4.2
[    2.961510] PPP BSD Compression module registered
[    2.961517] PPP Deflate Compression module registered
[    2.961542] PPP MPPE Compression module registered
[    2.961554] NET: Registered protocol family 24
[    2.961609] usbcore: registered new interface driver r8152
[    2.961641] usbcore: registered new interface driver asix
[    2.961674] usbcore: registered new interface driver ax88179_178a
[    2.961700] usbcore: registered new interface driver cdc_ether
[    2.961734] usbcore: registered new interface driver smsc75xx
[    2.961762] usbcore: registered new interface driver net1080
[    2.961814] usbcore: registered new interface driver cdc_subset
[    2.961843] usbcore: registered new interface driver zaurus
[    2.961889] usbcore: registered new interface driver cdc_ncm
[    2.962118] Wake76 for irq=199
[    2.962121] Wake77 for irq=199
[    2.962123] Wake78 for irq=199
[    2.962125] Wake79 for irq=199
[    2.962127] Wake80 for irq=199
[    2.962129] Wake81 for irq=199
[    2.962130] Wake82 for irq=199
[    2.962180] tegra-xotg xotg: usb2 phy is not available yet
[    2.962937] usbcore: registered new interface driver cdc_acm
[    2.962940] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    2.963008] usbcore: registered new interface driver usb-storage
[    2.963076] usbcore: registered new interface driver usbserial
[    2.963103] usbcore: registered new interface driver ch341
[    2.963123] usbserial: USB Serial support registered for ch341-uart
[    2.963147] usbcore: registered new interface driver cp210x
[    2.963164] usbserial: USB Serial support registered for cp210x
[    2.963194] usbcore: registered new interface driver ftdi_sio
[    2.963212] usbserial: USB Serial support registered for FTDI USB Serial Device
[    2.963262] usbcore: registered new interface driver option
[    2.963279] usbserial: USB Serial support registered for GSM modem (1-port)
[    2.963303] usbcore: registered new interface driver pl2303
[    2.963319] usbserial: USB Serial support registered for pl2303
[    2.963518] tegra-usb-cd usb_cd: otg phy is not available yet
[    2.964595] eqos 2490000.ether_qos: Setting local MAC: 0 4 4b a8 11 d9
[    2.965151] libphy: dwc_phy: probed
[    2.965992] tegra-xudc-new 3550000.xudc: usb2 phy is not available yet
[    2.968605] tegradc 15210000.nvdisplay: blank - powerdown
[    3.027851] PD DISP2 index4 DOWN
[    3.028506] bcm54xx_low_power_mode(): put phy in iddq-lp mode
[    3.028968] PD DISP1 index3 DOWN
[    3.029536] PD DISP0 index2 DOWN
[    3.078936] tegradc 15210000.nvdisplay: unblank
[    3.079051] PD DISP0 index2 UP
[    3.084852] PD DISP1 index3 UP
[    3.085356] PD DISP2 index4 UP
[    3.102815] Parent Clock set for DC plld2
[    3.103853] max77686-rtc max77620-rtc: rtc core: registered max77620-rtc as rtc0
[    3.105689] tegradc 15210000.nvdisplay: hdmi: pclk:162000K, set prod-setting:prod_c_200M
[    3.105699] tegradc 15210000.nvdisplay: hdmi: pclk:162000K, set prod-setting:prod_c_300M
[    3.106300] tegra_rtc c2a0000.rtc: rtc core: registered c2a0000.rtc as rtc1
[    3.106315] tegra_rtc c2a0000.rtc: Tegra internal Real Time Clock
[    3.106456] i2c /dev entries driver
[    3.107837] [OV5693]: probing v4l2 sensor.
[    3.274827] ata1: SATA link down (SStatus 0 SControl 300)
[    3.910062] max77620-power max77620-power: Event recorder REG_NVERC : 0x0
[    3.911941] FAN dev name: pwm-fan
[    3.911986] FAN:gpio request success.
[    3.911991] FAN: can't find tach_gpio
[    3.912013] pwm_fan_driver pwm-fan: cap state:7, cap pwm:255
[    3.912168] pwm_fan_driver pwm-fan: got pwm for fan
[    3.912171] pwm_fan_driver pwm-fan: tach period: 1000
[    3.912447] pwm_fan_driver pwm-fan: index 0: pwm=0, rpm=0, rru=40, rrd=40, state:2
[    3.912450] pwm_fan_driver pwm-fan: index 1: pwm=80, rpm=1000, rru=2, rrd=2, state:2
[    3.912453] pwm_fan_driver pwm-fan: index 2: pwm=120, rpm=2000, rru=1, rrd=1, state:2
[    3.912456] pwm_fan_driver pwm-fan: index 3: pwm=160, rpm=3000, rru=1, rrd=1, state:2
[    3.912459] pwm_fan_driver pwm-fan: index 4: pwm=255, rpm=4000, rru=1, rrd=1, state:3
[    3.912461] pwm_fan_driver pwm-fan: index 5: pwm=255, rpm=5000, rru=1, rrd=1, state:3
[    3.912464] pwm_fan_driver pwm-fan: index 6: pwm=255, rpm=6000, rru=1, rrd=1, state:3
[    3.912467] pwm_fan_driver pwm-fan: index 7: pwm=255, rpm=7000, rru=1, rrd=1, state:4
[    3.912470] pwm_fan_driver pwm-fan: index 8: pwm=255, rpm=10000, rru=1, rrd=1, state:4
[    3.912473] pwm_fan_driver pwm-fan: index 9: pwm=255, rpm=11000, rru=1, rrd=1, state:4
[    3.913251] device-mapper: uevent: version 1.0.3
[    3.913438] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised: dm-devel@redhat.com
[    3.913853] sdhci: Secure Digital Host Controller Interface driver
[    3.913854] sdhci: Copyright(c) Pierre Ossman
[    3.913858] sdhci-pltfm: SDHCI platform and OF driver helper
[    3.914107] sdhci-tegra 3460000.sdhci: Parent select= pll_p rate=408000000
[    3.914386] sdhci-tegra 3460000.sdhci: Parent select= pll_c4_out0 rate=196249804
[    3.914610] sdhci-tegra 3460000.sdhci: Client registration for eMC Successful
[    3.950806] mmc0: SDHCI controller on 3460000.sdhci [3460000.sdhci] using ADMA 64-bit with 64 bit addr
[    3.951009] sdhci-tegra 3440000.sdhci: Parent select= pll_p rate=408000000
[    3.951229] sdhci-tegra 3440000.sdhci: Client registration for eMC Successful
[    3.986803] mmc1: SDHCI controller on 3440000.sdhci [3440000.sdhci] using ADMA 64-bit with 64 bit addr
[    3.987028] sdhci-tegra 3400000.sdhci: Got CD GPIO
[    3.987080] sdhci-tegra 3400000.sdhci: Got WP GPIO
[    3.987157] sdhci-tegra 3400000.sdhci: Parent select= pll_p rate=408000000
[    3.987182] sdhci-tegra 3400000.sdhci: wakeup init done, cd_irq: 256
[    3.987400] sdhci-tegra 3400000.sdhci: Client registration for eMC Successful
[    4.020802] mmc0: MAN_BKOPS_EN bit is not set
[    4.028430] mmc0: Skipping tuning since strobe enabled
[    4.030913] mmc2: SDHCI controller on 3400000.sdhci [3400000.sdhci] using ADMA 64-bit with 64 bit addr
[    4.032838] tegra-se-elp 3ad0000.se_elp: tegra_se_elp_probe: complete
[    4.032958] hidraw: raw HID events driver (C) Jiri Kosina
[    4.034427] usbcore: registered new interface driver usbhid
[    4.034428] usbhid: USB HID core driver
[    4.036080] mmc0: periodic cache flush enabled
[    4.036089] mmc0: new HS400 MMC card at address 0001
[    4.036530] mmcblk0: mmc0:0001 032G34 29.1 GiB 
[    4.036805] mmcblk0boot0: mmc0:0001 032G34 partition 1 4.00 MiB
[    4.037060] mmcblk0boot1: mmc0:0001 032G34 partition 2 4.00 MiB
[    4.037307] mmcblk0rpmb: mmc0:0001 032G34 partition 3 4.00 MiB
[    4.038657]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29
[    4.039731] Denver: backdoor interface is NOT available.
[    4.041591] coresight-tmc 8030000.etf: TMC initialized
[    4.044300] coresight-tmc 8050000.etr: TMC initialized
[    4.046559] coresight-tpiu 8060000.tpiu: TPIU initialized
[    4.047060] coresight-funnel 9010000.funnel_bccplex: FUNNEL initialized
[    4.047466] coresight-funnel 8010000.funnel_major: FUNNEL initialized
[    4.047854] coresight-funnel 8820000.funnel_minor: FUNNEL initialized
[    4.048287] coresight-replicator 8040000.replicator: REPLICATOR initialized
[    4.048887] coresight-etm4x 9840000.ptm: ETM 4.0 initialized
[    4.049401] coresight-etm4x 9940000.ptm: ETM 4.0 initialized
[    4.049944] coresight-etm4x 9a40000.ptm: ETM 4.0 initialized
[    4.050463] coresight-etm4x 9b40000.ptm: ETM 4.0 initialized
[    4.050489] Module initialized successfully 
[    4.054045] tegra186-cam-rtcpu b000000.rtcpu: Trace buffer configured at IOVA=0xa0000000
[    4.055318] tegra186-cam-rtcpu b000000.rtcpu: already unhalted
[    4.056063] tegra-ivc ivc-b000000.rtcpu: region 0: iova=0xa0110000-0xa011957f size=38272
[    4.056450] tegra-ivc ivc-b000000.rtcpu:echo@0: echo: ver=0 grp=1 RX[16x64]=0x1000-0x1480 TX[16x64]=0x1480-0x1900
[    4.056495] tegra-ivc ivc-b000000.rtcpu:vinotify@12c0: vinotify: ver=0 grp=1 RX[64x128]=0x1900-0x3980 TX[64x128]=0x3980-0x5a00
[    4.056536] tegra-ivc ivc-b000000.rtcpu:mods@32c0: mods: ver=0 grp=1 RX[1x64]=0x5a00-0x5ac0 TX[1x64]=0x5ac0-0x5b80
[    4.056575] tegra-ivc ivc-b000000.rtcpu:ivccontrol@52c0: ivccontrol: ver=0 grp=1 RX[16x320]=0x5b80-0x7000 TX[16x320]=0x7000-0x8480
[    4.056611] tegra-ivc ivc-b000000.rtcpu:ivccapture@72c0: ivccapture: ver=0 grp=1 RX[16x64]=0x8480-0x8900 TX[16x64]=0x8900-0x8d80
[    4.056649] tegra-ivc ivc-b000000.rtcpu:dbg@7c00: dbg: ver=0 grp=1 RX[1x384]=0x8d80-0x8f80 TX[1x384]=0x8f80-0x9180
[    4.056687] tegra-ivc ivc-b000000.rtcpu:dbg@7e00: dbg: ver=0 grp=1 RX[1x384]=0x9180-0x9380 TX[1x384]=0x9380-0x9580
[    4.056832] tegra186-cam-rtcpu b000000.rtcpu: using cam RTCPU IRQ (52)
[    4.056834] tegra186-cam-rtcpu b000000.rtcpu: tegra_camrtc_mon_create is successful
[    4.057718] random: nonblocking pool is initialized
[    4.057887] tegra-ivc ivc-b000000.rtcpu:echo@0: ivc channel driver missing
[    4.057890] tegra-ivc ivc-b000000.rtcpu:vinotify@12c0: ivc channel driver missing
[    4.057893] tegra-ivc ivc-b000000.rtcpu:mods@32c0: ivc channel driver missing
[    4.057895] tegra-ivc ivc-b000000.rtcpu:ivccontrol@52c0: ivc channel driver missing
[    4.057897] tegra-ivc ivc-b000000.rtcpu:ivccapture@72c0: ivc channel driver missing
[    4.057899] tegra-ivc ivc-b000000.rtcpu:dbg@7c00: ivc channel driver missing
[    4.057901] tegra-ivc ivc-b000000.rtcpu:dbg@7e00: ivc channel driver missing
[    4.057927] tegra186-cam-rtcpu b000000.rtcpu: firmware version cpu=sce cmd=4 sha1=a8b1ecdd9615cd817a56df035be363fce3b0b88f
[    4.063279] tegra-ivc-cdev ivc-b000000.rtcpu:echo@0: probing /dev/camchar-echo
[    4.064442] tegra-ivc-cdev ivc-b000000.rtcpu:dbg@7c00: probing /dev/camchar-dbg
[    4.064569] camchar: rtcpu character device driver loaded
[    4.068872] tegra186-aondbg aondbg: aondbg driver probe() OK
[    4.069105] register_ari_mca_banks: Registered MCA ROC:IOB
[    4.069195] register_ari_mca_banks: Registered MCA ROC:CCE
[    4.069526] tegra18-bridge 2390000.axi2apb: bridge probed OK
[    4.069554] tegra18-bridge 23a0000.axi2apb: bridge probed OK
[    4.069579] tegra18-bridge 23b0000.axi2apb: bridge probed OK
[    4.069601] tegra18-bridge 23c0000.axi2apb: bridge probed OK
[    4.069625] tegra18-bridge 23d0000.axi2apb: bridge probed OK
[    4.069649] tegra18-bridge 2100000.axip2p: bridge probed OK
[    4.069672] tegra18-bridge 2110000.axip2p: bridge probed OK
[    4.069695] tegra18-bridge 2120000.axip2p: bridge probed OK
[    4.069718] tegra18-bridge 2130000.axip2p: bridge probed OK
[    4.069742] tegra18-bridge 2140000.axip2p: bridge probed OK
[    4.069765] tegra18-bridge 2150000.axip2p: bridge probed OK
[    4.069788] tegra18-bridge 2160000.axip2p: bridge probed OK
[    4.069810] tegra18-bridge 2170000.axip2p: bridge probed OK
[    4.069836] tegra18-bridge 2180000.axip2p: bridge probed OK
[    4.069859] tegra18-bridge 2190000.axip2p: bridge probed OK
[    4.069908] **** A57 ECC: Enabled
[    4.069910] tegra18_a57_serr_init: on CPU 5 a A57 Core
[    4.070048] parse_throttle_dt_data: Num cap clks = 4
[    4.070051] parse_throttle_dt_data: clk=mcpu type=1
[    4.070053] parse_throttle_dt_data: clk=bcpu type=2
[    4.070058] parse_throttle_dt_data: clk=gpu type=4
[    4.070060] parse_throttle_dt_data: clk=emc type=3
[    4.070528] tegra_throttle_probe: probe successful. #cdevs=4
[    4.070610] tegra18x_actmon d230000.actmon: in actmon_register()...
[    4.073069] tegra18x_actmon d230000.actmon: initialization Completed for the device mc_all
[    4.073373] hw perfevents: enabled with denver15_uncore_pmu PMU driver, 3 counters available
[    4.075436] tegra-se-nvhost 15810000.se: initialized
[    4.076721] tegra-se-nvhost 15810000.se: tegra_se_probe: complete
[    4.077306] tegra-se-nvhost 15820000.se: initialized
[    4.078691] tegra-se-nvhost 15820000.se: tegra_se_probe: complete
[    4.079263] tegra-se-nvhost 15830000.se: initialized
[    4.080243] tegra-se-nvhost 15830000.se: tegra_se_probe: complete
[    4.080814] tegra-se-nvhost 15840000.se: initialized
[    4.081013] mmc1: queuing unknown CIS tuple 0x80 (5 bytes)
[    4.082149] tegra-se-nvhost 15840000.se: tegra_se_probe: complete
[    4.084404] tegra-gpcdma 2600000.dma: GPC DMA driver register 32 channels
[    4.087843] cpufreq: platform driver Initialization: pass
[    4.087982] tegra_cluster_clk e090000.cluster_clk_priv: in probe()...
[    4.088040] tegra_cluster_clk e090000.cluster_clk_priv: passed
[    4.088213] tegra186-padctl 3520000.pinctrl: padctl mmio start 0x0000000003520000 end 0x0000000003520fff
[    4.088218] tegra186-padctl 3520000.pinctrl: ao mmio start 0x0000000003540000 end 0x0000000003540fff
[    4.088252] tegra186-padctl 3520000.pinctrl: FUSE_SKU_USB_CALIB_0 0x30b897
[    4.088255] tegra186-padctl 3520000.pinctrl: FUSE_USB_CALIB_EXT_0 0x9
[    4.089347] tegra186-padctl 3520000.pinctrl: using UTMI port 0 for otg
[    4.089868] tegra186-padctl 3520000.pinctrl: VBUS over-current detection enabled
[    4.090358] tegra-bpmp-thermal d000000.bpmp:bpmpthermal: zone 0 not supported
[    4.090764] tegra-bpmp-thermal d000000.bpmp:bpmpthermal: zone 3 not supported
[    4.092288] cpuidle: Initializing cpuidle driver init for Denver cluster
[    4.092398] cpuidle: Initializing cpuidle driver init for A57 cluster
[    4.093270] tachometer tegra-tachometer: Tachometer driver tegra-tachometer registered
[    4.093273] Tachometer driver initialized with pulse_per_rev: 2 and win_len: 2
[    4.101928] input: tegra-hda HDMI/DP,pcm=3 as /devices/3510000.hda/sound/card0/input0
[    4.102047] input: tegra-hda HDMI/DP,pcm=7 as /devices/3510000.hda/sound/card0/input1
[    4.107656] OPE platform probe
[    4.107731] OPE platform probe successful
[    4.148701] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF1 <-> ADMAIF1 mapping ok
[    4.148775] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF2 <-> ADMAIF2 mapping ok
[    4.148845] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF3 <-> ADMAIF3 mapping ok
[    4.148913] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF4 <-> ADMAIF4 mapping ok
[    4.148984] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF5 <-> ADMAIF5 mapping ok
[    4.149054] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF6 <-> ADMAIF6 mapping ok
[    4.149123] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF7 <-> ADMAIF7 mapping ok
[    4.149189] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF8 <-> ADMAIF8 mapping ok
[    4.149258] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF9 <-> ADMAIF9 mapping ok
[    4.149326] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF10 <-> ADMAIF10 mapping ok
[    4.149393] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF11 <-> ADMAIF11 mapping ok
[    4.149460] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF12 <-> ADMAIF12 mapping ok
[    4.149525] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF13 <-> ADMAIF13 mapping ok
[    4.149592] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF14 <-> ADMAIF14 mapping ok
[    4.149658] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF15 <-> ADMAIF15 mapping ok
[    4.149730] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF16 <-> ADMAIF16 mapping ok
[    4.149798] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF17 <-> ADMAIF17 mapping ok
[    4.149866] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF18 <-> ADMAIF18 mapping ok
[    4.149933] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF19 <-> ADMAIF19 mapping ok
[    4.150000] tegra-snd-t186ref-mobile-rt565x sound: ADMAIF20 <-> ADMAIF20 mapping ok
[    4.172532] input: tegra-snd-t186ref-mobile-rt565x Headphone Jack as /devices/sound/sound/card1/input2
[    4.173532] tegra-snd-t186ref-mobile-rt565x sound: codec-dai "dit-hifi" registered
[    4.173535] tegra-snd-t186ref-mobile-rt565x sound: This is a dummy codec
[    4.174117] GACT probability NOT on
[    4.174127] Mirror/redirect action on
[    4.174141] u32 classifier
[    4.174142]     Actions configured
[    4.174162] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
[    4.174823] IPVS: Registered protocols ()
[    4.174856] IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
[    4.174923] IPVS: Creating netns size=1424 id=0
[    4.174950] IPVS: ipvs loaded.
[    4.174955] IPVS: [rr] scheduler registered.
[    4.175026] ipip: IPv4 over IPv4 tunneling driver
[    4.175353] Initializing XFRM netlink socket
[    4.175650] NET: Registered protocol family 10
[    4.176232] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    4.176286] NET: Registered protocol family 17
[    4.176298] NET: Registered protocol family 15
[    4.176320] bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
[    4.176386] Bluetooth: RFCOMM socket layer initialized
[    4.176396] Bluetooth: RFCOMM ver 1.11
[    4.176404] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    4.176408] Bluetooth: HIDP socket layer initialized
[    4.176416] 8021q: 802.1Q VLAN Support v1.8
[    4.180180] Registered cp15_barrier emulation handler
[    4.180219] Registered setend emulation handler
[    4.182125] registered taskstats version 1
[    4.185512] isp 15600000.isp: initialized
[    4.190086] nvcsi 150c0000.nvcsi: initialized
[    4.191038] Wake76 for irq=199
[    4.191039] Wake77 for irq=199
[    4.191040] Wake78 for irq=199
[    4.191041] Wake79 for irq=199
[    4.191041] Wake80 for irq=199
[    4.191042] Wake81 for irq=199
[    4.191043] Wake82 for irq=199
[    4.191360] xhci-tegra 3530000.xhci: UTMI port 0 has OTG_CAP
[    4.191362] xhci-tegra 3530000.xhci: No USB3 port has OTG_CAP
[    4.215047] spi-tegra114 3210000.spi: Static pin configuration used
[    4.215191] xhci-tegra 3530000.xhci: Direct firmware load for tegra18x_xusb_firmware failed with error -2
[    4.215192] xhci-tegra 3530000.xhci: Falling back to user helper
[    4.215646] spi-tegra114 c260000.spi: Static pin configuration used
[    4.216360] spi-tegra114 3240000.spi: Static pin configuration used
[    4.217033] tegra-xotg xotg: OTG rev:0200, ADP:0, SRP:1, HNP:1, RSP:0
[    4.217066] tegra-xotg xotg: update_id_state: ID floating
[    4.217071] tegra-xotg xotg: update_vbus_state: VBUS not detected
[    4.217084] tegra-xotg xotg: Nvidia XUSB OTG Controller
[    4.218725] tegra-xotg xotg: otg: gadget gadget registered
[    4.218727] tegra-xotg xotg: set gadget otg_caps from OTG controller
[    4.218728] tegra-xotg xotg: otg: host not registered yet
[    4.218730] tegra-xotg xotg: otg: start OTG finite state machine
[    4.218768] tegra-xudc-new 3550000.xudc: entering ELPG
[    4.219263] tegra-xudc-new 3550000.xudc: entering ELPG done
[    4.219783] input: gpio-keys as /devices/gpio-keys/input/input3
[    4.256926] tegra_rtc c2a0000.rtc: setting system clock to 2020-02-06 21:23:32 UTC (1581024212)
[    4.279379] mmc1 tuning done saved tap delay=19
[    4.279381] mmc1: hw tuning done ...
[    4.279387] mmc1: tuning_window[0]: 0xfffffffe
[    4.279392] mmc1: tuning_window[1]: 0xfffffc7f
[    4.279396] mmc1: tuning_window[2]: 0xfff8ffff
[    4.279421] mmc1: tuning_window[3]: 0x71ffffff
[    4.279425] mmc1: tuning_window[4]: 0x0
[    4.279430] mmc1: tuning_window[5]: 0x0
[    4.279434] mmc1: tuning_window[6]: 0x0
[    4.279438] mmc1: tuning_window[7]: 0x0
[    4.284952] mmc1: queuing unknown CIS tuple 0x91 (3 bytes)
[    4.284990] mmc1: new ultra high speed SDR104 SDIO card at address 0001
[    4.286714] bpmp: mounted debugfs mirror
[    4.287218] [dram-timers] DRAM derating cdev registered.
[    4.291383] spmic-ldo0: disabling
[    4.291558] spmic-ldo1: disabling
[    4.291708] en-vdd-sd: disabling
[    4.291709] en-vdd-cam: disabling
[    4.291711] vdd-usb0-5v: disabling
[    4.291713] vdd-usb1-5v: disabling
[    4.291716] en-vdd-disp-3v3: disabling
[    4.291717] en-mdm-pwr-3v7: disabling
[    4.291718] en-vdd-disp-1v8: disabling
[    4.291720] en-vdd-cam-hv-2v8: disabling
[    4.291721] en-vdd-cam-1v2: disabling
[    4.291722] vdd-fan: disabling
[    4.291724] vdd-3v3: disabling
[    4.291726] en-vdd-vcm-2v8: disabling
[    4.291727] vdd-usb2-5v: disabling
[    4.291729] vdd-sys-bl: disabling
[    4.291730] en-vdd-sys: disabling
[    4.298010] ALSA device list:
[    4.298012]   #0: tegra-hda at 0x3518000 irq 400
[    4.298013]   #1: tegra-snd-t186ref-mobile-rt565x
[    4.300424] tegra-vi4 15700000.vi: initialized
[    4.301835] tegra-vi4 15700000.vi: subdev 150c0000.nvcsi-2 bound
[    4.301840] tegra-vi4 15700000.vi: subdev ov5693 2-0036 bound
[    6.371738] tegradc 15210000.nvdisplay: hdmi: plugged
[    6.472227] EXT4-fs (mmcblk0p1): 7 orphan inodes deleted
[    6.479080] EXT4-fs (mmcblk0p1): recovery complete
[    6.489591] EXT4-fs (mmcblk0p1): mounted filesystem with ordered data mode. Opts: (null)
[    6.499176] VFS: Mounted root (ext4 filesystem) on device 179:1.
[    6.508183] devtmpfs: mounted
[    6.512939] Freeing unused kernel memory: 1168K
[    6.519009] Freeing alternatives memory: 100K
[    6.533083] btb inv war enabled
[    6.588365] systemd[1]: systemd 229 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +)
[    6.610033] systemd[1]: Detected architecture arm64.
[    6.628922] systemd[1]: Set hostname to <jetson-0320218169735>.
[    6.768831] systemd[1]: Listening on LVM2 poll daemon socket.
[    6.778563] systemd[1]: PNFS blkmaping enablement. is not active.
[    6.788592] systemd[1]: Dependency failed for pNFS block layout mapping daemon.
[    6.799765] systemd[1]: nfs-blkmap.service: Job nfs-blkmap.service/start failed with result 'dependency'.
[    6.811276] systemd[1]: Listening on Journal Socket (/dev/log).
[    6.822528] systemd[1]: Listening on udev Control Socket.
[    6.831179] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    6.841924] systemd[1]: Listening on LVM2 metadata daemon socket.
[    6.851988] systemd[1]: Created slice System Slice.
[    6.860764] systemd[1]: Created slice system-getty.slice.
[    6.869301] systemd[1]: Listening on Journal Socket.
[    6.879221] systemd[1]: Mounting RPC Pipe File System...
[    6.890017] systemd[1]: Starting Create list of required static device nodes for the current kernel...
[    6.905112] systemd[1]: Mounting Debug File System...
[    6.914169] systemd[1]: Listening on Journal Audit Socket.
[    6.925335] systemd[1]: Started Braille Device Support.
[    6.934824] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    6.947270] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    6.961722] systemd[1]: Reached target Swap.
[    6.970825] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    6.985956] systemd[1]: Created slice User and Session Slice.
[    6.995600] systemd[1]: Reached target Slices.
[    7.003952] systemd[1]: Listening on Syslog Socket.
[    7.014739] systemd[1]: Starting Journal Service...
[    7.024225] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    7.040775] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[    7.051989] systemd[1]: Listening on udev Kernel Socket.
[    7.061461] systemd[1]: Reached target Encrypted Volumes.
[    7.073018] systemd[1]: Starting Remount Root and Kernel File Systems...
[    7.079186] EXT4-fs (mmcblk0p1): re-mounted. Opts: (null)
[    7.093882] systemd[1]: Mounting POSIX Message Queue File System...
[    7.111162] systemd[1]: Starting Load Kernel Modules...
[    7.122887] systemd[1]: Mounting NFSD configuration filesystem...
[    7.133530] systemd[1]: Reached target User and Group Name Lookups.
[    7.148469] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    7.148569] systemd[1]: Mounted RPC Pipe File System.
[    7.168657] systemd[1]: Mounted Debug File System.
[    7.181923] systemd[1]: Mounted POSIX Message Queue File System.
[    7.193604] systemd[1]: Mounted NFSD configuration filesystem.
[    7.203909] systemd[1]: Started Journal Service.
[    7.309207] systemd-journald[266]: Received request to flush runtime journal from PID 1
[    7.477555] tegra-pcie 10003000.pcie-controller: 4x1, 1x1 configuration
[    7.490814] tegra-pcie 10003000.pcie-controller: PCIE: Enable power rails
[    7.501379] tegra-pcie 10003000.pcie-controller: probing port 0, using 4 lanes
[    7.502996] tegra-pcie 10003000.pcie-controller: probing port 2, using 1 lanes
[    7.541791] xhci-tegra 3530000.xhci: cannot find firmware....retry after 1 second
[    7.641702] dhd_module_init in
[    7.648445] tegra_net_perf_init: cannot get wifi sclk
[    7.649006] found wifi platform device bcmdhd_wlan
[    7.655147] wifi_platform_get_country_code_map: could not get country_code_map
[    7.655149] wifi_plat_dev_drv_probe:platform country code map is not available
[    7.655158] Power-up adapter 'DHD generic adapter'
[    7.655165] wifi_platform_set_power = 1
[    7.859579] wifi_platform_bus_enumerate device present 1
[    7.879053] wifi_platform_bus_enumerate device present 0
[    7.879783] F1 signature read @0x18000000=0x17214354
[    7.883358] F1 signature OK, socitype:0x1 chip:0x4354 rev:0x1 pkg:0x2
[    7.883867] DHD: dongle ram size is set to 786432(orig 786432) at 0x180000
[    7.883934] wifi_platform_get_mac_addr
[    7.919953] CFG80211-ERROR) wl_setup_wiphy : Registering Vendor80211
[    7.920213] wl_create_event_handler(): thread:wl_event_handler:217 started
[    7.920229] CFG80211-ERROR) wl_event_handler : tsk Enter, tsk = 0xffffffc079be1a70
[    7.920343] dhd_attach(): thread:dhd_watchdog_thread:218 started
[    7.920477] dhd_attach(): thread:dhd_dpc:21a started
[    7.920531] dhd_attach(): thread:dhd_rxf:21b started
[    7.920536] dhd_deferred_work_init: work queue initialized 
[    7.926843] Dongle Host Driver, version 1.201.82 (r)
[    7.926843] Compiled in drivers/net/wireless/bcmdhd on Oct 31 2019 at 14:10:10
[    7.927143] tegra_sysfs_register
[    7.927171] Register interface [wlan0]  MAC: 00:04:4b:a8:11:d7
[    7.927171] 
[    7.927174] dhd_prot_ioctl : bus is down. we have nothing to do
[    7.927264] sdhci-tegra 3440000.sdhci: Tuning already done, restoring the best tap value : 19
[    7.928307] wifi_platform_set_power = 0
[    7.974805] tegra-pcie 10003000.pcie-controller: link 0 down, retrying
[    8.370812] tegra-pcie 10003000.pcie-controller: link 0 down, retrying
[    8.401563] using random self ethernet address
[    8.408350] using random host ethernet address
[    8.422757] Mass Storage Function, version: 2009/09/11
[    8.430189] LUN: removable file: (no medium)
[    8.441075] using random self ethernet address
[    8.447909] using random host ethernet address
[    8.459958] usb0: HOST MAC 0e:8b:74:aa:ef:7b
[    8.466654] usb0: MAC aa:ce:13:50:fb:61
[    8.473283] usb1: HOST MAC 0e:aa:fd:f7:7b:2a
[    8.481316] usb1: MAC 6e:ce:c0:69:78:93
[    8.489292] tegra-xudc-new 3550000.xudc: exiting ELPG
[    8.499431] tegra-xudc-new 3550000.xudc: exiting ELPG done
[    8.507627] tegra-xudc-new 3550000.xudc: ep 0 (type: 0, dir: out) enabled
[    8.518821] tegra-xudc-new 3550000.xudc: entering ELPG
[    8.527930] tegra-xudc-new 3550000.xudc: entering ELPG done
[    8.535878] tegra-xudc-new 3550000.xudc: exiting ELPG
[    8.544078] tegra-xudc-new 3550000.xudc: exiting ELPG done
[    8.558548] tegra-xudc-new 3550000.xudc: entering ELPG
[    8.559268] tegra-xudc-new 3550000.xudc: entering ELPG done
[    8.608194] xhci-tegra 3530000.xhci: Firmware timestamp: 2017-12-07 10:50:08 UTC, Version: 55.09 release
[    8.621967] xhci-tegra 3530000.xhci: xHCI Host Controller
[    8.629562] xhci-tegra 3530000.xhci: new USB bus registered, assigned bus number 1
[    8.640172] xhci-tegra 3530000.xhci: hcc params 0x0184fd25 hci version 0x100 quirks 0x00010810
[    8.651211] xhci-tegra 3530000.xhci: irq 59, io mem 0x03530000
[    8.659287] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    8.668457] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    8.677772] usb usb1: Product: xHCI Host Controller
[    8.687254] usb usb1: Manufacturer: Linux 4.4.159-tegra xhci-hcd
[    8.695287] usb usb1: SerialNumber: 3530000.xhci
[    8.702199] hub 1-0:1.0: USB hub found
[    8.708022] hub 1-0:1.0: 4 ports detected
[    8.714390] xhci-tegra 3530000.xhci: xHCI Host Controller
[    8.721872] xhci-tegra 3530000.xhci: new USB bus registered, assigned bus number 2
[    8.731568] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    8.740565] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    8.749845] usb usb2: Product: xHCI Host Controller
[    8.756840] usb usb2: Manufacturer: Linux 4.4.159-tegra xhci-hcd
[    8.764883] usb usb2: SerialNumber: 3530000.xhci
[    8.771979] hub 2-0:1.0: USB hub found
[    8.772002] hub 2-0:1.0: 3 ports detected
[    8.772357] tegra-xotg xotg: otg: host 3530000.xhci registered
[    8.808856] tegra-pcie 10003000.pcie-controller: link 0 down, retrying
[    8.810801] tegra-pcie 10003000.pcie-controller: link 0 down, ignoring
[    8.893723] device usb0 entered promiscuous mode
[    8.905299] IPv6: ADDRCONF(NETDEV_UP): usb0: link is not ready
[    8.916835] device usb1 entered promiscuous mode
[    8.927530] IPv6: ADDRCONF(NETDEV_UP): usb1: link is not ready
[    8.934871] l4tbr0: port 2(usb1) entered forwarding state
[    8.941745] l4tbr0: port 2(usb1) entered forwarding state
[    9.022821] usb 1-2: new high-speed USB device number 2 using xhci-tegra
[    9.159028] usb 1-2: feature bit otg_vbus_off set
[    9.159033] usb 1-2: New USB device found, idVendor=0424, idProduct=2504
[    9.159035] usb 1-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    9.159695] xhci-tegra 3530000.xhci: tegra_xhci_mbox_work mailbox command 6
[    9.159951] hub 1-2:1.0: USB hub found
[    9.160009] hub 1-2:1.0: 4 ports detected
[    9.212291] tegra-pcie 10003000.pcie-controller: link 2 down, retrying
[    9.462870] l4tbr0: port 2(usb1) entered disabled state
[    9.478822] usb 1-2.3: new low-speed USB device number 3 using xhci-tegra
[    9.485376] gk20a 17000000.gp10b: railgate is disabled.
[    9.496957] IPVS: Creating netns size=1424 id=1
[    9.602810] usb 1-2.3: New USB device found, idVendor=0461, idProduct=4d65
[    9.614279] usb 1-2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    9.625753] usb 1-2.3: Product: USB Optical Mouse
[    9.633572] usb 1-2.3: Manufacturer: PixArt
[    9.641063] usb 1-2.3: ep 0x81 - rounding interval to 64 microframes, ep desc says 80 microframes
[    9.652803] tegra-pcie 10003000.pcie-controller: link 2 down, retrying
[    9.666259] input: PixArt USB Optical Mouse as /devices/3530000.xhci/usb1/1-2/1-2.3/1-2.3:1.0/0003:0461:4D65.0001/input/input4
[    9.681301] hid-generic 0003:0461:4D65.0001: input,hidraw0: USB HID v1.11 Mouse [PixArt USB Optical Mouse] on usb-3530000.xhci-2.3/input0
[    9.766851] usb 1-2.4: new low-speed USB device number 4 using xhci-tegra
[    9.860028] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
[    9.870187] 
[    9.870187] Dongle Host Driver, version 1.201.82 (r)
[    9.870187] Compiled in drivers/net/wireless/bcmdhd on Oct 31 2019 at 14:10:10
[    9.885751] usb 1-2.4: New USB device found, idVendor=413c, idProduct=2105
[    9.885757] usb 1-2.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    9.885762] usb 1-2.4: Product: Dell USB Keyboard
[    9.885765] usb 1-2.4: Manufacturer: Dell
[    9.886196] usb 1-2.4: ep 0x81 - rounding interval to 128 microframes, ep desc says 192 microframes
[    9.903484] input: Dell Dell USB Keyboard as /devices/3530000.xhci/usb1/1-2/1-2.4/1-2.4:1.0/0003:413C:2105.0002/input/input5
[    9.959858] hid-generic 0003:413C:2105.0002: input,hidraw1: USB HID v1.10 Keyboard [Dell Dell USB Keyboard] on usb-3530000.xhci-2.4/input0
[   10.002340] wl_android_wifi_on in
[   10.011165] wifi_platform_set_power = 1
[   10.208865] tegra-pcie 10003000.pcie-controller: link 2 down, retrying
[   10.210813] tegra-pcie 10003000.pcie-controller: link 2 down, ignoring
[   10.210820] tegra-pcie 10003000.pcie-controller: PCIE: no end points detected
[   10.237668] tegra-pcie 10003000.pcie-controller: PCIE: Disable power rails
[   10.316633] mmc1: queuing unknown CIS tuple 0x80 (5 bytes)
[   10.395745] sdhci-tegra 3440000.sdhci: Tuning already done, restoring the best tap value : 19
[   10.411343] F1 signature read @0x18000000=0x17214354
[   10.423656] xhci-tegra 3530000.xhci: tegra_xhci_mbox_work mailbox command 5
[   10.423664] xhci-tegra 3530000.xhci: tegra_xhci_mbox_work ignore firmware MBOX_CMD_DEC_SSPI_CLOCK request
[   10.465797] F1 signature OK, socitype:0x1 chip:0x4354 rev:0x1 pkg:0x2
[   10.487704] DHD: dongle ram size is set to 786432(orig 786432) at 0x180000
[   10.651483] dhdsdio_write_vars: Download, Upload and compare of NVRAM succeeded.
[   10.694597] dhd_bus_init: enable 0x06, ready 0x06 (waited 0us)
[   10.723158] Enabling wake69
[   10.762410] wifi_platform_get_mac_addr
[   10.789683] Firmware up: op_mode=0x0005, MAC=00:04:4b:a8:11:d7
[   10.825508] dhd_preinit_ioctls pspretend_threshold for HostAPD failed  -23
[   10.860573] Firmware version = wl0: May 23 2018 16:37:00 version 7.35.349.47 (r690136 CY) FWID 01-5a659ebd
[   10.895437] dhd_interworking_enable: failed to set WNM info, ret=-23
[   10.919858] tegra_sysfs_on
[   10.964357] cfg80211: World regulatory domain updated:
[   10.980391] cfg80211:  DFS Master region: unset
[   10.985462] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   11.008846] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   11.024162] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   11.047421] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[   11.060494] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   11.074928] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   11.089233] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[   11.102145] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[   11.114194] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[   11.126996] Bridge firewalling registered
[   11.173840] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   11.182609] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   11.269514] tegradc 15210000.nvdisplay: blank - powerdown
[   11.309261] ip_tables: (C) 2000-2006 Netfilter Core Team
[   11.328075] PD DISP2 index4 DOWN
[   11.328475] PD DISP1 index3 DOWN
[   11.328662] PD DISP0 index2 DOWN
[   11.350211] tegradc 15210000.nvdisplay: unblank
[   11.350437] PD DISP0 index2 UP
[   11.351907] PD DISP1 index3 UP
[   11.351995] PD DISP2 index4 UP
[   11.353694] Parent Clock set for DC plld2
[   11.358035] tegradc 15210000.nvdisplay: hdmi: pclk:162000K, set prod-setting:prod_c_200M
[   11.358044] tegradc 15210000.nvdisplay: hdmi: pclk:162000K, set prod-setting:prod_c_300M
[   11.395893] CFGP2P-ERROR) wl_cfgp2p_add_p2p_disc_if : P2P interface registered
[   11.411001] WLC_E_IF: NO_IF set, event Ignored
[   11.726756] Netfilter messages via NETLINK v0.30.
[   11.735447] ctnetlink v0.93: registering with nfnetlink.
[   12.094415] IPv6: ADDRCONF(NETDEV_UP): docker0: link is not ready
[   12.437536] tegradc 15210000.nvdisplay: unblank
[   12.546835] CPU1: shutdown
[   12.549565] psci: CPU1 killed.
[   12.583032] CPU2: shutdown
[   12.585787] psci: CPU2 killed.

Ubuntu 16.04 LTS jetson-0320218169735 ttyS0

jetson-0320218169735 login: nvidia (automatic login)

Last login: Thu Feb  6 14:57:59 CST 2020 from 131.230.193.220 on pts/2
Welcome to Ubuntu 16.04 LTS (GNU/Linux 4.4.159-tegra aarch64)

 * Documentation:  https://help.ubuntu.com/

292 packages can be updated.
0 updates are security updates.

New release '18.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

nvidia@jetson-0320218169735:~$ [   14.563689] CFG80211-ERROR) wl_cfg80211_connect : Connectting withb4:2d:56:88:48:10 channel (64) ssid "eduroam", len (7)

[   14.689772] CFG80211-ERROR) wl_notify_connect_status : wl_bss_connect_done succeeded with b4:2d:56:88:48:10
[   14.716726] CFG80211-ERROR) wl_bss_connect_done : Report connect result - connection succeeded
[   14.728725] CFG80211-ERROR) wl_notify_connect_status : [   14.731416] cfg80211: Regulatory domain changed to country: US
[   14.731418] cfg80211:  DFS Master region: FCC[   14.731419] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   14.731423] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 3000 mBm), (N/A)
[   14.731425] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 1700 mBm), (N/A)
[   14.731427] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2300 mBm), (0 s)
[   14.731429] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2300 mBm), (0 s)
[   14.731430] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 3000 mBm), (N/A)
[   14.731432] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)

[   14.804885] wl_bss_connect_done succeeded with b4:2d:56:88:48:10
[   14.953082] fuse init (API version 7.23)
[   15.174144] dhd_ndo_add_ip: ndo ip addr add failed, retcode = -23
[   15.180313] dhd_inet6_work_handler: Adding host ip for NDO failed -23
[   16.929950] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   16.935308] Bluetooth: BNEP socket layer initialized
[   17.048355] IPVS: Creating netns size=1424 id=2
[   17.263625] tegradc 15210000.nvdisplay: unblank
[   18.327140] IPVS: Creating netns size=1424 id=3
[  330.694544] tegradc 15210000.nvdisplay: blank - powerdown
[  330.765460] PD DISP2 index4 DOWN
[  330.765663] PD DISP1 index3 DOWN
[  330.765805] PD DISP0 index2 DOWN


------=_Part_103_685221992.1581025123163--
