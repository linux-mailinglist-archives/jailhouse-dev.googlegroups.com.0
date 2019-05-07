Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHNPY7TAKGQEVYAYMAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A916AE1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 21:08:13 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id o65sf2245984lfe.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 12:08:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557256093; cv=pass;
        d=google.com; s=arc-20160816;
        b=FAYgBVrlyZ2T/8oL4qGdprDc4HyIcbYeqPii2mLyHfCMsKV+e8ZGbAK20MIdlKX9OI
         decs1qSx92PSqaVS9go2lmk1zL7NglBOq1mHlaZzUe8GNMF5jcXkdLl7AyrnD2oOKLIZ
         dokmDnSjJS4odJP3GudYDparUFejWTDvJfiN3E2nhiNmTwuH1C1ulojugzmqSmadMR5E
         YiFuy++ELAxkTYjQTNA64mptyh8cdAmvwWjLn1XLNhtnoSox1O2NJvbyy69VdqTAGjKb
         eVm8av1skdM+t8B2ZFqgtIX2gFw+JTTimKiGXC60RdiAQXlPMv59fsgRPZqcwwNr9dyt
         2RUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=kkLrGisKz+V+xp5zxbkvvos0cYdpZJWSzVhY039IM/I=;
        b=W+dqgwp6bDhUFVCXIdqCDTnQnUFFTsUxJCXTvlcUoS3HfCAAM6H8/0G5CqEK8m+Odg
         nJQ572odhhZzTJxu8xcTSVg1RdWp+/+191sLxZQcVyqFtTjdzDVGvPGxFm0D7HGuh/So
         2pOEM87w1arIP9ArVpoEP+eb88KI8UlxklSpZmMcjdmG110QWdYrvdvFgK1OVl2TmRFa
         PAj9F8ccGUiXyb9Vc8mkhTKueKJFhB94PDaiMq5umaegKZqUrVpCPDGPGK2dLMMVZcNT
         phgQ6mIXsmPmSarTM2RHHUNJ4KBlgERH7JWbyylcQ65gyLH/oDmnXb8foUQR2zKLAWh9
         Qa8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZmZbbEH1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kkLrGisKz+V+xp5zxbkvvos0cYdpZJWSzVhY039IM/I=;
        b=RB6huJMZPCtvBKOHMeXasWDFBHkIPoIGtclfNVvAyKAr5xVnljF2G7YbodRNbyBzmp
         dc6c+SQcD+Ui5EG27vzZSPy5jL/sA6EhW6ycvE2T/pPLbl0EM/ZFb86nw5M7jeE8IUxS
         diZVb4ccOixN7Pn3dGIhN69xuSiboIV74kNP3lmjlfxhicJ+3AincR1L8MsTNht1cDeQ
         NI0HSPof2+B+UOXS3gz1l8q3eF1gkGuxzQotDe2Xt0nK/0k85MH+D10SUcTPoGJpRZsH
         VGcDnmYDB9c/CFEh7BYpHPIoC0WdazWHd8LPuepBRCm4IRubMuyy+pfjtpY8EIB2eTIN
         mN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kkLrGisKz+V+xp5zxbkvvos0cYdpZJWSzVhY039IM/I=;
        b=rdOw1fBtMY6KsFxUygUtfLSnacRJaCxHPLqdz/9h0xJuIvlIFte/CKWJeQWs2w7+O+
         FIzOSeoTOhyjfaKHFNAOqtpHWHyVEinoPaWGwKcyNwtratdoYDQ2KlapnskKe/Xc5Nk4
         Y0NZIn3XrOAR9FMhWefrMIqTHbLecPSaFVftlFx8+ix/P1Xyh49js0pSVkyaLHCODXzV
         0iUrWRkwVSuaF5tigtlpV+gq1w5+5fnmmKcx255qrYRdGSt4P9SAdn9xGXRfF958rwe5
         l92UNpJVUSHgOv4GEdXvKs6hlboRsmyz0K+0ATntBTTOlNDRAVBloLkx1QHPAua+3J68
         uHyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzLHzo0dZMcMNOMwMok4rtU9mLBWI3m4cBD/ExqZnw3ZHx0RFv
	wLLMSZVB1sppFXiIhXW2ZPk=
X-Google-Smtp-Source: APXvYqzkPbhQ0UW5mcon3dttsDkNCZWEKGyOQRAbwk2gngFwlSmZM0uxMc9h88Mp2M1ukjI7Sz0nvw==
X-Received: by 2002:a19:4bc5:: with SMTP id y188mr16927827lfa.24.1557256093292;
        Tue, 07 May 2019 12:08:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:558b:: with SMTP id v11ls1507690lfg.10.gmail; Tue, 07
 May 2019 12:08:12 -0700 (PDT)
