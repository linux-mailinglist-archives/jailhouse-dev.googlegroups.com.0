Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBB4O5Y7YQKGQE7WXNH2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396C14D20B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 21:45:39 +0100 (CET)
Received: by mail-ot1-x33f.google.com with SMTP id a20sf461164otl.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N7IsboFXcnQHLS0Pm3DCcWdQE+bh/hGH/YgE3/tI85o=;
        b=kn8vJYZ+5AvzJm6DloRtmT8+/GALk1qMVzgTRLUlj1F+gb3IDLZC0P3TpP1Jgdvn29
         TZU5S5T5FdDZUcbJCH2G7Kh1JbVuAkDvJ8LhKGW6Dk7mKUkHEeFUQSXRLtBETRVnd5dF
         x4ERXKg/HQ6Yl/uzvpQjOmPnT+9d8GWwOXe7w/hA74cVEDQQxkXzNGAwdbNFIoYlRVta
         iFwa37LWzTBhpxMwIFSsF/aa/vnbM7Pkzj387CHUN+0WY1d6NbtpWUJiwaud4E5uXDTi
         9JYGVduJQijLMp5XqtA3aH2FPqT37Qsz8nZo5Ui3He2zsp78/NL79faFi+5uq9J2mRFY
         K1dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N7IsboFXcnQHLS0Pm3DCcWdQE+bh/hGH/YgE3/tI85o=;
        b=AonoK1tKU1Xhg9Z7Jy4Ij9JLRGLLnYbcIZs+ELwDUEiEqbRVST/tUbEoQRThDl7beT
         xtz4ZmfmtQQ9UMCoTNkj8SSwGTVeobdD5DHWtHQlRQm4yRS1w1Yzsq/LRkQVyUOqqkO9
         +kfby7OIafJpJNbE5Nq1gkQjFnGjjfo3y9wXIRmv3xpMJeePDHD6vQ/AnSCxUOXtiIgP
         gpTGPxlWQZmfjeW4prvbsN7NIA6mPZON2Ilg8W8Gt1bCdzSAATJi1jQvVy1HY9y0FYsJ
         xNCcc2qhsaYKOKSO3j5+Mkoh//6XrjeFrzRXNHBnZI6vt15OZac+RQQhGECW7H7zbDhg
         lnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=N7IsboFXcnQHLS0Pm3DCcWdQE+bh/hGH/YgE3/tI85o=;
        b=Emyts35BCnR6zJoKYyIDid/7N9HRwsLSC/bRqw1D3glDeJybarjUXm2LwgAoX8wsky
         czcck/XOPhVnTKv3QCoXXMWuUtAsmNUUFkdkWQAoCgYJpObNaQHqOz9uCNBwwhyr/C07
         1XWaxOnTe92GKgMX5hM56KcD8xyM/MfkJnrjzI8DHuzz3pS8j0yjG8oU658aK+kzH1zn
         dxJA2MSLdvXaBJZCrMV4H+hD4c1BCJOL2l3h+5Mrdq3NMP/uxZsOXknD0YrcpuU3rzla
         gpNXSZQYkd1StfqqTDMq6+9BWDN98hfCk/ICIsY6Zg3qpZ0jtuZJMMU0+TpuJxPnFLAh
         bx7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+o/dP7Ox+nZArNZqpDvTUiKyWRlZDsEpFJfpDeLulwmxr3ZUP
	Ts5RUcBAelpGgf/FMyPSixM=
X-Google-Smtp-Source: APXvYqxX+XjQmREZI9SFcba7KD//f0IVcgOtDbufF5597ZqrZJyjG3nfISLYVQJwOHGLbpf72rGMUA==
X-Received: by 2002:aca:4e10:: with SMTP id c16mr524562oib.6.1580330738036;
        Wed, 29 Jan 2020 12:45:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4604:: with SMTP id y4ls211333ote.7.gmail; Wed, 29 Jan
 2020 12:45:37 -0800 (PST)
X-Received: by 2002:a05:6830:1116:: with SMTP id w22mr929819otq.216.1580330737114;
        Wed, 29 Jan 2020 12:45:37 -0800 (PST)
Date: Wed, 29 Jan 2020 12:45:36 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
In-Reply-To: <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1332_337623952.1580330736555"
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

------=_Part_1332_337623952.1580330736555
Content-Type: multipart/alternative; 
	boundary="----=_Part_1333_127822928.1580330736556"

