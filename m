Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB46Q3L4QKGQETEWGF2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB98244B98
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 17:06:27 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id d22sf3403675wmd.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 08:06:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597417587; cv=pass;
        d=google.com; s=arc-20160816;
        b=kH51t+p6VivKWJL/dJYwGIVFwrsYjF+BibcxabKTSx7t5EwWEv5olp0HTvFRFLGCcy
         cRnnfSj74RCjTSzVaW3xmiLt1iGqAHwMIOX31TG2byH9LDWECe+L3bihrd5Zq8Lyeqnb
         rkXVJfJEN5Q/YA75CPWrChJH8xDoVHVt7qQ66ITFyk40YltlngA8d7SLhm+4//OPhghn
         dyaDuQmU6+IUt79su56dCJEZJZ0Iag33slMGJHknFcaYmVEYe4Q7D5aVrecu1xTUe+Ug
         BkCnEgqLzC4pS4AubBwbEb3lQHHisdEqSaksHefujzvjzPx3nACtRFCligcAmdcqL8GU
         DQEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:cc:to:sender
         :dkim-signature;
        bh=aUqgzTB2cbmsXgUxpmU1HOm5SHsCeendG/DHhgJo7hg=;
        b=h5IsxpcsoHvBf+1KKXmkdPnTDj/qMhqeY2lD1JLMiIMoRcHg6Qi9OHBtOWyUbRGYo+
         t0cGAo3egUZDZH+SOSAIAPWy233PaVNet7ZdQm+44C0DuiV+gu59+KC/XzOWuz5P9HAH
         7HqgEkZ4mmRevWl3YUYNNJHwuhk71SuAURtzwTyNBNLo0pzJXI3VJ3Z/mB0bdZBdf/6F
         4M9s/ux45klTn412gTF1Oxdz2rZs4bENeGkFgSY/pZJYqpiliAT69frmyeWD82S56/qs
         JuDol3st5d2KP9L5uxOXcsG3HwXQYirqGDQGmaH+7D+WJBcUfJuOxVj1WIlAloKBgLB2
         KFdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BXqEPp0P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aUqgzTB2cbmsXgUxpmU1HOm5SHsCeendG/DHhgJo7hg=;
        b=eq2UwLFgD38hGIJCDZQXP+m+zwjun/RDZV2cwK5WCurhxdmAmEWPlgzkIZeqjMJgbz
         8WL8eNnvNI1fcGGh48P8QNNVfpB34ZhuZz9zVHAhGIIjbVD3AAmSB2J+HlWTprxheMaU
         gVU3ej9ZRa56yOzDKkqjHaC9l95QgHPyE4mmmjG3vJaFc3gKIRurLeJ3GzH0bcifq0iB
         unkpTEVAnbT9F9AOupaAka0ml61MkSmebv/z5mv38DJomjH+4JrXu+rbXjzXrsmsjrM+
         0WUxuXJHWKAPWVKf7OxTFeP1PGPX2e9Q1X+PX0U3+XFdyQrqjCNTEc1UjnGnbF+DK6C+
         Kpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aUqgzTB2cbmsXgUxpmU1HOm5SHsCeendG/DHhgJo7hg=;
        b=Rym5QmMdfZ90LgIyLimZXm/B9DUfIHpTYZMX2m6pK5pFnGPbF8clYIav1sTfu2ATYm
         To27i3LAakfC8IXX/o7BzoLkALemaE+Najivt81RyPYcWB1D3+HO4jRh4ANmxbGv0GAX
         dTP4tq98EI6pV5siiVjLKh2EUDKye3NkjnNLID0ts/SxkVwgLT8mEUsURYHdC94/8bnM
         C9BiGe2R+0DMY0qzHJk4IhJm2yfFCpy6+/Ej9qUpz1w4R+dVvpOYCpg7K0Sv8jAKLtzO
         HcHGCxjw/tjb2CvPfH4qQ22o5VLQ6WMem2QxyW9AOi7Rsy+JAhs7BCPLhH4uyGPW/r/w
         hM5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530h81EgS2T7TnEfdOOTP35zJDLZ3O7CFtZfr+s6dv7bcpkpjeiL
	BMYNnUGJZh7+IBobBlTnPAI=
X-Google-Smtp-Source: ABdhPJxQRcvfZqjufnkBRL6EvDg+ih1ur7hgB7ARx6UL14uQUPbF+BI5b4c4ALUbyBsb+a31/bqd2w==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr3068112wmc.155.1597417587682;
        Fri, 14 Aug 2020 08:06:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls4295273wmf.3.canary-gmail;
 Fri, 14 Aug 2020 08:06:26 -0700 (PDT)
