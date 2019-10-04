Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL7D3PWAKGQE7PJNGDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA0CB4DA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 09:16:01 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id b90sf1493922ljf.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 00:16:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570173360; cv=pass;
        d=google.com; s=arc-20160816;
        b=ao3PCOtuGku5h7NQvHXOIyyxO5GmREpAJt17lqN+L7Dm1y+9Nmhjn18SwngemA3JLy
         u6Ega8a4c0TejibXfZ22IqI+s2oOqjSZriGOoA4eoRKS6aNLCLM85LTyO3Q+EW7bIqLW
         YMHf/drON4vZDQUg/saqlSvXI5m+NgEgMBDob0WQ222DLC7R+jcrz9WY2pLhFku+4QV/
         uq2/16AR/DdQBG2Dk1FcoaVm2uoQOjpQ1baC4Mvtf0OTnPVvbrbGoUicw97MIi+JLD0e
         iYQj2M11wI/UCJgMeD5D/RgSzq4kl9PG2CyNuGRbclsLRdXw+RooUyoUCqEiNMblk095
         xrzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=CW0V3mHHzGOU7jc0teVDD1aL8o6BMfrwPkErAuvLvIc=;
        b=f1rCqgDKJCDVCFKPl5m0hbiWR47Gi0poKh5kvTlVpYHo/CESUWrfhwcQ7heNuvoA+R
         rkTO83Q+ezYUWBiuHYHA6mXfiI+Pp+E5uhN744CqwNapxXNFauS1DCx/YsqDJI2BLZ9D
         Q7YzltDXupbS5gKsCjtxI0ZwYdLNmf6jHDcsEV4+2oqJ6j4NNtjxVQ9PbFMEo/KCQg/Z
         2/Zso1R9OUsORVV5TucHWfDKrxXlmJuK2btMUapT9WA/iKx9gpxAQd+NRZYzC1QgJQ9L
         jBwDPU6WRHe2QMl+BPOXtJHCziLfnYeI2UbLJzt42cgmPwP9x/qlKB/kCHq23M3tfLif
         vLKA==
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
        bh=CW0V3mHHzGOU7jc0teVDD1aL8o6BMfrwPkErAuvLvIc=;
        b=W1Yh3FKHHMpnwrCayEYuRp14TtOujs3tAqdz7fIMg8+2RdHGd/7+jLIS3vUr11VV5D
         e7nszFoMzC9E+jA3cpU4sK+3xIqDZ/kKJUKij/VM8q6RQKHhae1FULG+pYFFjkXOfzPB
         24WGp9Tqn6hwbwSoIH+x9i2e/wuoG59mbog3RO8DywVUm8ighPGRXIBctxIMTlEuXOU3
         RdzAfN3vJKDOUrhaxri7MrElLO59NllKvV73QzInOWE9TRMVyU1o1qVyawlWS6uETdum
         SLZULDbSFWV2z2Jq/3oZHG/HEdW82cnsoB6kHV9rVWJIsPvGLWOgAFDLwiuJlEspxxJ2
         0kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CW0V3mHHzGOU7jc0teVDD1aL8o6BMfrwPkErAuvLvIc=;
        b=HaZNJCwyU9t+Pnv7NifTy2p6MDt3QXCOG+cFmwjiVZvroTVBUWPlOGg3gUEo1YGXrw
         JOEYVnN6n/2ErsCJn7CeO37AaWEVeyt6qfw05UPQQ3SAYhhsdpUeL2eObw90i0QH9Qrc
         T5XiW6/UIQC5X5xfuau4okWv6CeYhcsnLE7KbPEHiJ0BSIeNFc7IKUKB1B7bNWHaDU+K
         K6byXS+AIrBOLl6yRBrJfHl+A5XQ+6DF093Lk1W96ZH4JFBlraLIi03L2Z8faY+CuPXP
         NzlEDDg3JyNQ9hPS3ffx/Cj8nETs/WCGd764pbWAobP4dlESGM5prqbhjLC4Kgk+a/Ra
         5POg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUSyLynEQq8RkANReO9YehN8KKjjfZfR3xGOyiTX+6/0pk2QiJ4
	hjenOhLMogsG6rbJv4jUPGk=