------=_Part_1333_127822928.1580330736556
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

NO, its 8GB-version and its iomem is:
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
02900800-02900fff : /aconnect@2a41000/ahub
02901000-029010ff : /aconnect@2a41000/ahub/i2s@2901000
02901100-029011ff : /aconnect@2a41000/ahub/i2s@2901100
02901200-029012ff : /aconnect@2a41000/ahub/i2s@2901200
02901300-029013ff : /aconnect@2a41000/ahub/i2s@2901300
02901400-029014ff : /aconnect@2a41000/ahub/i2s@2901400
02901500-029015ff : /aconnect@2a41000/ahub/i2s@2901500
02902000-029021ff : /aconnect@2a41000/ahub/sfc@2902000
02902200-029023ff : /aconnect@2a41000/ahub/sfc@2902200
02902400-029025ff : /aconnect@2a41000/ahub/sfc@2902400
02902600-029027ff : /aconnect@2a41000/ahub/sfc@2902600
02903000-029030ff : /aconnect@2a41000/ahub/amx@2903000
02903100-029031ff : /aconnect@2a41000/ahub/amx@2903100
02903200-029032ff : /aconnect@2a41000/ahub/amx@2903200
02903300-029033ff : /aconnect@2a41000/ahub/amx@2903300
02903800-029038ff : /aconnect@2a41000/ahub/adx@2903800
02903900-029039ff : /aconnect@2a41000/ahub/adx@2903900
02903a00-02903aff : /aconnect@2a41000/ahub/adx@2903a00
02903b00-02903bff : /aconnect@2a41000/ahub/adx@2903b00
02904000-029040ff : /aconnect@2a41000/ahub/dmic@2904000
02904100-029041ff : /aconnect@2a41000/ahub/dmic@2904100
02904200-029042ff : /aconnect@2a41000/ahub/dmic@2904200
02904300-029043ff : /aconnect@2a41000/ahub/dmic@2904300
02905000-029050ff : /aconnect@2a41000/ahub/dspk@2905000
02905100-029051ff : /aconnect@2a41000/ahub/dspk@2905100
02907000-029070ff : /aconnect@2a41000/ahub/afc@2907000
02907100-029071ff : /aconnect@2a41000/ahub/afc@2907100
02907200-029072ff : /aconnect@2a41000/ahub/afc@2907200
02907300-029073ff : /aconnect@2a41000/ahub/afc@2907300
02907400-029074ff : /aconnect@2a41000/ahub/afc@2907400
02907500-029075ff : /aconnect@2a41000/ahub/afc@2907500
02908000-029080ff : /aconnect@2a41000/ahub/ope@2908000
02908100-029081ff : /aconnect@2a41000/ahub/ope@2908000
02908200-029083ff : /aconnect@2a41000/ahub/ope@2908000
0290a000-0290a1ff : /aconnect@2a41000/ahub/mvc@290a000
0290a200-0290a3ff : /aconnect@2a41000/ahub/mvc@290a200
0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixer@290bb00
0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@290e400
0290f000-0290ffff : /aconnect@2a41000/ahub/admaif@290f000
02910000-02911fff : /aconnect@2a41000/ahub/asrc@2910000
02930000-0297ffff : /aconnect@2a41000/adma@2930000
02c00000-02c0ffff : /mc_sid@2c00000
02c10000-02c1ffff : /mc_sid@2c00000
03010000-0301ffff : /watchdog@30c0000
03090000-0309fffe : /watchdog@30c0000
030c0000-030cfffe : /watchdog@30c0000
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
03400000-0340020f : /sdhci@3400000
03440000-0344020f : /sdhci@3440000
03460000-0346020f : /sdhci@3460000
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
03960000-03960fff : 3960000.tegra_cec
03990000-0399ffff : 3990000.mipical
039c0000-039c000f : /tachometer@39c0000
03a90000-03a9ffff : sata-aux
03ad0000-03adffff : /se_elp@3ad0000
03ae0000-03aeffff : /se_elp@3ad0000
03c00000-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox interrrupt
03c10000-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox
08010000-08010fff : /funnel_major@8010000
08030000-08030fff : /etf@8030000
08050000-08050fff : /etr@8050000
08060000-08060fff : /tpiu@8060000
08070000-08070fff : stm-base
08820000-08820fff : /funnel_minor@8820000
08a1c000-08a1cfff : /ptm_bpmp@8a1c000
09010000-09010fff : /funnel_bccplex@9010000
09840000-09840fff : /ptm@9840000
09940000-09940fff : /ptm@9940000
09a40000-09a40fff : /ptm@9a40000
09b40000-09b40fff : /ptm@9b40000
0b1f0000-0b22ffff : sce-pm
0b230000-0b23ffff : sce-cfg
0c168000-0c168003 : Tegra Combined UART SPE mailbox
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
0e000000-0e07ffff : /cpufreq@e070000
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
80000000-96079fff : System RAM
  80280000-817dffff : Kernel code
  82040000-823b9fff : Kernel data
