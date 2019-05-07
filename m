Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNFDY7TAKGQEUSDYPZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D116A99
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 20:43:01 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id b85sf2546244wme.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 11:43:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557254580; cv=pass;
        d=google.com; s=arc-20160816;
        b=O44DT+Rep/BTxDovDfh3vgYurBuzR+UQ6fNuM3CfshvEftZUp3nSd0vXIWLBilAOBF
         Ud9eHjIfh6Nos83Wd4X8baA6QFKTw5yv/4BjF7Z9uGaCJOEQsQxHw4dPUviAOzmT5TSD
         piOKulofe+pfN5j38iYi75DQym3zn4A5iT4LyEsMp5U0eTHadHOntk5UI6eiLkI3I42O
         wyNpxiRNn/AQoYTjRNc9t8n0KNkzUnXdeA0gSY8B4YR0IXDQKo8fVGxGwHKqbKNRgg0h
         P5twSFJW4ZcHl4FbPN+utLzgURUPmLIapMRzq/Y+iQ8BvQsa4EaiE65VSf/m/3Senluk
         QfxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=izlyAYBzJgbHcUfuRJJ9njyz+xcIC5EYmcSQgWOYxJw=;
        b=ZHkTHCCSZoK4BP2YYruTy3ysR/ZP+kgcvxQqM8hTM8pN2WxebX9V1nxUO5kksNya0q
         PZ3inxy7mbZrgmWte5TboGSjUGF7x5IT9BnxSkiqQGqw2tSnDfCOQSHDZrstU+UYw8eD
         iu3E9Aw9K616ek2neG99uRt5BCb2Jn/FyvgkqxvgTWpVOYxguxfiWAtZSZuWQTJpQHJs
         kuFimtEZxKiQeG6G/9MvkOLQJSCLFrp6eq27sygl6gWDgsvZU7qqTsDFeZt19YdsplPL
         9LNQPVBkoudJgUV3SEbp1Qh3gw9IT9n/tcOrWz5HOBehDdOCASWU47TwdRXoWx6e+DUl
         hCgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=izlyAYBzJgbHcUfuRJJ9njyz+xcIC5EYmcSQgWOYxJw=;
        b=rjfdjrg/uB8raiMkmlVJmGEkhWa8LvKJtz7ra0S0tYneU9y14v2EnTuOB4Iz1JhB2b
         oLZGPD2aaG1KKykUMOdouh55+IfFX3rEGzfBOZAhPzDgqjGLQp7JVveZf6WgKbW58FjG
         kzkt1+2jtobEe9gJEtfS7KWBiTfpUu1BquTjZiGMViThSp6LQnuKWqttJ9GOTEVODuu8
         edfJhPgqptGD8vKbzch2COpkHsxXTsoJKW4t5a2xOae5O/DPaPWLIadxQ4iPp+2ln1dD
         DkDr6AINXNvq/rXfWVxQ8FHkM4OW7kkym0z1MqN/agLP5YJ2+yln3qMrZPMJ2B6+Cd/Q
         Rcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=izlyAYBzJgbHcUfuRJJ9njyz+xcIC5EYmcSQgWOYxJw=;
        b=ZYcrhJyqxK1G8FlZ19sYoPG7n2Bm56QKSiWXSWgXu8nj68Bm49j+xrX+3gLb9QT9v+
         XhCjGeqtQiUhdJBYVz8Al4dSJb8khmbPbA4FXQVrin/FUd1IqfhKKeFE4Fu+h9oqiDGY
         DQ/Q8zRKR8hsG176X6TLulubqbzxKCZwc3hdRrKQTvzwJ7qZoMPYkj0gVY84JjXj3CQI
         9lS6Q3NzvSJNAJ0BmPJuTt9z6erj3m57Ii9gTyjdDs+hnjZadsiBQ7vdWU4MVCiwwyRt
         tVhOOOzZS4HT05fTH2UKLy51jwsh+uWIwDHABCH/fGbwdmus4uE+am7pywA5yip4tgP9
         BJaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXpG9gBNaLEoFx88dWegwRqAbJTE6kLMm8sEd8bmduaFmbqKRPk
	MLJ84pkj3yHNFKG5pi9liEk=
