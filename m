Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHOUUHWQKGQEOAY3HMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E7DAE15
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 15:18:22 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id 7sf948647wrl.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 06:18:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571318301; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jjljqwm45DcGD5cqbEekScg7Oj4ysZM42lz+9kwNVfTNLNNqmHtOaqrv73Qs6b8b59
         4b2c32GdHUO7xRw9pxNzLlWEIWUNoJgIU+1tXEi6gSWFB+erCr+hp+2McaqRh/O7M5uo
         wnnomXqyMKbkQvl3zxww7dJaUWnKgspQbUsmwBzQihXZJDLemyCH7aQWr4AVIhutIDnz
         2W9PCASdxYvKjB8ZhfeZ7+92yzwWsgA1WwpDQ4RfQh5rIJRpf4MuXcyJ9tf5K3DcGHNZ
         lRtgRbDZbirqOXWK9yqNcV4qIzfHpueE+AHVBAd38EscGQwdOJCIUUWjjqk/PBNTeB2w
         ZaBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=dG3LRUqiOcIadXc0mSmBt5+sAY0ur65ttrhrmMeZGnY=;
        b=qizBSRFk3MDJO0dJmkizt5auKheVSHTe9GhK1FLNv1oDwcZykA8qcudm4i2LfPSKSf
         HkKWzxHJGHFyknMZ6KQOYXREur7VEaF8kaeDnSOj8c/wE5I+3uJ781zVvr5KS3X6ls7X
         NJaNQBuwhc6kNi1xnTuq/HJYqn/LwKejxFD6PkoQ3rfCyy1HMRUWmBvGjwWVZIEfoR9S
         Sf+BZS/+e4bau2YvZ8yS8G4unQ1DGe5UaUmXsQPmK3p1sesxI8zUJok4xeGjxYWfxIJ5
         fQIXropf80y0yY+DP96PAHY+8/zPX/rnTVLzXQA9DhM9e+L2VOvsrHDuKYJHDzaweqkm
         LAdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dG3LRUqiOcIadXc0mSmBt5+sAY0ur65ttrhrmMeZGnY=;
        b=I7LmfqAgDJqM8Zaw88Yi4Zl9MpSD+EIAv2bRIZh9ZitwDxXMkyLzcCN2o68MCvrqZt
         GySHPCgPrbuXKxGQz2KgQJxjK75EJ8wp3IY4mzo8Bt7XXeMtZGUjKre067tgwH8LUiuD
         tWdV3ERb6VTWvazAdfWic0Q+CJUhm99f9q1Kryg+Rwfd61/CfdEUTO+Atjw5pLfmeaJd
         Psdb6dPhIwqXBUs57d+qgH6wdxgBvpkG8A3pdRrX0qYRLC12lPL1gHAEkVK65RgY4jCD
         3upJCUq3vfJplXc/fTDOEVbd6RiRdm+NxNXpZ0XTV3eVQqEU3qvF8vU20Qm7b5KyFwpz
         ejCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dG3LRUqiOcIadXc0mSmBt5+sAY0ur65ttrhrmMeZGnY=;
        b=Jt7MKX+oPILDk/zAkBntY3idt4YiZGE/BjDWN3U9MOXK2Qcgd80xwRdpab0UQHZBkt
         16JBSCbwnIH/ahtFpQPKGTDCrtVSbLHGREQjJJOQI7cQA2kucJmo2aIgsK7mH2xyQuSE
         iUaqdDWtaUki6TmTzkj7h3ZygPAH0yHohP2m7KN3H5Ah324729kuFWUGgenIM5EAAoLK
         aG8Xr/3McGU2d+dXNRf3BA29ol2bMwwlEmMDaNCzG1Z5JHwt5/Li4gpOj+4O+0k1vZWh
         PIqH8JObk4aiL4Wdk8MPujRVMurw5FhI9RJ79xAs1DGHrAaJ7O7HCYqYi0AwMtgnjb+U
         wHGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUh0C+5J3yH9ws5FuGQW2B0w1vAlGohnE5Tf6QUVpOrqZj0aPL1
	78k502nSpQeKdtiVkIjqSIU=
