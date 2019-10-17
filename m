Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ64UHWQKGQEEST6AAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAE9DAE89
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 15:36:40 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id j10sf436698lja.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 06:36:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571319400; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z7h+SPmjTvVRVYBtkZvnP+aSgV1gZ8+w/kJysKA8PBXMO++1iaOsrfVvPV+ed9wNlt
         ohADj95ag91cRDv7JsfbF8lozKb9NgPtl/KVnZAcniKSAMv5cBTIWlCaAK1tYT+3lkIU
         ovHKlLkyZIhOALvGGX+PHZXVTopsibKwISsk8jIf4wgzBa+4YAvQAZ3ZGZt2MuVQovpo
         morWInXXxRH87qE+uQwCruwhraSA6guJLT8S+US3kgRR3ZuAGVACGlhyN4u4/g/yjFQG
         6FP3bM+YS99WL2T69rXHHKuJV/UYv1pLJxmN9RvRd1T+/2wRIk/O0rS0J1tET/cUviCU
         Kz6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=4ygeZECEQdpw9ydfRwZySFwDJONG9il5zT8/ywSuoQc=;
        b=H/xViduJoEkfP5TZcVp19DxkhAf5Ayp0dTJxvybcdhglUBsqlW3ksF9KgTpgF+QhQI
         11HRKNOkAJz3E6sLTriD36ikhSTGJ0L+TGvcJSI4CkSpO4Wuw4tB6jWPksR/Yqz9up0c
         I8iv4r/eelolOAtVFropKIhgfocA6tziGx2IYYJcculsShZYaou6C3O26Kg1P+yzqkvY
         gNAVnM4hhYWr5cMhpnm8pSrJZ0DyD46Gk3718kwImD1y5HexYdaKj91gJvlSyTddx33Q
         kPCqk4K43Ya+HevKub8sWorZtnUqZy3tLG3hno/7CfqoQeO+THuI621bnbkVQ+g5WzUg
         Wogg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eW7cr0dh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4ygeZECEQdpw9ydfRwZySFwDJONG9il5zT8/ywSuoQc=;
        b=C1dPNxQVhmv42wdhBqx9fmW13prUGe5k+OZTYT+ss98Z8IPRVDH12hxnj0Uu9f2t95
         o7BFJFjrkFoGn/iGEtvjMfby8Jbbgn4v443QRpNrE9rZuoPs8P7OPpQueTA2EIgRw6T6
         /4U/rPW+OZis85r/ogMnFYQdgqedNQ8H4IYPRx5vnvUIPDDGZppN8+8x4iS375C0f3h5
         IL85QoNuoQ4aEt3Wpf6A7GPHJZacHJt/ocdBblc5l+B0kOOU1h3igj6d5zhWm6CdUuqP
         58/Uf8OPufO/XToS8NaSCAcVL3wj0VUEpYtrq8O9hAKvJO0N/O1SVZP09QLGQHOIHksg
         vjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4ygeZECEQdpw9ydfRwZySFwDJONG9il5zT8/ywSuoQc=;
        b=lRvIIviWoflpS/Kx5gY2g1uXgKEMWNAkQ2TKPnOEzusfo38S/RXBl+X/uU8G28LtQV
         lrzigTN1CdGb7uk/moe9tcKtVCw5wm82tDWodDCZNd430hf81ob+fMiJfiXYRJpHl5v5
         GXtsgDuNnqsImR/auZ3dekNeMPsNurM8zuOUE/y5SrkYBmDvOIbGArexfD0/x1TZfalI
         QKO1jqbAAJfPnkYjCO+l8UQ4iG9yIk4VPq3PND2UvsTo17VazqPTGV0Qx1CKwFtrVsC5
         Gwc24AuN8jNXB5fimFBeGvAFR6tjMt1nxc3y2Gj6/jjo61mae+Ic3jtOJSjC59EOetXd
         bPbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRSPcWmRkDEMq1DyyCvfZ2wKGUr87Z+yF7ll5ZJTjTC13SDpm9
	NuKOlYXTAMy8xlQQHg0CVf4=
