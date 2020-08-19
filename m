Return-Path: <jailhouse-dev+bncBCONRR6ZTUGRBZ4N6T4QKGQESF4UL4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF53249B4F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 13:03:04 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id c186sf877254wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 04:03:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597834984; cv=pass;
        d=google.com; s=arc-20160816;
        b=AMeV4ajb+88V7RzzfgI9vHLLukN4Ashc3doRPmafawYS+NwF+Bd6CJH/XrAWmx8Tc4
         0TXWJ2Emr/utPH6lP2AGBgARHbTUFAtOM87hlHJxTeJMpLkh3OgPea0dtFohFAH97HZd
         BA/ItMJuxS9Cr1fH+n6VOLPReSCNnD+rU6sMcDvy2GZFSzjV0EtjpNeAxNrgrXtRJPzG
         MhxXz4t4ftt8oQxX9l2syDtEmRUili5TZIjEIRTCZc3r4w89Da15ut84y7QGoNJWlk3n
         lXdWbryAD/zCdrUgWRAdTUucAzCTUnSNLHrAq0mQ6carBmw81Ec1jU+n0f88hPQgW1XA
         kbBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=tyQgU+7O8V4pwME53r8z2uYHKzbFUR8eSGcBvHjwHLo=;
        b=TQFI2A08BbQM0sWPmYNVC9hNvu/ZiJkNMMUc93sbNMwe5PIb16ABEAMgDkpnLgt5Ho
         s6wTtOBkeNV5hVUESbNC6jPHTZmDSQP/vHU41nT5hlro3CUZm3yFzbU5GvaPbEmWV3tc
         FRonSKmbKnZdl2sI5mwmQgGiYQ/xOhLAwcjydZ2NBZ6o9cDG0P14F9D4syXdM77Ahc9v
         gBY9amRwXKFX4+ZHFUd37Vix1UIJEKY2eYLZWWrFnI1HsrFtF7UvEv29vf1za/PCEkE1
         r03bTRF/zSy0xJs9I//mkWwe1gOjIchHP05z7vdGQsgEhTt1Pocl0HfslblayySdU6am
         d1wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tyQgU+7O8V4pwME53r8z2uYHKzbFUR8eSGcBvHjwHLo=;
        b=Agv6UPJE6pgC1hgPbfk48Re0tUMMuoS/ORsjztqsAeN4VIkkDYp/Na3PPBzT4tRyv5
         GabgDI3QKCdNByfmzoOVUf8p+vB/CwbLWRWkQeeD5UI5JYaGiK0RNq7/7vyqIYqe5FJ/
         iN43FO/88ogkqKHrCiX/OLXZhmDJaTvqvzfXWBZebyAVbym0LZQqCg+y2j+lcGlMwCuS
         DTn1XhMSlNOYD+EJ7dSnQDKankUKDwCpeE5tKH8/Ru7FktAufBosHFJBA0VLX42AB9fQ
         M9U+8WOdUxVssjDBpBRu2y9cKvdk4dLkv0PuUU1C2mSTqRI3cZQuny2D/nqBbbtEepRl
         4y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tyQgU+7O8V4pwME53r8z2uYHKzbFUR8eSGcBvHjwHLo=;
        b=LWSG4h7z4sE3H5wGqdWKVprLXy65UCYRbh0ugU3lwkRuvhv1YrtXPGmNhPK7NMBEh7
         33u/xAr8oYj0fZb1KSjsRcT5tATCd9yFIbCUJR6t24D1BsbTwlJgFybIfMlsWlQqtavi
         nKBwa4VJ/yfIKAkb+dAgPmJaLCkXX78qqIjAuPlk+XQZt1ucNhL4hnOP7isP84v+ik1E
         feFwisbXocU277l0+UFyortmP4IF9ZMrh54lyNjIPWwsN805Sej2B9pZXoa+t8cTu07C
         nblPpnNBovJBZvLFchxaayrT4gJp9WIQQUPVdSb2MQtic+oMcnfC42EFMxwJ8hyGcoqE
         Pv4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531rTC30SQmwTm5KMJVy5FVQ7nBxuMK8LJnKbzxKbamvOBJc5PNQ
	D+ghBNVBLwZzI7Zj8Ns8fLQ=
X-Google-Smtp-Source: ABdhPJz+X73fl+HKJbqXZjVOPHgr4jeqAXNjqnnSpHjaKC0HwVPColh8SAOYHV55782azrKmYDgeCA==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr4646477wmk.17.1597834984212;
        Wed, 19 Aug 2020 04:03:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a50e:: with SMTP id o14ls1610043wme.3.gmail; Wed, 19 Aug
 2020 04:03:03 -0700 (PDT)
