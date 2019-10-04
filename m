Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA5Y3XWAKGQEH5KCT3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564ECBDDC
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 16:49:40 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id f63sf1698722wma.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 07:49:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570200580; cv=pass;
        d=google.com; s=arc-20160816;
        b=XZPlbQel8txRRCsOJ06p2faaGPA/E8GsjTgQyu+sgaSdaw/QyNyDbO/TEq7mimtROr
         atNUIJpHh6utdKbgRgfjEDpt+wEuee5eqfc1JmNqeBvYdFTNBbNhSTL0l4xmJL6D9Y/Z
         fLybG15u8ahMTh60i1IJgeqNSOsYjP+2Z2jyrCxvxeOkXK39GhprRoRdNmL5ldv0Ntb2
         UfFf/WXqlh4FUQA6Jy3/3Ogf6wCVaVszYKXhgnTv0hHXk3tzLM22I4t5P/Lz43pVPha6
         3J58Wslh1CPtV2OCuyhphsSUR4bS3bRy57Oa4zwvcGr0jVEodtp6VQZkBpvPy21z9kaR
         oDpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=gf/3w+AxAqsTDNrDE9/EqP99ESN7UARk2hKYye2uFMY=;
        b=An6464pPCSM+cHKELD43GMu1JtVi5EC8p+1HU+usRi90dV8OZ0tb6FJgfLJRhJ1pRx
         mGFvibQICknnQAfLXdGzngNi1u0MhEMumbguqDD0aP76M2Ycp0DE4VyTg3nvmdBj2G60
         GynlOkEyktj+iNUl/epTyrZHac/TmTul5Hsxl7YQK6VECvyVNH8sEhmA9GM3Q+UwIhhA
         3a6jAIXH3su8RIvRUqbPZ+FOOCrqmPp+/f1bGMjxfzdQBImBGrwxSUPRA9vTog7i0Djw
         GiPDwENYNIOlRRtFz1/x691fG8Q5fWcYLZCqzhaypRokFJtNCFBasg4Ria/39L1Pc68C
         BwXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gf/3w+AxAqsTDNrDE9/EqP99ESN7UARk2hKYye2uFMY=;
        b=PJ0KQQd2Je68MZ6UPZUlEdV9HIHa7VaP+z43BXeVYKblkFz9XTTd/HWVfG7UN0czkE
         eDhhwTFa4nwIKwt2kQqvIk06aA718w2PSWE33gC+w8XrFa+XcMgpmLQbDb0tOgcHPWZg
         FW2QQiVKc3bdlsfzHCge0khgpFqnOwjjNQRUmimuDaJEqqUJBRO5UK/NPJHUSqx80ktq
         FzVilpi9JgR9Ku+/YrAirP1zjH7O6tTStA5dyLYlmiBV4PCjckyxN81jyRRd0Lq0MSLN
         bcY4wIvgcTunc3pnomkYpvIeapQ7gLzI2I/P0pL/eMGuyqBLd/wPYVboAnk9NB7RsD3r
         O7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gf/3w+AxAqsTDNrDE9/EqP99ESN7UARk2hKYye2uFMY=;
        b=kxtnxYOn4R6LcG29dFgF6trsmxIzkwXBJvbrYs1j9ZzvCbMAdKtMxHHN3e962IPY42
         3BFsM5wes7yvJ5DbRC19WtW/496CSUQrNpmncNfcAoZRZ0mQk0gDMZ2Ov4qvwG/WHa9r
         hh9tYyWPlbSJEtsPqTq8t7cHFCSjcbOQGGrQNVwhoeoF0Pzkp453PL44pZ/AHZCL4WDc
         UyD9DWH+e5kTfCaJzUi5J8+vIvD3e4/n9LnOXXnY4KrIQcWLQuwKBjTrqf7zcdEFbt5A
         qXjOwzeb5WnUmdXGO3vmcpzw69YuqoQbRLihf2BSsz0UnI0+pUKPUk9XTV+RBBYjcsUH
         YsWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxd9E6ZmcnHFvBPvKq4kQadAf1UHNGv9VbGm7pJVYgIsUtVWRs
	AOALVHmh6zFVtYupU5fS/CY=