X-Received: by 2002:a19:6b03:: with SMTP id d3mr10943700lfa.137.1557256092720;
        Tue, 07 May 2019 12:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557256092; cv=none;
        d=google.com; s=arc-20160816;
        b=HowSYZ9xohu1PKKxraab3TX8f7pPhSLe/wvcbQfjY/BQYVp1YQ+ps0vcz9qjRoL9Bh
         X+69rEJW5uXDQkMuRqgIpTRdxqrZ6/8bqwrAPirksWgiWVtf1mhDFBl1dy6AZ098939I
         kvzEyWVe8fVP34rawbvWTc5rPGns3xg/4b7cgZeC6B+T2Zbijg+lf5TtMFRylqAIDb5e
         1CPINNgBmA3dx0YvRnySMGq2lcjnGWisectaHXiwX8QEeLCSRYPdVv/bSx1IhWuSWi3L
         95H6Xc2uCghvlZthTCMVPqlFcpoXvbSSpXLJP7nzbH7oh1UAClid+tR9Qo4yaDo67+Uk
         RCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=+tBCHe5JKy50+7bA+hrY8Y+rGlcgp0NGoCo4/Ic8O+I=;
        b=IuMCORIy3LMwhzgPBY4nlSvGGT8k/H0SIpOVYOlexNRZJYzxS9RiBHjHL1bH0SJ6a2
         BtDhQzyZUotC4f/Xgha8eAEeZJxPkBKfmJXuKzn8EwlyhKiRKmahIPx4pIwY8n2AR//L
         87xXeEP3uciw4Grh2n5+k2H/iOI2YAXUQreJx5Sd5axL0+Dmg0HIUU0Mwd+9RKtukzzS
         OpF/kMOlsbD517ggq6aCzlsvODRaZY23ewNb9wlZc6/nihTacaLPlDMbXrExgc1/Okeo
         MkXFlN4U2PALEK+1YDQZOwHexgb6+dZxXBiyuNGQUo6pfKFcFRfId3q51rRsNmWdAm0J
         8daA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZmZbbEH1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id p12si409665ljh.5.2019.05.07.12.08.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 44z8JW6LRFzxtD;
	Tue,  7 May 2019 21:08:11 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 May 2019
 21:08:11 +0200
Subject: Re: [PATCH v2 6/7] pyjailhouse: autogenerate pci_cap_ids.py
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
 <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
 <3630dc76-83db-c00f-dfda-7b8459674453@siemens.com>
 <c73157ec-21d5-139f-2a3d-2ce99497e2c0@oth-regensburg.de>
 <e8d06cbf-6916-27b7-1c24-f78de71733a3@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <3f02de5e-af0e-1f03-8698-67aa3f2bb79c@oth-regensburg.de>