X-Google-Smtp-Source: APXvYqxznJnWyoZ4BFt8+m/KRE8Ko9ssAvIE84IMmgLNz6yr1ojnmNUc0+in4QRAdvMsTw9KEpY5vg==
X-Received: by 2002:a2e:9750:: with SMTP id f16mr2391495ljj.239.1570173360471;
        Fri, 04 Oct 2019 00:16:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d9a:: with SMTP id c26ls1152697ljj.9.gmail; Fri, 04 Oct
 2019 00:15:58 -0700 (PDT)
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr8885131ljj.127.1570173358906;
        Fri, 04 Oct 2019 00:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570173358; cv=none;
        d=google.com; s=arc-20160816;
        b=ENij1d1IaMR+yM+loOIPxh4moEjq4c5Wa/8tBKyZg3wiCc37JtwmmVT3CGgV47II3v
         6ZzHU9NGWKq8nd4zBOrWJG2vWN3chg34v14lsjpuC6gg2YfXL5G7rwnHB6M7ERPreDwD
         cYywbyCH7Lf3Os5J7fhSt7Y2xRjudnOHci8zqqWmnyFcyb/aZlxiQEPDnFqgD/ZcO6f1
         GstDcL1QNVHOkpayqloXOLXOgvJ14V6UQPoj0WViiQt/GrgkFlJRD/OYmo/l7v5htJut
         lPhfv+/qkEC0ooq9owBXmrXQ7vWv2To8HpMcsc2kyrA+kPv2sSCEmB4vXNX+LYGtRPKE
         vSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=FEjVeYDWQOkeUkvAVO/I1htg4QdPYa6PaLlabhcXHHQ=;
        b=TwSr3P+97o0/mJkpBUJREQg+B4hYu9v//yWa7UIrT5aAPSQb6lmiGySAMmd6pm0uIZ
         MneIqg6WsteakmJSPlL4dQP1shsAwxce2U/WC1qisjWJENTawK5c+BnRMWKQzF4uLcwc
         WVJGRKZiOeBl6NjmofKqFaGU+QLP8DXMYO89zhcje2AGlukrasJPk0m+/naxpwHsZjgM
         WslGYpwiRWqfbYnQC6FLaUPvRUIhXZPEl/fj6ZMYOxliFYawQ62T+vyhLQLGao950HKv
         Q5z3ojImPn1O6G9MaYH3gZ2afNXBWZnH10nuFrDROnPo0D3oyGt9ynLFVHHgA3q2Adef
         zZwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z4si67696lfe.4.2019.10.04.00.15.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 00:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x947Fvvg008319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Oct 2019 09:15:58 +0200
