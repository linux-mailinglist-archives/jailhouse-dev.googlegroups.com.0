Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPC3HVQKGQEJ2FXVJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A6ADC32
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Sep 2019 17:35:58 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id x5sf2312747ljc.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Sep 2019 08:35:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568043357; cv=pass;
        d=google.com; s=arc-20160816;
        b=C9CJhxsqFyx0kVr/U6Eobi2Bx3jrEEaALR0Chj3+3IGjQVD8rfvICejzKcecTb9yfj
         b5NhrPYe3CqDSKTFI5xd0JZ3dFEOhLaCMgnwXrWjo8yYzvDBYYhI5lkoLNYRZMwdhMqh
         KTUOaV5Onu0fuIsEYtw4jF/oCdAX1SmFoLksZENT7eT7VwnhGvxDas5bGOgcbyhf9fZS
         WgRJElpFQyvj2BOKMFarOmhiYIBktxKWvRzjpTxm6SIDHjZhk0dZLlnMxz8SdA7jS0iu
         yn7x9+2/5AkgRVpjhWGE2NVrpIZZddzjiVRmcW8VHIEJsIzfyKstdV1YG8F5oKQeiskO
         BO+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=DJNw1Br1i+Kq0dq0qtEzluhAaKcT049+oTFCNQg6cWU=;
        b=kBtV4nfB80MfBUrjHvzN0wte7MTZyo32K54W8qszWnTpbieZzKwnTYUeVCkw1nSVq6
         MZPS/Z/pxU+Ov+Z8h0U3ADjjnylZNOPT9HVGm7/fqHF4KbhUWgEE4+eDeCDrFNV6yzuk
         J5N00pcUGaffEILhe6ZVgZ0/phVbOBeF4xU88EjdQ2iiZmhI3/HDIPmAJ8YOStPV631M
         hOjl7jb886dfIHz1otJUXZu2sjctFvSe3u+1TUoMvHhCX+JJtz8JCoeZsIogMvI05SVa
         bAvcrYb1EkAxZbLVpWyKt7jiCYtQip6DjgGSrUePcrvjURbLB0UafGO7n1z2Jfu+Bhrb
         O5mg==
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
        bh=DJNw1Br1i+Kq0dq0qtEzluhAaKcT049+oTFCNQg6cWU=;
        b=C+vNopXE0m+SuTvbTe6om93sCo4r+VrmiHlWmQtBWJyZ2cMyJXL4wHoYrDmnbPA4pd
         FLHQcfNZuZDfQXqBgtPZN52I5MG1j7vdgKKKULgLsOPKGTG7vvgp71H9fvfApHCYt/nk
         AHZ16VCuiHIHipkGZDeZG7T/gDoM2r9hph2QadZCKRPA74hchuiOBzcEaNV5Q/TdNmUP
         Ce070lwnoZrzmJHQBysylxnIYsPjNHICq6Lb+e1N5TSwf/rUmbhw+PctNGsCSLBxV1C/
         3RG6J1oaqc2t9pm6CVN2E3RfPlHp+DcVj6f6C/XmOFcrtOyhan8Z2e+GnK1ewiSSllkn
         cM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DJNw1Br1i+Kq0dq0qtEzluhAaKcT049+oTFCNQg6cWU=;
        b=fjnSYX3x5okPBd2B88NruZpOlw4i5azdIqC55sVEm3z628zAqPvvmAI0sL8lk0IeE1
         eH0AWlqzaQ0WuXLvFqRo8q0015YpWSWU0v+KCyiwQ7+oLJmCpFfHG9VH4SpNBazDBEfh
         lCGdMC9wsDwZYXtTEdHYu5HC38D2c5NX+KtvkJn0LLgnlb62XWXYN3dZ3LtkzNmw/pzq
         IVUC6RHj+Dwq0ZzSuTCnGs3D0Z41cbmR9yhAziqAR/mPp8oWPSRTu5TympyB2Fpmsh4r
         NgPX3AjJC8Ojlpy2JpBisymx2ijhyGhRY+sdieOiRl53lKBlXGUke0SW0ocr2y5iaRE1
         J/9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNY/5NcEa/WDLQuNQSRmCYXvKBOULDpDaeDtIvRKTaei9R5IJe
	Kzn1InKSL01lL95nPvHeOSY=
X-Google-Smtp-Source: APXvYqxV+OLJIqHMrAGnUXoP/chpi5VAd1L0VlxTTzdMvPyg/rWFuGzlv8BiHMlx8LlQhc6n78gj0A==
X-Received: by 2002:a2e:99d7:: with SMTP id l23mr9407090ljj.86.1568043357748;
        Mon, 09 Sep 2019 08:35:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f50:: with SMTP id v16ls1574759ljk.1.gmail; Mon, 09 Sep
 2019 08:35:56 -0700 (PDT)
