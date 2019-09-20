Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB6FSLWAKGQE6QY3FSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id A2233B8E28
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 11:57:27 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id m17sf1064194lfl.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 02:57:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568973447; cv=pass;
        d=google.com; s=arc-20160816;
        b=h1Ka8I2Daw2i8xmF2J4OY3nByr8jXfJVZI4iP8zKOpcKJOlZ1jkciLDJ+mgXmonlc6
         8SF7CPjF6sZgRPU5SplaneiRsr8Z7bz+fl0HhxkfqADOQY49uGZuOLOE35w2PUzvLn3Q
         5Ne/D9WOuUPH1Ve0Lg84b+vNAwLvCl3v2u/AIzMuXBMnjZNbjWGdPJa4+5iu98yqSF6D
         Bsi3x8J50fpX9dMBFpsedshyylzDTRGftvPTm2jOP9mJ9Usv4nP4OOug401Iuyc/CO8C
         ocBxRMOpNqjFRvFYs1pt0TEUWdvEw+7KAyWh0KkKYd5sXDuqb59feLtUZPhLY2fsjNL6
         0pcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=XCV4740evPm+Q6UIU5NFbYGNiqXcvVJZdtac1tivhNI=;
        b=kp/zK9qW0Jgx9psrMV50FjwVPSGeZEXWByZwt9j5h/dOP/sGAyjWdqJ3p0//BjCAJI
         EOUIvF+L9itdQJcXeco/9Di2/b0e4yfziu4ZdHzBWdoy7zQ8QSw4FEvhYKPHrSV+NewR
         Pa52WkJJ7PSeJ6NzgOit+VWmHu5ZJRPryJIkEmGMQaL3xALvcnWsSv7+7TbWTrk1uEWc
         KK0uamuiN5tFFKBgOSBuDcE5v12DENqyJqj2gli80AYmZk5ZYQkCfHiG9s+ZMBb3cuVA
         m4VaRrqFTgNNueTUSBmWHZwBPuK8xLD4SEiBRrCs6nDXbfQ+l6P+ub9N1Gk9Kh/Wk3fz
         B1qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XCV4740evPm+Q6UIU5NFbYGNiqXcvVJZdtac1tivhNI=;
        b=p3ujc/1kkPsl65faadJXNrYoyZ5gbrShtvIXR/YwMge932WOqHY+aRqxuHbsG0e6uY
         4NpreXuU05ieSWFqIUej4nZ9y034SXaBcSNhBgYjA/zvYEtNeqOFvrgpXgpd0vbR5RRD
         VpHna4NXSRTKKfYz1p4OF6c/CAZCzyihGDsU/xfW1kfsG3ZEvvNpfMKV6zbuD63MOg/u
         8kkVQtyyEpFpQ7zpZ5z6jSWARwWcNsl1Sgml13o8NIhYDGMbZghcxgdLxtXIaE3aAHwi
         f3WadJYbg47mIi52bgOigduSVCNBSNnFB2s1H6zGrsATh1fixi6/1ieJSEw1cW1Vbamm
         2tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XCV4740evPm+Q6UIU5NFbYGNiqXcvVJZdtac1tivhNI=;
        b=VUYS4mFsmJoSsvLEObow66+2NcDnPZXrUkFh9OqA1eVmHXXCvIH0v0zCpwstNENeuV
         YWn/baSrCNUg0t/G7JgTYoJz3TtXch/RZJW4qAssYMZBmMrA8/2xlba42lJTTh/LfWV2
         oWNvwElXiGX9PWGLxBTH3XhkYzLjrgt2b3a9xul3gk3UtPe5zqG/0xrmW9Bws+sUH8hb
         dh+qOZCxRnB0BikKidWpGRAWNNAa+JD75sCoM6pZVXxOm9wcj3u6jKd0agmY0QNCvqI8
         43dOkP4WPeTlxd3YFKrbzgTszjh8euV8Sr2vXs1aDl/sT+/tuITkER+TRUHWWbAry+kH
         z6aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVv+mLST9ecc+/Dc92DbcDlai1DC/VWc7VTelc9xubi1Sy3BJ6s
	knO8xJdrEwgOhC6YPO4ADuU=
X-Google-Smtp-Source: APXvYqyGy5jxPvSh6SjtPVDvXRX7E5m7qoKhIqozrTcwUMOmM4sbdWgP3onJ6tUlY8qwI1t7kiu77A==
X-Received: by 2002:a2e:3806:: with SMTP id f6mr8808872lja.143.1568973447138;
        Fri, 20 Sep 2019 02:57:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8803:: with SMTP id x3ls109670ljh.10.gmail; Fri, 20 Sep
 2019 02:57:26 -0700 (PDT)
