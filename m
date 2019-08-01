Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB75NRPVAKGQEVYPIVKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B17DAFD
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 14:11:44 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id g8sf35383844wrw.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 05:11:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564661503; cv=pass;
        d=google.com; s=arc-20160816;
        b=wwZ//OgvM1xGomHTp5KzOP8NZ7NGpxJv+tHPIKgS+iIhYqBRZm4HZtaHjzwW+pNfxT
         sE1EZgTj1xMP1dqwQVC2TkEzF/juBRhrRHVyh8PKCC/lU/TftJoedTrLeZT5LCnGRjQr
         3KYIfF5PwQt2OqDRvT3C7b+Df4GyFH+HaX5Ik4yQ/1RJnmZUGxGBDzjCrqzn7oV1w19e
         g37hdvfh7zMd8BizNCcovlX0ggUl6pcCLi5yDi5/i/PgHweD6ii6EcTzz5wu5wVaKvfV
         MgNSK8BzA+Q4s3vx1EtTP2CBxS9mJnJNxf315c5NTr+7lS2hF/bufCH+gxxN8YMIHc9T
         lHCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=7/69YjOZq36h4B2kDUyBC+Uwf3GTPhtuhQme/42q9eg=;
        b=HMpQ35cmngrcpsos0YrYGWXm3jwiZMtfSngUihs4YhFNWTqWw04SfDcoA1sJULTcCy
         zdn1rD7jX6Pykzp92BZZJK0uG3YNWJR376mvGD5ejeEFEMlSUCDqNQGFlA5OiaPJ6s5n
         MIAY+hHVOQISdVtESZ4l0VE7t6e5E97vpVA/1Uok8ZyoL0XYmZY6/CKZ4Nk9yYS6F4gX
         y4wvKYEgtu60oyfhgvK6j8Q3Gd92SffPGmhVPumezS1zZvY/3TN8o+paLVFIfzMOcaSq
         HePMiPGEuFn7KNAOBIGzuivNCpTmCoTSmRFcFVo0BMnUlwlJfgsaEel2lD8SDafrOoCc
         pEqw==
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
        bh=7/69YjOZq36h4B2kDUyBC+Uwf3GTPhtuhQme/42q9eg=;
        b=hoc4AZA24oksA+p3L9zacKVzUlmj3jncStBLTC/J4xxhYdwZritsAvOB9o5ZpJVbpe
         mwe6XWGe+nNgnPdjgNudW8xuo8vWIebnMDqGmNcSEbYjA+iCsV6wOANA/LXrvhIP8iTO
         hsPYUURM7Hv4OdNOaCNWP9+ocOsUpjYMRJU+F1m+9LXwktouwVfncx6daFWEcbe7KlMo
         bYnX6zjvB3Xsjs6/NzbL71IZ9O8BvJ8yiTHnsX/93xfzFaRbPDzYPy9316qhFEJcMg+G
         rHh1AN1EjwccpN1Xd3I7+qA5tfEXOP0IqtFj+46ve0YjPmPlfsyMhJRP3Sgnm/hFX7AI
         fs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7/69YjOZq36h4B2kDUyBC+Uwf3GTPhtuhQme/42q9eg=;
        b=ib7DTSoq4wM8UJQA7f+Of5L2vr/U/IKF8GvpdiFMOVQEmaEWu6gXbOC3WSlwxlt+Ix
         JBG1mABgYiwDv/01qrFlFe8J1U4T158XLw83mlbTsOXfKmNwdk+jcKAaPWZxlJFZVFT2
         V50hAcChhJJFGGXWpVHKI2y+sOWUn/XnhFPhDmw0R71+I5/LWuQC1hTqmqxCGjRX4nqQ
         r50WNAeSqPOZoSRWWcLgp3HKCAdIe27FhTt4oxNTYtbPEZIEysB6IJeHGRey3YsRc6w1
         Q7xwoXU7r1GEPCQRRjmxK9rAsJa8LvAK26RXHChJIQkC5w91MfG9+aHRH6v/fHvm7uc8
         N6sQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+ofAhZBxou3qHi/sY12EnXxjMPshinp+vaou/T6mCf9w1VEb6
	IFJW5LerdxsZqJUIKfbTmuE=