X-Google-Smtp-Source: APXvYqykgBYsS5shG/dUoExopoVEMTfggQsMWJ/H9FKE6rpUszFIXLUlDshVWSCo61ZD+ZYPUtVcZw==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr22934870wrq.23.1557254580680;
        Tue, 07 May 2019 11:43:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db81:: with SMTP id u1ls4207185wri.14.gmail; Tue, 07 May
 2019 11:42:59 -0700 (PDT)
X-Received: by 2002:adf:df85:: with SMTP id z5mr17794391wrl.127.1557254579291;
        Tue, 07 May 2019 11:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557254579; cv=none;
        d=google.com; s=arc-20160816;
        b=rogoTcgTefs4xA2lo3a0XmqaZhtcqa5h/gprWOF9pJD8mvTu5MOghpZoW13/ChQYRo
         CXhY3T0OPWpfTS8uBbScdmTr7K9XQAaFMiveadEPF1oGosmtMs6E5LUeJ/NKMy8+GXX4
         6PayE0l9CKbNptkAT2XDyA2vuumwXlYoiCoYO1FlJme4ToHpZfVgq/2v3Tt4rXp6m3iq
         lAccsMqUnEv67oTgzy3lM2GfTd2mPCw887RsZ1F24ZVfIuKD/P50t0+bvogAAvNhuQ9L
         lD2AUHFIFfShk2nfaeGu67bx6yL9dzY4L1h77ZSSbUJljHsMVB5GHVzIRdWns5HkNBjA
         aYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=RnW8AmkX2FFfR16ZSndWFGAIh42UNlHt7pZbTXEjAPY=;
        b=Redym472vC9C0mQlb7kP/MHT0xV7oPkgcJYvPcOmzWkivcHn5yFeK1x/OQ2N4ARZZm
         xp6+4MongDrQNrsf4dzrUMf7alJ26ZbACTRwBs8WgOsi0Qr7DRey/eqX6R9QuEiA9Y86
         ZNAZ+7KBkSqrOVVlOu5R2kZ1dCCNzjrfyVO7cYNCzxmoYmWjcVqHvyfTWxkTMin6naEF
         A+KhGexYB45itunJeCPZaDtT79jn7d9U2z66ki1DLvaVQkDbBOC7a+hf7bA9YXLxroih
         WYpiNRs0aeJMgQkez8zDljAJfHSdq1AF1KKB9cCXi7b4WkFAaxgzA98NG25sDX1kOW4/
         B86Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z70si10945wmc.2.2019.05.07.11.42.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x47IgwK8021767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 20:42:58 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x47IgwAw018939;
	Tue, 7 May 2019 20:42:58 +0200
Subject: Re: [PATCH v2 6/7] pyjailhouse: autogenerate pci_cap_ids.py
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
 <20190506221110.19495-7-ralf.ramsauer@oth-regensburg.de>
 <3630dc76-83db-c00f-dfda-7b8459674453@siemens.com>
 <c73157ec-21d5-139f-2a3d-2ce99497e2c0@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e8d06cbf-6916-27b7-1c24-f78de71733a3@siemens.com>
