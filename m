Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBB24HZXYQKGQEO5VYWFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A414E461
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 22:00:28 +0100 (CET)
Received: by mail-oi1-x237.google.com with SMTP id c4sf2132183oiy.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 13:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U4JHpdlmF0L2bRkqGO5lr0d/Bb+QZuKiZnrMTG0pbnc=;
        b=sU1zK3ZMnbr+wEpQJtH/TGyuOCiAGY6x5YtN0dD2KegVijKCYEy5cNkyF1phz173Sf
         otpTXRMhRwlxkreljKvaJlR8p5j0zl/PpTzO2yNFK3l79POR6NZYgWR3dUuf+y4xY433
         USB81t5MVsmEiW7XO5J0QGCm1wQ0swZX7SMJSqstIw9yJX3eVkPGr36K2dYdAQrpCRlk
         RdRh6kZKHHv64AkMEMFTKaspSixi7mSPuIOsdztx/pPOR2lurf8APlrRJLSGRrhzQkp6
         cUxpy9LV3BvsHyjzFvkyfIsu5Xv1yig4SZe5+5SsduM+p+7drkzPFUR4bMjmzsMW6A3v
         Kjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U4JHpdlmF0L2bRkqGO5lr0d/Bb+QZuKiZnrMTG0pbnc=;
        b=BXQ14BMsESW9jLOGDXIrQpbtCflV8m/YQ44EUtwz/gPTqhBL012ENCpI7uhlsGTDLA
         6U+Bq87wVNvt1w4vhAYUsRLuyUOyXUstlKR/UyMef6/ewHfZ7yk2ff4zokUsUKp70hjp
         3atSE3dPeMfPEa0v2jqJ10n2wgcxioejRe4Fub787nsiKjJ7DnUz+FA3n+20s8HJBue4
         UjnS+P29LypL/YCb7/kexLUUUz87gTrPpgs7v7v7w0BdgZxxYEJcg3Mj+O0EeMjvkrk3
         y9Nvad3GpjpbroFkIZFYMfSCGhsAtbivxeZHh21eX6uDFz9TYPAitDqPixYXVaPx4K5T
         YWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U4JHpdlmF0L2bRkqGO5lr0d/Bb+QZuKiZnrMTG0pbnc=;
        b=NAtZq3XUnMKGJwm5iDbIjIpAQIet/6ZhEjrGnxO4Jh7YwESQyZEljOJ1vPm5X6aULf
         ajCy1f0aZCnb1zwebZUZ6fK4NcVB+nyBgZWbJNT5c497BTKhqV+y6SeoLDcaW2L+guXb
         iDghmnkmYr+Tu+BI0xbc82iKI24EFcWT3DWA4jQqJg1UrGJcAFFBbeXE0wf+/Gc1EPIH
         Y+1xX0nxD6dDVayUW/r5gHiMlvR7Qe1dKiLaG6FHif+e1Vg5Gv/8cw1nlTR++TC0U54J
         GufBEhT9e9bvdsYXHrGlAW/nSS9NTsejnGIDtPWVrTz+tyRG6q2tljKC12WoBX6XmN6M
         NyGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+tiCC2S1DWf1T6KL8i6YmFWSqa28I2r1hZMuPlTY18QeQq01T
	KNZzur3Q3x7boQdA+ffDwiM=
X-Google-Smtp-Source: APXvYqyUxv7XPq0+vdctfC2JpDdQrC8t7SBhp5ksTbpx6VgtkxYRHBv6GaaYcEPdzl+KOexV5QfPlA==
X-Received: by 2002:aca:4183:: with SMTP id o125mr4048220oia.125.1580418027713;
        Thu, 30 Jan 2020 13:00:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4a96:: with SMTP id i22ls1142024otf.9.gmail; Thu, 30 Jan
 2020 13:00:27 -0800 (PST)
X-Received: by 2002:a9d:6418:: with SMTP id h24mr5072337otl.172.1580418027030;
        Thu, 30 Jan 2020 13:00:27 -0800 (PST)
Date: Thu, 30 Jan 2020 13:00:25 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
In-Reply-To: <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
 <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1176_1752819028.1580418026179"
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

------=_Part_1176_1752819028.1580418026179
Content-Type: multipart/alternative; 
	boundary="----=_Part_1177_617579483.1580418026179"

