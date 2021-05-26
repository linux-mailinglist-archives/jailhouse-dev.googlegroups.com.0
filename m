Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTG7XCCQMGQE2SN67RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29C3915D3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 May 2021 13:23:57 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0sf391842edu.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 May 2021 04:23:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622028236; cv=pass;
        d=google.com; s=arc-20160816;
        b=F4sm/y+qTNg1HpgNUzW64btNxST4rpk2xPoJJRmTtR+dtSG88CKK+C4g6GrvfcadFu
         QyTZNs/cIG+SB1r/Cqulfiy57CwwXQNXo7ifasezf8iqmfOqX55jEZaL+5NMTbsa3G/N
         jiAgKH81wxHriyaWtQfecenv6Tub+wTVqRd8JjxgcpcRY2n9aqSibQyZ5xirzJkHfDGn
         2jjnEka2aONsjFB7alQITnTZRUeuiQDSysSfwSr7N1hoK/7zpP3RokQYjL6uV4TTf1mq
         X7KsbdDuhnx2MNKHHtfhhFIW+4WIdqO/YBqGevrbv97gQ2IXc0xvOJ3if4pXbgm3eWIU
         fwKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=DjODXCaS6WR6iUgKEiwOY67idtqUVicZvvefqM+P4MQ=;
        b=sz0VTdOdig9mKiuYsJTMF4gNExNdmWZ0ZuWeLF5BwukO6FiwJ0ygnGed4JQmJo0cy9
         9Ed+VqV1uOk2J+a8f04YmFeydLJy+sg4gXm+h0UxEkFzLitK5JW9zDuhJX7Fw1g6B3xN
         uN5g11WcunqafcZls68ErwJaeKoM/FIh/KlKLAFYESRShHo8wMagPt3M9HzbuF/lbIv/
         jX1bIG/hWwjlPnQLSsFNH6fSx1HaUXe6SvJWlW6en3g6xnN3+W9usyKGzanAgrmZw8N3
         ttY6ajISXy736HOgWyB6lCyuw3LuuqiLtYC48D6+SkuNRUtUzFmSHzb186ejOBv9DV73
         WgBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RJERCzAR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DjODXCaS6WR6iUgKEiwOY67idtqUVicZvvefqM+P4MQ=;
        b=SPqr61h7qbHNRe1DfgdCnFUP2WK/rTlcL6bjnUmzr8UlsIeK22zk0z3S9iqKyMKyFU
         AySlH1DvXmG7zyGLLWBQbV/cAxrcExTuay/ua+vkBboMNVIJK+VdeCkCfWXOuyHuUoM0
         cdhQ3gucdevYhWp6dCU/DXLpMkSnllHJwPhwaqBUqEbLuoDM3g3Z8P7DvqP7RDFdxejQ
         WOUCUEN0OoVjaGD2U4i7IfLmxn4k23qGk8fy8+VjIvtBhdVgmL7HZRLWF/GOm+kUj8qs
         Ej7D5/RXRHQu5nh6618Hnoy71KDpC7XnggH5z/5ZhQqx9xg4ghSTADXsD6jUWORdIm01
         3krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DjODXCaS6WR6iUgKEiwOY67idtqUVicZvvefqM+P4MQ=;
        b=jkqi3hUgSV5o6zz/w1y1rBm1WUTXPhNaSEjePx+JCQdKNzrKaPux7yyEjdAX3FixIq
         gJgFnJPFJqajnVLOvmw3LkdUBqN1qtQFUC24HG9anpYrgGP5PQPlKBZCt9LdTmg6E8lJ
         n5nO4jXXAU6DtcTkBNgW1ZKcc4GuKgFtIrEE9/HtfkZBUb5hFHmAV2OelRgAYxQXvw0k
         ER/pHz/n6oxPGMIE/H1/2xoFgaUa8wJVX8f8W1/hSqHpydGpPGIzaDJFUYE0CX//0Mhu
         JvoZM6zzxBLhW7QXIRFjGsy3Oi9AiNlsTTcMZumfLM/VcvK3m3+vwffZa/mTuktJCMDQ
         VfYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531U2cHNHsi0VH0U0A4J7ZSIZEJHCXjcIey+kHFMDurvvRTMApNg
	Zzvwx6/Qd3kspkxsHsh7XOU=
X-Google-Smtp-Source: ABdhPJxrQR5qmxDqIxW6NORepzmhBe4l1FTdYBToBgfUm7U4uTSFY1vJRMGWx3NeBG0OYD/yFRbF1Q==
X-Received: by 2002:aa7:c359:: with SMTP id j25mr36470070edr.171.1622028236832;
        Wed, 26 May 2021 04:23:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:20d6:: with SMTP id qq22ls6140911ejb.3.gmail; Wed,
 26 May 2021 04:23:55 -0700 (PDT)
