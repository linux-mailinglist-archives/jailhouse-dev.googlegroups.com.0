Return-Path: <jailhouse-dev+bncBCA7ZIXV4AJBBAFZUOGAMGQEZHPZ73Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0BE447BA4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Nov 2021 09:14:57 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8sf6010326lfu.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Nov 2021 00:14:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636359297; cv=pass;
        d=google.com; s=arc-20160816;
        b=xsZNMLzgPvQxiF5bJzJbNcjqj2bH+etMxLrwVYk1EA8u/wOQ+gm8lrgenLmxdcqTOB
         gMoV/2JHC+2f3yIrORB+EHtRzGqOc9MVTm2JdCMdb7PSqqTzI4EIrhyM7Vt/6fKEHdQY
         WlImSpsj8Y+obEIgjPipe8wkNGCAv63L9Nh8ReRpiWjArVNvSbYnFQb6xAPUq3tXVR8d
         G6dbVY2ie+Gr0WHoOxnxyMtZY+uvdGPQASVmDL8YeInj9Zk0+OV1Lisd1MkYGn6KubLd
         Ic9NHqCpW6/MKyagqX7zyH33Ddoe08lT3c1aJxGHIiEWPQbn0PVuNKVgIkXtO7c4SQWS
         12dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:ironport-hdrordr:ironport-data:ironport-sdr:sender
         :dkim-signature;
        bh=xrqgiYe3RIS2Tw/wRETy1HJMjpccD4bmY3wIOwyffDk=;
        b=IUPedDCwAkEVBWeT0vIRI2AVtFoquMCY5F/lfDLa6J2cBCFrk1izuHMBlDFcJt67O9
         O1cXWI/JM0U/nW5BYq8MkklINEa9xPRPg2oAzeHjXWGhM4VIj+tENbdwUTbcJkJMZywZ
         IWZTt5nU6Cfa2pO9/gfUsjy54bey1LI1P8LLqEBU6ofSJiLVQvb4JDus5LlAdun4rUBO
         zFj7n0tXw41G2nxL3lFqjMYqgWyt4bxwrrSDCFIf08qOC5qtuclVjeTSe4LeNxaJ5Izm
         KJdiQtWqXAv1txdQvk6sHlJP7fzhhPldteH8FrS2j7xP93hRRQ5EmPNJWudcOSz3yG1X
         PRBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b="cBqUR6/4";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:ironport-sdr:ironport-data:ironport-hdrordr:from:to:subject
         :thread-topic:thread-index:date:message-id:references:in-reply-to
         :accept-language:content-language:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xrqgiYe3RIS2Tw/wRETy1HJMjpccD4bmY3wIOwyffDk=;
        b=az93oy9L4D/KYKnp6ra09bkqQ0LTn1B05v7gLBMn+WiX+EVlLwAMcjQnNWkG8MDAvz
         4DmB+0JVBJNSwT9RDkB5fmvinxJ200sf5z0p638WanM+z8Qs4lJCkroILRqbX7L4qomB
         l4wrExiiu2tMJz3B8uYGl/wpjz4KK15A+M4W6BsZ3JsdD6OD+OQbOQfFtTapDGkPnyM5
         QmAyLSFZ2vLz71sgOYvuRTjzOZsGukC2CmvCiJbie4EcGqwWtEULe7LQMlEhwftPSbAG
         PiyP2Wsi6CHGDoHf+a69qeI91jZH+ptePnK1Q8DfXhWlcrzIsd9BpHNOWYT1bmhwdNtc
         EfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:ironport-sdr:ironport-data
         :ironport-hdrordr:from:to:subject:thread-topic:thread-index:date
         :message-id:references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xrqgiYe3RIS2Tw/wRETy1HJMjpccD4bmY3wIOwyffDk=;
        b=jPq6przy+2MG0XQlPEPQYExsBIj9TBbhJGII2dVqSGyj6h8019Q8xSK+NcO2Erct5u
         xsaJA5c+GS6OB8gI0mR45fRA4h4Ls/svSixIzjmz7Xq3drdXAEMUA4oNE5zoVUNdmcoN
         HNvleRSx/zZB7dqMkioF8FzW8Fojd6GLgcHFDYl9M4q+B+jxUGb5GOeZ8wIiyU+cSYxB
         wgMPuuCR4XavVCygUdQxG1Z8J9uDA3YS+fCMg3S2OJwoEaVHpvUWeM3SHPWgRwXykOF6
         qTpAZ+6GGgxU8/PRuyQDtM8UyfT50lzLXSCKY628otXlzk9sV9PphiJ3Ec60jcZnuQso
         uFlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BgNNAZVML/KmKktzcojCvXasQpYVYQQJH09KtvdAMyHveBl6+
	8VLq/Y/s/Xonf9McQW10nnQ=