Received: from [139.22.119.224] (md1y04tc.ad001.siemens.net [139.22.119.224] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x947Fu4B003168;
	Fri, 4 Oct 2019 09:15:57 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b4b63fc4-87fc-909f-6b96-fe8f413a198c@siemens.com>
Date: Fri, 4 Oct 2019 09:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48835bb9-5fe5-852b-e538-00c7b6fb6498@oth-regensburg.de>
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


On 02.10.19 16:14, Ralf Ramsauer wrote:
> Hi,
>=20
> On 10/1/19 5:34 PM, Jan Kiszka wrote:
>> On 01.10.19 17:23, Ralf Ramsauer wrote:
>>> Hi Jan,
>>>
>>> On 9/30/19 9:28 PM, Jan Kiszka wrote:
>>>> On 30.09.19 21:25, Andrej Utz wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 30.09.19 21:19, Jan Kiszka wrote:
>>>>>> On 30.09.19 21:13, Andrej Utz wrote:
>>>>>>> This patch series eases configuration of port I/O devices for x86
>>>>>>> plattforms by generating an initial PIO region list. To sustain
>>>>>>> previous
>>>>>>> behavior, most entries are disabled (commented out). Only whitelist=
ed
>>>>>>> device ports are allowed. This includes the peripheral PCI port
>>>>>>> space.
>>>>>>
>>>>>> Did you also try what explodes when enforcing the generated list? I
>>>>>> mean, if there is no mess like with hidden memory regions, things
>>>>>> just Just Work (TM).
>>>>>
>>>>> Not yet. Analysis of additional whitelist candidates shall follow.
>>>>
>>>> We probably need a mixture: white-listing know-harmless thing that are
>>>> requested in the legacy range, combined with permitting the PCI
>>>> device-related regions.
>>>
>>> Ack. With a little luck we can rely on entries in /proc/ioports, at
>>> least for PCI ports above 0xd00.
>>>
>>> I just compared lspci vs. ioports on some machines: Looks like ioports
>>> contains everything that can be found in PCI config space. But ioports
>>> contains even more.
>>>
>>> What are those pnp entries good for? E.g.:
>>>  =C2=A0=C2=A0 f800-f87f : pnp 00:01
>>>  =C2=A0=C2=A0 f880-f8ff : pnp 00:01
>>>  =C2=A0=C2=A0 [...]
>>>
>>> Are these reserved areas for PCI devices?
>>
>> pnp, ACPI, some further platform resources.
>=20
> Will the root cell touch those ports? So far, it looks like it doesn't.
>=20
>>
>>>
>>> And on my laptop, I can also find ACPI stuff above 0xd00:
>>>
>>> 0d00-ffff : PCI Bus 0000:00
>>>  =C2=A0=C2=A0 1640-164f : pnp 00:01
>>>  =C2=A0=C2=A0 1800-187f : pnp 00:01
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1800-1803 : ACPI PM1a_EVT_BLK
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1804-1805 : ACPI PM1a_CNT_BLK
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1808-180b : ACPI PM_TMR
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1820-182f : ACPI GPE0_BLK
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 1850-1850 : ACPI PM2_CNT_BLK
>>>
>>> How should we deal with that?
>>
>> PM_TMR is passed through anyway, at least to non-root cells. The rest is
>> more dangerous, potentially. But a "works by default" setting may have
>> to include them.
>>
>>>
>>> And what about VGA? We whitelist 0x3b0-0x3df on any machine. Shouldn't
>>> VGA be listed in ioports if present? At least for qemu that's the case.
>>> If we can rely on that, then we wouldn't even have to whitelist VGA. [1=
]
>>
>> Yes. VGA, if it shall be with the root cell (common case), should be
>> listed.
>=20
> Alright.
>=20
> So here you can find a WIP version of this series that comes with
> support for selective whitelisting PCI devices:
>=20
> https://github.com/lfd/jailhouse/tree/ioports-ralf-v2
>=20
> So far, I successfully tested this approach on Qemu and on a real
> machine. No crashes so far. (which I didn't expect, to be honest ;-) )
>=20
> Jan, could you please test this approach? Just run it on your local
> machine, look at the output, and compare it with /proc/ioports. If this
> is the way to go, I'll make a clean series out of it. The head commit is
> probably the most interesting one.
>=20

Something is broken:

$ jailhouse config create config.c
Traceback (most recent call last):
  File "~/jailhouse/tools/jailhouse-config-create", line 260, in <module>
    mem_regions, dmar_regions =3D sysfs_parser.parse_iomem(pcidevices)
  File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 102, in par=
se_iomem
    tree =3D IORegionTree.parse_io_file('/proc/iomem', MemRegion)
  File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 976, in par=
se_io_file
    level, r =3D IORegionTree.parse_io_line(line, TargetClass)
  File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 967, in par=
se_io_line
    return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
  File "~/jailhouse/tools/../pyjailhouse/sysfs_parser.py", line 869, in __i=
nit__
    super(MemRegion, self).__init__(start, stop, typestr)
TypeError: super() argument 1 must be type, not classobj

This was run inside the qemu x86 instance.

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
jailhouse-dev/b4b63fc4-87fc-909f-6b96-fe8f413a198c%40siemens.com.