Date: Tue, 7 May 2019 21:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8d06cbf-6916-27b7-1c24-f78de71733a3@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ZmZbbEH1;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/7/19 8:42 PM, Jan Kiszka wrote:
> On 07.05.19 20:30, Ralf Ramsauer wrote:
>> On 5/7/19 8:11 PM, Jan Kiszka wrote:
>>> On 07.05.19 00:11, Ralf Ramsauer wrote:
>>>> Convert pci_cap_ids.py to a shell script that should be called with
>>>> cell-config.h.
>>>>
>>>> The script will extract PCI_CAP_IDs with grep & sed, fill the template
>>>> and
>>>> print the generated python file. The Makefile will redirect the output
>>>> to the
>>>> final destination.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> =C2=A0=C2=A0 .gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0=C2=A0 pyjailhouse/pci_cap_ids.py | 67
>>>> --------------------------------------
>>>> =C2=A0=C2=A0 tools/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++--
>>>> =C2=A0=C2=A0 tools/gen_pci_cap_ids.sh=C2=A0=C2=A0 | 58 +++++++++++++++=
++++++++++++++++++
>>>> =C2=A0=C2=A0 4 files changed, 71 insertions(+), 69 deletions(-)
>>>> =C2=A0=C2=A0 delete mode 100644 pyjailhouse/pci_cap_ids.py
>>>> =C2=A0=C2=A0 create mode 100755 tools/gen_pci_cap_ids.sh
>>>>
>>>> diff --git a/.gitignore b/.gitignore
>>>> index 494b9356..678f7436 100644
>>>> --- a/.gitignore
>>>> +++ b/.gitignore
>>>> @@ -19,6 +19,7 @@ include/jailhouse/config.h
>>>> =C2=A0=C2=A0 hypervisor/hypervisor.lds
>>>> =C2=A0=C2=A0 inmates/lib/arm/inmate.lds
>>>> =C2=A0=C2=A0 inmates/lib/arm64/inmate.lds
>>>> +pyjailhouse/pci_cap_ids.py
>>>> =C2=A0=C2=A0 tools/jailhouse
>>>> =C2=A0=C2=A0 tools/jailhouse-gcov-extract
>>>> =C2=A0=C2=A0 tools/jailhouse-config-collect
>>>> diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
>>>> deleted file mode 100644
>>>> index 3b824718..00000000
>>>> --- a/pyjailhouse/pci_cap_ids.py
>>>> +++ /dev/null
>>>> @@ -1,67 +0,0 @@
>>>> -#
>>>> -# Jailhouse, a Linux-based partitioning hypervisor
>>>> -#
>>>> -# Copyright (c) OTH Regensburg, 2019
>>>> -#
>>>> -# Authors:
>>>> -#=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> -#
>>>> -# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0
>>>> See
>>>> -# the COPYING file in the top-level directory.
>>>> -
>>>> -from .extendedenum import ExtendedEnum
>>>> -
>>>> -
>>>> -class PCI_CAP_ID(ExtendedEnum):
>>>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PM'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x01, # Power Management
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VPD'=C2=A0=C2=A0=C2=A0 : =
0x03, # Vital Product Data
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSI'=C2=A0=C2=A0=C2=A0 : =
0x05, # Message Signalled Interrupts
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'HT'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x08, # HyperTransport
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0 : 0x09,=
 # Vendor-Specific
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DBG'=C2=A0=C2=A0=C2=A0 : =
0x0A, # Debug port
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SSVID'=C2=A0 : 0x0D, # Br=
idge subsystem vendor/device ID
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECDEV' : 0x0F, # Secure =
Device
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'EXP'=C2=A0=C2=A0=C2=A0 : =
0x10, # PCI Express
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSIX'=C2=A0=C2=A0 : 0x11,=
 # MSI-X
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SATA'=C2=A0=C2=A0 : 0x12,=
 # SATA Data/Index Conf.
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AF'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x13=C2=A0 # PCI Advanced Features
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>> -
>>>> -
>>>> -class PCI_EXT_CAP_ID(ExtendedEnum):
>>>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ERR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x01, # Advanced Error Reporting
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC'=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 0x02, # Virtual Channel Capability
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DSN'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x03, # Device Serial Number
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PWR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x04, # Power Budgeting
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCLD'=C2=A0=C2=A0=C2=A0 :=
 0x05, # Root Complex Link Declaration
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCILC'=C2=A0=C2=A0 : 0x06=
, # Root Complex Internal Link Control
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCEC'=C2=A0=C2=A0=C2=A0 :=
 0x07, # Root Complex Event Collector
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MFVC'=C2=A0=C2=A0=C2=A0 :=
 0x08, # Multi-Function VC Capability
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC9'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x09, # same as _VC
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCRB'=C2=A0=C2=A0=C2=A0 :=
 0x0A, # Root Complex RB?
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0=C2=A0 :=
 0x0B, # Vendor-Specific
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'CAC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0C, # Config Access - obsolete
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ACS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0D, # Access Control Services
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ARI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0E, # Alternate Routing ID
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ATS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0F, # Address Translation Services
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRIOV'=C2=A0=C2=A0 : 0x10=
, # Single Root I/O Virtualization
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MRIOV'=C2=A0=C2=A0 : 0x11=
, # Multi Root I/O Virtualization
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MCAST'=C2=A0=C2=A0 : 0x12=
, # Multicast
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PRI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x13, # Page Request Interface
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AMD_XXX' : 0x14, # Reserv=
ed for AMD
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'REBAR'=C2=A0=C2=A0 : 0x15=
, # Resizable BAR
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPA'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x16, # Dynamic Power Allocation
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'TPH'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x17, # TPH Requester
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'LTR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x18, # Latency Tolerance Reporting
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECPCI'=C2=A0 : 0x19, # S=
econdary PCIe Capability
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PMUX'=C2=A0=C2=A0=C2=A0 :=
 0x1A, # Protocol Multiplexing
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PASID'=C2=A0=C2=A0 : 0x1B=
, # Process Address Space ID
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1D, # Downstream Port Containment
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'L1SS'=C2=A0=C2=A0=C2=A0 :=
 0x1E, # L1 PM Substates
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PTM'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1F=C2=A0 # Precision Time Measurement
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>
>>> Do we really need this back-and-forth? Why not come up with the
>>> generator directly?
>>
>> Didn't do this on purpose.
>>
>> I don't know if you like the way how I generate the code. Don't even
>> know if I really like it [1]. The split-up makes it easier for me if
>> further changes are required.
>>
>> If the decision is against a generator, then we can simply drop this=C2=
=A0
>> patch.
>>
>> And if we go for the generator, those patches can simply be squashed.
>>
>> =C2=A0=C2=A0 Ralf
>>
>> [1] It's a bash-grep-sed dance to pull out those defines. If we forget
>> about this some day, and do some changes elsewhere, things might
>> silently fail.
>=20
> Not sure what error modes you have in mind here, can you elaborate?