X-Received: by 2002:a17:906:590d:: with SMTP id h13mr32588678ejq.169.1622028235696;
        Wed, 26 May 2021 04:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622028235; cv=none;
        d=google.com; s=arc-20160816;
        b=CrWi1EKf44nk9CFIBInzfZbERT73h6MUk8upbwEQ8nxBBTnbeFzQ7EhXxaNsjM1EeP
         oCaOCoIetWGOzkc5NhSzbLCCIFbQuNqAcw4Tvr0UmFlAgPvjkz83hv8VCLC9eCJN97W4
         pbgIE/6EKBmzDrWlxPQZZbPAI+eGmdhq7oK9YHN7kkkpccDK8BSdvgfKYizG64QuerbE
         zz5o9Cok6iV98HhhSz2IuNNi6vn83dHx622GnK3kVqXvib3IRtugwGDxVFxVL+RnBgMD
         t/b6JbR/QOT94SwuX9h6nzvM4DEzLSeFkrLATc7uNfr2a8qVTUKpU/f26PwXl+fshF2z
         nfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=DC9bjtkc/LyPp7ngXpxeiNlwr9IDl16yP0Rr4LXOugQ=;
        b=yYJsTrgwRFN6D4/5lb/nvYRSHf1wnOc+BME/LHumdFN+R9Hkkqs1LCHtoMH7OQdCMZ
         E67q48kBL030OT4oBAg6GwIxikVMZARBkD0OEWLcwYrI0LMWMdwun4q68ilhRR00+XfK
         IGca/p02O9W0jBWsJLaoTLs6ycq13nQ/n2Lg2E+SOousH6uJTBBiZYy0G/Ihxi3JwhSh
         ylMEb/OcWJSL0JATnISXR3NLFLkhsm335hyTt7b1sw8k0CDrEtqxlrHhFYOL6492+lk4
         s7peXCCEfbElitunoCqp7J+BQkrFRMV/1W4lqnGv277Kn3KKi/pO7ztQttuOWFBwOKiA
         CUqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RJERCzAR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r21si1551386ejo.0.2021.05.26.04.23.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 04:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4FqpVg1fGrzy1f;
	Wed, 26 May 2021 13:23:55 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::762d] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 26 May 2021 13:23:54 +0200
Subject: Re: Jailhouse command error
To: Prashant Kalikotay <prashantkalikotay1995@gmail.com>,
	<jailhouse-dev@googlegroups.com>
References: <CAEoyBwAnGc_qtFv1npqjZRY0OTg+tsREkdP0kd3xiapoAh3msg@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <fc3e7d44-ca01-df8e-f81f-c99d9ef73e7a@oth-regensburg.de>
Date: Wed, 26 May 2021 13:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAEoyBwAnGc_qtFv1npqjZRY0OTg+tsREkdP0kd3xiapoAh3msg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RJERCzAR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 26/05/2021 12:09, Prashant Kalikotay wrote:
> Dear all,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I am trying to checkout Jailhouse in a virtualbox/debian
> OS running linux kernel 4.19, x86,=C2=A0 it installed successfully i.e. m=
ake
> and make install were successful.

Running Jailhouse in Virtualbox is not supported. Try testing Jailhouse
in qemu instead: https://github.com/siemens/jailhouse-images/

  Ralf

> However when I try running=C2=A0 $ jailhouse hardware check I get this er=
ror
> message:
> root@debian:/home/prashant# ./jailhouse/tools/jailhouse hardware check
> Feature =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Availability
> ------------------------------ =C2=A0------------------
> Number of CPUs > 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok
> Long mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ok
> Traceback (most recent call last):
> =C2=A0 File "./jailhouse/tools/jailhouse-hardware-check", line 147, in <m=
odule>
> =C2=A0 =C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioapics, =
dmar_regions)
> =C2=A0 File "/home/prashant/jailhouse/tools/../pyjailhouse/sysfs_parser.p=
y",
> line 338, in parse_dmar
> =C2=A0 =C2=A0 f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
> =C2=A0 File "/home/prashant/jailhouse/tools/../pyjailhouse/sysfs_parser.p=
y",
> line 90, in input_open
> =C2=A0 =C2=A0 raise e
> IOError: [Errno 2] No such file or directory:
> '//sys/firmware/acpi/tables/DMAR'
>=20
> could anyone pin out the problem thanks.
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CAEoyBwAnGc_qtFv1npqjZRY0=
OTg%2BtsREkdP0kd3xiapoAh3msg%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CAEoyBwAnGc_qtFv1npqjZRY=
0OTg%2BtsREkdP0kd3xiapoAh3msg%40mail.gmail.com?utm_medium=3Demail&utm_sourc=
e=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc3e7d44-ca01-df8e-f81f-c99d9ef73e7a%40oth-regensburg.de.