X-Google-Smtp-Source: APXvYqyYEbR1wjahMtzk3SzUa9UD6u9oufnv1DxUlDtOfS6s48DnpBvtlhwIklWUDrhpfhjI7HNgcg==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr3140051wrl.356.1571318301834;
        Thu, 17 Oct 2019 06:18:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9c90:: with SMTP id d16ls992596wre.14.gmail; Thu, 17 Oct
 2019 06:18:20 -0700 (PDT)
X-Received: by 2002:adf:e401:: with SMTP id g1mr1134704wrm.211.1571318300875;
        Thu, 17 Oct 2019 06:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571318300; cv=none;
        d=google.com; s=arc-20160816;
        b=cH1OLFbgrGtkSK4ZedwRGlY+3V03WT8dyG9VkExqwh/GzQU2Z3pqQRMAz90ZnTxqIj
         Mw2umHslmUU3SGZ5FRTmLmxzOCfuOgKYyNbyfG/E8DvPMILHQyx4gf8WwHHxk7bDgDUR
         xDrOPlAM21gav5cp2sYVXz9cRVhUIehwHwfPycuCeyHHJyr5HLSyYYY8gwdTv3HmG9os
         Tqsc9Wy4BrDUJYFvc9lxxjiEb5PQQ16o9adv0KlbW/kJjvbK3XEkKOev4dJzrydb/XQz
         UzpMocEqgsXtUb/Cf9t92Iv8YO+nR2qTVJZ/pJ8cnOCodBD9frJGLhtmrn+lI7W7dQ3I
         hYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ne5Z3MGxA7OZY9rSdxBjn47uwz9U7eEEeY9wWJjTzH4=;
        b=1K4iadB9Bg4AeowBHsrls30IFJeI/uPIVuV628TQO9hdYJH6K8GcbLIyt1xzH+apxE
         CXkLRilt2QQpJ3JozQuuE+FmIfIvSj6YT7Po/QXetXeAYGLA7h2O4CQNqYDs4hTpss23
         0SR7OjAt59XUIODTxVP+WinMB8+FUxvPRhKiz9QWUlRU4Kg90kbiyGBudMcAQ64ToUH3
         GMUM57cXQG6Sjb6uLVm0K+0pKX0w6Z381fsU8Nb/7rlDNzCD2NvpXAS3Me3NbgNLR9mD
         te9M/SXRLoopx0hT9qbQEETP4vxP4M19XJGoki1MaGxRM58KRrjNk+UFU0GAUnVdPOSr
         RVOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o10si158802wrm.5.2019.10.17.06.18.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 06:18:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9HDIKT2017614
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Oct 2019 15:18:20 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9HDIKAb032096;
	Thu, 17 Oct 2019 15:18:20 +0200
Subject: Re: [PATCH v4 12/13] pyjailhouse: x86: implement pio_regions
 generator
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
 <20191015162242.1238940-13-ralf.ramsauer@oth-regensburg.de>
 <db6fdd43-f6f4-62b2-cfe6-d2113b99f74b@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f9d5cc63-2232-f18f-88fd-3f2d66e3f746@siemens.com>
