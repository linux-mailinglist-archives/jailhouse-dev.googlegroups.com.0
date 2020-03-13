Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRE3V7ZQKGQEZPTWQYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 9835D184E70
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 19:15:32 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id i25sf8806748edx.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Mar 2020 11:15:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584123332; cv=pass;
        d=google.com; s=arc-20160816;
        b=tDzDVneklmwoxRb1QBmIFIBQfV37JVfOFqgPztyndr/s1fVqNcWVoTSm+mvzPRUL4m
         VNrAfV/j/Nq/gyz7yqnINXjEdUPIYyXX6pJPI0CNHeb/t8t+T2IvEtm9EGOX2sSxMvP1
         cwG+g+qCar3O/NrD+cUO6TdoTvl/AyM1EBGagyOWae2CiNLsOL11d3jMx0YA9LmE0pyB
         ZxhdcviCgA+SVUw4XZD9PyHksj4at/Z36fj5MQGQM71hrcbuFiksYAOhcDS2GHb3kXwp
         cPGdRBrUpuCpYaG5aP+omUMLPIglPMnU/nm2fya7P+JRCbZw/K69oxbwtcIoMHAAL9BI
         sMAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=tFF5h/4ch/x2/K1ezViyIxrNxJUXrrp9/T2yyHDLnMo=;
        b=wOIGpOXlFWFGWFjye/eZHgVRU07TU2V7eZXu4gW2/20N/yOD/AvXCvirV3Xr9XtsKY
         IjOcydxv3l8rKrRK4d2hiVX2wKl+7JkkT6hk9Ycu1Nc97dk4RHDtuMibOjSs2jB77Qgk
         XVxOQ+KspsnNvouSGlszPEjLGlZAXXaMMM2oER1j6ysKEVac4DyPOsR/WsU5y8//2FQ6
         weFZxBEz/n82wpDT9WiANTE1KwyUp03fChikwzfIE3IwaROSIy9/VCI+FyM6ipHjZNUe
         xdWJ3PLlHyQ3eCWklThOwoialOyZf2WFHvoGcWCOQs06zAUq5RLvc3w/JcJhDfHc5wNl
         ztOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tFF5h/4ch/x2/K1ezViyIxrNxJUXrrp9/T2yyHDLnMo=;
        b=iJcjzlJfht/W6Ao31GGvSpoEoZoXNQH6D2ASKhEnuvYTo4YYkSs089y5lUUFTLeV5B
         TNcx7zUqdwayuISYcTrQtJf85g/brGOGFxUUbTCaJWJLPE48jlxt+NurlY5IcGJL210u
         Y1cIA01ZEy67I+RhrUn4Q055lJaYzX5ctJEVYyXJh7Oh7T8SLX6uzCe6Dujepw+n7D7k
         4ruNV4roanRstvaC2bohOaRMAzDHq5kku84dbZgaUHQ9G0pXRxkGKJFDA6/qD0WVzExg
         Xcl1ke1/hM09hm0J++r4R4MBOCO1zkmgLCbrIe3gY6caXA2+5hZ/ok7z68CrHYR7HRZJ
         ERGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tFF5h/4ch/x2/K1ezViyIxrNxJUXrrp9/T2yyHDLnMo=;
        b=KNkcQFGIG9nvsrnntbKrf9UxL5bNVsHQmzBeygBHRb08Ci+WN52j07xS5RKBBcEqeL
         KlYk4dKjnWqZIDx8W1jFsm6XVllPOzh4aUU0oZLgGyfm3u9V31zdLLJ8uBSplO22lvbG
         iC33gcbOZTJLYMZtaxbmFhGJCd4ZrXZetK7ikN62KL7ojzN14JHOohjFK9Ugnak3gq4s
         GWaNLxf9Yf7yCQK+9UJylGvDBNBfDYBjkIaNC93nU7l7WUNJC6c41yuQ7tYn09b0MHbz
         FdF6fXkXMhEbb3MDIiZZwdOdsjPyBuD/vui/gAtS5wPdOKwhD6xqG3I5zqYwG9E6zchv
         L8NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2wN1V1qExj0wIB3US+nW4V0mvOPCHssnz23JjCvRSpAG0y0d+k
	91wuanHPbcAtox7rRKRL7fs=
X-Google-Smtp-Source: ADFU+vvQsvItNPZzDLo2wPNORl+s8h0p7YCPcFR85Xza4XbtJXQF/3C1RpyLVpCKEsiwpbE3T2qoxQ==
X-Received: by 2002:a50:9661:: with SMTP id y88mr14515653eda.357.1584123332304;
        Fri, 13 Mar 2020 11:15:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0cb:: with SMTP id bq11ls6020611ejb.7.gmail; Fri,
 13 Mar 2020 11:15:31 -0700 (PDT)
