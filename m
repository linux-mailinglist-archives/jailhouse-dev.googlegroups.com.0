Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5HI3P4AKGQELWTKB2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFFD228170
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 15:58:13 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id yh3sf10658004ejb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 06:58:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595339893; cv=pass;
        d=google.com; s=arc-20160816;
        b=up5K810j81oiw7d0iLUSysBa2rVVu14OJhxHiu48EluTQg4vwN0crStu9flDaL70g0
         n7gPj6CoXS5x/a0DKl/6db+kkQ1mRrg3klcHiucNE/j8MvDJsOCNSb7fn4PhELntlClY
         jr17IXrVLNLb7kWMpvWdzt06r+rtDIOM7LOK1hHaU6OTpeWEcRYA0828imhnK+wuu6NP
         UkWEZRMk6Ly5l1xWu5Vds+AwznyTqOEkJ9/oP2ycT+E0L7ItLEptxlpcUjyNHC5ehmiL
         uAciEt6go+Iipa459sf6JeJuriz5WgWrnB019DP5V9oikNq4qBYaPpYDpSIFjdvo3yKF
         GGBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=1zdkM5QlSYC2Z9g5WvQMT2nlpmFbA1iuvQl7dC6r12c=;
        b=JGm2oqyejDrZl4tGVPq5Cli4z1X/r27MnF9P15OMwYP76+/cLnxwCO95USdyOHZ2Sh
         YMUy4J9ZUNhmjOu/4GgGz6IuUP81g0CwkFltucWG0A/1wfvvu/WXsLAhK3Uk9Vyb2NhD
         2E8jxFuG4UKjZEZG0bnXENFz1wj52ccimNZldckuOd2apyEfH4QT/NCESVta8xlU/LoY
         bjlPgAM6t7EoSxikjbDBOHoNDyt7HSDxkeBwtFfo1qX50kMvdDpMgFZKJnc2DKjcfUWn
         lhJPNW+P3GksFhlwpnZG/0TxEEOH0priXuNmtVXzIJfcieGwD8renTlydEmJepcV3/LU
         /jqw==
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
        bh=1zdkM5QlSYC2Z9g5WvQMT2nlpmFbA1iuvQl7dC6r12c=;
        b=PylRmL4UN7N60jUZfYLvQaA24LfVgVyToZ614GzTabQvqRKxNPqDh9mi2Cts9WQW+r
         VhMF6h7sy7EcxC7aHeJy6FQCcL8q1P9VvFcA4N/y79esDG9kOuuRq8XNXzwtVR6dKrNz
         Q88Np2PojcmXmYy7/1JdedLE6/x8q2wWqMyye4JOMr6DDJE3wbGAENPVr/gYk7F9fpdI
         DZHOf0SWWJlOXxepUokcYReT5Ya3FKj4TiH4bvnfonMqjBX2lrUCwGFNvXqIvH/nIwzp
         nKuksdzuICkPDFHbBGt/1Z5R/6Ht6RtLmdy2R1BZ8bikij40reBAlynMKXsFmsXpouPx
         pIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1zdkM5QlSYC2Z9g5WvQMT2nlpmFbA1iuvQl7dC6r12c=;
        b=TqvIdNzAqFoFeNXSeYUCsbc4xuUnNGYv4Rz3JQBIU2Y+b1BfcztQ4Jv3c9oYfGPQ0Y
         DB9RKPuslry0IC3SqhLZAaNVIQiJ7xqOJAaVNrssRCzFbiqNekdp+Jpowz/+VuAmFm+Z
         thAybXSuV9laNeOrmsA9R+xEQoK7OwRXvGkkSPV36aS1Gg1MP8Hejal5ioOv8PM1lEtd
         kTzOV/kR8d+pIcYEczqaHDshatI7DN/EVk/xUMtjjzzeztCNk2kzLiRfnD5CL4DrTwSJ
         OKGG0kx/jF1E7kWfePyEEENFtZ5C2sbyucayY3zJ1WY28iMgJim6aneci5tV+Vpmf6zc
         ZRyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DjID8ag8rdWGcd/eyxUN0yvbdo+hKwTOafNPTXC98tdrlgUn0
	5hoolknkMjRVeWOiGq50f0E=
X-Google-Smtp-Source: ABdhPJzlKt2u5qNg+Hke0OePzr02AXaAiUn/vaQeEOrpBx0JRu1CY8tA7ahAbDrTfLxEL/WSJECwkQ==
X-Received: by 2002:a17:906:3889:: with SMTP id q9mr26899333ejd.318.1595339892901;
        Tue, 21 Jul 2020 06:58:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:cb8c:: with SMTP id k12ls3780085edi.0.gmail; Tue, 21 Jul
 2020 06:58:12 -0700 (PDT)
