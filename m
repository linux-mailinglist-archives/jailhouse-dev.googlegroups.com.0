Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNVU3XWAKGQEUEDZIFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DECBD97
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 16:41:59 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id a14sf727924lfk.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 07:41:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570200119; cv=pass;
        d=google.com; s=arc-20160816;
        b=JcAKUDAQky6O8SD+0nrHMVANxPh2O4j1AxMlXuDF2ayA2ooK/0TephvNpvYgxLjXIR
         we32fzCv86l+38p55VmV4RN4fgzbdFS3xUNgeOoqxPeV0Btijbq+48kyT3dKokWNvkqB
         S4BmLmPXdf01rdWa/z54rJpXiD7jJv1pAOKNLSf/1d4hzR5uE2HZdyD/SD1baUGsTLli
         baZRRamf6vTpFc/oh74X0YJwgDvzIhE6TTkOLE56Nt9XarK73UZbGm3g8GDzqXVJDYKR
         TuaxKDRfocr0u+B8vFoeguXP1aCMrtesLCarYKwN8YfYky3Wo67N3Fqrdi+jizQvu6We
         U8SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:to:sender
         :dkim-signature;
        bh=Cy3mKohVHdUUnpIprTy2L5ZO9cvfOQdp15cI30d2/x0=;
        b=HiGgL2Rq44o3mpiPjt8niNlSzEK6Lg7zNexgILTwn0cXMjAGdH36dqAU2RwC+GDMXp
         nBcr9Ru8ljG6xJsrIsBYv/8aWXEsbItgLkU/84za0ISOn60dnVlFNaW+foNKTyO0Uq7Y
         S6Bd83DPOp/iCeY3rOJwlfd5GAFJCcHl7i2RgM2XVhYrPXIJrCg2AsGNF9GZpNQO2OzZ
         UtlgGE1Fx3as5FSfOcQ8dOAQ+TASc/x23/Xtr96jVGHaohwuQBgAmvVQbePVxdImy98r
         HJwgnjMrdcSnrl76/vU/3AaSr34aSADjG040eD+c0vEzGcldPRnmvlmetiTHILjgPjEO
         I0yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EMqsf6W2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cy3mKohVHdUUnpIprTy2L5ZO9cvfOQdp15cI30d2/x0=;
        b=h+2Odw7PRtkSL3lGA+ChESGNTC/xi3Xu82K5nj991W/fLIigf9aUFjmm5j/A2MfPic
         UX+MS1w0cJ7yUaAM3CIUZ0vGG7InAmxGW8yVekwfVkqPYeX8Trlqt8YuVk1X2DVtotr8
         Ih+rUkmTWE+k3ja+4RypH3dMpuul6MHQZj6WEoWx5hFMtHZKbGT9joSe/9Y7PWBFku8K
         fjy2dw2In+OHKipit+8qMrblA3Jv074y2tC8W61G3atIQdO/2/W9y4nQYN5/c6p6Z0qz
         Pns195iLNo08MH75D/Iq6EdTFZdpynYajsmHv2ld6llj/4ANdp8xmjKqlXHoqmn/Wh5P
         SqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cy3mKohVHdUUnpIprTy2L5ZO9cvfOQdp15cI30d2/x0=;
        b=cPthl1fj9rHfVUDfO1spVYdbOfa6oMuTFLnyqS/99O+MLxWETo137rovYtPVcEo5p5
         qNuaexHRovALzs3d4hRabzpXVNkpm40x55cJySmm+YiiLI+/VSN5Mo8UfIpzbETxYXr5
         fQ/nVj4jqhsRAvJYvggh8PXrFtoLfrfCZlcMu9qTcHJsi4IYGN4ZdojCZ4PNFm4kwMxb
         P6fqVuthM++L+mYuGYHLUxebuP9Bep95h9OFYuN9qepk8NEyFbrcAelJqt7SD5dAafEQ
         Eb5QvkLBUL9VU6nQsjsbQ36HdAfxAgWJOdlOlml4AP7I8diCQGLwe1ED6gf+fXZlvooY
         W25w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0NAS4z9xrPXYvYEnqF7LYgnF0B/DUXVhU8scmbjaSF5bKmaDD
	CZ/gRHyf4jc5eKRWUU1CO/k=