X-Received: by 2002:a2e:309:: with SMTP id 9mr8724497ljd.171.1568973446484;
        Fri, 20 Sep 2019 02:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568973446; cv=none;
        d=google.com; s=arc-20160816;
        b=X7P9sorZ79+Q9fbIIUSZQtfPYgIcKUMAEx2h2qrDxOT+6d3AltrlrZbyUZDrG/lXaB
         agUnmv7Z9Ht95F6pfnLkZ2hOLyAZV/7nZN1fC6WflQMADc9iiG48H+QcD6ou6UaUNAOH
         zeWGcB9yKWiCXPQuGvR00xqPxXT975Qoua58++MJBYnuHwSzmUl38DIkjrVJXE/LXDqD
         0mNNyLFODNYikX30XSxDoSTjnmkP//bq5/McGXEUexuCFaj871TF6upFoDOGerTulHFV
         OACWXhoLOBYlUZZLRtL7DLSHTOXDfwm4oznvE7EqK37sZ7Iey9KAgiZK3T+4whBti9Z1
         8iQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=sUfC9uXbgi7d7p1c6FMPqFTAQvRaPItFRkPOR5dLROM=;
        b=nXU5JK/DGNCAow7vQLM7MG2+q7zWfqus0CQSm8PbdDAKavUB40kZVBCROQiGt8/4B1
         1wqM0I78Dpl2V8A+VaSUqW4jXSOXBMDmbv531nVhh0pmP2ewGNINjqbJ+TEH5sEggzio
         lnazOdEIhCjr0z84PkRCspHzzN340amcPd8VUKTNzPxtiSfH/1ZpLTEXfRoHqn2cxBKe
         F+3cDA8eOonDiReIqwuRTYE0wISxEjcyShVT+fz3ltmGorcJx3XUFKWgc610dDX4r85F
         R2sWxH73YEfR8PRJmi1ahXCAHgNZmAZlZIuPUQuxo6iv0pKvORaTIAawlHc2jRGrLa0d
         SZDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y6si89701lji.0.2019.09.20.02.57.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 02:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x8K9vPHT027903
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Sep 2019 11:57:25 +0200
Received: from [139.22.77.104] ([139.22.77.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8K9vOSH021322;
	Fri, 20 Sep 2019 11:57:24 +0200
Subject: Re: Invalid MMIO access during PCI device initialization
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <f529a508-6259-43e5-a2f9-6b4c48bdf153@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <494277d5-a425-8e0d-85da-6474878134e4@siemens.com>
Date: Fri, 20 Sep 2019 11:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f529a508-6259-43e5-a2f9-6b4c48bdf153@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 20.09.19 10:49, Chung-Fan Yang wrote:
> Hi everyone,
> 
> I am having some problem with a physical PCI-e serial card and non-root Linux.
> 
> I have been using the serial card with the root Linux and non-root RTOS for a 
> while whthout any problem.
> 
> Recently, I decided to try this card in a non-root Linux.
> I compiled the Jailhouse enabled kernel and prepared a rootfs.
> The non-root Linux work fine with an motherboard built-in 8250 serial.
> 
> I have a custom Linux driver for this PCI-e serial card.
> Therefore, this card should be immune from the 8250.n_uart problem.
> However, because the card is still in the COMMUNICATION_SERIAL class, 8250_pci 
> driver still will initialize the card during boot.
> 
> During this initialization, it will try to setup the virtual channels.
> When it read the VC capability structures, the system hangs with the following 
> log(I had made jailhouse to be more verbose).
> 
> More specifically,
> 
> when it do pci_vc_do_save_buffer() in drivers/pci/vc.c and call
> 
> pci_read_config_word(dev, pos + PCI_VC_PORT_CTRL, (u16 *)buf);
> 
> it will in turn call read_pci_config() in arch/x86/pci/early.c, resulting a fault.
> 
> 
> Removing PCI device 02:00.0 from cell "RootCell"
> Freeing 8 interrupt(s) for device 0200 at index 74
> Adding PCI device 02:00.0 to cell "linux-x86-demo"
> Reserving 1 interrupt(s) for device 0200 at index 72
> Removing PCI device 02:00.1 from cell "RootCell"
> Freeing 8 interrupt(s) for device 0201 at index 119
> Adding PCI device 02:00.1 to cell "linux-x86-demo"
> Reserving 1 interrupt(s) for device 0201 at index 73
> Removing PCI device 02:00.2 from cell "RootCell"
> Freeing 1 interrupt(s) for device 0202 at index 71
> Adding PCI device 02:00.2 to cell "linux-x86-demo"
> Reserving 1 interrupt(s) for device 0202 at index 71
> Created cell "linux-x86-demo"
> Page pool usage after cell creation: mem 468/16329, remap 65711/131072
> Cell "linux-x86-demo" can be loaded
> CPU 7 received SIPI, vector 100
> Started cell "linux-x86-demo"
> FATAL: unsupported instruction (0x66 0x00 0x00 0x00)
> FATAL: Invalid MMIO/RAM read, addr: 0x000000008020010c size: 0
> Name: linux-x86-demo
> RIP: 0xffffffffb2550a08 RSP: 0xffffad0cc003bc08 FLAGS: 10286
> RAX: 0xffffad0cd020010c RBX: 0xffffad0cd0200000 RCX: 0x000000000000010c
> RDX: 0x00000000000000ff RSI: 0x0000000000000002 RDI: 0x0000000000000000
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> RBP: 0x000000000000010c
> DS: 0
> SS: 0
> GDTR_BASE: 0xfffffe0000001000 GDTR_LIMIT: 0x000000000000007f
> IDTR_BASE: 0xfffffe0000000000 IDTR_LIMIT: 0x0000000000000fff
> CR0: 0x0000000080050033 CR3: 0x0000000006c0a001 CR4: 0x00000000003626f0
> EFER: 0x0000000000000d01
> CPL: 0 RPL: 0
> Parking CPU 7 (Cell: "linux-x86-demo")
> 
> I do not understand why only this specific read cause a fault, but others don't.
> Did I misconfig anything in the cell config file(as an attachment).
> 

I suspect your are not using current master but rather the laster release, 
right? Could you retry with master, specifically because of [1]?

Jan

[1] 
https://github.com/siemens/jailhouse/commit/96157677dfbb37cc112e4384bbd4c585f9d98af6

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/494277d5-a425-8e0d-85da-6474878134e4%40siemens.com.