961bd000-efffffff : System RAM
f0200000-2757fffff : System RAM
275880000-27588ffff : persistent_ram
275890000-27589ffff : persistent_ram
2758a0000-2758affff : persistent_ram
2758b0000-2758bffff : persistent_ram
2758c0000-2758cffff : persistent_ram
2758d0000-2758dffff : persistent_ram
2758e0000-2758effff : persistent_ram
2758f0000-2758fffff : persistent_ram
275900000-27590ffff : persistent_ram
275910000-27591ffff : persistent_ram
275920000-27592ffff : persistent_ram
275930000-27593ffff : persistent_ram
275940000-27594ffff : persistent_ram
275950000-27595ffff : persistent_ram
275960000-27596ffff : persistent_ram
275970000-27597ffff : persistent_ram
275980000-27598ffff : persistent_ram
275990000-27599ffff : persistent_ram
2759a0000-2759affff : persistent_ram
2759b0000-2759bffff : persistent_ram
2759c0000-2759cffff : persistent_ram
2759d0000-2759dffff : persistent_ram
2759e0000-2759effff : persistent_ram
2759f0000-2759fffff : persistent_ram
275a00000-275a7ffff : persistent_ram
275e00000-275ffffff : System RAM
276600000-2767fffff : System RAM
277000000-2771fffff : System RAM


On Wednesday, January 29, 2020 at 1:19:56 PM UTC-6, Jan Kiszka wrote:
>
> On 29.01.20 19:52, Saroj Sapkota wrote:=20
> > I have attached jetson-tx2.c and serial console output that is obtained=
=20
> > after jailhouse enable command.=20
> >=20
>
> I think I'm starting to under (I don't have access to any TX2 to=20
> validate): We are crashing while enabling Jailhouse, thus not messages=20
> from that side. And that crash might be because you are using the=20
> 4GB-version of the TX2 while the config is targeting the 8GB-version.=20
>
> If that is true, you can likely resolve the issue by shrinking the mem=3D=
=20
> reservation by 4G and also moving the hypervisor range in the config=20
> down by 4G.=20
>
> Jan=20
>
> > On Wednesday, January 29, 2020 at 12:06:48 PM UTC-6, Jan Kiszka wrote:=
=20
> >=20
> >     On 29.01.20 18:04, Saroj Sapkota wrote:=20
> >      > I changed the extlinux as suggested by Henning schild, as=20
> >      > attached file:=20
> >      > and rebooted the system and checked the following:=20
> >      > printenv gives:=20
> >      > tx2@tx2 $ sudo printenv=20
> >      > [sudo] password for tx2:=20
> >      >=20
> >    =20
> LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=
=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D=
30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:=
*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=
=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D0=
1;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D01;31:*.gz=
=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;3=
1:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.=
tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D=
01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31=
:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=
=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D=
01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;=
35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.=
tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=
=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D0=
1;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;3=
5:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:=20
>
> >=20
> >      > LANG=3Den_US.UTF-8=20
> >      > HOME=3D/home/tx2=20
> >      > TERM=3Dxterm-256color=20
> >      >=20
> >    =20
> PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap=
/bin=20
> >=20
> >      > MAIL=3D/var/mail/root=20
> >      > LOGNAME=3Droot=20
> >      > USER=3Droot=20
> >      > USERNAME=3Droot=20
> >      > SHELL=3D/bin/bash=20
> >      > SUDO_COMMAND=3D/usr/bin/printenv=20
> >      > SUDO_USER=3Dtx2=20
> >      > SUDO_UID=3D1000=20
> >      > SUDO_GID=3D1000=20
> >      > Similarly output of cat /proc/cmdline is :=20
> >      > root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4=20
> >     console=3DttyS0,115200n8=20
> >      > console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb=20
> >      > no_console_suspend=3D1 earlycon=3Duart8250,mmio32,0x3100000=20
> >      > nvdumper_reserved=3D0x2772e0000 gpt=20
> tegra_fbmem2=3D0x140000@0x9607d000=20
> >      > lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_first=3D1=20
> >     tegraid=3D18.1.2.0.0=20
> >      > maxcpus=3D6 boot.slot_suffix=3D boot.ratchetvalues=3D0.2031647.1=
=20
> >      > bl_prof_dataptr=3D0x10000@0x275840000=20
> >     sdhci_tegra.en_boot_part_access=3D1=20
> >      > quiet mem=3D7808M vmalloc=3D512M=20
> >      >=20
> >      > when i again tried to enable jailhouse through command sudo=20
> >     jailhouse=20
> >      > enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell=20
> >      > terminal cell hangs and debug cell gives following output:=20
> >=20
> >     We need the output on the serial console configured in jetson-tx2.c=
=20
> as=20
> >     Jailhouse debug channel.=20
> >=20
> >     Jan=20
> >=20
> >     --=20
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     Corporate Competence Center Embedded Linux=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailho...@googlegroups.com <javascript:>=20
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/3f267078-10bf-4a5c-86df-9=
a2cf0d4abd4%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/3f267078-10bf-4a5c-86df-9=
a2cf0d4abd4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f%40googlegroups.com.