X-Google-Smtp-Source: APXvYqzu4Eyci+LcxLAAjyMmze5poKwIppyTXDN/z4zNC2Iw2xplFmWeZQPT7n9Nwf6Xs3+fgRL1uQ==
X-Received: by 2002:a2e:3201:: with SMTP id y1mr9769681ljy.5.1570200119244;
        Fri, 04 Oct 2019 07:41:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:95d4:: with SMTP id y20ls1337106ljh.15.gmail; Fri, 04
 Oct 2019 07:41:58 -0700 (PDT)
X-Received: by 2002:a2e:91d0:: with SMTP id u16mr9605927ljg.164.1570200118233;
        Fri, 04 Oct 2019 07:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570200118; cv=none;
        d=google.com; s=arc-20160816;
        b=LfCYOjGivaimG6dlmqo/+8//jJDsgWiyRI6I7iDO4iGVv76XbWT84yT348CHCam+ss
         qpGTK9dYTn/8obDrmXdOY0tDFklv2j48j8Vf4EWw+FcAlUPGrxkL5SckIYn75uBzLH8w
         cLXWe6NqxUasHHiA/l+U+T1jvwyZ/tYx0IT3QjawSnxChL6OfIC6urQcRpkp80aVGxEo
         AZ81r4ggjUPwAa018QnQhf3IACg/Yqoc/22Ge+RVioyOAQQjTRFhlaw8Jrnx7RPLvD0o
         V0CmTqeBxdDbLW2FxGVJa41IKDkf4MhdvjR2wbdWJxri22lVDn2Suw4xh7uAQkhGCxaz
         h57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:to
         :dkim-signature;
        bh=YEosGNAeJa5IoThbTCAuhaZJvtwADsMKYTgt2rsizpo=;
        b=zqoP1DDq9TlHkYK4C0IEsIWE5cmfR2+ZTCLFOI4JY4QoeD+mtcFAHUbNBGwF57Jp1x
         vbC+2YR1NMub/jaxXrafLG33RSA/1sWJ1LlPOcfjMBOFCumz8/xnAHKZX/iABxRRXsyL
         JHIYciWOdlpbaJHUysVGB6kUOISgCEPmDscG+iVdFBhILA46lZA8BH3N+jRt9EJyzzuW
         w5/PcWwU8Yhp0qA03M8Wqw06GyKenGXZuilgQoMERbJz7rX5LJj3PoQt6PkxiKeGeGWB
         v/QgrEZyQPnwRqyc1c1l2dtu31qK9WL5e2llbKWJrFFChpEZb8YHanZisgTzTQthxksm
         nzlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EMqsf6W2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id d3si416872lfq.1.2019.10.04.07.41.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 07:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46lCJ45xwzzy2Y;
	Fri,  4 Oct 2019 16:41:56 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 4 Oct 2019
 16:41:56 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <0713c187-2670-7914-1ad6-561bc4073920@siemens.com>
 <724ad1a6-00b9-b921-122c-25c26e75349c@st.oth-regensburg.de>
 <f31ce534-911d-ccba-c96d-529eb7a5c828@siemens.com>
 <922f18c5-418d-cfcd-1078-e632a9266464@oth-regensburg.de>
 <eb961a5f-0ed3-b821-b9b2-666a9fdcbfd8@siemens.com>
 <48835bb9-5fe5-852b-e538-00c7b6fb6498@oth-regensburg.de>
 <b4b63fc4-87fc-909f-6b96-fe8f413a198c@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for
 port I/O
Message-ID: <e9bea12a-1524-6289-db95-f25edc3a3074@oth-regensburg.de>
Date: Fri, 4 Oct 2019 16:41:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <b4b63fc4-87fc-909f-6b96-fe8f413a198c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EMqsf6W2;
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