X-Google-Smtp-Source: ABdhPJxUOAtYvrOiFk+52sJYmazMzlSjBcvN45nPe4wvO8fkWSu7tB0wT4Jjte9Kttc1ORilh9ZY3Q==
X-Received: by 2002:a2e:948:: with SMTP id 69mr2874808ljj.82.1636359297250;
        Mon, 08 Nov 2021 00:14:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a03:: with SMTP id v3ls2460501ljc.2.gmail; Mon, 08 Nov
 2021 00:14:56 -0800 (PST)
X-Received: by 2002:a2e:bc0b:: with SMTP id b11mr674740ljf.157.1636359296139;
        Mon, 08 Nov 2021 00:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636359296; cv=none;
        d=google.com; s=arc-20160816;
        b=Yv3bM/2oW/QadLaAAWcZbFaKQ5U2exmmKwsy8Hkm1GZOQLhebKhnwA23LuQsV77hS0
         /bbn9h6CZi9OtuoOJ2ntq5YhRuDYAJg47gBUbvpILwBvFg2o7qSERReIfbBQehEXSfta
         JSYael+pj2csu49ee0VDX2rdglUWEI3Eb+luZHEjv2oADowSXmr6RG4OUYdOR+A5KyPJ
         /kQdmB1uKi2/32ZUcqx5SqeWLKCdcy3WQx7+rWUK4ioFJwKJqF3lknIk0KGO4yKyuOiV
         5qo70gaJ1p38rJlVoBg2WgONXy6iItfwLgZG1IgsKk5qBkzDqjx4guKlR8p//QMMsf5y
         LVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:ironport-hdrordr:ironport-data
         :ironport-sdr:dkim-signature;
        bh=NA64FNyucmkGRmDstY7QIRqG8t3woGxzj5LKEMOulc8=;
        b=o7Qj36irdqs6JAPgsKtyOtDe4DFquM1WCjAMrZCnt1q8BlPKGSBvrvkWBFWk48xb5Q
         TbMr9EKtxcfXPTl2O2VtBigOY8PGJERzPNzW0GdmNm6BN+/RUYagUrlHpEQLX+PdQd9m
         tfW7tkV9APmwc6mzejuRBqOSTVcp+TabcFLLozwjSzkBLnhLuH7zj02QRisoR0V4Hs2X
         ot0GNl3nV/+gOKX3aDHsi5yrwoPdwCdCHXHJpKQ3quKsZzDuAtzTJ1M/jYDw1yVf3ZVK
         g7lNR6SKmegZyM0eu0ZjCNldJXJ80nqtE0BwyDsvssje+tOqkAnWHcDmyMoQnNGXRhY7
         Bf1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b="cBqUR6/4";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
Received: from mx2.ulmapackaging.com (mx2.ulmapackaging.com. [212.8.121.109])
        by gmr-mx.google.com with ESMTPS id w6si936937lfa.7.2021.11.08.00.14.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) client-ip=212.8.121.109;
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: kcwzKYBeu3XGzRXzWBl6bVl+IURUDv0dc4EieQ82zH0TfARroSckwg0cbSxVOFVmavvz1HoAfn
 6dgKUtiXXRgw==
IronPort-Data: =?us-ascii?q?A9a23=3AtrkyNqr7xCpxy34WL1BSYZ3edNdeBmI2ZxIvg?=
 =?us-ascii?q?KrLsJaIsI4StFCztgarIBmBafiMNmKhKd4kaI7loRhTv5PdzNBiSlY+pCthQ?=
 =?us-ascii?q?iJB9MeUXt7xwmUcns+xwm8vdK/uhiknQoGowPscEzmM+X9BDpC79SMljPjQF?=
 =?us-ascii?q?uKlYAL5EnsZqTFMGX5JZS1Ly7ZRbr5A2bBVMivV0T/Ai5S31GyNh1aYBlkpB?=
 =?us-ascii?q?5er83uDihhQVAQw5TTSbdgT1LPXeuJ84Jg3fcldJFOgKmVY83LTq08uEdiEE?=
 =?us-ascii?q?m3lExcFUrtJk57gakZSG+OUJQGFiXNZWq6txAVGoyV0371T2Pg0MBgNzWzX2?=
 =?us-ascii?q?Yk3kYglWZ+YEG/FOoXWg+0SWgNKGjNjFbBC/bbfKHO8uMOSyUKAeHzpqxlrJ?=
 =?us-ascii?q?BpubdZHp7wf7WZmsKZwxCo2RhKKhua2x6+gR6xgi9oLI87sM4cStWtn0CnCS?=
 =?us-ascii?q?/0hRPj+rw/ijTND9G5v3IYXQ7CHIZNEAQeDpS/oO3VnUmr7wrpn9AtwukTCT?=
 =?us-ascii?q?g=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ANnQWR6krhl37tQ0USs5P7Ng/avzpDfII3D?=
 =?us-ascii?q?Abv31ZSRFFG/Fwz/re+MjzpiWE7wr5P0tQ5OxoWZPwO080mqQU3WB8B9qftU?=
 =?us-ascii?q?zdyQ6VxeJZnPffKl/bak7DH4dmvM8KGZSWSueAb2SS5vyU3ODMKbcdKa68np?=
 =?us-ascii?q?xA692z854nd3ANV0gp1XYBNu6MencGPDWuK6BJb6ah2g=3D=3D?=
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO spc015.packaging.ulma.es) ([172.16.1.15])
  by mx2.ulmapackaging.com with ESMTP/TLS/ECDHE-RSA-AES128-SHA256; 08 Nov 2021 09:14:55 +0100