------=_Part_1333_127822928.1580330736556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>NO, its 8GB-version and its iomem is:</div><div>02100=
000-02100fff : /axip2p@2100000<br>02110000-02110fff : /axip2p@2110000<br>02=
120000-02120fff : /axip2p@2120000<br>02130000-02130fff : /axip2p@2130000<br=
>02140000-02140fff : /axip2p@2140000<br>02150000-02150fff : /axip2p@2150000=
<br>02160000-02160fff : /axip2p@2160000<br>02170000-02170fff : /axip2p@2170=
000<br>02180000-02180fff : /axip2p@2180000<br>02190000-02190fff : /axip2p@2=
190000<br>02200000-0220ffff : security<br>02210000-0221ffff : gpio<br>02390=
000-02390fff : /axi2apb@2390000<br>023a0000-023a0fff : /axi2apb@23a0000<br>=
023b0000-023b0fff : /axi2apb@23b0000<br>023c0000-023c0fff : /axi2apb@23c000=
0<br>023d0000-023d0fff : /axi2apb@23d0000<br>02430000-02444fff : /pinmux@24=
30000<br>02600000-0280ffff : /dma@2600000<br>02900800-02900fff : /aconnect@=
2a41000/ahub<br>02901000-029010ff : /aconnect@2a41000/ahub/i2s@2901000<br>0=
2901100-029011ff : /aconnect@2a41000/ahub/i2s@2901100<br>02901200-029012ff =
: /aconnect@2a41000/ahub/i2s@2901200<br>02901300-029013ff : /aconnect@2a410=
00/ahub/i2s@2901300<br>02901400-029014ff : /aconnect@2a41000/ahub/i2s@29014=
00<br>02901500-029015ff : /aconnect@2a41000/ahub/i2s@2901500<br>02902000-02=
9021ff : /aconnect@2a41000/ahub/sfc@2902000<br>02902200-029023ff : /aconnec=
t@2a41000/ahub/sfc@2902200<br>02902400-029025ff : /aconnect@2a41000/ahub/sf=
c@2902400<br>02902600-029027ff : /aconnect@2a41000/ahub/sfc@2902600<br>0290=
3000-029030ff : /aconnect@2a41000/ahub/amx@2903000<br>02903100-029031ff : /=
aconnect@2a41000/ahub/amx@2903100<br>02903200-029032ff : /aconnect@2a41000/=
ahub/amx@2903200<br>02903300-029033ff : /aconnect@2a41000/ahub/amx@2903300<=
br>02903800-029038ff : /aconnect@2a41000/ahub/adx@2903800<br>02903900-02903=
9ff : /aconnect@2a41000/ahub/adx@2903900<br>02903a00-02903aff : /aconnect@2=
a41000/ahub/adx@2903a00<br>02903b00-02903bff : /aconnect@2a41000/ahub/adx@2=
903b00<br>02904000-029040ff : /aconnect@2a41000/ahub/dmic@2904000<br>029041=
00-029041ff : /aconnect@2a41000/ahub/dmic@2904100<br>02904200-029042ff : /a=
connect@2a41000/ahub/dmic@2904200<br>02904300-029043ff : /aconnect@2a41000/=
ahub/dmic@2904300<br>02905000-029050ff : /aconnect@2a41000/ahub/dspk@290500=
0<br>02905100-029051ff : /aconnect@2a41000/ahub/dspk@2905100<br>02907000-02=
9070ff : /aconnect@2a41000/ahub/afc@2907000<br>02907100-029071ff : /aconnec=
t@2a41000/ahub/afc@2907100<br>02907200-029072ff : /aconnect@2a41000/ahub/af=
c@2907200<br>02907300-029073ff : /aconnect@2a41000/ahub/afc@2907300<br>0290=
7400-029074ff : /aconnect@2a41000/ahub/afc@2907400<br>02907500-029075ff : /=
aconnect@2a41000/ahub/afc@2907500<br>02908000-029080ff : /aconnect@2a41000/=
ahub/ope@2908000<br>02908100-029081ff : /aconnect@2a41000/ahub/ope@2908000<=
br>02908200-029083ff : /aconnect@2a41000/ahub/ope@2908000<br>0290a000-0290a=
1ff : /aconnect@2a41000/ahub/mvc@290a000<br>0290a200-0290a3ff : /aconnect@2=
a41000/ahub/mvc@290a200<br>0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixe=
r@290bb00<br>0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@290e400<br>029=
0f000-0290ffff : /aconnect@2a41000/ahub/admaif@290f000<br>02910000-02911fff=
 : /aconnect@2a41000/ahub/asrc@2910000<br>02930000-0297ffff : /aconnect@2a4=
