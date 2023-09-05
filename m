Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUME3STQMGQEAN2VSWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B797921D8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Sep 2023 12:26:27 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id ffacd0b85a97d-31f46ccee0fsf796555f8f.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 03:26:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1693909587; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ll7hLpmPXMa9xrsg2r4Mx0nXGk2rexr7WFTQWEWX02bpOzwDFUP7HXu8pz4X8UjhAe
         KBQtnisKmmA0zd8XXc3S4X54L6Z1qzqF0GaOZtbI4nwbE0oOZn2mBcoY+f3vQtPxYayO
         XSLyd8qGOjgDq8TzKQCujnK6U1G1xcKDCEAhVVq2Dr/7uL209WpN7SeqOMs4P7p4zVTd
         OxTQMD/Hzb4HaM2LToCQM/ro+eYLbjvU16gg7+VWzB3D3ceYNW+gX6oFGO2g1vtNo27Y
         TSzufa0aMuxCbEK5tmH8v0PKxGkW9RZvOxnSe1iSeMHQri519HW4Dzi4Z6O4mmDowiLf
         fmbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=1kibrug6Kiz6bxh8pKI+NGpLWRGdbrz1tVHb71oBWBA=;
        fh=BpAVTopiFedOQLrB8p68CNBMN1+ngfjJPKgZMaa6nIw=;
        b=bHit4C2mcQPeWWb3mYTwPq6tlK58kls0q23RdQg60GXDt1wewHJQfwLGIpps7EeFz4
         HT7ylekTv77FAURcW2w70rMVHf4/RKnRu7kJwNGqCEXN0bglkX/JiPoA0cvLuPt1bESe
         PYNfzbqELMHtgNXwXT8ZkNIPPVVRV40C88M5IJcFR8tMlowkPfhsfcJNJNo9C9H5XGAH
         d9RDCEi5BHgfIC7Jwsm6gKYKBM2HULuMtE2HHxESLNa7D4yKr4u1XLtZWv3e8U2O7t+o
         0o9ooxBw36rqWg5lIAZaOQX4fHCpTnykqhOxigZjUBWhM6y9kWhLaFQz6A8hck7CbYj4
         j6jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="DwSi6/4S";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693909587; x=1694514387; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1kibrug6Kiz6bxh8pKI+NGpLWRGdbrz1tVHb71oBWBA=;
        b=akblo2gvh4yyEkGlJE1bKjfiLIM4vUGm0akI1uZ1x2g9TJSYcRJUXXakgtkFUp4wf/
         X6yAq1gEnc1xjb7QPEidOEEu+fwk4okBcx2UeKhpFwwcRxtyBJv5E++gt2NolAk0SOYF
         A+2+Zvb5y/V6HW/7qsFgfBOTbFI5d7WSA82nOX+/u2hVLg3gjllmE85rG5YeZPliURnX
         xN1PYOt88gg8dqY8q1dRi5NN7dtSV202PHaATVZa1FmQzoTUeOEevfp9avoZCYrQBxHi
         5pJfQzXevyj9yaVXxDHNkz8+qzZDRzz+910EDZ0tDdYsOshZz8t167cyw+mH1wnBcoYe
         eshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693909587; x=1694514387;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kibrug6Kiz6bxh8pKI+NGpLWRGdbrz1tVHb71oBWBA=;
        b=WADU3sMwhDGkcq7mC/zt4qG6qaRvOEk/DdUyl1O77O1NnLQLYI1cVp4c/M9ancWIE/
         tib7IwV1xPuzCpES29cceDG8kP7I7x03xOzyY0cZaKBypvc/qLuvenrvTncn5u/RAsD0
         6tJLcH0vH2lZO30zT2TcChD8AyQrMeHML+WUwWZ3y5X0UI2jxjYtwQHr82ZxVf64pbPp
         0TMObXiVg+QPY0NC4HZPmxZDmot1VFfEt+gdGFmqIJniLE4D0+9Mt5qzH9K2V/woZn8X
         wBwIQF2rmizHP4i2Aru9W9HwoNssr+fSEtM4QnHsA+MGv8rkGOFdDSaoQdfP1ZR7bI3c
         2xVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxVC39x2w5gguNkQ75gJOpZApQ9aXe1MPzeupaxXbdSqRFFfC2F
	1M/dCRSpQkfCqyJxAQlqyWk=