X-Received: by 2002:a1c:80c1:: with SMTP id b184mr4666528wmd.121.1597834983365;
        Wed, 19 Aug 2020 04:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597834983; cv=none;
        d=google.com; s=arc-20160816;
        b=MCm7d6FlUvRF6p3WURm29B7pHzIVxg6vQRocjcmk9tsTDG9Oz+3+9fl3tg5qB1tAjo
         ybwdetUdoVXmmx6zfD0ZqIL1vm4kTohbvDIizwD8MxDzTAO9Wd1syr8SjLfVjpc9W4z5
         i9hhhO7rA7kaKkJa1FJV5zJUnPmdkA3mbV4q72LZ9UZHKWLL7bMR/Ad3Jmj6b6WGChBj
         8s2IKfLIo5OtTf1CM52dAmmHA6o1+Wo66rfDdFgc8m2DJiz35Sp8U8LhsODVBy9Y/xNo
         CB0HdRgQ0LjrfXgnnGFqxm4l00+/8pY1GHVqsHbZie3X70DTiMbhHzgfBKqDC/uk6deI
         zCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject;
        bh=e3M5yPbGSNmiRWuKC2+IkkAnoMy117uVCpctp3pf7U0=;
        b=SQa3Zngod1hnA7NPpX1A2S/PqSDHYywjMz/MTOfCCuTJe4cM6dEm+5hEe52554fOVL
         9QZsZEtrZkWmfRnyTkUnGEdTvTWerqwsATyWy9O1pjtm/XRozbzNmCXZAVjcBAdtYXJ0
         S39g74NOExnJhsk1ICzmtyE8BoR/3gHNVsHqUE8yhyoVr1bcw0OS9AAPTWmUbEU8IBI7
         4WX37Ef5z3t7RkOZVpPBGEgtrZLpn/oDl8whkf6hPFji9mj23a3v7g5aDDEtg2GdqJRU
         pQFCp3NCHca89ISu1QCEsTUS2d4mx/dcGHoK3PlMgxJF9zaraJiECqFyTRC7DqVFa0WR
         2ASQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
Received: from mx03.uni-tuebingen.de (mx03.uni-tuebingen.de. [134.2.5.213])
        by gmr-mx.google.com with ESMTPS id w6si172758wmk.2.2020.08.19.04.03.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 04:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) client-ip=134.2.5.213;
Received: from [134.2.14.31] (tichy.Informatik.Uni-Tuebingen.De [134.2.14.31])
	by mx03.uni-tuebingen.de (Postfix) with ESMTPSA id 1D567832D6
	for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 13:03:03 +0200 (CEST)
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of
 memory
To: jailhouse-dev@googlegroups.com
References: <20200817171736.78100-1-jakub@luzny.cz>
 <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com>
 <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
From: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Autocrypt: addr=christoph.gerum@uni-tuebingen.de; keydata=
 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
 T29y/VTnmoSXIbqAbOajhVUuOH67EXAD
Message-ID: <32baa43a-4e84-7f22-230c-bdc5fba33c76@uni-tuebingen.de>
Date: Wed, 19 Aug 2020 13:03:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: christoph.gerum@uni-tuebingen.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of christoph.gerum@uni-tuebingen.de designates
 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
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

Hi Jan,

On 8/19/20 12:18 PM, Jan Kiszka wrote:
>>     > + *
>>     > + * Reservation via device tree: reg =3D <0x0 0x20000000 0x1000000=
0>;
>>     > + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0x0 0xe0000000 0x200000>=
;
>>
>>     Why this split-up into two regions?
>>
>>     This will also mean I need to add a patch to [1] so that the DT will
>>     carry the carve out. And drop the mem=3D from [2]. Or can we rearran=
ge the
>>     reservation to keep that mem=3D cut-off, at the price of wasting mem=
ory on
>>     larger RPi variants?
>>
>>
>> It's because the PCI MMIO address space is mapped to=C2=A00xe0000000 in =
the
>> original configuration. I don't know where this address comes from, but
>> I've had some issues then I moved it somewhere else. I would like it
>> most if it would be above all the available memory, but I was getting
>> errors when i tried to do so:
>>
>> [ =C2=A0154.161182] pci-host-generic 200000000.pci: host bridge /pci@0 r=
anges:
>> [ =C2=A0154.161231] pci-host-generic 200000000.pci: =C2=A0 MEM
>> 0x200100000..0x200103fff -> 0x200100000
>> [ =C2=A0154.161354] pci-host-generic 200000000.pci: ECAM at [mem
>> 0x200000000-0x2000fffff] for [bus 00]
>> [ =C2=A0154.161525] pci-host-generic 200000000.pci: PCI host bridge to b=
us
>> 0001:00
>> [ =C2=A0154.161540] pci_bus 0001:00: root bus resource [bus 00]
>> [ =C2=A0154.161553] pci_bus 0001:00: root bus resource [mem
>> 0x200100000-0x200103fff]
>> [ =C2=A0154.161620] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
>> [ =C2=A0154.161718] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000f=
ff]
>> [ =C2=A0154.162420] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
>> [ =C2=A0154.162523] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000f=
ff]
>> [ =C2=A0154.166228] pci 0001:00:00.0: BAR 0: no space for [mem size 0x00=
001000]
>> [ =C2=A0154.166246] pci 0001:00:00.0: BAR 0: failed to assign [mem size
>> 0x00001000]
>> [ =C2=A0154.166259] pci 0001:00:01.0: BAR 0: no space for [mem size 0x00=
001000]
>> [ =C2=A0154.166270] pci 0001:00:01.0: BAR 0: failed to assign [mem size
>> 0x00001000]
>>
>> So it seems that only 32-bit addresses are supported. When I tried to
>> move it somewhere to the reserved space (e.g. to 0x20000000), I was
>> getting crashes when enabling Jailhouse. So I stuck to the original addr=
ess.
> That PCI MMIO config space is for a virtual host controller that
> Jailhouse provides. If has to be placed into a free range in the
> physical address space of that target. If you relocate that range in the
> system config, also update the non-root cell device tree. The root cell
> will get that information automatically.
>=20
> Could you share /proc/iomem (without reservations) from your larger RPi?

During our work on autojail we also had the assumption that
.pci_mmconfig_base needed to be below 2^32, but we could not find a
reason for that in jailhouse. I was think, that this restriction was
either caused by the linux driver or a misconfigured device tree. But I
will revisit the problem in the next days.

Kind Regards, Christoph

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/32baa43a-4e84-7f22-230c-bdc5fba33c76%40uni-tuebingen.de.