1000/adma@2930000<br>02c00000-02c0ffff : /mc_sid@2c00000<br>02c10000-02c1ff=
ff : /mc_sid@2c00000<br>03010000-0301ffff : /watchdog@30c0000<br>03090000-0=
309fffe : /watchdog@30c0000<br>030c0000-030cfffe : /watchdog@30c0000<br>031=
00000-0310003f : serial<br>03110000-0311003f : /serial@3110000<br>03130000-=
0313003f : /serial@3130000<br>03160000-031600ff : /i2c@3160000<br>03180000-=
031800ff : /i2c@3180000<br>03190000-031900ff : /i2c@3190000<br>031b0000-031=
b00ff : /i2c@31b0000<br>031c0000-031c00ff : /i2c@31c0000<br>031e0000-031e00=
ff : /i2c@31e0000<br>03210000-0321ffff : /spi@3210000<br>03240000-0324ffff =
: /spi@3240000<br>03280000-0328ffff : /pwm@3280000<br>03290000-0329ffff : /=
pwm@3290000<br>032a0000-032affff : /pwm@32a0000<br>03400000-0340020f : /sdh=
ci@3400000<br>03440000-0344020f : /sdhci@3440000<br>03460000-0346020f : /sd=
hci@3460000<br>03500000-03500fff : sata-ipfs<br>03501000-03506fff : sata-co=
nfig<br>03507000-03508fff : sata-ahci<br>03510000-0351ffff : /hda@3510000<b=
r>03520000-03520fff : padctl<br>03530000-03537fff : /xhci@3530000<br>035380=
00-03538fff : /xhci@3530000<br>03540000-03540fff : ao<br>03550000-03557fff =
: /xudc@3550000<br>03558000-03558fff : /xudc@3550000<br>03820000-038205ff :=
 /efuse@3820000<br>03830000-0383ffff : /kfuse@0x3830000<br>03960000-03960ff=