Received: from spc015.packaging.ulma.es (172.16.1.15) by
 spc015.packaging.ulma.es (172.16.1.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 09:14:54 +0100
Received: from spc015.packaging.ulma.es ([::1]) by spc015.packaging.ulma.es
 ([::1]) with mapi id 15.00.1497.012; Mon, 8 Nov 2021 09:14:54 +0100
From: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: Problem: system hangs
Thread-Topic: Problem: system hangs
Thread-Index: AdfRb/yz6sETOSkXRaWPtbwUlYSPUgA6R1AAAIcETsA=
Date: Mon, 8 Nov 2021 08:14:54 +0000
Message-ID: <fc8922fafafd475281b11bc752059476@spc015.packaging.ulma.es>
References: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
 <d60a1523-b304-2c16-efee-0c4f0638ba77@siemens.com>
In-Reply-To: <d60a1523-b304-2c16-efee-0c4f0638ba77@siemens.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.87.145]
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: rsagarzazu@ulmapackaging.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ulmapackaging.com header.s=secumail header.b="cBqUR6/4";
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates
 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
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


> On 04.11.21 12:47, Raimundo Sagarzazu wrote:
>>  Hello all,
>> =20
>>  I=E2=80=99m experiencing a =E2=80=9Csystem hanging=E2=80=9D problem whe=
n jalhouse is enabled. It
>>  happens with just rootcell enabled, no need to start inmate cells. I=E2=
=80=99ve
>>  been working on it for several weeks trying to have at least an error
>>  log or report but I didn=E2=80=99t success. System just freezes.
>> =20
>
> Do you have set up Jailhouse to report to the serial port? Are there any
> words from it when the system freezes?

> Jan

Hi Jan,

I do set up the serial port but no words on freeze. This is the log at boot=
 time:

Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 3
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 49/975, remap 1/131072
Initializing processors:
 CPU 3... (APIC ID 6) OK
 CPU 0... (APIC ID 0) OK
 CPU 1... (APIC ID 2) OK
 CPU 2... (APIC ID 4) OK
Initializing unit: VT-d
DMAR unit @0xfed64000/0x1000
DMAR unit @0xfed65000/0x1000
Reserving 120 interrupt(s) for device fa:1f.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:02.0 at index 120
Adding PCI device 00:0e.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:0e.0 at index 121
Adding PCI device 00:0f.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:0f.0 at index 122
Adding PCI device 00:12.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:12.0 at index 123
Adding PCI device 00:13.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:13.0 at index 124
Adding PCI device 00:13.1 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:13.1 at index 125
Adding PCI device 00:13.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:13.2 at index 126
Adding PCI device 00:13.3 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:13.3 at index 127
Adding PCI device 00:14.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:14.0 at index 128
Adding PCI device 00:14.1 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:14.1 at index 129
Adding PCI device 00:15.0 to cell "RootCell"
Reserving 8 interrupt(s) for device 00:15.0 at index 130
Adding PCI device 00:16.0 to cell "RootCell"
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.1 to cell "RootCell"
Adding PCI device 01:00.0 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Reserving 5 interrupt(s) for device 03:00.0 at index 138
Adding PCI device 05:00.0 to cell "RootCell"
Reserving 5 interrupt(s) for device 05:00.0 at index 143
Page pool usage after late setup: mem 360/975, remap 65548/131072
Activating hypervisor

After this, nothing.

I'm working with three very similar boards based on the Intel Atom E3950 pr=
ocessor: iBASE AGS102 box, COM Express module + custom carrier and a panel =
PC from BECKHOFF. Two of them fail, the third doesn't.  Where should I focu=
s? BIOS? Memory region differences? PCI?

  Rai.


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc8922fafafd475281b11bc752059476%40spc015.packaging.ulma.es.