X-Google-Smtp-Source: APXvYqxIDbsiQ+uRPAtyTrthpyjYB8Q/pAOKzIzVj2nqLGRkjjWrOTD4/7FgOsZOmSNDqw9UEqtx7A==
X-Received: by 2002:ac2:5507:: with SMTP id j7mr2504861lfk.75.1571319399767;
        Thu, 17 Oct 2019 06:36:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1043:: with SMTP id x3ls291342ljm.14.gmail; Thu, 17
 Oct 2019 06:36:39 -0700 (PDT)
X-Received: by 2002:a2e:9a4c:: with SMTP id k12mr2642687ljj.213.1571319399009;
        Thu, 17 Oct 2019 06:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571319399; cv=none;
        d=google.com; s=arc-20160816;
        b=DZvjK2pM4S7RPAjvq260BXkdJJDnOhjeZhlgL2nSnj5DrZwhV6j3gt9XKMBmUoiNKf
         kDSnGa2RjIAQ4NJGsA0c5n38OZUOfJgFT23ppVBjvPZo6J2w0Un4xo49ENhqzy3sESRT
         cWMT0gK2pyigz0tN0pm9SiOuIGzAOxYetKRcKOyNph5Miu1Kw6uUvRPuY1qXps8xbXxQ
         ANXI+xsTDh5ht1JBihVGjxAfg5XXk6hs4mO4e4T4CNGoQxa0Da36wG02M3f00aKnEgBw
         kDjhVFfoF4z4khnXfaMfUVpmAE1ITb693M2HaXubS8JuBPX9aXtWf5B2JX0CrWHTK4v8
         Q36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=0alJ31WDGoIPHFUS3gYQrxWYdsAhk9TtwteOGUbjEgM=;
        b=b3Rf5hOfgC9Ho1JSh9Y4S7GGElJXRNHzH0hWI91/kUvyNDU6+Li6fMn7xK7TS2oCHN
         kRGKL95/XnhatK5FyelimGmpGZLIML7eNNZ/qqjJUgJmz5X4H8o+A4xr0vF4pzIAyX84
         RudvBpiWlUc1wycfykCL+bbhWYqkL4/1qUCkqatBjaCJauDvQQReLW4WQ4XbxBxWA5o1
         oKZ6RhWqLZyhot5mGIAlITCZ+lP4UX4yvoQzRrRRzLbAjODL5QvpFUhSkGJBSzi7EVlv
         jLHjvhBVKOH1lRy5Vfe7SNJZ9TMZV38o47sl+XHEh+wp/QIT7l/VBayJnKlA0sz5Gcb0
         +Q9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eW7cr0dh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id y6si109521lji.0.2019.10.17.06.36.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 06:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46v9Dj6sYNzyCW;
	Thu, 17 Oct 2019 15:36:37 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 17 Oct
 2019 15:36:37 +0200
Subject: Re: [PATCH v4 12/13] pyjailhouse: x86: implement pio_regions
 generator
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
 <20191015162242.1238940-13-ralf.ramsauer@oth-regensburg.de>
 <db6fdd43-f6f4-62b2-cfe6-d2113b99f74b@st.oth-regensburg.de>
 <f9d5cc63-2232-f18f-88fd-3f2d66e3f746@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <32d4e38a-0ae4-b6a6-61e6-b889d0e7d26d@oth-regensburg.de>
Date: Thu, 17 Oct 2019 15:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <f9d5cc63-2232-f18f-88fd-3f2d66e3f746@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=eW7cr0dh;
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



