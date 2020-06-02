Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBFGI3D3AKGQEGICYKHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54A1EB90E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 12:04:05 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id u15sf651242wmm.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 03:04:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591092245; cv=pass;
        d=google.com; s=arc-20160816;
        b=0uCed/l0IGPrND+p3NrwyFgs62KksXBw5Abx4+w1Rz3Q0K9wqRjq8KA2yH0JLUSvCZ
         h7KFTHJuzzj0NPTdialuz6V5Iqj50eXoYloxGYBVHxJLom9LqhL0M5ZW2ijzvkCwrAm2
         U+ALRpT844lqX1Gt+u4DnvIuxbQ1yAUgxc0T6sDcU+vsBkX1XSPNclXUMPLUyS0ERP2A
         wsdrCfaa19lZDm3Dc72fjcJP98BJ2/1t0fm4LH5rg7E718ppPZBoJAtZNM3xtp6ogF/c
         NXA+NLdnvt31KIMw1Eg0ODBTrOBoVzgfutZEBsJjCBvBa6KJRe1Sviw2CF7mXS0Wl+JG
         95pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:cc:to:sender
         :dkim-signature;
        bh=W44xjpJbrijgRBfZLx/YBLPjL6NUmRq42fl49osTcSQ=;
        b=GW8Jom283zlTtI4Pdq+Hqf2BDdImt+o9eORrXqc+Kv6Ybupmo4EOsde/uEc6WFFaWq
         udfKW4YH9z9lUZyR+Ach9mtejn3oFzc//B/e+QVN8agR8M47ZsIOb8nU3bS0hFixAEqo
         2fpIyZzWHM6NH1uYA/1syTPhBh4pZdqXR4J8cY1J7AGjCdec+BUFPrLIu94VELXmplNf
         eXpn6WeAhOwyf68C+f+1itUthvXctbn6fBid5IhTsmaXBnDXn9KvMY95WXHtjmBy1/47
         x2seVcvC0/ARYJXis/L3QW0DCqrt3ONrb/W9mHQS0ul6GfyrLsRzPFlDT2/MEYiXnODu
         bLXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MbSkpe58;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W44xjpJbrijgRBfZLx/YBLPjL6NUmRq42fl49osTcSQ=;
        b=Diyv4ifWWj9qyTSWdh7Iujpt6SFpGpWnle5yTEXa4kEL6Z7Fsn3x87Re5HeB+uBfg6
         vMNvQ0cYmuXIdyuLBoF1CCGfFxZr0COdWgVK/ACNDObwCQOSQAJbH7oSsB104ZDaThVt
         ZEVxIm7foESKI33Zlr56dOcPnVloj6d8KTcMGz2l+eRdD7WnAFyvPCJa8X8U2G4xPqbb
         iTHeOs0Sd8iLsAidTHVJmS5B/2+6IhRlAyJC3HXdPiKVL7aEBk9yPUK25wzfNbhVcaco
         TePrispG+82PmuzDc8zWl+9+TKlFtjas7mnbXzw4FlGzKg8bH9amiON3rfONBuaw593W
         9RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W44xjpJbrijgRBfZLx/YBLPjL6NUmRq42fl49osTcSQ=;
        b=HtLBM+BmoHDgRmbqLIG7zFMpAdV8eYjJ9eUgU3PoHk9LJAj5gWm/S+O69RWe1LqTh5
         Tlhy8wHHzJ0/i4w5dw67oXdypCcNpPbv98n7RjHCg+6C32sVCBJOUKDoOJGK03mz6O9m
         rzkjR6EQzWZLeu8He1QoddY1jad+8BQpKZ1urjgo+7jh/UzNetZGlMB5A+Q1vQBhZvKn
         RMLEqo5l4iufr/NceYnCRDslpJ8XMIKCQ9/Q1v5+eDN7lGWjEn48QpdnIJEfC2gvcutq
         I6iQjPoxloZ9oZW0Eo58j4k2QweFxcY/tGGEaaqH7G5zvGpenovu2BB3d5KC71PlBITA
         zY3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dItFk4Q+5i/rvd9rpxg3ZgoXGcVfIYf8r9x1I/yUaY6wcfxYi
	xR7lFzxfwsuDsHa35I5Z1u0=