X-Received: by 2002:a1c:750f:: with SMTP id o15mr3057574wmc.182.1597417586920;
        Fri, 14 Aug 2020 08:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597417586; cv=none;
        d=google.com; s=arc-20160816;
        b=jzRrsXZsL5+TyF9rSICGG6CqhoMSVUndFzzw6pPm0azfKDNd1NeaJg/aR4jwV91QA6
         cXBRRYTThwTzqmoHNW2l46aVRM0yBbB4DRmdkf2OV3w7d1dN4koiQcD2FVVa3C9e1EVs
         pU62iN656rQPaK5/t+c9Bs29ntsI9ODCqG3eM2klZQUaFgoBfPH36QTtLF4Hbul9G3jC
         L+G91P7ESjJ1sEiw80I2SpfP7nP77knaL6S362/8hZwx/DAnUNjKVfEdasM1CwzmXnus
         IeeUjXfu1TcTGPu0vrfAJyCWC322MS2FU4Iu64s/zuF4oKLXN6JQz5SgGQv02WXlVcFx
         pLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=pr/cUEZ3v9A0MFqEmo4TGkK4fuCQO1VFVIk50cXBiuU=;
        b=Y4nLz3HrvJSMa3AcJGUQoUe/YEOitjX5shtWry6EgefxY3y8YceA6ZrDAskJa4zoLY
         DpAJE38Z+px6JwfKQzUScTLLGI4R8G3Yb1L1BgbU+Z5ub6msZu1+eaXY/m/xDxgWh3Ay
         6S5bzrz0gygoJaPeLnFXOTOhPlPuD36rS2uMAc7QMYSVfvFhsXLf67UU+y6ngtqonalD
         fW4VJUHYYji78OWYhJ/9pF/1pcAvYXCuPvrVoekL340CuOQBct9TuYrNGxrXYHH2HnjA
         chKuApo7V7tWrARUq5ia8/yjErTIxuJryEnya3C0iI0V4OlXtNMfA75KT6qvYTlVmEFQ
         /x1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BXqEPp0P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h11si449359wrc.2.2020.08.14.08.06.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 08:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BSmwy3ZlQzy8h;
	Fri, 14 Aug 2020 17:06:26 +0200 (CEST)
Received: from [172.18.243.198] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 14 Aug
 2020 17:06:25 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH 06/10] Add libbaremetal
Message-ID: <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
Date: Fri, 14 Aug 2020 17:06:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BXqEPp0P;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

(+Cc Wolfgang, we recently had discussion on the boot process of Jailhouse)

On 8/14/20 11:43 AM, Jan Kiszka wrote:
> On 14.08.20 11:08, Peng Fan wrote:
>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>
>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>> baremetal loader.
>>>>
>>>> The Makefile code is copied from inmates, currently only string.c is
>>>> moved from inmates to libbaremetal. In future, we might need to share
>>>> uart/mmu and etc.
>>>
>>> Might quickly become confusing to have two libs. What prevents renaming
>>> inmates/lib completely into libbaremetal? Sure, there are some jailhous=
e
>>> specifics in inmates/lib, but those could likely be put in some corner.
>>
>> How about rename inmates to baremetal?
>> And add bootloader stuff under baremetal?
>=20
> We could do
>=20
> baremetal

What we provide is a minimalist runtime environment, which is not just
limited to baremetal applications (depends on the definition of
baremetal, though). But=E2=80=A6

> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
> =E2=94=9C=E2=94=80=E2=94=80 lib
> =E2=94=9C=E2=94=80=E2=94=80 tests
> =E2=94=94=E2=94=80=E2=94=80 tools
>=20
> and put the jailhouse loader under tools. Inmates is a "brand" in
> Jailhouse context, so it should remain in some form. But it's true, some

=E2=80=A6 yep, the branding is the point why we should keep calling them 'i=
nmates'.

> of the existing demo inmates can already run without jailhouse.

And that's the second point - we already have some kind of support for
this kind of use case. However, I agree that I wouldn't expect the
preloader inside inmates/.

>=20
> Ralf, what do you think?

Peng, I just read the code of the loader and I try to understand what
how it's exactly working. Nice work! Do I see that correctly: You
basically "imitate" Linux in a way that you manually do the early setup
(some register setup, GIC init, kick off all CPUs, hv stubs, ...).

IOW, you bring the system to the same state, where the Linux driver
would hand over Jailhouse. You activate Jailhouse, we then return to the
loader which got lifted to the first cell, the root cell. Now you use
the loader to partition the system, i.e., to create cells. Therefore,
you use the hypercall interface, just like Linux would typically do it
for us. Finally, there's the hand over to Linux.

But do we really need a separate loader? Can't we just place the
loader-related stuff at, say, the end of jailhouse.bin?

To be more concrete, i think it should be possible to have the full
preloader-thing located under hypervisor/arch/arm64/. It should also be
possible to link everything that is required into jailhouse.bin - so we
would get one universal binary instead of a chain of dependent binaries. [1=
]

Pro: You can make early use of the UART in your preloader without having
the need to, for example, duplicate drivers. That's quite useful for
debugging if something goes wrong very early. Secondly, you can also
piggyback on existing gic routines, no need to reimplement
phys_processor_id, =E2=80=A6

The next thing after early boot would be the handover to jailhouse.
Before the handover, we set a flag that indicates that we do an early
boot of Jailhouse. We can use this flag to do the full partitioning of
the system before we return to the guests in one single step. IOW, we
never return to the preloader once the handover happened. We can do
that, as u-boot already placed our guests and we just need to start them
(as we would start regular cells).

The amount of additional logic in the actual hypervisor core should be
reasonably low.

Did you already consider that strategy? Jan, what do you think?

Thanks
  Ralf

>=20
> Jan
>=20
[1] E.g., we could group early preloader bootup code to an own section
that we drop once it's not needed any longer.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0%40oth-regensburg.de.