X-Google-Smtp-Source: APXvYqx0B59nzKzuiV+xr1pJMOdxaxoQ27UWkWqGMa1/QQ0vk60yCMpTlQbQ/wvi6pi9sSmWAQyhqA==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr119056872wme.98.1564661503852;
        Thu, 01 Aug 2019 05:11:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d11:: with SMTP id t17ls25198965wmt.0.gmail; Thu, 01
 Aug 2019 05:11:43 -0700 (PDT)
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr115762218wmm.121.1564661503114;
        Thu, 01 Aug 2019 05:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564661503; cv=none;
        d=google.com; s=arc-20160816;
        b=uP8kdZkMOahTTk1RKyufvonFWNCVT1m+D66vR4sek7EIa4jOryBXxKtrzljKNfk2Ak
         wEfjhVwBdo6jKCBxEPZ5nyHzwK5Iq+Kyp80/t6anDQaO/2UOIO+KQav48G27K502wRpZ
         GoJ9aBhFMPe1SWUouDg3e3pR/01K2D1hDgPoTX7mliUgEmAZe1k+lWFSF7XpaaQey4em
         H90XoLSpsJf5dVuwaWWCppON5RkoJOlRfOp42XtSAY9/N5/f0YwWVqeVrYqDigQPrVKY
         k2cSCvw0HxUIVc/MqcuodBdxLVZwd/VjjW6YKNuNrvHHg5gWsxn0M6fIzsjBCWHOOC/7
         hkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=E43BE41onBJHfhwpBYHzXFwiCb5AwceA89gCBn7ysds=;
        b=y0+oomPX5mL93lhzzZmD/eufDVrVL3usV55B4412Xvley8o2FCUfaWuLfXKoiUucYp
         iomDAJiCb1OBxXN7dpxxS9naBrBkaxGfAjIwa9CtfGkOBbOS2Rkh8CSEIkgji0RU0f6r
         wUcwAQeqkL9ND5vrq9btgNfY13F4AGcT5RIiWY6SwOIajngrBLJH/unlmUlRHfcKpsBw
         dUd6WfINaQsFKxNc24X+yOc5D37hMnmITizvS1phKixMFs9LvvIKgXex1ALvXfXcKlUD
         v75VkUlKpRjjHXtzRrxe1TThgrYK+tl9POMvwAgVF3Wy2zv6buVqjr+kRAnxukCaKLRd
         SFEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j18si587373wmk.0.2019.08.01.05.11.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 05:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x71CBgQk000593
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2019 14:11:42 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x71CBg5O011250;
	Thu, 1 Aug 2019 14:11:42 +0200
Subject: Re: Problem with IVSHMEM on Bananapi
To: dianaramos007@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
 <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <22c9aeae-ac3c-b07e-da80-82bc6f153dcc@siemens.com>
Date: Thu, 1 Aug 2019 14:11:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
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

On 01.08.19 00:57, dianaramos007@gmail.com wrote:
>     Your kernel is now accessing a device that is not configured in the o=
riginal
>     bananapi.cell, likely because that config was for a classic banana pi=
, yours is
>     an M1. Adjust the config, adding at least a region to cover the 0x100=
 bytes at
>     0x01c25000, and things should work better.
>=20
> =C2=A0
> I've modified the configuration file for the banana pi cell, covering bot=
h
> addresses by adding the following memory regions:
>=20
> /* HDMI */ {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x01c16000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D =
0x01c16000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1000=
,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_IO,
> =C2=A0=C2=A0=C2=A0 =C2=A0 }
>=20
> and
>=20
> /* RTP */ {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D =
0x01c25000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D =
0x01c25000,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x100,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>=20
> This=C2=A0 seems to solve the unhandled traps; however, when I try to cre=
ate the=C2=A0
> banana-gic-demo cell (by running "./jailhouse cell create=C2=A0
> ../configs/arm/bananapi-gic-demo.cell"), another trap appears:
>=20
> Unhandled data read at 0x1c20060(4)
> FATAL: unhandled trap (exception class 0x24)
> pc=3D0xc03f45e8 cpsr=3D0x60010093 hsr=3D0x93870007
> r0=3D0x20010093 r1=3D0x00000191 r2=3D0x00000060 r3=3D0xe0009060
> r4=3D0xc0b2b558 r5=3D0x00000100 r6=3D0x20010093 r7=3D0x00000000
> r8=3D0x00000004 r9=3D0xde22c000 r10=3D0xc0b04c48 r11=3D0xde0ddc00
> r12=3D0x00000000 r13=3D0xde22dc98 r14=3D0xc03f45d8
> Parking CPU 0 (Cell: "Banana-Pi")
>=20
>=20
> According to /proc/iomem, this is related to the clock. I've tried to mod=
ify the
> config files, by commenting the console configuration of gic-demo cell:
>=20
>     .clock_reg =3D 0x01c2006c,
>     .gate_nr =3D 23,
>     .divider =3D 0x0d,
>=20
> I got the following trap:
>=20
> Unhandled data read at 0x1c20088(4)
> FATAL: unhandled trap (exception class 0x24)
> pc=3D0xc03f457c cpsr=3D0x60010093 hsr=3D0x93850007
> r0=3D0xa0010093 r1=3D0x00000195 r2=3D0x00000088 r3=3D0xe0009088
> r4=3D0xc0b2a3dc r5=3D0xde817cc0 r6=3D0xa0010093 r7=3D0x80000000
> r8=3D0xde24a000 r9=3D0xc0b04c48 r10=3D0x00000008 r11=3D0xdf054880
> r12=3D0x00000000 r13=3D0xde24be68 r14=3D0xc03f456c
> Parking CPU 0 (Cell: "Banana-Pi")
>=20
> How can I solve this trap?

Both your cells, root and non-root, access the ICC at 0x1c20000 here. I don=
't
recall the nature of this resource anymore, maybe it can be split at regist=
er
boundaries. If so, define smaller sub-page regions in the root cell and had=
 the
subset of them out for exclusive use by the non-root cell.

Currently, you revoke access to the region at 0x1c20000 from the root cell =
when
creating the non-root cell.

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
jailhouse-dev/22c9aeae-ac3c-b07e-da80-82bc6f153dcc%40siemens.com.