X-Received: by 2002:a17:906:3653:: with SMTP id r19mr13164917ejb.88.1584123331470;
        Fri, 13 Mar 2020 11:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584123331; cv=none;
        d=google.com; s=arc-20160816;
        b=U3XlphYgLzEYX8N0RvcSKRTa7NM/E29wta/BoejPDtyGqFh9ofT7k6mKMU5hJJCzJT
         vTV02EHYkLwn5RTfH0MyY0ruC+qJN+I8GO1zJfqInR34DJlCnttvY/nzQ6akiZxl6YS8
         4ea4NaxhrOU2CTwhYQCJYlquDzoCIuCstkxwopoTugXuYuFBIhzYu0sqjvd/NnQDRixS
         Ow3uEv8Y1x1j3BUjVEBMmf6ZKFVrAD5zh4m+jCD5Z3TECye2nMCrTl6I8m8nkrMxRoQj
         qvHRucRnS+0CkL9EM4P1k/Fv/bbgO5fpainjvLqHNxxffzcyuajp8FGj3nHYSe9xWsTk
         BB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ks7CltS/CmfkhZiNZwzwVh8twZwlV4BSwHU+GHQfa+U=;
        b=0QfsEAcz04E3vShIs6aDQm6ViiJCgc3QljVdE0BsFUNsAmZArCV2x8NGVSdYmskkbU
         b7m/YH3XC6Gna9KmUO2zV26WnFmBlZv1CUKNFa4p0H4qxteH0/mAuNMDv4aDYZxNVLNW
         H54UwM/3vdPOMit2mn5FafHbrgjIaTeASujKeeIgSLYKqzS+rREEs2dJUyRvYDRm0cgZ
         spOpg8x3NLsztPNr7sj67pL2pCaCV+CxPGOyeLLQ5+fVSowOr3pdwHlik3Zo3/0FGltG
         R0byZmCy+0wHJBi708eH43X5i91ric4cp19ptXXjinEi9kB5RAkh4jfNXwvDFecK+HkZ
         HRUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id x7si284468ejw.0.2020.03.13.11.15.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02DIFU6C026441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2020 19:15:30 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02DIFUIj018363;
	Fri, 13 Mar 2020 19:15:30 +0100
Subject: Re: how to make two non root cell with different resource allocation
 (serial port, IVSHMEM) in jetson tx1
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2568a874-f368-4cec-9076-bad2a0669af4@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5601f586-853c-dcd1-3961-7e5e0b03ae5c@siemens.com>
Date: Fri, 13 Mar 2020 19:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2568a874-f368-4cec-9076-bad2a0669af4@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 13.03.20 18:40, Saroj Sapkota wrote:
> I tried to make two different non-root cell by taking jetson-tx1-demo as 
> an example when I try to create cell it says resource busy. Then I make 
> another configuration as espresso-demo i was able to create cell but 
> when I tried to change communication region and UART region (I mean 
> address) it shows un-handled error but when I kept UART and 
> communication address same as the tx1-demo it was successfully loaded 
> and started with tx1-demo. Displaying result in the same serial port.
> I have attached three configuration
> 1.jetson-tx1-demo(in built in jailhouse)
> 2.jetson-tx1-inmate1(configured by using 1 as template) (resource busy 
> error)
> 3.jetson-tx1-inmate2(configured by using espresso-demo as template)
> 4.jetson-tx1 root cell

There are several example cases in the tree that contain non-root 
configs which can be active at the same time, e.g., 
qemu-arm64-linux-demo and qemu-arm64-inmate-demo or also the 
zynqmp-zcu102-linux-demo and
zynqmp-zcu102-linux-demo-2.

> Questions:
> 1. Do all cell have same UART, IVSHMEM, and communication 
> region(0x80000000; I checked with other arm64 cell also all of them have 
> same address why?)?

Comm region is a virtual resource. It can be mapped anywhere where there 
is space - and where the guests expects it. So we ended up at 
0x800000000 on arm64.

UART is a physical resource. When it's mapped multiple times it means 
both guests may access it - which easily ends up in an output mess at 
best. So, it is typically given one non-root cell while the root still 
has access but does not make use of it.

The shared memory is the same for all connected guests of the same link, 
at least its physical address. That makes it, well, shared.

> 2. How can I direct output of each cell to different serial port?

By assigning different ports and configuring different console entries 
in the cell config (for bare-metal inmates) or adjusting the inmate 
device tree (for Linux inmates).

> 3. Why there is resource busy error in second case?

Both cells are supposed to use the same CPU - that is not working with 
Jailhouse. We only hand out exclusively used CPUs.

> 4. I don't understand how to declare irqchip and pci_device for each 
> cell and root cell? (most difficult one)

PCI assignment (except for virtual ivshmem devices) is not supported on 
your target (missing IOMMU, missing generic PCI host controller). All 
you can do is give one inmate exclusive access to a physical host 
controller, thus all devices behind it. Shouldn't be many on the TX1, 
though. For the pattern of configuring ivshmem devices, study e.g. 
qemu-arm64 configs. Except for the ivshmem memory addresses, you may 
copy those.

The irqchip config of inmates is first of all copy from the root cell, 
just with the pin_bitmap reduces to those external interrupts that the 
inmate shall exclusively(!) use. Interrupts are associated with physical 
devices (check what Linux in the root cell reports when it still has 
access) or with the virtual ivshmem devices (vpci_irq_base + ivshmem PCI 
slot number (PCI device number, that's the Device in 
Bus:Device.Function, modulo 4).

Hope that helps a bit.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5601f586-853c-dcd1-3961-7e5e0b03ae5c%40siemens.com.