Date: Tue, 7 May 2019 20:42:58 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c73157ec-21d5-139f-2a3d-2ce99497e2c0@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 07.05.19 20:30, Ralf Ramsauer wrote:
> On 5/7/19 8:11 PM, Jan Kiszka wrote:
>> On 07.05.19 00:11, Ralf Ramsauer wrote:
>>> Convert pci_cap_ids.py to a shell script that should be called with
>>> cell-config.h.
>>>
>>> The script will extract PCI_CAP_IDs with grep & sed, fill the template
>>> and
>>> print the generated python file. The Makefile will redirect the output
>>> to the
>>> final destination.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 .gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>  =C2=A0 pyjailhouse/pci_cap_ids.py | 67 -------------------------------=
-------
>>>  =C2=A0 tools/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++--
>>>  =C2=A0 tools/gen_pci_cap_ids.sh=C2=A0=C2=A0 | 58 +++++++++++++++++++++=
++++++++++++
>>>  =C2=A0 4 files changed, 71 insertions(+), 69 deletions(-)
>>>  =C2=A0 delete mode 100644 pyjailhouse/pci_cap_ids.py
>>>  =C2=A0 create mode 100755 tools/gen_pci_cap_ids.sh
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index 494b9356..678f7436 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -19,6 +19,7 @@ include/jailhouse/config.h
>>>  =C2=A0 hypervisor/hypervisor.lds
>>>  =C2=A0 inmates/lib/arm/inmate.lds
>>>  =C2=A0 inmates/lib/arm64/inmate.lds
>>> +pyjailhouse/pci_cap_ids.py
>>>  =C2=A0 tools/jailhouse
>>>  =C2=A0 tools/jailhouse-gcov-extract
>>>  =C2=A0 tools/jailhouse-config-collect
>>> diff --git a/pyjailhouse/pci_cap_ids.py b/pyjailhouse/pci_cap_ids.py
>>> deleted file mode 100644
>>> index 3b824718..00000000
>>> --- a/pyjailhouse/pci_cap_ids.py
>>> +++ /dev/null
>>> @@ -1,67 +0,0 @@
>>> -#
>>> -# Jailhouse, a Linux-based partitioning hypervisor
>>> -#
>>> -# Copyright (c) OTH Regensburg, 2019
>>> -#
>>> -# Authors:
>>> -#=C2=A0 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> -#
>>> -# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>>> -# the COPYING file in the top-level directory.
>>> -
>>> -from .extendedenum import ExtendedEnum
>>> -
>>> -
>>> -class PCI_CAP_ID(ExtendedEnum):
>>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PM'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x01, # Power Management
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VPD'=C2=A0=C2=A0=C2=A0 : 0=
x03, # Vital Product Data
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSI'=C2=A0=C2=A0=C2=A0 : 0=
x05, # Message Signalled Interrupts
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'HT'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x08, # HyperTransport
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0 : 0x09, =
# Vendor-Specific
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DBG'=C2=A0=C2=A0=C2=A0 : 0=
x0A, # Debug port
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SSVID'=C2=A0 : 0x0D, # Bri=
dge subsystem vendor/device ID
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECDEV' : 0x0F, # Secure D=
evice
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'EXP'=C2=A0=C2=A0=C2=A0 : 0=
x10, # PCI Express
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MSIX'=C2=A0=C2=A0 : 0x11, =
# MSI-X
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SATA'=C2=A0=C2=A0 : 0x12, =
# SATA Data/Index Conf.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AF'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x13=C2=A0 # PCI Advanced Features
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -
>>> -
>>> -class PCI_EXT_CAP_ID(ExtendedEnum):
>>> -=C2=A0=C2=A0=C2=A0 _ids =3D {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ERR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x01, # Advanced Error Reporting
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC'=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 0x02, # Virtual Channel Capability
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DSN'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x03, # Device Serial Number
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PWR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x04, # Power Budgeting
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCLD'=C2=A0=C2=A0=C2=A0 : =
0x05, # Root Complex Link Declaration
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCILC'=C2=A0=C2=A0 : 0x06,=
 # Root Complex Internal Link Control
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCEC'=C2=A0=C2=A0=C2=A0 : =
0x07, # Root Complex Event Collector
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MFVC'=C2=A0=C2=A0=C2=A0 : =
0x08, # Multi-Function VC Capability
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VC9'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x09, # same as _VC
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RCRB'=C2=A0=C2=A0=C2=A0 : =
0x0A, # Root Complex RB?
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'VNDR'=C2=A0=C2=A0=C2=A0 : =
0x0B, # Vendor-Specific
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'CAC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0C, # Config Access - obsolete
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ACS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0D, # Access Control Services
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ARI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0E, # Alternate Routing ID
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ATS'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x0F, # Address Translation Services
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SRIOV'=C2=A0=C2=A0 : 0x10,=
 # Single Root I/O Virtualization
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MRIOV'=C2=A0=C2=A0 : 0x11,=
 # Multi Root I/O Virtualization
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MCAST'=C2=A0=C2=A0 : 0x12,=
 # Multicast
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PRI'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x13, # Page Request Interface
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'AMD_XXX' : 0x14, # Reserve=
d for AMD
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'REBAR'=C2=A0=C2=A0 : 0x15,=
 # Resizable BAR
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPA'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x16, # Dynamic Power Allocation
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'TPH'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x17, # TPH Requester
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'LTR'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x18, # Latency Tolerance Reporting
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'SECPCI'=C2=A0 : 0x19, # Se=
condary PCIe Capability
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PMUX'=C2=A0=C2=A0=C2=A0 : =
0x1A, # Protocol Multiplexing
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PASID'=C2=A0=C2=A0 : 0x1B,=
 # Process Address Space ID
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'DPC'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1D, # Downstream Port Containment
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'L1SS'=C2=A0=C2=A0=C2=A0 : =
0x1E, # L1 PM Substates
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PTM'=C2=A0=C2=A0=C2=A0=C2=
=A0 : 0x1F=C2=A0 # Precision Time Measurement
>>> -=C2=A0=C2=A0=C2=A0 }
>>
>> Do we really need this back-and-forth? Why not come up with the
>> generator directly?
>=20
> Didn't do this on purpose.
>=20
> I don't know if you like the way how I generate the code. Don't even
> know if I really like it [1]. The split-up makes it easier for me if
> further changes are required.
>=20
> If the decision is against a generator, then we can simply drop this  pat=
ch.
>=20
> And if we go for the generator, those patches can simply be squashed.
>=20
>    Ralf
>=20
> [1] It's a bash-grep-sed dance to pull out those defines. If we forget
> about this some day, and do some changes elsewhere, things might
> silently fail.

