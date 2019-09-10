Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZHW3XVQKGQEANFFXQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE5AE822
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Sep 2019 12:31:01 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id s2sf1570343ljm.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Sep 2019 03:31:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568111460; cv=pass;
        d=google.com; s=arc-20160816;
        b=0FN7ACz6XOtFg16H7AlPGwUJilevv08TH1cF5cFTgVEouXrj2skPrmxwtH3dxTkj31
         Bje2izzryLqXJ5PfBlQLmHD9EYVpUDe6QyGJD2hVvpWsNtb7ShMk41MI2m8wQApKw/2z
         Ltz/W7MoTMwVdeUQb0Zwb9WK9l7I0oaaJfKiPXKBixemKB5GwWO76Et8kujqJqHgHjSy
         X/r4YydEkmvil7vWR0S8p+Hpyafl1vAtwL2XAOCWikNdm6R7gbGkA7SU9mORl5uTd8mr
         WhofSBRnziV/2GQ1Tfr0KallXQIuwFCARNHyC0rUncBOil8yMRRID2fqiyba246u/Qb6
         zgig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature;
        bh=KNR5AaEtKDTD8N+MYy7LKQsmzgk6g7H8/rjOm2PaKRM=;
        b=nlCYtXTmh8EUm0jqW3/A939m4WW2XwhT6CNS4QcqiTv4fqDHclExp+XxqEhyGUPjf+
         NpFkJT/WINJZuMvSxtM8H37++fyaNOwNbL0PizemLjX7qmagdUCFfG6iDMgyZzVOHFI7
         6FNjNC5HKygK7StW99EZdyw25Di8kQ4PF63tgD3CE+6UglBIKvdAiwjR+6/E8THCfbIn
         DtxfbBJ/STsRl4W9c1keobxIYVCQrCivD2I8RwE45OUbhN+iq2JNfVr8JFTzF0gUBFqH
         evK6lv1jx8PnQAXMtFXj1DVdpT4U5R3lq40uq2RvkIdk/13POtAgmt+4KNDsMSd4mVWQ
         9VWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KNR5AaEtKDTD8N+MYy7LKQsmzgk6g7H8/rjOm2PaKRM=;
        b=G/Bqb9NpLHUUueP2rA4nD7Oh8uJK14jOTUsCtzddXQ2/aFDaA7wCS0MZFNkX3HrIUs
         2/C7mmcPNcL1KK/3Q1fJtCDd9+qCUGaeT5HIp0tCbvTOISkladpBFgN1v0pyKND2sDwU
         C9JOJrRh9fAs8vQcQa7B+qTYkWiFgqnZZxCo5rgY+Hua0iGNIBKvtz+GD/SZXzNbYtdP
         pUBKXIh+esqg28wFBW4gOaLicdmiQ8rxfd+3APpQCJqH04VaBnaPaA5wy7tc8XHPZf3l
         J/IMxhKQNkIoS54cpuN1lMOSYSLfA06njBlC0YlUBWIjUL64Vobycd1vnU1MuksxeHSH
         xIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KNR5AaEtKDTD8N+MYy7LKQsmzgk6g7H8/rjOm2PaKRM=;
        b=Ol0odqqWWMmp32k7U/zWmd5A9wsYW6FZabhv7Uoai4ebyFebgRWr8XOURLz3ZSKhbd
         KESyTGfhAVbaAyvVz2nUVOadz78ikum2I7R0aip49Lz42GuU1Ywcv6T9CCPyjXvX7157
         2RO/q/bkZys2vSaATDFjGQBjYGtVDSM/4h8f12YdjXffph8x/MeAfR0x/B8nBJW6rxnd
         +My7PE3Zzycjimh4NJ/FIhNPnWAj/oyFh85GDd/tBOxu22JrHtJJNU8G77577l7Zo8jA
         ItOKbs1mFSUyCyPPQJQy5QkrjgVYCtEZBWsMgu17ik5aNdoEOdiqKH3+EaITtJeiTVNr
         bt2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWsujJMoTqprYd0GKaNrDQMQMvGU6lwSd+QtWWp1nDqtPtkB7qu
	aEtGbdSuHaUKBuKtPenaYZg=