X-Received: by 2002:a2e:990d:: with SMTP id v13mr9644909lji.146.1568043356834;
        Mon, 09 Sep 2019 08:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568043356; cv=none;
        d=google.com; s=arc-20160816;
        b=1J5Kz5uGDbVPA5S8GRwnltTEtskmrqPpwTDjE8NGVhkhWxlgOAtGoadffqvvw4Mllc
         +/1qzNPdn2hIRa4IwG6ae30/AAJDrbA4HnhoeZpSyr0TBNo7dl6LofLvyqWlzl9czeNg
         vKA3e+p++NrLzxAMBfQC5pYYPnPvzynNfSFfLIdzCcs2il7zWPb959p7NrxVbXOSPE1b
         c8kdd0i4rbR1i+EmMJ+TrhHeNNblDoOTCGUzafXKpnlYED0uuSOBYVNGjYEj/LqdnHy8
         kQy+rThZaEqxJ9Q4rxRbYWT40+S5bRguqzHXv6qiANbOq+NmwlqB7+5aw0+oyiUYAuav
         s13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=bPtPJJlvyNJjvNXUEnu21zCZ5MaR26koalu88MAKihI=;
        b=fQD+U3PCQVNyAdEP+yYcfZ3SVR+HtddLHE+rLgqCckMfl17I1InYTpEn7xXSilTUQt
         PtzQ0V0B9Dz9axAyAmNHE8iyQjMNc24tgtUtfIokzNPi21TltDxBYrpaMHLJZfWKkBRq
         R3oathpmvJrKHSuZ20rDdjEw05HFwbwE/dYP+4BIK8fchqjFBrY3z1fd08YHMsgGim7R
         G3l60BINf9c+575FR6GadEww2PMM5e/CkYMmnUPk5bbxoDicErlwyatjzRhVTOpat0Gu
         gRSJCq4XVKNY/htSXMMSzqNwklrThwjmLyqordfN9IlOhENdJlNnARGgakJytYjIh7cT
         iK/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q7si825032lji.5.2019.09.09.08.35.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 08:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x89FZtq2016564
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Sep 2019 17:35:56 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x89FZsdu028515;
	Mon, 9 Sep 2019 17:35:54 +0200
Subject: Re: Using android as root cell facing ESR_EC_IABT_LOW issue
To: Yanqiang Liu <oai@sjtu.edu.cn>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f2f0be83-9b52-a1e5-2d5a-bd7b1d7f545f@siemens.com>
Date: Mon, 9 Sep 2019 17:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <05ee0f95-c64e-4b3f-a0df-1ce0ddc26d53@googlegroups.com>
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

On 09.09.19 14:39, Yanqiang Liu wrote:
> Hi,
> I am working to enable jailhouse as android being the root cell on imx8mq=
 platform.
> When it comes back to android after the initialization of the hypervisor,=
 I get=20
> the error code 0x20.
> Is there any advice for me on debugging?

Basic information is in [1][2].

>=20
> Initializing Jailhouse hypervisor v0.10 (66-g22170297-dirty) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 1... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 2... OK
> Initializing unit: irqchip
> Initializing unit: ARM SMMU
> No SMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "imx8mq"
> iommu_config_commit imx8mq
> Page pool usage after late setup: mem 61/994, remap 144/131072
> Activating hypervisor
> FATAL: instruction abort at 0xf7ffe094

An instruction at that guest-physical address cause a second-level translat=
ion=20
failure. Check your root cell config for that address region, if it should =
be=20
included, if it is executable.

Jan

>=20
> FATAL: forbidden access (exception class 0x20)
> Cell state before exception:
>  =C2=A0pc: ffff000001468094=C2=A0 =C2=A0lr: ffff000001468094 spsr: 200001=
c5=C2=A0 =C2=A0 =C2=A0EL1
>  =C2=A0sp: ffff00000801bf00=C2=A0 esr: 20 1 0000086
>  =C2=A0x0: 0000000000000000=C2=A0 =C2=A0x1: 0000000000000000=C2=A0 =C2=A0=
x2: 0000000000000000
>  =C2=A0x3: 0000000000000000=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =C2=A0=
x5: 0000000000000000
>  =C2=A0x6: 0000000000000000=C2=A0 =C2=A0x7: 0000000000000000=C2=A0 =C2=A0=
x8: 0000000000000000
>  =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x11: 000000=
0000000000
> x12: 0000000000000000=C2=A0 x13: 0000000000000000=C2=A0 x14: 000000000000=
0000
> x15: 0000000000000000=C2=A0 x16: 0000000000000000=C2=A0 x17: 000000000000=
0000
> x18: 0000000000000000=C2=A0 x19: ffff00000146cc18=C2=A0 x20: 000000000000=
0000
> x21: 0000000000000000=C2=A0 x22: 0000000000000001=C2=A0 x23: 000000000000=
0000
> x24: ffff0000114c3a60=C2=A0 x25: ffff00000949bf48=C2=A0 x26: ffff00000801=
c000
> x27: ffff000009851000=C2=A0 x28: ffff8000774cd400=C2=A0 x29: ffff00000801=
bf00
>=20
> Parking CPU 3 (Cell: "imx8mq")
>=20
> Sincerely,
> Yanqiang Liu

[1]
https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailh=
ouse-Tutorial.pdf
[2] https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f2f0be83-9b52-a1e5-2d5a-bd7b1d7f545f%40siemens.com.
