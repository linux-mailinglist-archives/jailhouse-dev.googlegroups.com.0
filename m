Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBN553TUQKGQEGI46BFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56D71AC9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 16:50:31 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id s7sf9392028ljm.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 07:50:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563893431; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vit6XdN6ymPmYD7DG68qbZzMzUtUkfuiLAOIthFYpCkpin6JjI6D6Nz9JfFd3uvCYI
         wG/tfIcDY1oMNS1W1iYK6ldN2yOS0CWPaagSx0nBy8TbryN3VS1NSEMm6exB/NzyIAZS
         8bdkd0gUQ98J6PRjGBuiTqB2UC3J9V0kOsTvNk/EfzxTVRqLfoTbSgjW5gVWMlluqOgT
         vu4sh1U1yKtdZqagDSfisL3dY8L2Akh/GPnhF+I12UibKmS4b/vWLklkt3DjTwmVS/UL
         /tA0doNERb8gLrStHsThwv8sVCZWYVRWe2JUABh3Th+vDuPcBC1AgyyeCSBzKr6rULAP
         Orlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:openpgp:subject:from:to:sender
         :dkim-signature;
        bh=lJv6LWVFfA67HpV7Ra8KMiAZmw42T2TPkzk0PB9zL6Q=;
        b=0VTY45o7lRHAe9DLlLQ2e7ze1HpqJD3P8i/RjcYN2Tk9SSf5iBzBKr8AvL0mWrFxUu
         7FkY6pcnqUCHt+vhpm5Wzw8jugCtjjvBmskyyGzakrVFz78DTrJY2D4qH70qrEMC+Vxb
         XFFsTGdJQGQXwdWDlTdA6ds/kbHx3v0kT7571H2yaIqHwSrWvDdkzmaQ9NqNwRl/r57C
         Ooj36zB5SyTBuZmSUjJRIHZvn45IT7sqlUW9vsKtQ061RSlhxiZViWofFc4nfos3n7D/
         z/3fvP7VeGqJ4UrxVqIpw1Bxhg+4S0dXebnhO1ERfjxb1x31ojTuht0fvzplh83U71bM
         Y95Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gQ2Lgywy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:openpgp:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lJv6LWVFfA67HpV7Ra8KMiAZmw42T2TPkzk0PB9zL6Q=;
        b=ah3TnjC2nEkmwW69y6wtNugGTwF3YKZxi4NztIvtgy6bJo3Flw7Lknc2dYL36WgF9P
         ktssQAY9JnUxxsWKbz0F5PE+CQ9lyXD1LDsG46EgnvAcybweUcnC63U5z3exi+hxegYO
         yDFwjS6xnYdqegvqL5CmGg3+PKVDeeaPHTxrPznFuOuPNaWFrvS/yeZqI7yx7hWqCblP
         mJt/yk+Zkl6UlzczUdoXayyl9DZvneCtTZ/e4dogkwQ9qI43C4MEmzlaiCjOJkZnIlly
         eLqPIWJLitkx+cF7mxBLisMF+0u5YVpsZxad9Sl+RJKTctpW9KzPslfWeun/ymECMN3d
         vQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:openpgp:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lJv6LWVFfA67HpV7Ra8KMiAZmw42T2TPkzk0PB9zL6Q=;
        b=fSdFZ4DXOe9C+L2YT80XcrwgH9G12BbADdt6SOc6bFmOU0JA64XBfrJ7aRdTHg7kiz
         GEXHRMEIIrjc/fioIbAr8n7tyzsKs+xy/gPMQ3pBRpGf9pfLECAT8t51KS4vdG12LxIb
         rjWGeuDuIrMpW4Ov8YPAnOmilVnLmrHO7uR+tYbyXQOTbMd2miuY16Ryqc8Nd7hr7M6F
         2oIQHVXcWtg1Ci7BcG5Wn7ptrJO6UGv8S2E17+1RsYKShKgZPePkn/Wmi51tofKQuwwR
         /VEyaO62LjKAb9MsyPoneXuqQ190RERxihfD3/imFkfc7h2N1Mc4iCAc8/Wr6NoH5z1U
         ojAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUpKErYZE/GJ1BYtQLqBuaRPQMYp/HYIkPhcg4Vg/ENd9g9L5eE
	R4Eh92IzcDxKlLBNS9uYyZk=
X-Google-Smtp-Source: APXvYqzaiH8iZuN7YO/8+sGESHLmr1amLc/2hxDNppFSY3DCmrQC0j1PWua80VCKoLcuhR5BADNPrg==
X-Received: by 2002:a2e:9cd4:: with SMTP id g20mr17538083ljj.205.1563893431271;
        Tue, 23 Jul 2019 07:50:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8917:: with SMTP id d23ls4905964lji.14.gmail; Tue, 23
 Jul 2019 07:50:30 -0700 (PDT)