X-Google-Smtp-Source: APXvYqyXCEOlcdi/TKeYMVSD7RVd5vBJ5CfRoqeoIf4bvp17IS06P4FvTPKY+Mayf6JZxYQDgyRY+g==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr12203399wrv.248.1570200580219;
        Fri, 04 Oct 2019 07:49:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d9:: with SMTP id f25ls1269572wml.5.gmail; Fri, 04 Oct
 2019 07:49:39 -0700 (PDT)
X-Received: by 2002:a1c:a617:: with SMTP id p23mr4005736wme.166.1570200579391;
        Fri, 04 Oct 2019 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570200579; cv=none;
        d=google.com; s=arc-20160816;
        b=LFcAiRzCEMl1sGfi+K6chP+dVp/r1PTCtIaLiW/EeNYNhcXSExks5XPtCUrN7A/fOO
         D9Ywui8EnxfhW1cJqQHpS2rvemYGvLnn6EjVw+t35jyV3aNh2ZGAZhRjKi0AG9zAf7Ga
         ey9aNig5Cq3x/FLt5uF6kAzdgJbILCuui5R0OJRdTlQGBRVIUs8QZ4OW76/E67p8mjVT
         8bvKK5JGBpD1Mlr1ZdrS7MuAudL9bP7dvOCAIyW0k74uZ1VAZ01yFFHHECG/YkrK8Xre
         63MYaYjV8QWhrVCwwP5qBWOhjxlqwQwpWcxELIjNRfbdypTymEYOJoNeWSMQ7MxNO9hT
         pIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=T5MK2SaPy4HxTfpJvSqM+qTEw2cqvxzV8eZYRcKv5II=;
        b=ym+3ucOzYc7GzZXplfEkacTCGHRIAjUS9j+ZUZ7hdMxee9/iFg6zu6933Bko0fliBY
         pWck3wPT35f8T9z9Fc4jNPZaN7OWIg1aquiclNt6+jhCBgd5HxOmBbk8FGgvYU1c3+0t
         7w94Mjpd+WSQzBUpA+HA1AWeFdgXBD70D9jpBJ+/zozKnBykOa9uhTIKp6bkBSOL+Z2s
         HQYU5uwINlFV6ovg01MGfhEmeKD0zbYlUf9FpsCbhVBvQEH6mLqFIPht4ESjGvow9O56
         fpLycQ9z9lM7vkmKFghAImYzrSwwV0s4xqxqn7cCOhCt6aFKq42g77xHYUEJvSfsKD2t
         2hOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j4si311371wro.5.2019.10.04.07.49.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 07:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x94EncWu020287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Oct 2019 16:49:39 +0200
