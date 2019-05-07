Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQE5Y7TAKGQEXDCCBUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838416A2B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 20:30:25 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id y4sf652763ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 11:30:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557253824; cv=pass;
        d=google.com; s=arc-20160816;
        b=g07O+mP7fTD7nppJlDahi2YfCctbAS/Q1S21dAF3vdgdH5KQRGFSUNl+Dmx/n1hP96
         pnJHrxQtlbOFsBnF2T+2sLQ13RnltkpPa5eDzxO/eaIKkOYVBKwvHzOD0sEbAt1sKqAe
         TiJMsXP4MaGjtia38yW7w7N4aeOZR6ccvZkupDrEVA/B+ijtk6wDncyQ2mNw+MYJIXN6
         TXVApj54vQ053xEtwBeSQl8mMPi8ElUvAdVLxPP/vBNMfHmnwzXgiiSpO7YROE5pd6mP
         D0iSvYFciKn0ypLjkKn0nxIZbcFyNrj9vIZmh2BYtf9gPcoL2IYLu6mJdxn99WPCY5Pe
         LekQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:to:sender
         :dkim-signature;
        bh=2kTbWgyu0yOfiWiX+Ycg7VNYjz2zIzvwTpt1DRuKt8U=;
        b=CxBIqvl7W+aUtKN04Oe34CYYx2Ew2iF607/IPVllUEGcxtMBVbcWonoWbN5wqXOI08
         TV/C0HFQCo7Ab3Anh9uQvQl60sNyTITIU/t8Y2z1lxmburxHwNRUiwCIXPV++5cBXsdh
         Vs9Dv/JpE8sB7Ll+KF3mVKQ8P03m73nAPod32/0bJfdpo094luvUD0IZUYpvBmUpOHsb
         k40Z8naKz3OBQfdsfurADsWUGgaWv0tk9262yvXTScp5kYHBTH0mpIAQ5UPvunRAfZux
         aAAEsytLpAsX4YuR19mfV8ove2bHMxSPQ+yADOw493RvW23FJVLUvLE5klk5dRJtaOWU
         BkJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dq1x1cPy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:openpgp:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2kTbWgyu0yOfiWiX+Ycg7VNYjz2zIzvwTpt1DRuKt8U=;
        b=TQogcWOJ2p6KkBFSTWxII6UqQyrheQZbSIWalAKzhaWnMJHb99RjiLk3eDCcby8yYS
         nnti+LnEH0DtPSNH0MWi4MVJGF0EZngsywUFlmHDdNR7dSFaDPshL5VdH/QusyWg8jlV
         kf8eGRfgW+0MjkRuIAkzKCCGkHvtALCToaBXIszFiDsxmupTETS463V3HkN11yu5wMZF
         jFejY3LO5eI2eqfxhpCEHu+ta1g/eUmQBgtOxMiTyzVDl6w6e14vVPYArc4jILusnSqC
         iKs/6AScdmmijLU9qVvoPkHx8Ssqaa6wfCPMQHe51FY7mCUdNKV6QHRdJKuPFGJHstsD
         t1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2kTbWgyu0yOfiWiX+Ycg7VNYjz2zIzvwTpt1DRuKt8U=;
        b=lTtigcJqcBOUICIInURQIRlHUtUMDODoe5KgZIZAfCI9eTYt4ldANfB/TaLlIxRGLH
         o6rhtpLTiOpl0ny3oVWEK0xFdJYMKCAMxqXwKgOVy32TnGUWeNDH7UpiURs1xzi0Seej
         U4RCXT1s0zZxJ7XTdsJfLZ75qzAraOG+4jb8Ied6Fqh9L+WG7bnnuT3WrH81pEdo8rr3
         aMc3Q4mZyLElwWGdMv5wqcD7SFbKgWap+0QswI3o30Ugcj/zpH0CQH+gUOP6fcxsyHQ7
         AOzLEmQU9Tj9z52PdSQJsm/b+cBHAvIVoFjx1MtitwsWJSczIa9C30Ju3aHNPdW3SihW
         uLaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVeC6NzFj9mtJ9f0B3yzPp1t2KeJwobAUMOMZIcGlGpRJb21s7q
	OWoyHp91YAqQoGjljOrkuJQ=
X-Google-Smtp-Source: APXvYqwIl00yTyjzbpSA1uGBOUEiABOHUHfoT084qT5RkgRib+PrbG4ZvFTS/czmcHsnK9WHzFE+Kg==
X-Received: by 2002:ac2:5626:: with SMTP id b6mr3046241lff.82.1557253824528;
        Tue, 07 May 2019 11:30:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls1499647lfm.1.gmail; Tue, 07 May
 2019 11:30:24 -0700 (PDT)