X-Google-Smtp-Source: ABdhPJy3k2gB0c9RRtorTgBYBHkQui07F2zyI+HLnc0iBxIbwjd82gfTrBqV4rkUkeJYLRsIZ0xvOQ==
X-Received: by 2002:adf:82c9:: with SMTP id 67mr28244732wrc.149.1591092244936;
        Tue, 02 Jun 2020 03:04:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a70e:: with SMTP id q14ls1273871wme.0.gmail; Tue, 02 Jun
 2020 03:04:04 -0700 (PDT)
X-Received: by 2002:a1c:544d:: with SMTP id p13mr3681229wmi.25.1591092244396;
        Tue, 02 Jun 2020 03:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591092244; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd9CSl+Rpzu26yrR2JVGuQVCilHTwUYl1q2YntfcrmmKF5I40duLsR0aizn22XPVHr
         CBEKIddu6VkMENN6LMJeFil9YbUztigK/LeD0Js1Ww5Uo4KgAnD3wigFRkpF9rzyRICB
         KSsnzQ9KlERrbB2ZW9uRfG6+g5W1ErMquFLc+O5ZVnt0GxkJxmNfZaavqIRTErjTYBuM
         xPYcqo3wsc7ZIaDvFClaZQwGiE6LIl72Lk4/ZbDwItE6ic2UvEjtEj33IEURBSAJPAbn
         bQEAX7GecmvtDJX+jv79RRTQfF7kHp33NR9M6MlDZwMNn+nQxx0DuBIacsNyx1qqFwxg
         FZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=lbCzOrNiV7l2AVxa4duWvcbtv12DbzI+HcwKck2htnY=;
        b=szW0nRqS5swbjFqczIhIhOcMc6WUJvBYNpWfCKnXcnHzuDEDs2MlIt1CvTXC8hU0H+
         jnZgi2CPApN8vhwJhlvXCGhZeKiynGIfv3wwXRXS5CC5BWUiesSsqt3qLLL2gf90vMpx
         8OkAT8WlY2qy3D5wLpsE+WW12SmL+hNgKRwVoOUvvZ28DPli/fVnCax+9mA3YQjmFBra
         CzqcOBpBQUat2fr5/MQ3f2bgw22ktP9olSczI1q3nWsCuaGDeWbwXniFYDn/79gQzLlj
         JfnDYgmqZaMgvunB46L1AvoGCzmsIzWPayBTp5c23gv+Bb+YCuFak9YjJNjpj/ov3UMR
         pATw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MbSkpe58;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id y65si141999wmb.0.2020.06.02.03.04.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 03:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49bngm02QJzyYd;
	Tue,  2 Jun 2020 12:04:04 +0200 (CEST)
Received: from [IPv6:2a02:8388:7c3:300:4e34:88ff:fe05:eed9]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Jun 2020
 12:04:03 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Mario Mintel
	<mariomintel@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: <buildroot@buildroot.org>, <jailhouse-dev@googlegroups.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com> <20200529204844.GR8737@scaer>
 <3806f122-f6b0-efba-e94a-64a3729fbe8a@oth-regensburg.de>
 <CAH3JsOrK+8F4xXhxm8ytEawBQ63jswzBG8PW2naq40M6MAyZQA@mail.gmail.com>
 <CAH3JsOrGo0k4S=VKfaXFbgkOv2jYvCB6nff0f+TihKz-1ok4JQ@mail.gmail.com>
 <20200601211902.GI8737@scaer>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
Message-ID: <8ede0323-ef3b-a405-81dc-80f92085ab93@oth-regensburg.de>
Date: Tue, 2 Jun 2020 12:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601211902.GI8737@scaer>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=MbSkpe58;
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

Hi Yann,