X-Google-Smtp-Source: APXvYqw9//m4KDBRxpXo7NaEyvXyF53Z34XgT/sg88AuZ376p1xytINsoMhYnV4HZyBkmO5Ph/T2PQ==
X-Received: by 2002:ac2:495e:: with SMTP id o30mr19792834lfi.82.1568111460772;
        Tue, 10 Sep 2019 03:31:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:985a:: with SMTP id e26ls2003914ljj.8.gmail; Tue, 10 Sep
 2019 03:30:59 -0700 (PDT)
X-Received: by 2002:a2e:974c:: with SMTP id f12mr19148305ljj.15.1568111459227;
        Tue, 10 Sep 2019 03:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568111459; cv=none;
        d=google.com; s=arc-20160816;
        b=DVM2+p3BgjAzgr/e6nGyMvSOCiRlTfTyqG6DjGx7Wj/Pz9eKRSa0iYkdBO+da4C0eu
         BObw7zA4uiNr3ALktrs3EZL4nvgCWZh6tfzaQ6unASXDgdbwPN6kVUkr43+Vm8NlVFcs
         nooNbul5phBc+/1mUon28VnKfnfiwHqPt3+DyNazSM+klR8RtkDotAQnvHAgUAHFrgQn
         vi0JTRP6QATbA9o3zjpSbgxMSJAgS9YOGctOeQ4J25Wz+hmwF8n85dm9UWGGsvwX/NV8
         j5O1xH8e/4VBhOnLQaEknrc58pcTgYdqzX/Df3mjDJULzSCJROo0jIljyA8FiBrj2JCJ
         c33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=zzkmrB0+1DmpB+zxJtM/Xg8NXTHRIHvdTPRmS1DgTNs=;
        b=FfsBAlE7LcLPHlHSash/TBYf/POCQu1zcIVlSgp+sK6bQKVt6JDxY5E3wqnn5HUuCB
         nwcPaPZk/2+CGU2gk76TC6mDRZbxth1Kfhoeiwlql3z63+tSDgqv9ssusliHuJtu9ffz
         +8obtYQii9lvQI8yGD8r+/O4dW6Hfx5FrayRgQ9xBJLZg8GCHquiTGZjE8cLLYLwcn4b
         CRzeZdIHjwldDGMAitDpnj0Zv5cbgD/TaKfbtdOdYHKfL5k/ePh33FJzWqy8gNXVXN1F
         YYB1Kh9Rq9r2CDc51g1ppnVm7n/rWWLrIFm+yA5QWdMw6ONZAmXoGdx0M41C3aM+Js6z
         ddZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q7si970332lji.5.2019.09.10.03.30.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 03:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x8AAUvK7002541
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2019 12:30:58 +0200
Received: from [167.87.12.76] ([167.87.12.76])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8AAUu3k004827;
	Tue, 10 Sep 2019 12:30:57 +0200
Subject: Re: Using android as root cell facing ESR_EC_IABT_LOW issue
To: oai@sjtu.edu.cn
References: <05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53@googlegroups.com>
 <f2f0be83-9b52-a1e5-2d5a-bd7b1d7f545f@siemens.com>
 <1631676022.12406230.1568110415048.JavaMail.zimbra@sjtu.edu.cn>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <60657747-0a90-02ac-3fb6-f6951730972d@siemens.com>
Date: Tue, 10 Sep 2019 12:30:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1631676022.12406230.1568110415048.JavaMail.zimbra@sjtu.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

[re-adding the list]

On 10.09.19 12:13, oai@sjtu.edu.cn wrote:
> I tried to include 0xf0000000-0xffffffff in the cell config, and I succed=
ed in enabling jailhouse in android.
> Thanks a lot for the advice. It seems that I had not understood the meani=
ng of the inmate memory region.
>=20

Great that you found a solution! Yes, the cell needs explicit permission. A=
nd=20
the root cell needs that for regions where it is supposed to load inmate=20
code&data into.