------=_Part_1177_617579483.1580418026179
Content-Type: text/plain; charset="UTF-8"

Thank you for the prompt reply Jan.

##>This means I have to compare jetson-tx2.c with /proc/iomem addresses and 
change if there is any deviation? 

##>How the address for inmate is allocated, its the spaces of system RAM?

##>where and how can i find the .gicd_base = 0x03881000,(.gicc_base, 
.gich_base, .gicv_base) addresses of the board?

##> last thing how to define .irqchip; pin_base and pin_bitmap?


On Thursday, January 30, 2020 at 2:17:44 AM UTC-6, Jan Kiszka wrote:
>
> On 29.01.20 21:45, Saroj Sapkota wrote: 
> > NO, its 8GB-version and its iomem is: 
> > 02100000-02100fff : /axip2p@2100000 
> > 02110000-02110fff : /axip2p@2110000 
> > 02120000-02120fff : /axip2p@2120000 
> > 02130000-02130fff : /axip2p@2130000 
> > 02140000-02140fff : /axip2p@2140000 
> > 02150000-02150fff : /axip2p@2150000 
> > 02160000-02160fff : /axip2p@2160000 
> > 02170000-02170fff : /axip2p@2170000 
> > 02180000-02180fff : /axip2p@2180000 
> > 02190000-02190fff : /axip2p@2190000 
> > 02200000-0220ffff : security 
> > 02210000-0221ffff : gpio 
> > 02390000-02390fff : /axi2apb@2390000 
> > 023a0000-023a0fff : /axi2apb@23a0000 
> > 023b0000-023b0fff : /axi2apb@23b0000 
> > 023c0000-023c0fff : /axi2apb@23c0000 
> > 023d0000-023d0fff : /axi2apb@23d0000 
> > 02430000-02444fff : /pinmux@2430000 
> > 02600000-0280ffff : /dma@2600000 
> > 02900800-02900fff : /aconnect@2a41000/ahub 
> > 02901000-029010ff : /aconnect@2a41000/ahub/i2s@2901000 
> > 02901100-029011ff : /aconnect@2a41000/ahub/i2s@2901100 
> > 02901200-029012ff : /aconnect@2a41000/ahub/i2s@2901200 
> > 02901300-029013ff : /aconnect@2a41000/ahub/i2s@2901300 
> > 02901400-029014ff : /aconnect@2a41000/ahub/i2s@2901400 
> > 02901500-029015ff : /aconnect@2a41000/ahub/i2s@2901500 
> > 02902000-029021ff : /aconnect@2a41000/ahub/sfc@2902000 
> > 02902200-029023ff : /aconnect@2a41000/ahub/sfc@2902200 
> > 02902400-029025ff : /aconnect@2a41000/ahub/sfc@2902400 
> > 02902600-029027ff : /aconnect@2a41000/ahub/sfc@2902600 
> > 02903000-029030ff : /aconnect@2a41000/ahub/amx@2903000 
> > 02903100-029031ff : /aconnect@2a41000/ahub/amx@2903100 
> > 02903200-029032ff : /aconnect@2a41000/ahub/amx@2903200 
> > 02903300-029033ff : /aconnect@2a41000/ahub/amx@2903300 
> > 02903800-029038ff : /aconnect@2a41000/ahub/adx@2903800 
> > 02903900-029039ff : /aconnect@2a41000/ahub/adx@2903900 
> > 02903a00-02903aff : /aconnect@2a41000/ahub/adx@2903a00 
> > 02903b00-02903bff : /aconnect@2a41000/ahub/adx@2903b00 
> > 02904000-029040ff : /aconnect@2a41000/ahub/dmic@2904000 
> > 02904100-029041ff : /aconnect@2a41000/ahub/dmic@2904100 
> > 02904200-029042ff : /aconnect@2a41000/ahub/dmic@2904200 
> > 02904300-029043ff : /aconnect@2a41000/ahub/dmic@2904300 
> > 02905000-029050ff : /aconnect@2a41000/ahub/dspk@2905000 
> > 02905100-029051ff : /aconnect@2a41000/ahub/dspk@2905100 
> > 02907000-029070ff : /aconnect@2a41000/ahub/afc@2907000 
> > 02907100-029071ff : /aconnect@2a41000/ahub/afc@2907100 
> > 02907200-029072ff : /aconnect@2a41000/ahub/afc@2907200 
> > 02907300-029073ff : /aconnect@2a41000/ahub/afc@2907300 
> > 02907400-029074ff : /aconnect@2a41000/ahub/afc@2907400 
> > 02907500-029075ff : /aconnect@2a41000/ahub/afc@2907500 
> > 02908000-029080ff : /aconnect@2a41000/ahub/ope@2908000 
> > 02908100-029081ff : /aconnect@2a41000/ahub/ope@2908000 
> > 02908200-029083ff : /aconnect@2a41000/ahub/ope@2908000 
> > 0290a000-0290a1ff : /aconnect@2a41000/ahub/mvc@290a000 
> > 0290a200-0290a3ff : /aconnect@2a41000/ahub/mvc@290a200 
> > 0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixer@290bb00 
> > 0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@290e400 
> > 0290f000-0290ffff : /aconnect@2a41000/ahub/admaif@290f000 
> > 02910000-02911fff : /aconnect@2a41000/ahub/asrc@2910000 
> > 02930000-0297ffff : /aconnect@2a41000/adma@2930000 
> > 02c00000-02c0ffff : /mc_sid@2c00000 
> > 02c10000-02c1ffff : /mc_sid@2c00000 
> > 03010000-0301ffff : /watchdog@30c0000 
> > 03090000-0309fffe : /watchdog@30c0000 
> > 030c0000-030cfffe : /watchdog@30c0000 
> > 03100000-0310003f : serial 
> > 03110000-0311003f : /serial@3110000 
> > 03130000-0313003f : /serial@3130000 
> > 03160000-031600ff : /i2c@3160000 
> > 03180000-031800ff : /i2c@3180000 
> > 03190000-031900ff : /i2c@3190000 
> > 031b0000-031b00ff : /i2c@31b0000 
> > 031c0000-031c00ff : /i2c@31c0000 
> > 031e0000-031e00ff : /i2c@31e0000 
> > 03210000-0321ffff : /spi@3210000 
> > 03240000-0324ffff : /spi@3240000 
> > 03280000-0328ffff : /pwm@3280000 
> > 03290000-0329ffff : /pwm@3290000 
> > 032a0000-032affff : /pwm@32a0000 
> > 03400000-0340020f : /sdhci@3400000 
> > 03440000-0344020f : /sdhci@3440000 
> > 03460000-0346020f : /sdhci@3460000 
> > 03500000-03500fff : sata-ipfs 
> > 03501000-03506fff : sata-config 
> > 03507000-03508fff : sata-ahci 
> > 03510000-0351ffff : /hda@3510000 
> > 03520000-03520fff : padctl 
> > 03530000-03537fff : /xhci@3530000 
> > 03538000-03538fff : /xhci@3530000 
> > 03540000-03540fff : ao 
> > 03550000-03557fff : /xudc@3550000 
> > 03558000-03558fff : /xudc@3550000 
> > 03820000-038205ff : /efuse@3820000 
> > 03830000-0383ffff : /kfuse@0x3830000 
> > 03960000-03960fff : 3960000.tegra_cec 
> > 03990000-0399ffff : 3990000.mipical 
> > 039c0000-039c000f : /tachometer@39c0000 
> > 03a90000-03a9ffff : sata-aux 
> > 03ad0000-03adffff : /se_elp@3ad0000 
> > 03ae0000-03aeffff : /se_elp@3ad0000 
> > 03c00000-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox 
> interrrupt 
> > 03c10000-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox 
> > 08010000-08010fff : /funnel_major@8010000 
> > 08030000-08030fff : /etf@8030000 
> > 08050000-08050fff : /etr@8050000 
> > 08060000-08060fff : /tpiu@8060000 
> > 08070000-08070fff : stm-base 
> > 08820000-08820fff : /funnel_minor@8820000 
> > 08a1c000-08a1cfff : /ptm_bpmp@8a1c000 
> > 09010000-09010fff : /funnel_bccplex@9010000 
> > 09840000-09840fff : /ptm@9840000 
> > 09940000-09940fff : /ptm@9940000 
> > 09a40000-09a40fff : /ptm@9a40000 
> > 09b40000-09b40fff : /ptm@9b40000 
> > 0b1f0000-0b22ffff : sce-pm 
> > 0b230000-0b23ffff : sce-cfg 
> > 0c168000-0c168003 : Tegra Combined UART SPE mailbox 
> > 0c240000-0c2400ff : /i2c@c240000 
> > 0c250000-0c2500ff : /i2c@c250000 
> > 0c260000-0c26ffff : /spi@c260000 
> > 0c280000-0c28003f : /serial@c280000 
> > 0c2a0000-0c2a00ff : /rtc@c2a0000 
> > 0c2f0000-0c2f0fff : security 
> > 0c2f1000-0c2f1fff : gpio 
> > 0c300000-0c303fff : /pinmux@2430000 
> > 0c340000-0c34ffff : /pwm@c340000 
> > 0c360000-0c3603ff : /pmc@c360000 
> > 0c370000-0c3705ff : /pmc@c370000 
> > 0c390000-0c392ffe : /pmc@c360000 
> > 0d230000-0d230fff : /actmon@d230000 
> > 0e000000-0e07ffff : /cpufreq@e070000 
> > 10000000-10000fff : /pcie-controller@10003000/pci@1,0 
> > 10004000-10004fff : /pcie-controller@10003000/pci@3,0 
> > 12000000-12ffffff : /iommu@12000000 
> > 13e00000-13e0ffff : /host1x 
> > 13e10000-13e1ffff : /host1x 
> > 13ec0000-13efffff : /host1x 
> > 150c0000-150fffff : /host1x/nvcsi@150c0000 
> > 15100000-1513ffff : /host1x/tsecb@15100000 
> > 15340000-1537ffff : /host1x/vic@15340000 
> > 15380000-153bffff : /host1x/nvjpg@15380000 
> > 15480000-154bffff : /host1x/nvdec@15480000 
> > 154c0000-154fffff : /host1x/nvenc@154c0000 
> > 15500000-1553ffff : /host1x/tsec@15500000 
> > 15600000-1563ffff : /host1x/isp@15600000 
> > 15700000-157fffff : /host1x/vi@15700000 
> > 15810000-1581ffff : /host1x/se@15810000 
> > 15820000-1582ffff : /host1x/se@15820000 
> > 15830000-1583ffff : /host1x/se@15830000 
> > 15840000-1584ffff : /host1x/se@15840000 
> > 17000000-17ffffff : /gp10b 
> > 18000000-18ffffff : /gp10b 
> > 80000000-96079fff : System RAM 
> >    80280000-817dffff : Kernel code 
> >    82040000-823b9fff : Kernel data 
> > 961bd000-efffffff : System RAM 
> > f0200000-2757fffff : System RAM 
> > 275880000-27588ffff : persistent_ram 
> > 275890000-27589ffff : persistent_ram 
> > 2758a0000-2758affff : persistent_ram 
> > 2758b0000-2758bffff : persistent_ram 
> > 2758c0000-2758cffff : persistent_ram 
> > 2758d0000-2758dffff : persistent_ram 
> > 2758e0000-2758effff : persistent_ram 
> > 2758f0000-2758fffff : persistent_ram 
> > 275900000-27590ffff : persistent_ram 
> > 275910000-27591ffff : persistent_ram 
> > 275920000-27592ffff : persistent_ram 
> > 275930000-27593ffff : persistent_ram 
> > 275940000-27594ffff : persistent_ram 
> > 275950000-27595ffff : persistent_ram 
> > 275960000-27596ffff : persistent_ram 
> > 275970000-27597ffff : persistent_ram 
> > 275980000-27598ffff : persistent_ram 
> > 275990000-27599ffff : persistent_ram 
> > 2759a0000-2759affff : persistent_ram 
> > 2759b0000-2759bffff : persistent_ram 
> > 2759c0000-2759cffff : persistent_ram 
> > 2759d0000-2759dffff : persistent_ram 
> > 2759e0000-2759effff : persistent_ram 
> > 2759f0000-2759fffff : persistent_ram 
> > 275a00000-275a7ffff : persistent_ram 
> > 275e00000-275ffffff : System RAM 
> > 276600000-2767fffff : System RAM 
> > 277000000-2771fffff : System RAM 
>
> OK, but reservation still doesn't work as needed. There must be no RAM 
> identified by the kernel from 270000000 onward, see comments in 
> jetson-tx2.c. 
>
> But there might be more different with your system, just compare the 
> addresses of the persistent memory with the tx2 config. Maybe you have a 
> newer variant of the board. Adding Claudio, maybe he has an idea. But I 
> suspect you will have to update the config for the variations. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af79c7dc-6eb8-45c0-a93f-6e0e4da069ab%40googlegroups.com.