X-Received: by 2002:a2e:8082:: with SMTP id i2mr39822650ljg.121.1563893430305;
        Tue, 23 Jul 2019 07:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563893430; cv=none;
        d=google.com; s=arc-20160816;
        b=rzddiIfpHdgsy5E+4oo6slVBpLPeiDxCX6whxEH/rMsLiGfpdeuhyZk124kTp4ccpt
         zzeqi73CxY4PJzxWKai07XNY9T2H5S7cFwGzTz7wxjoEBYqvLH9hbw68QzQg/M/KKdAj
         oalV+KKPppcij9E7MIL3y244GMWQti4K4vEp5gHKSpOROEojZJh7WLbNliZVfzAP5tRV
         616pfMrhOQsP2AOCOHC+qS3pWhPAuR7o1rL/NQT+xvUdms9+MOqmyMfz44BIsVvTJWH8
         hAn94qL3mgCmLVW911005JE/v66Nt8UhNrfxylk4X3qpKnahrAgWTuFVG7R2zvbdMM5h
         Bnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:openpgp:subject:from:to:dkim-signature;
        bh=U5qqk+VZJTm582iTZWD1eDI6urNs2XX6n4HV79zPiWU=;
        b=TMfNudQ29WWJagTRjhbIFXgTbMhFWc3XOr/IVEETNAtw/Volf4bjEEYxf0UwyfjBwp
         omvOua08RUkf+tWv9Suqw3fFOXSkFqwZsWo3KBZXf83RuoctvANjNQ1jX5FFAEK+RLKn
         DqSEIbXgOKIfiqAZURbJe6FH4JNdoAfhXfS6FO+nsZ+fubKKz+jB+RpGi7r2F88upj8x
         1U9TeYKcAb3ujG4w2E5BTKswwi1iQHIiLHfrBuys2VfWYe3JYFDu6yPK2rJpmEkj1EZ9
         5T1fT5a0Vt3T4saPfzio7xjDW5nve23YOo0xi18/jzQW4kCcgXmonTRiftMTs2XWvB9X
         TZ0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gQ2Lgywy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id q7si2482968lji.5.2019.07.23.07.50.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 07:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45tLxd19kmzxvN
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Jul 2019 16:50:29 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 16:50:29 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Jailhouse and PCI UARTs pt.2
Openpgp: preference=signencrypt
Message-ID: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
Date: Tue, 23 Jul 2019 16:50:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=gQ2Lgywy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

I start a new thread, as this is now became another issue. Still working
on getting a RS232 PCIe card running in a non-root Linux cell.

The good news: basically, it works. I can send and receive data via MSI
ints.

serial 0000:17:00.0: enabling device (0400 -> 0403)
querying PCI -> IRQ mapping bus:23, slot:0, pin:0.
serial 0000:17:00.0: can't find IRQ for PCI INT A; probably buggy MP table
0000:17:00.0: ttyS2 at I/O 0x4008 (irq = 24, base_baud = 115200) is a
ST16650V2

I still see the 'buggy MP' error, but it can be ignored as the driver
will eventually use MSI.


Two bad news: Linux's 8250 driver needs patching. At least we need some
parameter like 8250.platform=disable to disable the probing for platform
uarts. Why?

ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
restricted ports. It does touch those ports, as it lacks ACPI platform
information and assumes 'any' platform UART is present.

I.e.:
  8250.nr_uarts=1 only touches 0x3f8
  8250.nr_uarts=2 touches 0x3f8 and 0x2f8
  8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)

In addition to that I have a PCI device. And Linux won't probe it until
it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
want to restrict access to 0x2f8), it will never probe the PCI device.

So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
to all ports. Yikes. At least I now know that the PCI device basically
works, but still, this needs to be patched.


Second thing: Sending/receiving works fine, but I still get VT-d fault
events. Such like:

VT-d fault event reported by IOMMU 0:
 Source Identifier (bus:dev.func): 17:00.0
 Fault Reason: 0x22 Fault Info: 8e000000000 Type 0

... We don't have IR-PCI-MSI in non-root cells, right? So where does
this fault come from?

Note that before handing over the device to the non-root cell, the root
cell didn't load the driver for the device, so it should be handed over
unitialised.

Thanks
  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/80b316b3-a6e4-35be-7cc0-578f1ac685de%40oth-regensburg.de.