Not sure what error modes you have in mind here, can you elaborate?

Further remarks on the script:

> diff --git a/tools/gen_pci_cap_ids.sh b/tools/gen_pci_cap_ids.sh
> new file mode 100755
> index 00000000..c6d71341
> --- /dev/null
> +++ b/tools/gen_pci_cap_ids.sh
> @@ -0,0 +1,58 @@
> +#!/bin/bash
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) OTH Regensburg, 2019
> +#
> +# Authors:
> +#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +
> +CELL_CONFIG_H=3D$1
> +
> +function find_defines() {
> +	header=3D$1
> +	prefix=3D$2
> +	search=3D"#define\s\+${prefix}\(\S*\)\s\+\(\S*\).*"
> +	replace=3D"        '\1'\t: \2,"
> +
> +	grep $prefix $header | sed -e "s/$search/$replace/"
> +}
> +
> +PCI_CAP_IDS=3D$(find_defines $CELL_CONFIG_H PCI_CAP_ID_)
> +PCI_EXT_CAP_IDS=3D$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
> +
> +cat <<END
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) OTH Regensburg, 2019
> +#
> +# Authors:
> +#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.

This copyright header for the generated file is overkill - and may even bec=
ome=20
out of sync /wrt the file it pulls from.

> +
> +# This file is autogenerated. If you need to change it, edit
> +# tools/gen_pci_cap_ids.py.sh instead.
> +
> +from .extendedenum import ExtendedEnum
> +
> +
> +class PCI_CAP_ID(ExtendedEnum):
> +    _ids =3D {
> +${PCI_CAP_IDS}
> +    }
> +
> +
> +class PCI_EXT_CAP_ID(ExtendedEnum):
> +    _ids =3D {
> +${PCI_EXT_CAP_IDS}
> +    }
> +
> +    def __str__(self):
> +        return ExtendedEnum.__str__(self) + ' | JAILHOUSE_PCI_EXT_CAP'

Don't think the __str__ part should go here. It encodes more than just the=
=20
values but a lot about how jailhouse_pci_capability is working.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e8d06cbf-6916-27b7-1c24-f78de71733a3%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