X-Google-Smtp-Source: AGHT+IH/D6xA08/6Z8m2pHMlA4AS3kzGUo7sn5ihCiUB0Ds+eI3Kvhs8aE2c6g9ZdeozFlFLcZekIg==
X-Received: by 2002:a05:6000:11c3:b0:319:735f:92c5 with SMTP id i3-20020a05600011c300b00319735f92c5mr9847962wrx.32.1693909586692;
        Tue, 05 Sep 2023 03:26:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:514d:0:b0:312:831e:dc1b with SMTP id u13-20020a5d514d000000b00312831edc1bls1005541wrt.2.-pod-prod-00-eu;
 Tue, 05 Sep 2023 03:26:24 -0700 (PDT)
X-Received: by 2002:a5d:6d46:0:b0:315:7f1d:7790 with SMTP id k6-20020a5d6d46000000b003157f1d7790mr9077965wri.6.1693909584397;
        Tue, 05 Sep 2023 03:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693909584; cv=none;
        d=google.com; s=arc-20160816;
        b=NHOiZi3srZFnnqwnYm1bjpgiRKqR1/ZUxZFb0spH9fmJbaxFQYh0RtwJTpHzXoA2Q5
         3sXVcYtBgSHTY6T05Nl82o5NDWIGPPm0mhE0Cz+2HPEcMdE2sV36zQzfX2HfwAW9p+4M
         VbTCF1wSR7m3nct0YsnWPniw4uKtLd0tCQ6OoL5o5EiRotakjhKHGfNPjjeCilNSQN9h
         1uE8fgB6EOo+cNwiU3HAciKbJgtZ4CQdiI5fE4hSRLXJLRrPUPhkdCj3PqFDja/yQsw+
         4/K6w8YhDQF1mmYlOkefZKoJUCUSdhzq2fG5utAYiQzKni7cDs+tXvqfXQggAEbAkvYh
         qXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xnywQ2De88eHKGE3ZsWvPDvpEdrqgfpx17zFpYLsYJY=;
        fh=BpAVTopiFedOQLrB8p68CNBMN1+ngfjJPKgZMaa6nIw=;
        b=l+94RtERrsMhCQQQpFAHTgqJSHv8IKQYKcY7LWMzwIcltMsbMPeJtEyVi28NxON7LX
         q+0gPsIY0/nqtPlVO7xRYwl6r05EmA/vaKrtmZGdNVEEGhbRv8UMtu9C46YErTrg5APL
         7UN+MvU33J4K4vC9RlcQ7EZVUrzlfTcEhVQB33lxYccfLgTOCrOKFdEEX3rOHZQYYZXu
         upjlR8Q56ledoLlgZa7fQF6JYFhVgLNGLIAhY5JNrD8UIN3hpc26hJ6SzrlV29qS2guK
         mDgylrZ7hyQwzyTldAKIoxiB/nd/QBX5etlV7MDR3zv6SQRLxytxm2dNejLPy8N/IDQx
         cOWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="DwSi6/4S";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id bo29-20020a056000069d00b0031c3528356asi855803wrb.2.2023.09.05.03.26.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id EE1492E0104;
	Tue,  5 Sep 2023 12:26:22 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Rg1rG4n2yzxws;
	Tue,  5 Sep 2023 12:26:22 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 5 Sep
 2023 12:26:22 +0200
Message-ID: <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
Date: Tue, 5 Sep 2023 12:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
Content-Language: en-US
To: Zhan Zheng <zzlossdev@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
 <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="DwSi6/4S";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

What does jailhouse config-check report on your system configuration?

   Ralf

On 05/09/2023 10:52, Zhan Zheng wrote:
> dmesg in `screen-exchange`
>=20
> =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>     hello, everyone. I'm porting jailhouse to rk3568 which running open
>     harmony.
>     jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a
>     basic root cell to test it.
>     but when i `jailhouse enable rk3568.cell`, the system reboot. can
>     someone help me pls?
>     thanks
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6=
ca0cc93fcb2n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen

Dr. Ralf Ramsauer
Labor f=C3=BCr Digitalisierung
Fakult=C3=A4t f=C3=BCr Informatik und Mathematik

Ostbayerische Technische Hochschule Regensburg
Galgenbergstrasse 32
93053 Regensburg

Tel.: +49 (0)941 943-9267
E-Mail: ralf.ramsauer@oth-regensburg.de
http://www.oth-regensburg.de

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a4c85fc2-4bf4-4c07-830f-67a60a6d40a6%40oth-regensburg.de.