X-Received: by 2002:ac2:53ad:: with SMTP id j13mr4049615lfh.14.1557253824017;
        Tue, 07 May 2019 11:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557253824; cv=none;
        d=google.com; s=arc-20160816;
        b=LQdqqXraV4krQ0UGgOEJ9/6M6xoAJwA7mWbPcuiCzkcyZLp0gB2eFAnUcSF5ZSHPEd
         kBW0WXCREMXZU/yFwRXowejoaf6hmaqaBTRatG3rXfvaXU6Y/DOlC9Px0c346ygnQmRV
         f6X+SeQUdKvWsmMD2PZ8EWQ6+8lVWm4bvh9WrKR9U4mR79/kNtOzXnKIsO6QVuj2eZCr
         tkTGTwXqVMBiPecU7ns2OkREk3MHlnHABzAsa7kx2o+AWaXr9wzNBti18ozv/4i4cvIw
         CuLmIdiM7yejayYuliQXj8xzuL7ZXEucDTd2OBJnBnNG2rEjWpvtZA2uoh6VbVDMnu1W
         MIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=M5YhauVcvjGCygXfU4raGNY685+0XM5nGNFXH7PtYlg=;
        b=kPOZ4erSj0mznGcnZoB+Oh3VJ38OuhSkCzLnW/KnsHzvUPUueZXB1L/ewKXx6fJXau
         WwzaItgnEgCp9O3ROTXINtDObyBjp2AAc64cedUjmPmLs+M5tjHKfHarInfmesDzxQvZ
         tyHurEl08lCHo3X4cDc9kcWVA/2jYGxKMLlqOpMC/syZDf1eUyFzSxZM5JTW+N8t77ev
         /wWuW4aBAchZQOXjLUOo2uhO7DXBsTEU9cb/JPcWDsxrj2RcxbKC+D0Qzrb8MOJuFYNR
         xwjJ8YjFB5EZ7Hu9E4LrZBF66T/tw0UhPooRoh57gkrpOsLh+IFE6p3NoaZwPHo3sSbi
         QT1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dq1x1cPy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f18si460420ljg.3.2019.05.07.11.30.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44z7St5hcXzxxN;
	Tue,  7 May 2019 20:30:22 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 May 2019
 20:30:22 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
 <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
 <3630dc76-83db-c00f-dfda-7b8459674453@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH v2 6/7] pyjailhouse: autogenerate pci_cap_ids.py