I use regular expressions for pulling out names and values. Generally,
regexes can't parse C preprocessor macros, so it's a hack. But
everything else would be an overkill.

For the regex, I rely on whitespaces as separators. Let's say we do sth.
like

#define PCI_CAP_ID_SOMETHING 1 + 5 /* some cap */

then the regex will fail. We probably won't do this, but it's a
trade-off between maintainability, avoiding redundancy of code and
simplicity.

>=20
> Further remarks on the script:
>=20
>> diff --git a/tools/gen_pci_cap_ids.sh b/tools/gen_pci_cap_ids.sh
>> new file mode 100755
>> index 00000000..c6d71341
>> --- /dev/null
>> +++ b/tools/gen_pci_cap_ids.sh
>> @@ -0,0 +1,58 @@
>> +#!/bin/bash
>> +#
>> +# Jailhouse, a Linux-based partitioning hypervisor
>> +#
>> +# Copyright (c) OTH Regensburg, 2019
>> +#
>> +# Authors:
>> +#=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> +# the COPYING file in the top-level directory.
>> +
>> +CELL_CONFIG_H=3D$1
>> +
>> +function find_defines() {
>> +=C2=A0=C2=A0=C2=A0 header=3D$1
>> +=C2=A0=C2=A0=C2=A0 prefix=3D$2
>> +=C2=A0=C2=A0=C2=A0 search=3D"#define\s\+${prefix}\(\S*\)\s\+\(\S*\).*"
>> +=C2=A0=C2=A0=C2=A0 replace=3D"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 '\1'\t: \2,"
>> +
>> +=C2=A0=C2=A0=C2=A0 grep $prefix $header | sed -e "s/$search/$replace/"
>> +}
>> +
>> +PCI_CAP_IDS=3D$(find_defines $CELL_CONFIG_H PCI_CAP_ID_)
>> +PCI_EXT_CAP_IDS=3D$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
>> +
>> +cat <<END
>> +#
>> +# Jailhouse, a Linux-based partitioning hypervisor
>> +#
>> +# Copyright (c) OTH Regensburg, 2019
>> +#
>> +# Authors:
>> +#=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> +# the COPYING file in the top-level directory.
>=20
> This copyright header for the generated file is overkill - and may even
> become out of sync /wrt the file it pulls from.

Will remove it.

>=20
>> +
>> +# This file is autogenerated. If you need to change it, edit
>> +# tools/gen_pci_cap_ids.py.sh instead.
>> +
>> +from .extendedenum import ExtendedEnum
>> +
>> +
>> +class PCI_CAP_ID(ExtendedEnum):
>> +=C2=A0=C2=A0=C2=A0 _ids =3D {
>> +${PCI_CAP_IDS}
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +
>> +class PCI_EXT_CAP_ID(ExtendedEnum):
>> +=C2=A0=C2=A0=C2=A0 _ids =3D {
>> +${PCI_EXT_CAP_IDS}
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 def __str__(self):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ExtendedEnum.__str__(=
self) + ' | JAILHOUSE_PCI_EXT_CAP'
>=20
> Don't think the __str__ part should go here. It encodes more than just
> the values but a lot about how jailhouse_pci_capability is working.

With this approach, we don't need to differentiate between normal and
extended cap ids in the template.

If it's just about JAILHOUSE_PCI_EXT_CAP inside __str__, then we can
introduce another routine (let's say gen_config()) for both classes.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3f02de5e-af0e-1f03-8698-67aa3f2bb79c%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