Date: Thu, 17 Oct 2019 15:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <db6fdd43-f6f4-62b2-cfe6-d2113b99f74b@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 15.10.19 18:54, Andrej Utz wrote:
> Hi Ralf,
>=20
> On 15.10.19 18:22, Ralf Ramsauer wrote:
>> From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>
>> This replaces the former static port list with actual port regions as
>> listed in
>> /proc/ioports.
>>
>> A whitelist selectively allows access to known ports (if present). PCI
>> devices
>> above 0xcff are permitted as well.
>>
>> However, not all ports that are in use are listed in ioports, so the
>> generated
>> list may still ne further tuning.
>>
>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>> [ralf: s/permitted/whitelist/, autodetect VGA, whitelist serial,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whitelist PCI devices, amend =
commit message, improve __str__
>> methods,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ensure pep8 conformity]
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 89 ++++++++++++++++++++=
+++++++++++++++
>> =C2=A0 tools/jailhouse-config-create | 15 +-----
>> =C2=A0 tools/root-cell-config.c.tmpl | 12 ++---
>> =C2=A0 3 files changed, 96 insertions(+), 20 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 1d00f364..3cefc2c7 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -18,6 +18,7 @@
>> =C2=A0 # to change the generated C-code.
>> =C2=A0 =C2=A0 +import re
>> =C2=A0 import struct
>> =C2=A0 import os
>> =C2=A0 import fnmatch
>> @@ -25,6 +26,7 @@ import fnmatch
>> =C2=A0 from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
>> =C2=A0 =C2=A0 root_dir =3D "/"
>> +bdf_regex =3D re.compile(r'\w{4}:\w{2}:\w{2}\.\w')
>> =C2=A0 =C2=A0 =C2=A0 def set_root_dir(dir):
>> @@ -147,6 +149,65 @@ def parse_iomem(pcidevices):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>> =C2=A0 =C2=A0 +def ioports_search_pci_devices(tree):
>> +=C2=A0=C2=A0=C2=A0 ret =3D []
>> +
>> +=C2=A0=C2=A0=C2=A0 if tree.region and bdf_regex.match(tree.region.types=
tr):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret.append(tree.region)
>> +=C2=A0=C2=A0=C2=A0 else:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for subtree in tree:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
+=3D ioports_search_pci_devices(subtree)
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret
>> +
>> +
>> +def parse_ioports():
>> +=C2=A0=C2=A0=C2=A0 tree =3D IORegionTree.parse_io_file('/proc/ioports',=
 PortRegion)
>> +
>> +=C2=A0=C2=A0=C2=A0 pm_timer_base =3D tree.find_regions_by_name('ACPI PM=
_TMR')
>> +=C2=A0=C2=A0=C2=A0 if len(pm_timer_base) !=3D 1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise RuntimeError('Found %u=
 entries for ACPI PM_TMR
>> (expected 1)' %
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 len(pm_timer_base))
>> +=C2=A0=C2=A0=C2=A0 pm_timer_base =3D pm_timer_base[0].start
>> +
>> +=C2=A0=C2=A0=C2=A0 leaves =3D tree.get_leaves()
>> +
>> +=C2=A0=C2=A0=C2=A0 # Never expose PCI config space ports to the user
>> +=C2=A0=C2=A0=C2=A0 leaves =3D list(filter(lambda p: p.start !=3D 0xcf8,=
 leaves))
>> +
>> +=C2=A0=C2=A0=C2=A0 # Drop everything above 0xd00
>> +=C2=A0=C2=A0=C2=A0 leaves =3D list(filter(lambda p: p.start < 0xd00, le=
aves))
>> +
>> +=C2=A0=C2=A0=C2=A0 whitelist =3D [
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x40,=C2=A0=C2=A0 # PIT
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x60,=C2=A0=C2=A0 # keyboard
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x61,=C2=A0=C2=A0 # HACK: NM=
I status/control
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x64,=C2=A0=C2=A0 # I8042
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x70,=C2=A0=C2=A0 # RTC
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x2f8,=C2=A0 # serial
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x3f8,=C2=A0 # serial
>=20
> I see you added the onboard UARTs to the whitelist. Shouldn't we
> disallow them if they collide with Jailhouse' own debug port?

It's not nice, can generate garbage on the UART, but it's not generally
invalid to share the ports. We could warn about the sharing, as an
add-on feature.

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
jailhouse-dev/f9d5cc63-2232-f18f-88fd-3f2d66e3f746%40siemens.com.