Message-ID: <c73157ec-21d5-139f-2a3d-2ce99497e2c0@oth-regensburg.de>
Date: Tue, 7 May 2019 20:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3630dc76-83db-c00f-dfda-7b8459674453@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dq1x1cPy;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/7/19 8:11 PM, Jan Kiszka wrote:
> On 07.05.19 00:11, Ralf Ramsauer wrote:
>> Convert pci_cap_ids.py to a shell script that should be called with
>> cell-config.h.
>>
>> The script will extract PCI_CAP_IDs with grep & sed, fill the template
>> and
>> print the generated python file. The Makefile will redirect the output
>> to the
>> final destination.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 .gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 pyjailhouse/pci_cap_ids.py | 67 ---------------------------------=
-----
>> =C2=A0 tools/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++--
>> =C2=A0 tools/gen_pci_cap_ids.sh=C2=A0=C2=A0 | 58 +++++++++++++++++++++++=
++++++++++
>> =C2=A0 4 files changed, 71 insertions(+), 69 deletions(-)
>> =C2=A0 delete mode 100644 pyjailhouse/pci_cap_ids.py
>> =C2=A0 create mode 100755 tools/gen_pci_cap_ids.sh
>>
>> diff --git a/.gitignore b/.gitignore
>> index 494b9356..678f7436 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -19,6 +19,7 @@ include/jailhouse/config.h
>> =C2=A0 hypervisor/hypervisor.lds
>> =C2=A0 inmates/lib/arm/inmate.lds
>> =C2=A0 inmates/lib/arm64/inmate.lds
>> +pyjailhouse/pci_cap_ids.py
>> =C2=A0 tools/jailhouse
>> =C2=A0 tools/jailhouse-gcov-extract
>> =C2=A0 tools/jailhouse-config-collect
>> diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
>> deleted file mode 100644
>> index 3b824718..00000000
>> --- a/pyjailhouse/pci_cap_ids.py
>> +++ /dev/null
>> @@ -1,67 +0,0 @@
>> -#
>> -# Jailhouse, a Linux-based partitioning hypervisor
>> -#
>> -# Copyright (c) OTH Regensburg, 2019
>> -#
>> -# Authors:
>> -#=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> -#
>> -# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> -# the COPYING file in the top-level directory.
>> -
>> -from .extendedenum import ExtendedEnum
>> -
>> -
>> -class PCI_CAP_ID(ExtendedEnum):
>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PM'=C2=A0=C2=A0=C2=A0=C2=A0=
 : 0x01, # Power Management
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VPD'=C2=A0=C2=A0=C2=A0 : 0x=
03, # Vital Product Data
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSI'=C2=A0=C2=A0=C2=A0 : 0x=
05, # Message Signalled Interrupts
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'HT'=C2=A0=C2=A0=C2=A0=C2=A0=
 : 0x08, # HyperTransport
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0 : 0x09, #=
 Vendor-Specific
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DBG'=C2=A0=C2=A0=C2=A0 : 0x=
0A, # Debug port
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SSVID'=C2=A0 : 0x0D, # Brid=
ge subsystem vendor/device ID
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECDEV' : 0x0F, # Secure De=
vice
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'EXP'=C2=A0=C2=A0=C2=A0 : 0x=
10, # PCI Express
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSIX'=C2=A0=C2=A0 : 0x11, #=
 MSI-X
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SATA'=C2=A0=C2=A0 : 0x12, #=
 SATA Data/Index Conf.
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AF'=C2=A0=C2=A0=C2=A0=C2=A0=
 : 0x13=C2=A0 # PCI Advanced Features
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -
>> -class PCI_EXT_CAP_ID(ExtendedEnum):
>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ERR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x01, # Advanced Error Reporting
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC'=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 : 0x02, # Virtual Channel Capability
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DSN'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x03, # Device Serial Number
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PWR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x04, # Power Budgeting
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCLD'=C2=A0=C2=A0=C2=A0 : 0=
x05, # Root Complex Link Declaration
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCILC'=C2=A0=C2=A0 : 0x06, =
# Root Complex Internal Link Control
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCEC'=C2=A0=C2=A0=C2=A0 : 0=
x07, # Root Complex Event Collector
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MFVC'=C2=A0=C2=A0=C2=A0 : 0=
x08, # Multi-Function VC Capability
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC9'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x09, # same as _VC
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCRB'=C2=A0=C2=A0=C2=A0 : 0=
x0A, # Root Complex RB?
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0=C2=A0 : 0=
x0B, # Vendor-Specific
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'CAC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0C, # Config Access - obsolete
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ACS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0D, # Access Control Services
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ARI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0E, # Alternate Routing ID
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ATS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0F, # Address Translation Services
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRIOV'=C2=A0=C2=A0 : 0x10, =
# Single Root I/O Virtualization
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MRIOV'=C2=A0=C2=A0 : 0x11, =
# Multi Root I/O Virtualization
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MCAST'=C2=A0=C2=A0 : 0x12, =
# Multicast
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PRI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x13, # Page Request Interface
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AMD_XXX' : 0x14, # Reserved=
 for AMD
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'REBAR'=C2=A0=C2=A0 : 0x15, =
# Resizable BAR
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPA'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x16, # Dynamic Power Allocation
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'TPH'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x17, # TPH Requester
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'LTR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x18, # Latency Tolerance Reporting
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECPCI'=C2=A0 : 0x19, # Sec=
ondary PCIe Capability
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PMUX'=C2=A0=C2=A0=C2=A0 : 0=
x1A, # Protocol Multiplexing
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PASID'=C2=A0=C2=A0 : 0x1B, =
# Process Address Space ID
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1D, # Downstream Port Containment
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'L1SS'=C2=A0=C2=A0=C2=A0 : 0=
x1E, # L1 PM Substates
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PTM'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1F=C2=A0 # Precision Time Measurement
>> -=C2=A0=C2=A0=C2=A0 }
>=20
> Do we really need this back-and-forth? Why not come up with the
> generator directly?

Didn't do this on purpose.

I don't know if you like the way how I generate the code. Don't even
know if I really like it [1]. The split-up makes it easier for me if
further changes are required.

If the decision is against a generator, then we can simply drop this  patch=
.

And if we go for the generator, those patches can simply be squashed.

  Ralf

[1] It's a bash-grep-sed dance to pull out those defines. If we forget
about this some day, and do some changes elsewhere, things might
silently fail.

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c73157ec-21d5-139f-2a3d-2ce99497e2c0%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