On 10/17/19 3:18 PM, Jan Kiszka wrote:
> On 15.10.19 18:54, Andrej Utz wrote:
>> Hi Ralf,
>>
>> On 15.10.19 18:22, Ralf Ramsauer wrote:
>>> From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>>
>>> This replaces the former static port list with actual port regions as
>>> listed in
>>> /proc/ioports.
>>>
>>> A whitelist selectively allows access to known ports (if present). PCI
>>> devices
>>> above 0xcff are permitted as well.
>>>
>>> However, not all ports that are in use are listed in ioports, so the
>>> generated
>>> list may still ne further tuning.
>>>
>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>> [ralf: s/permitted/whitelist/, autodetect VGA, whitelist serial,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whitelist PCI devices, amend=
 commit message, improve __str__
>>> methods,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensure pep8 conformity]
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 89 +++++++++++++++++++=
++++++++++++++++
>>> =C2=A0 tools/jailhouse-config-create | 15 +-----
>>> =C2=A0 tools/root-cell-config.c.tmpl | 12 ++---
>>> =C2=A0 3 files changed, 96 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>> index 1d00f364..3cefc2c7 100644
>>> --- a/pyjailhouse/sysfs_parser.py
>>> +++ b/pyjailhouse/sysfs_parser.py
>>> @@ -18,6 +18,7 @@
>>> =C2=A0 # to change the generated C-code.
>>> =C2=A0 =C2=A0 +import re
>>> =C2=A0 import struct
>>> =C2=A0 import os
>>> =C2=A0 import fnmatch
>>> @@ -25,6 +26,7 @@ import fnmatch
>>> =C2=A0 from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
>>> =C2=A0 =C2=A0 root_dir =3D "/"
>>> +bdf_regex =3D re.compile(r'\w{4}:\w{2}:\w{2}\.\w')
>>> =C2=A0 =C2=A0 =C2=A0 def set_root_dir(dir):
>>> @@ -147,6 +149,65 @@ def parse_iomem(pcidevices):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>>> =C2=A0 =C2=A0 +def ioports_search_pci_devices(tree):
>>> +=C2=A0=C2=A0=C2=A0 ret =3D []
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if tree.region and bdf_regex.match(tree.region.type=
str):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret.append(tree.region)
>>> +=C2=A0=C2=A0=C2=A0 else:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for subtree in tree:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 +=3D ioports_search_pci_devices(subtree)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret
>>> +
>>> +
>>> +def parse_ioports():
>>> +=C2=A0=C2=A0=C2=A0 tree =3D IORegionTree.parse_io_file('/proc/ioports'=
, PortRegion)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pm_timer_base =3D tree.find_regions_by_name('ACPI P=
M_TMR')
>>> +=C2=A0=C2=A0=C2=A0 if len(pm_timer_base) !=3D 1:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RuntimeError('Found %=
u entries for ACPI PM_TMR
>>> (expected 1)' %
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 len(pm_timer_base))
>>> +=C2=A0=C2=A0=C2=A0 pm_timer_base =3D pm_timer_base[0].start
>>> +
>>> +=C2=A0=C2=A0=C2=A0 leaves =3D tree.get_leaves()
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Never expose PCI config space ports to the user
>>> +=C2=A0=C2=A0=C2=A0 leaves =3D list(filter(lambda p: p.start !=3D 0xcf8=
, leaves))
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Drop everything above 0xd00
>>> +=C2=A0=C2=A0=C2=A0 leaves =3D list(filter(lambda p: p.start < 0xd00, l=
eaves))
>>> +
>>> +=C2=A0=C2=A0=C2=A0 whitelist =3D [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x40,=C2=A0=C2=A0 # PIT
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x60,=C2=A0=C2=A0 # keyboar=
d
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x61,=C2=A0=C2=A0 # HACK: N=
MI status/control
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x64,=C2=A0=C2=A0 # I8042
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x70,=C2=A0=C2=A0 # RTC
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2f8,=C2=A0 # serial
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x3f8,=C2=A0 # serial
>>
>> I see you added the onboard UARTs to the whitelist. Shouldn't we
>> disallow them if they collide with Jailhouse' own debug port?
>=20
> It's not nice, can generate garbage on the UART, but it's not generally
> invalid to share the ports. We could warn about the sharing, as an
> add-on feature.

Or simply remove the default whitelist of 0x3f8. No other system config
whitelists that port for the root cell at the moment. An user may
uncomment the line on their own.

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
jailhouse-dev/32d4e38a-0ae4-b6a6-61e6-b889d0e7d26d%40oth-regensburg.de.