X-Received: by 2002:a50:f702:: with SMTP id g2mr26616520edn.348.1595339892073;
        Tue, 21 Jul 2020 06:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595339892; cv=none;
        d=google.com; s=arc-20160816;
        b=Oc3DXO+qUwqui5P74hrXS8xmvO2aJlaYXovpirV4NEgkjgAmI7EWmdjZ2M/7pRO+oR
         ArbWTBYSNrfmJC2A1TMUjQGRXaUYeoEON5uEgUIUh1XL7JpmkiovMagqdkAtMQVHKacf
         7Mrj/RYbfitXT288qfNlz5gyf4s9jqLWwb8zEr5NF+DYi6IxM1hHLoChxzEhiq82iRBO
         x4G95qNEAiVRymWN09IIK9kqhWjPAZ3cmWnqzhhI1Ro4fg8wDie2G2wee7UvPBP7sGXL
         hQ30oXIbtDhQl87XknfZewve68S1lgMYmPORQeCTehOqPs5eErvyWlk3qERvC5+HMJGt
         UDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gvRoiyhVM7QPe13q0mal9kzZsrvZaeS0PxKlxwXVNbk=;
        b=tN5dsIGTchRLra4yu0rQTp4Zh7PogSqX0DqsHu3lu2xpJ4Uuea2Wnw3K3IYJzCJlsR
         BeKGPdyEo3GPDW/g/TdTfkO5vY8pMgjNRpLFfadAxHWTDbU+Xz/eTEcFNL01s6DlETQR
         STzBK8PVcpkY3uqH0DfyeBSulaSCMIHwTfPVWEhqzT0y1xgJDxYkXqFRLaLbrIeFyxL3
         q5ctL1mf6XA2o2o+B9du+NKB/i/JbYvZSb2nM7vjd6tB+H4Sb1dV/1oF8zz+TPbDL1zo
         hVRX9JjlO0im9zrWs8EkfG1Sbc3dsAtK00GJt+ISj9YYLJnDKFgmTh5zZRcaQgpS8Clm
         1YCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k4si832208edl.4.2020.07.21.06.58.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 06:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06LDw6og010732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 15:58:06 +0200
Received: from [167.87.32.116] ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06LDw4SZ011068;
	Tue, 21 Jul 2020 15:58:05 +0200
Subject: Re: Is Jailhouse already used on products? And if not what's the gap?
To: Rick Xu <cutfield@126.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
 <830ae788-2f93-4f55-a38b-640bd4acb560n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e0650df-e049-614b-0fbd-9f978b66b9e0@siemens.com>
Date: Tue, 21 Jul 2020 15:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <830ae788-2f93-4f55-a38b-640bd4acb560n@googlegroups.com>
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

On 21.07.20 14:36, Rick Xu wrote:
> Jan,
>  =C2=A0 Thanks for your detailed reply~
>  =C2=A0 Chinese characters are hieroglyphs. What is interesting is that=
=20
> Jailhouse translated into Chinese is "=E5=9B=B9=E5=9C=84".
> "=E5=9B=B9=E5=9C=84" is very similar to the architecture diagram of Jailh=
ouse.

Nice! Thanks a lot for sharing. :)

>=20
> "Is there any plan to pass ISO26262 certification?"----My colleague's=20
> question.
>=20

In [3], we are looking into IEC 61508, and that should allow to derive=20
ISO26262 certification (being based on IEC).

> Our company's Soc and hardware=C2=A0 will be available soon, with an ARMv=
8-A=20
> CPU and our own AI Acceleration unit,
> I'll try to make jailhouse running on our hardware. Is there any=20
> relevant documentation to guide my adaptation work=EF=BC=9F
>=20

The basic ideas and guidelines from [4][5] still apply, but the rest=20
depends on SoC details, which features used etc. However, if you have a=20
booting Linux on your board, enabling Jailhouse for development and demo=20
purposes is rather simple. Locking things down will surely require more=20
effort, though. One of them might be partitioning of the AI unit - if=20
that is needed.

Just drop questions here if you run into issues.

Jan

[4]=20
https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailh=
ouse-Tutorial.pdf
[5] https://youtu.be/7fiJbwmhnRw?list=3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q

>=20
>=20
> =E5=9C=A82020=E5=B9=B47=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UT=
C+8 =E4=B8=8A=E5=8D=885:27:54<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>=20
>     On 20.07.20 09:57, Rick Xu wrote:
>      > Hi,
>      > =C2=A0 =C2=A0 I'm very interested in this project.
>      > For 3 reasons, first, it uses a LINUX as a host OS and then
>     changes it
>      > to a guest OS, so a running host OS was saved.
>      > Second, less virtualization and more real-time.
>      > Third,=C2=A0 it's easy to use.
>      > So, I want to evaluate the feasibility of using it in an
>     automotive system.
>      > I want to know is it mature enough to already been used in some
>      > products, so I can use this information to enhance the customer's
>      > confidence.
>      > And if it has not been used for products, why?
>      > Looking forward to your reply.
>      >
>=20
>     Jailhouse is primarily useful in two application areas. One is
>     real-time, splitting of high-performance cores in a AMP setups withou=
t
>     much hacking while providing minimal latencies. There are users out
>     there, at least one stepped forward officially, see [1]. Furthermore,
>     Jailhouse is part of processor SDKs that TI and NXP are shipping to
>     their customers, and not only that just led to [2] - which I think
>     speaks for itself.
>=20
>     The second, still more research-like area is functional safety. This =
is
>     our (Siemens) primary focus with Jailhouse. And while we are still
>     waiting for and even collaborating on developing [3] a certifiable
>     high-performance multicore hardware, our discussions with external
>     experts and certification authority made us confident that a key
>     element
>     of the software for complex mixed-critial multicore systems - Jailhou=
se
>     - will be very well suited and efficiently usable. Once we have a
>     hardware.
>=20
>     Jan
>=20
>     [1]
>     https://elinux.org/images/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf
>     [2]
>     https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fd=
bf5e4385b1e6677
>=20
>     [3] https://www.selene-project.eu/
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-6=
40bd4acb560n%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/830ae788-2f93-4f55-a38b-=
640bd4acb560n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9e0650df-e049-614b-0fbd-9f978b66b9e0%40siemens.com.