f : 3960000.tegra_cec<br>03990000-0399ffff : 3990000.mipical<br>039c0000-03=
9c000f : /tachometer@39c0000<br>03a90000-03a9ffff : sata-aux<br>03ad0000-03=
adffff : /se_elp@3ad0000<br>03ae0000-03aeffff : /se_elp@3ad0000<br>03c00000=
-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox interrrupt<br>03c100=
00-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox<br>08010000-08010f=
ff : /funnel_major@8010000<br>08030000-08030fff : /etf@8030000<br>08050000-=
08050fff : /etr@8050000<br>08060000-08060fff : /tpiu@8060000<br>08070000-08=
070fff : stm-base<br>08820000-08820fff : /funnel_minor@8820000<br>08a1c000-=
08a1cfff : /ptm_bpmp@8a1c000<br>09010000-09010fff : /funnel_bccplex@9010000=
<br>09840000-09840fff : /ptm@9840000<br>09940000-09940fff : /ptm@9940000<br=
>09a40000-09a40fff : /ptm@9a40000<br>09b40000-09b40fff : /ptm@9b40000<br>0b=
1f0000-0b22ffff : sce-pm<br>0b230000-0b23ffff : sce-cfg<br>0c168000-0c16800=
3 : Tegra Combined UART SPE mailbox<br>0c240000-0c2400ff : /i2c@c240000<br>=
0c250000-0c2500ff : /i2c@c250000<br>0c260000-0c26ffff : /spi@c260000<br>0c2=
80000-0c28003f : /serial@c280000<br>0c2a0000-0c2a00ff : /rtc@c2a0000<br>0c2=
f0000-0c2f0fff : security<br>0c2f1000-0c2f1fff : gpio<br>0c300000-0c303fff =
: /pinmux@2430000<br>0c340000-0c34ffff : /pwm@c340000<br>0c360000-0c3603ff =
: /pmc@c360000<br>0c370000-0c3705ff : /pmc@c370000<br>0c390000-0c392ffe : /=
pmc@c360000<br>0d230000-0d230fff : /actmon@d230000<br>0e000000-0e07ffff : /=
cpufreq@e070000<br>10000000-10000fff : /pcie-controller@10003000/pci@1,0<br=
>10004000-10004fff : /pcie-controller@10003000/pci@3,0<br>12000000-12ffffff=
 : /iommu@12000000<br>13e00000-13e0ffff : /host1x<br>13e10000-13e1ffff : /h=