On 6/1/20 11:19 PM, Yann E. MORIN wrote:
> Mario, Ralf, All,
>=20
> On 2020-06-01 18:23 +0200, Mario Mintel spake thusly:
>> Am Sa., 30. Mai 2020 um 19:28=C2=A0Uhr schrieb Mario Mintel < [1]mariomi=
ntel@gmail.com>:
>>   Am Fr., 29. Mai 2020 um 23:40=C2=A0Uhr schrieb Ralf Ramsauer < [2]ralf=
.ramsauer@oth-regensburg.de>:
>>   On 5/29/20 10:48 PM, Yann E. MORIN wrote:
>>   > Mario, All,
>>   > On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
>>   >> In addition to official releases of Jailhouse, allow to specify a c=
ustom
>>   >> Git URI + branches. This adds more flexibility for custom
>>   >> configurations.
>>   > The overwhelming majority of packages do not allow selecting an
>>   > alternate location. Why would jailhouse be different?
>>
>>   Jailhouse requires system-specific configurations. Those configuration=
s
>>   are compiled from C source files to binaries during the build process.
>>   While upstream Jailhouse comes with a lot of samples for supported
>>   systems, you will need a lot of fine tuning to for a specific use case=
.
>=20
> I am not sure I entirely followed... Note that I am totally ignorant to
> how jailhouse works (and I barely know what it is). So I had a quick
> look into the github repo, and I noticed this:
>=20
>     A system configuration can be created on an x86 target system by
>     running the following command:
>=20
>         jailhouse config create sysconfig.c
>=20
>     In order to translate this into the required binary form, place
>     this file in the configs/x86/ directory. The build system will pick
>     up every .c file from there and generate a corresponding .cell file.
>=20
> Is this what you were trying to explain?

Yes. And that we want to use a git repository rather than a fixed
release for development reasons.

>=20
> If so, then I think we need a way for people to indeed provide their
> cells descriptions files, so that they do get compiled by jailhouse,
> without resorting to using an OVERRDIE_SRCDIR.

For the operational use-case, yes. For development purposes,
OVERRIDE_SRCDIR is works fine.

>=20
> So I see a few options:
>=20
>  1- let people provide those .c files as a patch against jailhouse. This
>     requires no infra in Buildroot, but this is not very convenient;
>=20
>  2- add a configuration option in jailhouse/Config.in, which people
>     could set as a path to a directory with .c files; those would be
>     copied into the jailhouse build directory before the actual build,
>     so the documented way (see above) will be used; those files would
>     have to be in a br2-external tree or whatever, but not in a package
>     (because we'd have no way to ensure that package be extracted before
>     jailhouse gets built).
>=20
>  3- let people write their own package(s) (e.g. in a br2-external tree)
>     that only builds the cell files. That package would depend on
>     jailhouse (or rather, the to-be-introduced host-jailhouse). And
>     packages could also provide their own cell definitions, too...
>=20
> I think option 3 is the best solution, as it is the most flexible and
> most generic one. However, it will depend on the possibility to
> introduce a host-jailhoue package that can just install the 'jailhouse
> cell cross compiler'. As far as I see, this is just a bunch of objcopy,
> but this is quite tightly integrated into the kernel Kbiuld process, so
> might not so simple to come up with.
>=20
> Option 2 is probably a good compromise if option 3 turns out to be too
> difficult to come up with...

True, option 3 would probably be the best way, though it could get a bit
tricky.

BTW, Jan, is there a reason why we don't (optionally) install the
hypervisor's headers yet? This would probably be enough to allow us for
compiling cell configurations apart from Jailhouse's build process.

Thanks
  Ralf

>=20
> [--SNIP--]
>> It does work as proposed by Yann. I wasn't aware of that option. I
>> guess that makes this patch redundant.
>=20
> Using a completely separate tree? Yes, I think this is not an option.
>=20
> However, given the above, maybe we still need a way for people to
> provide their cells descriptions and have them somehow copied at build
> (or configure) time...
>=20
> Regards,
> Yann E. MORIN.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8ede0323-ef3b-a405-81dc-80f92085ab93%40oth-regensburg.de.