Jan

> regards,
> Yanqiang Liu
>=20
> ----- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 -----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: "Jan Kiszka" <jan.kiszka@siemens.com>
> =E6=94=B6=E4=BB=B6=E4=BA=BA: "oai" <oai@sjtu.edu.cn>, "Jailhouse" <jailho=
use-dev@googlegroups.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =E6=98=9F=E6=9C=9F=E4=B8=80, 2019=
=E5=B9=B4 9 =E6=9C=88 09=E6=97=A5 =E4=B8=8B=E5=8D=88 11:35:48
> =E4=B8=BB=E9=A2=98: Re: Using android as root cell facing ESR_EC_IABT_LOW=
 issue
>=20
> On 09.09.19 14:39, Yanqiang Liu wrote:
>> Hi,
>> I am working to enable jailhouse as android being the root cell on imx8m=
q platform.
>> When it comes back to android after the initialization of the hypervisor=
, I get
>> the error code 0x20.
>> Is there any advice for me on debugging?
>=20
> Basic information is in [1][2].
>=20
>>
>> Initializing Jailhouse hypervisor v0.10 (66-g22170297-dirty) on CPU 0
>> Code location: 0x0000ffffc0200800
>> Page pool usage after early setup: mem 39/994, remap 0/131072
>> Initializing processors:
>>   =C2=A0CPU 0... OK
>>   =C2=A0CPU 1... OK
>>   =C2=A0CPU 3... OK
>>   =C2=A0CPU 2... OK
>> Initializing unit: irqchip
>> Initializing unit: ARM SMMU
>> No SMMU
>> Initializing unit: PCI
>> Adding virtual PCI device 00:00.0 to cell "imx8mq"
>> iommu_config_commit imx8mq
>> Page pool usage after late setup: mem 61/994, remap 144/131072
>> Activating hypervisor
>> FATAL: instruction abort at 0xf7ffe094
>=20
> An instruction at that guest-physical address cause a second-level transl=
ation
> failure. Check your root cell config for that address region, if it shoul=
d be
> included, if it is executable.
>=20
> Jan
>=20
>>
>> FATAL: forbidden access (exception class 0x20)
>> Cell state before exception:
>>   =C2=A0pc: ffff000001468094=C2=A0 =C2=A0lr: ffff000001468094 spsr: 2000=
01c5=C2=A0 =C2=A0 =C2=A0EL1
>>   =C2=A0sp: ffff00000801bf00=C2=A0 esr: 20 1 0000086
>>   =C2=A0x0: 0000000000000000=C2=A0 =C2=A0x1: 0000000000000000=C2=A0 =C2=
=A0x2: 0000000000000000
>>   =C2=A0x3: 0000000000000000=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =C2=
=A0x5: 0000000000000000
>>   =C2=A0x6: 0000000000000000=C2=A0 =C2=A0x7: 0000000000000000=C2=A0 =C2=
=A0x8: 0000000000000000
>>   =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x11: 0000=
000000000000
>> x12: 0000000000000000=C2=A0 x13: 0000000000000000=C2=A0 x14: 00000000000=
00000
>> x15: 0000000000000000=C2=A0 x16: 0000000000000000=C2=A0 x17: 00000000000=
00000
>> x18: 0000000000000000=C2=A0 x19: ffff00000146cc18=C2=A0 x20: 00000000000=
00000
>> x21: 0000000000000000=C2=A0 x22: 0000000000000001=C2=A0 x23: 00000000000=
00000
>> x24: ffff0000114c3a60=C2=A0 x25: ffff00000949bf48=C2=A0 x26: ffff0000080=
1c000
>> x27: ffff000009851000=C2=A0 x28: ffff8000774cd400=C2=A0 x29: ffff0000080=
1bf00
>>
>> Parking CPU 3 (Cell: "imx8mq")
>>
>> Sincerely,
>> Yanqiang Liu
>=20
> [1]
> https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf
> [2] https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51=
q
>=20


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/60657747-0a90-02ac-3fb6-f6951730972d%40siemens.com.