ost1x<br>13ec0000-13efffff : /host1x<br>150c0000-150fffff : /host1x/nvcsi@1=
50c0000<br>15100000-1513ffff : /host1x/tsecb@15100000<br>15340000-1537ffff =
: /host1x/vic@15340000<br>15380000-153bffff : /host1x/nvjpg@15380000<br>154=
80000-154bffff : /host1x/nvdec@15480000<br>154c0000-154fffff : /host1x/nven=
c@154c0000<br>15500000-1553ffff : /host1x/tsec@15500000<br>15600000-1563fff=
f : /host1x/isp@15600000<br>15700000-157fffff : /host1x/vi@15700000<br>1581=
0000-1581ffff : /host1x/se@15810000<br>15820000-1582ffff : /host1x/se@15820=
000<br>15830000-1583ffff : /host1x/se@15830000<br>15840000-1584ffff : /host=
1x/se@15840000<br>17000000-17ffffff : /gp10b<br>18000000-18ffffff : /gp10b<=
br>80000000-96079fff : System RAM<br>=C2=A0 80280000-817dffff : Kernel code=
<br>=C2=A0 82040000-823b9fff : Kernel data<br>961bd000-efffffff : System RA=
M<br>f0200000-2757fffff : System RAM<br>275880000-27588ffff : persistent_ra=
m<br>275890000-27589ffff : persistent_ram<br>2758a0000-2758affff : persiste=
nt_ram<br>2758b0000-2758bffff : persistent_ram<br>2758c0000-2758cffff : per=
sistent_ram<br>2758d0000-2758dffff : persistent_ram<br>2758e0000-2758effff =
: persistent_ram<br>2758f0000-2758fffff : persistent_ram<br>275900000-27590=
ffff : persistent_ram<br>275910000-27591ffff : persistent_ram<br>275920000-=
27592ffff : persistent_ram<br>275930000-27593ffff : persistent_ram<br>27594=
0000-27594ffff : persistent_ram<br>275950000-27595ffff : persistent_ram<br>=
275960000-27596ffff : persistent_ram<br>275970000-27597ffff : persistent_ra=
m<br>275980000-27598ffff : persistent_ram<br>275990000-27599ffff : persiste=
nt_ram<br>2759a0000-2759affff : persistent_ram<br>2759b0000-2759bffff : per=
sistent_ram<br>2759c0000-2759cffff : persistent_ram<br>2759d0000-2759dffff =
: persistent_ram<br>2759e0000-2759effff : persistent_ram<br>2759f0000-2759f=
ffff : persistent_ram<br>275a00000-275a7ffff : persistent_ram<br>275e00000-=
275ffffff : System RAM<br>276600000-2767fffff : System RAM<br>277000000-277=
1fffff : System RAM<br><br></div><br>On Wednesday, January 29, 2020 at 1:19=
:56 PM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"=
>On 29.01.20 19:52, Saroj Sapkota wrote:
<br>&gt; I have attached jetson-tx2.c and serial console output that is obt=
ained=20
<br>&gt; after jailhouse enable command.
<br>&gt;=20
<br>
<br>I think I&#39;m starting to under (I don&#39;t have access to any TX2 t=
o=20
<br>validate): We are crashing while enabling Jailhouse, thus not messages=
=20
<br>from that side. And that crash might be because you are using the=20
<br>4GB-version of the TX2 while the config is targeting the 8GB-version.
<br>
<br>If that is true, you can likely resolve the issue by shrinking the mem=
=3D=20
<br>reservation by 4G and also moving the hypervisor range in the config=20
<br>down by 4G.
<br>
<br>Jan
<br>
<br>&gt; On Wednesday, January 29, 2020 at 12:06:48 PM UTC-6, Jan Kiszka wr=
ote:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 29.01.20 18:04, Saroj Sapkota wrote:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; I changed the extlinux as suggested by He=
nning schild, as
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; attached file:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; and rebooted the system and checked the f=
ollowing:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; printenv gives:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; tx2@tx2 $ sudo printenv
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; [sudo] password for tx2:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;<wbr>36:mh=3D0=
0:pi=3D40;33:so=3D01;35:do=3D<wbr>01;35:bd=3D40;33;01:cd=3D40;33;01:<wbr>or=
=3D40;31;01:mi=3D00:su=3D37;41:sg=3D<wbr>30;43:ca=3D30;41:tw=3D30;42:ow=3D3=
4;<wbr>42:st=3D37;44:ex=3D01;32:*.tar=3D01;<wbr>31:*.tgz=3D01;31:*.arc=3D01=
;31:*.<wbr>arj=3D01;31:*.taz=3D01;31:*.lha=3D<wbr>01;31:*.lz4=3D01;31:*.lzh=
=3D01;31:<wbr>*.lzma=3D01;31:*.tlz=3D01;31:*.<wbr>txz=3D01;31:*.tzo=3D01;31=
:*.t7z=3D<wbr>01;31:*.zip=3D01;31:*.z=3D01;31:*.<wbr>Z=3D01;31:*.dz=3D01;31=
:*.gz=3D01;31:<wbr>*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D<wbr>01;31:*.xz=3D01;=
31:*.zst=3D01;31:*<wbr>.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D<wbr>01;31:*.tbz=
=3D01;31:*.tbz2=3D01;<wbr>31:*.tz=3D01;31:*.deb=3D01;31:*.<wbr>rpm=3D01;31:=
*.jar=3D01;31:*.war=3D<wbr>01;31:*.ear=3D01;31:*.sar=3D01;31:<wbr>*.rar=3D0=
1;31:*.alz=3D01;31:*.ace=3D<wbr>01;31:*.zoo=3D01;31:*.cpio=3D01;<wbr>31:*.7=
z=3D01;31:*.rz=3D01;31:*.<wbr>cab=3D01;31:*.wim=3D01;31:*.swm=3D<wbr>01;31:=
*.dwm=3D01;31:*.esd=3D01;31:<wbr>*.jpg=3D01;35:*.jpeg=3D01;35:*.<wbr>mjpg=
=3D01;35:*.mjpeg=3D01;35:*.<wbr>gif=3D01;35:*.bmp=3D01;35:*.pbm=3D<wbr>01;3=
5:*.pgm=3D01;35:*.ppm=3D01;35:<wbr>*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D<wbr=
>01;35:*.tif=3D01;35:*.tiff=3D01;<wbr>35:*.png=3D01;35:*.svg=3D01;35:*.<wbr=
>svgz=3D01;35:*.mng=3D01;35:*.pcx=3D<wbr>01;35:*.mov=3D01;35:*.mpg=3D01;35:=
<wbr>*.mpeg=3D01;35:*.m2v=3D01;35:*.<wbr>mkv=3D01;35:*.webm=3D01;35:*.ogm=
=3D<wbr>01;35:*.mp4=3D01;35:*.m4v=3D01;35:<wbr>*.mp4v=3D01;35:*.vob=3D01;35=
:*.qt=3D<wbr>01;35:*.nuv=3D01;35:*.wmv=3D01;35:<wbr>*.asf=3D01;35:*.rm=3D01=
;35:*.rmvb=3D<wbr>01;35:*.flc=3D01;35:*.avi=3D01;35:<wbr>*.fli=3D01;35:*.fl=
v=3D01;35:*.gl=3D<wbr>01;35:*.dl=3D01;35:*.xcf=3D01;35:*<wbr>.xwd=3D01;35:*=
.yuv=3D01;35:*.cgm=3D<wbr>01;35:*.emf=3D01;35:*.ogv=3D01;35:<wbr>*.ogx=3D01=
;35:*.aac=3D00;36:*.au=3D<wbr>00;36:*.flac=3D00;36:*.m4a=3D00;<wbr>36:*.mid=
=3D00;36:*.midi=3D00;36:*.<wbr>mka=3D00;36:*.mp3=3D00;36:*.mpc=3D<wbr>00;36=
:*.ogg=3D00;36:*.ra=3D00;36:*<wbr>.wav=3D00;36:*.oga=3D00;36:*.opus=3D<wbr>=
00;36:*.spx=3D00;36:*.xspf=3D00;<wbr>36:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; LANG=3Den_US.UTF-8
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; HOME=3D/home/tx2
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; TERM=3Dxterm-256color
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 PATH=3D/usr/local/sbin:/usr/<wbr>local/bin:/usr/sbin=
:/usr/bin:/<wbr>sbin:/bin:/snap/bin
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; MAIL=3D/var/mail/root
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; LOGNAME=3Droot
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; USER=3Droot
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; USERNAME=3Droot
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; SHELL=3D/bin/bash
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; SUDO_COMMAND=3D/usr/bin/printenv
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; SUDO_USER=3Dtx2
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; SUDO_UID=3D1000
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; SUDO_GID=3D1000
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Similarly output of cat /proc/cmdline is =
:
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; root=3D/dev/mmcblk0p1 rw rootwait rootfst=
ype=3Dext4
<br>&gt; =C2=A0 =C2=A0 console=3DttyS0,115200n8
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; console=3Dtty0 fbcon=3Dmap:0 net.ifnames=
=3D0 video=3Dtegrafb
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; no_console_suspend=3D1 earlycon=3Duart825=
0,mmio32,<wbr>0x3100000
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; nvdumper_reserved=3D0x2772e0000 gpt tegra=
_fbmem2=3D0x140000@<wbr>0x9607d000
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; lut_mem2=3D0x2008@0x9607a000 usbcore.old_=
scheme_first=3D1
<br>&gt; =C2=A0 =C2=A0 tegraid=3D18.1.2.0.0
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; maxcpus=3D6 boot.slot_suffix=3D boot.ratc=
hetvalues=3D0.2031647.1
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; bl_prof_dataptr=3D0x10000@<wbr>0x27584000=
0
<br>&gt; =C2=A0 =C2=A0 sdhci_tegra.en_boot_part_<wbr>access=3D1
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; quiet mem=3D7808M vmalloc=3D512M
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt;
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; when i again tried to enable jailhouse th=
rough command sudo
<br>&gt; =C2=A0 =C2=A0 jailhouse
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; enable Downloads/linux-jetson/<wbr>config=
s/arm64/jetson-tx2.cell
<br>&gt; =C2=A0 =C2=A0 =C2=A0&gt; terminal cell hangs and debug cell gives =
following output:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 We need the output on the serial console configured =
in jetson-tx2.c as
<br>&gt; =C2=A0 =C2=A0 Jailhouse debug channel.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 --=20
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscat=
ed-mailto=3D"4pv_IGzmAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39=
;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39=
;;return true;">jailho...@<wbr>googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"4pv_IGzmAAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3f26707=
8-10bf-4a5c-86df-9a2cf0d4abd4%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/3f267078-10bf-4a5c-86df-9a2cf0d4abd4%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/3f267078-10bf-4a5c-86df-9a2cf0d4abd4%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/3f2670=
78-<wbr>10bf-4a5c-86df-9a2cf0d4abd4%<wbr>40googlegroups.com</a>=20
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/3f2=
67078-10bf-4a5c-86df-9a2cf0d4abd4%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/3f267078-10bf=
-4a5c-86df-9a2cf0d4abd4%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/3f267078-10bf-4a5c-86df-9a2cf0d4abd4%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/3f267078-<wbr>10bf-4a=
5c-86df-9a2cf0d4abd4%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f%40googlegroups.com<=
/a>.<br />

------=_Part_1333_127822928.1580330736556--

------=_Part_1332_337623952.1580330736555--