On 10/4/19 9:15 AM, Jan Kiszka wrote:
>=20
> On 02.10.19 16:14, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 10/1/19 5:34 PM, Jan Kiszka wrote:
>>> On 01.10.19 17:23, Ralf Ramsauer wrote:
>>>> Hi Jan,
>>>>
>>>> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>>>>> On 30.09.19 21:25, Andrej Utz wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>>>>> This patch series eases configuration of port I/O devices for x86
>>>>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>>>>> previous
>>>>>>>> behavior, most entries are disabled (commented out). Only whitelis=
ted
>>>>>>>> device ports are allowed. This includes the peripheral PCI port
>>>>>>>> space.
>>>>>>>
>>>>>>> Did you also try what explodes when enforcing the generated list? I
>>>>>>> mean, if there is no mess like with hidden memory regions, things
>>>>>>> just Just Work (TM).
>>>>>>
>>>>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>>>>
>>>>> We probably need a mixture: white-listing know-harmless thing that ar=
e
>>>>> requested in the legacy range, combined with permitting the PCI
>>>>> device-related regions.
>>>>
>>>> Ack. With a little luck we can rely on entries in /proc/ioports, at
>>>> least for PCI ports above 0xd00.
>>>>
>>>> I just compared lspci vs. ioports on some machines: Looks like ioports
>>>> contains everything that can be found in PCI config space. But ioports
>>>> contains even more.
>>>>
>>>> What are those pnp entries good for? E.g.:
>>>>  =C2=A0=C2=A0 f800-f87f : pnp 00:01
>>>>  =C2=A0=C2=A0 f880-f8ff : pnp 00:01
>>>>  =C2=A0=C2=A0 [...]
>>>>
>>>> Are these reserved areas for PCI devices?
>>>
>>> pnp, ACPI, some further platform resources.
>>
>> Will the root cell touch those ports? So far, it looks like it doesn't.
>>
>>>
>>>>
>>>> And on my laptop, I can also find ACPI stuff above 0xd00:
>>>>
>>>> 0d00-ffff : PCI Bus 0000:00
>>>>  =C2=A0=C2=A0 1640-164f : pnp 00:01
>>>>  =C2=A0=C2=A0 1800-187f : pnp 00:01
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1800-1803 : ACPI PM1a_EVT_BLK
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1804-1805 : ACPI PM1a_CNT_BLK
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1808-180b : ACPI PM_TMR
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1820-182f : ACPI GPE0_BLK
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1850-1850 : ACPI PM2_CNT_BLK
>>>>
>>>> How should we deal with that?
>>>
>>> PM_TMR is passed through anyway, at least to non-root cells. The rest i=
s
>>> more dangerous, potentially. But a "works by default" setting may have
>>> to include them.
>>>
>>>>
>>>> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn't
>>>> VGA be listed in ioports if present? At least for qemu that's the case=
.
>>>> If we can rely on that, then we wouldn't even have to whitelist VGA. [=
1]
>>>
>>> Yes. VGA, if it shall be with the root cell (common case), should be
>>> listed.
>>
>> Alright.
>>
>> So here you can find a WIP version of this series that comes with
>> support for selective whitelisting PCI devices:
>>
>> https://github.com/lfd/jailhouse/tree/ioports-ralf-v2
>>
>> So far, I successfully tested this approach on Qemu and on a real
>> machine. No crashes so far. (which I didn't expect, to be honest ;-) )
>>
>> Jan, could you please test this approach? Just run it on your local
>> machine, look at the output, and compare it with /proc/ioports. If this
>> is the way to go, I'll make a clean series out of it. The head commit is
>> probably the most interesting one.
>>
>=20
> Something is broken:
>=20
> $ jailhouse config create config.c
> Traceback (most recent call last):
>   File "~/jailhouse/tools/jailhouse-config-create", line 260, in <module>
>     mem_regions, dmar_regions =3D sysfs_parser.parse_iomem(pcidevices)
>   File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 102, in p=
arse_iomem
>     tree =3D IORegionTree.parse_io_file('/proc/iomem', MemRegion)
>   File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 976, in p=
arse_io_file
>     level, r =3D IORegionTree.parse_io_line(line, TargetClass)
>   File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 967, in p=
arse_io_line
>     return level, TargetClass(int(region[0], 16), int(region[1], 16), typ=
e)
>   File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 869, in _=
_init__
>     super(MemRegion, self).__init__(start, stop, typestr)
> TypeError: super() argument 1 must be type, not classobj

Argh, seems that's a python2 compat issue, doesn't happen with python3.
Please pull again, should be fixed now.

BTW: How should we deal with python2 in the future? It's (finally) EOL
in ~2 months.

  Ralf

>=20
> This was run inside the qemu x86 instance.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e9bea12a-1524-6289-db95-f25edc3a3074%40oth-regensburg.de.