------=_Part_1177_617579483.1580418026179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for the prompt reply Jan.</div><div><br></d=
iv><div>##&gt;This means I have to compare jetson-tx2.c with /proc/iomem ad=
dresses and change if there is any deviation? <br></div><div><br></div><div=
>##&gt;How the address for inmate is allocated, its the spaces of system RA=
M?</div><div><br></div><div>##&gt;where and how can i find the .gicd_base =
=3D 0x03881000,(.gicc_base, .gich_base, .gicv_base) addresses of the board?=
</div><div><br></div><div>##&gt; last thing how to define .irqchip; pin_bas=
e and pin_bitmap?<br></div><div><br></div><br>On Thursday, January 30, 2020=
 at 2:17:44 AM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-lef=
t: 1ex;">On 29.01.20 21:45, Saroj Sapkota wrote:
<br>&gt; NO, its 8GB-version and its iomem is:
<br>&gt; 02100000-02100fff : /axip2p@2100000
<br>&gt; 02110000-02110fff : /axip2p@2110000
<br>&gt; 02120000-02120fff : /axip2p@2120000
<br>&gt; 02130000-02130fff : /axip2p@2130000
<br>&gt; 02140000-02140fff : /axip2p@2140000
<br>&gt; 02150000-02150fff : /axip2p@2150000
<br>&gt; 02160000-02160fff : /axip2p@2160000
<br>&gt; 02170000-02170fff : /axip2p@2170000
<br>&gt; 02180000-02180fff : /axip2p@2180000
<br>&gt; 02190000-02190fff : /axip2p@2190000
<br>&gt; 02200000-0220ffff : security
<br>&gt; 02210000-0221ffff : gpio
<br>&gt; 02390000-02390fff : /axi2apb@2390000
<br>&gt; 023a0000-023a0fff : /axi2apb@23a0000
<br>&gt; 023b0000-023b0fff : /axi2apb@23b0000
<br>&gt; 023c0000-023c0fff : /axi2apb@23c0000
<br>&gt; 023d0000-023d0fff : /axi2apb@23d0000
<br>&gt; 02430000-02444fff : /pinmux@2430000
<br>&gt; 02600000-0280ffff : /dma@2600000
<br>&gt; 02900800-02900fff : /aconnect@2a41000/ahub
<br>&gt; 02901000-029010ff : /aconnect@2a41000/ahub/i2s@<wbr>2901000
<br>&gt; 02901100-029011ff : /aconnect@2a41000/ahub/i2s@<wbr>2901100
<br>&gt; 02901200-029012ff : /aconnect@2a41000/ahub/i2s@<wbr>2901200
<br>&gt; 02901300-029013ff : /aconnect@2a41000/ahub/i2s@<wbr>2901300
<br>&gt; 02901400-029014ff : /aconnect@2a41000/ahub/i2s@<wbr>2901400
<br>&gt; 02901500-029015ff : /aconnect@2a41000/ahub/i2s@<wbr>2901500
<br>&gt; 02902000-029021ff : /aconnect@2a41000/ahub/sfc@<wbr>2902000
<br>&gt; 02902200-029023ff : /aconnect@2a41000/ahub/sfc@<wbr>2902200
<br>&gt; 02902400-029025ff : /aconnect@2a41000/ahub/sfc@<wbr>2902400
<br>&gt; 02902600-029027ff : /aconnect@2a41000/ahub/sfc@<wbr>2902600
<br>&gt; 02903000-029030ff : /aconnect@2a41000/ahub/amx@<wbr>2903000
<br>&gt; 02903100-029031ff : /aconnect@2a41000/ahub/amx@<wbr>2903100
<br>&gt; 02903200-029032ff : /aconnect@2a41000/ahub/amx@<wbr>2903200
<br>&gt; 02903300-029033ff : /aconnect@2a41000/ahub/amx@<wbr>2903300
<br>&gt; 02903800-029038ff : /aconnect@2a41000/ahub/adx@<wbr>2903800
<br>&gt; 02903900-029039ff : /aconnect@2a41000/ahub/adx@<wbr>2903900
<br>&gt; 02903a00-02903aff : /aconnect@2a41000/ahub/adx@<wbr>2903a00
<br>&gt; 02903b00-02903bff : /aconnect@2a41000/ahub/adx@<wbr>2903b00
<br>&gt; 02904000-029040ff : /aconnect@2a41000/ahub/dmic@<wbr>2904000
<br>&gt; 02904100-029041ff : /aconnect@2a41000/ahub/dmic@<wbr>2904100
<br>&gt; 02904200-029042ff : /aconnect@2a41000/ahub/dmic@<wbr>2904200
<br>&gt; 02904300-029043ff : /aconnect@2a41000/ahub/dmic@<wbr>2904300
<br>&gt; 02905000-029050ff : /aconnect@2a41000/ahub/dspk@<wbr>2905000
<br>&gt; 02905100-029051ff : /aconnect@2a41000/ahub/dspk@<wbr>2905100
<br>&gt; 02907000-029070ff : /aconnect@2a41000/ahub/afc@<wbr>2907000
<br>&gt; 02907100-029071ff : /aconnect@2a41000/ahub/afc@<wbr>2907100
<br>&gt; 02907200-029072ff : /aconnect@2a41000/ahub/afc@<wbr>2907200
<br>&gt; 02907300-029073ff : /aconnect@2a41000/ahub/afc@<wbr>2907300
<br>&gt; 02907400-029074ff : /aconnect@2a41000/ahub/afc@<wbr>2907400
<br>&gt; 02907500-029075ff : /aconnect@2a41000/ahub/afc@<wbr>2907500
<br>&gt; 02908000-029080ff : /aconnect@2a41000/ahub/ope@<wbr>2908000
<br>&gt; 02908100-029081ff : /aconnect@2a41000/ahub/ope@<wbr>2908000
<br>&gt; 02908200-029083ff : /aconnect@2a41000/ahub/ope@<wbr>2908000
<br>&gt; 0290a000-0290a1ff : /aconnect@2a41000/ahub/mvc@<wbr>290a000
<br>&gt; 0290a200-0290a3ff : /aconnect@2a41000/ahub/mvc@<wbr>290a200
<br>&gt; 0290bb00-0290c2ff : /aconnect@2a41000/ahub/amixer@<wbr>290bb00
<br>&gt; 0290e400-0290e7ff : /aconnect@2a41000/ahub/arad@<wbr>290e400
<br>&gt; 0290f000-0290ffff : /aconnect@2a41000/ahub/admaif@<wbr>290f000
<br>&gt; 02910000-02911fff : /aconnect@2a41000/ahub/asrc@<wbr>2910000
<br>&gt; 02930000-0297ffff : /aconnect@2a41000/adma@2930000
<br>&gt; 02c00000-02c0ffff : /mc_sid@2c00000
<br>&gt; 02c10000-02c1ffff : /mc_sid@2c00000
<br>&gt; 03010000-0301ffff : /watchdog@30c0000
<br>&gt; 03090000-0309fffe : /watchdog@30c0000
<br>&gt; 030c0000-030cfffe : /watchdog@30c0000
<br>&gt; 03100000-0310003f : serial
<br>&gt; 03110000-0311003f : /serial@3110000
<br>&gt; 03130000-0313003f : /serial@3130000
<br>&gt; 03160000-031600ff : /i2c@3160000
<br>&gt; 03180000-031800ff : /i2c@3180000
<br>&gt; 03190000-031900ff : /i2c@3190000
<br>&gt; 031b0000-031b00ff : /i2c@31b0000
<br>&gt; 031c0000-031c00ff : /i2c@31c0000
<br>&gt; 031e0000-031e00ff : /i2c@31e0000
<br>&gt; 03210000-0321ffff : /spi@3210000
<br>&gt; 03240000-0324ffff : /spi@3240000
<br>&gt; 03280000-0328ffff : /pwm@3280000
<br>&gt; 03290000-0329ffff : /pwm@3290000
<br>&gt; 032a0000-032affff : /pwm@32a0000
<br>&gt; 03400000-0340020f : /sdhci@3400000
<br>&gt; 03440000-0344020f : /sdhci@3440000
<br>&gt; 03460000-0346020f : /sdhci@3460000
<br>&gt; 03500000-03500fff : sata-ipfs
<br>&gt; 03501000-03506fff : sata-config
<br>&gt; 03507000-03508fff : sata-ahci
<br>&gt; 03510000-0351ffff : /hda@3510000
<br>&gt; 03520000-03520fff : padctl
<br>&gt; 03530000-03537fff : /xhci@3530000
<br>&gt; 03538000-03538fff : /xhci@3530000
<br>&gt; 03540000-03540fff : ao
<br>&gt; 03550000-03557fff : /xudc@3550000
<br>&gt; 03558000-03558fff : /xudc@3550000
<br>&gt; 03820000-038205ff : /efuse@3820000
<br>&gt; 03830000-0383ffff : /kfuse@0x3830000
<br>&gt; 03960000-03960fff : 3960000.tegra_cec
<br>&gt; 03990000-0399ffff : 3990000.mipical
<br>&gt; 039c0000-039c000f : /tachometer@39c0000
<br>&gt; 03a90000-03a9ffff : sata-aux
<br>&gt; 03ad0000-03adffff : /se_elp@3ad0000
<br>&gt; 03ae0000-03aeffff : /se_elp@3ad0000
<br>&gt; 03c00000-03c00fff : Tegra Combined UART TOP0_HSP Linux mailbox int=
errrupt
<br>&gt; 03c10000-03c10003 : Tegra Combined UART TOP0_HSP Linux mailbox
<br>&gt; 08010000-08010fff : /funnel_major@8010000
<br>&gt; 08030000-08030fff : /etf@8030000
<br>&gt; 08050000-08050fff : /etr@8050000
<br>&gt; 08060000-08060fff : /tpiu@8060000
<br>&gt; 08070000-08070fff : stm-base
<br>&gt; 08820000-08820fff : /funnel_minor@8820000
<br>&gt; 08a1c000-08a1cfff : /ptm_bpmp@8a1c000
<br>&gt; 09010000-09010fff : /funnel_bccplex@9010000
<br>&gt; 09840000-09840fff : /ptm@9840000
<br>&gt; 09940000-09940fff : /ptm@9940000
<br>&gt; 09a40000-09a40fff : /ptm@9a40000
<br>&gt; 09b40000-09b40fff : /ptm@9b40000
<br>&gt; 0b1f0000-0b22ffff : sce-pm
<br>&gt; 0b230000-0b23ffff : sce-cfg
<br>&gt; 0c168000-0c168003 : Tegra Combined UART SPE mailbox
<br>&gt; 0c240000-0c2400ff : /i2c@c240000
<br>&gt; 0c250000-0c2500ff : /i2c@c250000
<br>&gt; 0c260000-0c26ffff : /spi@c260000
<br>&gt; 0c280000-0c28003f : /serial@c280000
<br>&gt; 0c2a0000-0c2a00ff : /rtc@c2a0000
<br>&gt; 0c2f0000-0c2f0fff : security
<br>&gt; 0c2f1000-0c2f1fff : gpio
<br>&gt; 0c300000-0c303fff : /pinmux@2430000
<br>&gt; 0c340000-0c34ffff : /pwm@c340000
<br>&gt; 0c360000-0c3603ff : /pmc@c360000
<br>&gt; 0c370000-0c3705ff : /pmc@c370000
<br>&gt; 0c390000-0c392ffe : /pmc@c360000
<br>&gt; 0d230000-0d230fff : /actmon@d230000
<br>&gt; 0e000000-0e07ffff : /cpufreq@e070000
<br>&gt; 10000000-10000fff : /pcie-controller@10003000/pci@<wbr>1,0
<br>&gt; 10004000-10004fff : /pcie-controller@10003000/pci@<wbr>3,0
<br>&gt; 12000000-12ffffff : /iommu@12000000
<br>&gt; 13e00000-13e0ffff : /host1x
<br>&gt; 13e10000-13e1ffff : /host1x
<br>&gt; 13ec0000-13efffff : /host1x
<br>&gt; 150c0000-150fffff : /host1x/nvcsi@150c0000
<br>&gt; 15100000-1513ffff : /host1x/tsecb@15100000
<br>&gt; 15340000-1537ffff : /host1x/vic@15340000
<br>&gt; 15380000-153bffff : /host1x/nvjpg@15380000
<br>&gt; 15480000-154bffff : /host1x/nvdec@15480000
<br>&gt; 154c0000-154fffff : /host1x/nvenc@154c0000
<br>&gt; 15500000-1553ffff : /host1x/tsec@15500000
<br>&gt; 15600000-1563ffff : /host1x/isp@15600000
<br>&gt; 15700000-157fffff : /host1x/vi@15700000
<br>&gt; 15810000-1581ffff : /host1x/se@15810000
<br>&gt; 15820000-1582ffff : /host1x/se@15820000
<br>&gt; 15830000-1583ffff : /host1x/se@15830000
<br>&gt; 15840000-1584ffff : /host1x/se@15840000
<br>&gt; 17000000-17ffffff : /gp10b
<br>&gt; 18000000-18ffffff : /gp10b
<br>&gt; 80000000-96079fff : System RAM
<br>&gt; =C2=A0=C2=A0 80280000-817dffff : Kernel code
<br>&gt; =C2=A0=C2=A0 82040000-823b9fff : Kernel data
<br>&gt; 961bd000-efffffff : System RAM
<br>&gt; f0200000-2757fffff : System RAM
<br>&gt; 275880000-27588ffff : persistent_ram
<br>&gt; 275890000-27589ffff : persistent_ram
<br>&gt; 2758a0000-2758affff : persistent_ram
<br>&gt; 2758b0000-2758bffff : persistent_ram
<br>&gt; 2758c0000-2758cffff : persistent_ram
<br>&gt; 2758d0000-2758dffff : persistent_ram
<br>&gt; 2758e0000-2758effff : persistent_ram
<br>&gt; 2758f0000-2758fffff : persistent_ram
<br>&gt; 275900000-27590ffff : persistent_ram
<br>&gt; 275910000-27591ffff : persistent_ram
<br>&gt; 275920000-27592ffff : persistent_ram
<br>&gt; 275930000-27593ffff : persistent_ram
<br>&gt; 275940000-27594ffff : persistent_ram
<br>&gt; 275950000-27595ffff : persistent_ram
<br>&gt; 275960000-27596ffff : persistent_ram
<br>&gt; 275970000-27597ffff : persistent_ram
<br>&gt; 275980000-27598ffff : persistent_ram
<br>&gt; 275990000-27599ffff : persistent_ram
<br>&gt; 2759a0000-2759affff : persistent_ram
<br>&gt; 2759b0000-2759bffff : persistent_ram
<br>&gt; 2759c0000-2759cffff : persistent_ram
<br>&gt; 2759d0000-2759dffff : persistent_ram
<br>&gt; 2759e0000-2759effff : persistent_ram
<br>&gt; 2759f0000-2759fffff : persistent_ram
<br>&gt; 275a00000-275a7ffff : persistent_ram
<br>&gt; 275e00000-275ffffff : System RAM
<br>&gt; 276600000-2767fffff : System RAM
<br>&gt; 277000000-2771fffff : System RAM
<br>
<br>OK, but reservation still doesn&#39;t work as needed. There must be no =
RAM=20
<br>identified by the kernel from 270000000 onward, see comments in=20
<br>jetson-tx2.c.
<br>
<br>But there might be more different with your system, just compare the=20
<br>addresses of the persistent memory with the tx2 config. Maybe you have =
a=20
<br>newer variant of the board. Adding Claudio, maybe he has an idea. But I=
=20
<br>suspect you will have to update the config for the variations.
<br>
<br>Jan
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
om/d/msgid/jailhouse-dev/af79c7dc-6eb8-45c0-a93f-6e0e4da069ab%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/af79c7dc-6eb8-45c0-a93f-6e0e4da069ab%40googlegroups.com<=
/a>.<br />

------=_Part_1177_617579483.1580418026179--

------=_Part_1176_1752819028.1580418026179--