Received: from [139.25.68.37] (md1wgtfc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x94Enc5b000943;
	Fri, 4 Oct 2019 16:49:38 +0200
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
 <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
 <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
 <48835bb9-5fe5-852b-e538-00c7b6fb6498@oth-regensburg.de>
 <b4b63fc4-87fc-909f-6b96-fe8f413a198c@siemens.com>
 <e9bea12a-1524-6289-db95-f25edc3a3074@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <49c67213-9adf-70d6-6b0b-4e7bc294a5ae@siemens.com>
Date: Fri, 4 Oct 2019 16:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9bea12a-1524-6289-db95-f25edc3a3074@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 04.10.19 16:41, Ralf Ramsauer wrote:
> On 10/4/19 9:15 AM, Jan Kiszka wrote:
>>
>> On 02.10.19 16:14, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 10/1/19 5:34 PM, Jan Kiszka wrote:
>>>> On 01.10.19 17:23, Ralf Ramsauer wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>>>>>> On 30.09.19 21:25, Andrej Utz wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>>>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>>>>>> This patch series eases configuration of port I/O devices for x86
>>>>>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>>>>>> previous
>>>>>>>>> behavior, most entries are disabled (commented out). Only whiteli=
sted
>>>>>>>>> device ports are allowed. This includes the peripheral PCI port
>>>>>>>>> space.
>>>>>>>>
>>>>>>>> Did you also try what explodes when enforcing the generated list? =
I
>>>>>>>> mean, if there is no mess like with hidden memory regions, things
>>>>>>>> just Just Work (TM).
>>>>>>>
>>>>>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>>>>>
>>>>>> We probably need a mixture: white-listing know-harmless thing that a=
re
>>>>>> requested in the legacy range, combined with permitting the PCI
>>>>>> device-related regions.
>>>>>
>>>>> Ack. With a little luck we can rely on entries in /proc/ioports, at
>>>>> least for PCI ports above 0xd00.
>>>>>
>>>>> I just compared lspci vs. ioports on some machines: Looks like ioport=
s
>>>>> contains everything that can be found in PCI config space. But ioport=
s
>>>>> contains even more.
>>>>>
>>>>> What are those pnp entries good for? E.g.:
>>>>>   =C2=A0=C2=A0 f800-f87f : pnp 00:01
>>>>>   =C2=A0=C2=A0 f880-f8ff : pnp 00:01
>>>>>   =C2=A0=C2=A0 [...]
>>>>>
>>>>> Are these reserved areas for PCI devices?
>>>>
>>>> pnp, ACPI, some further platform resources.
>>>
>>> Will the root cell touch those ports? So far, it looks like it doesn't.
>>>
>>>>
>>>>>
>>>>> And on my laptop, I can also find ACPI stuff above 0xd00:
>>>>>
>>>>> 0d00-ffff : PCI Bus 0000:00
>>>>>   =C2=A0=C2=A0 1640-164f : pnp 00:01
>>>>>   =C2=A0=C2=A0 1800-187f : pnp 00:01
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1800-1803 : ACPI PM1a_EVT_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1804-1805 : ACPI PM1a_CNT_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1808-180b : ACPI PM_TMR
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1820-182f : ACPI GPE0_BLK
>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0 1850-1850 : ACPI PM2_CNT_BLK
>>>>>
>>>>> How should we deal with that?
>>>>
>>>> PM_TMR is passed through anyway, at least to non-root cells. The rest =
is
>>>> more dangerous, potentially. But a "works by default" setting may have
>>>> to include them.
>>>>
>>>>>
>>>>> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn'=
t
>>>>> VGA be listed in ioports if present? At least for qemu that's the cas=
e.
>>>>> If we can rely on that, then we wouldn't even have to whitelist VGA. =
[1]
>>>>
>>>> Yes. VGA, if it shall be with the root cell (common case), should be
>>>> listed.
>>>
>>> Alright.
>>>
>>> So here you can find a WIP version of this series that comes with
>>> support for selective whitelisting PCI devices:
>>>
>>> https://github.com/lfd/jailhouse/tree/ioports-ralf-v2
>>>
>>> So far, I successfully tested this approach on Qemu and on a real
>>> machine. No crashes so far. (which I didn't expect, to be honest ;-) )
>>>
>>> Jan, could you please test this approach? Just run it on your local
>>> machine, look at the output, and compare it with /proc/ioports. If this
>>> is the way to go, I'll make a clean series out of it. The head commit i=
s
>>> probably the most interesting one.
>>>
>>
>> Something is broken:
>>
>> $ jailhouse config create config.c
>> Traceback (most recent call last):
>>    File "~/jailhouse/tools/jailhouse-config-create", line 260, in <modul=
e>
>>      mem_regions, dmar_regions =3D sysfs_parser.parse_iomem(pcidevices)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 102, in=
 parse_iomem
>>      tree =3D IORegionTree.parse_io_file('/proc/iomem', MemRegion)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 976, in=
 parse_io_file
>>      level, r =3D IORegionTree.parse_io_line(line, TargetClass)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 967, in=
 parse_io_line
>>      return level, TargetClass(int(region[0], 16), int(region[1], 16), t=
ype)
>>    File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 869, in=
 __init__
>>      super(MemRegion, self).__init__(start, stop, typestr)
>> TypeError: super() argument 1 must be type, not classobj
>=20
> Argh, seems that's a python2 compat issue, doesn't happen with python3.
> Please pull again, should be fixed now.
>=20
> BTW: How should we deal with python2 in the future? It's (finally) EOL
> in ~2 months.

It's EOL when distro versions supporting it are EOL. So, maybe another 5 ye=
ars?=20
If not more.

That said, I'm in general fine with nailing down to python3. We should star=
t=20
with identifying the spots that can be removed then.

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
jailhouse-dev/49c67213-9adf-70d6-6b0b-4e7bc294a5ae%40siemens.com.
