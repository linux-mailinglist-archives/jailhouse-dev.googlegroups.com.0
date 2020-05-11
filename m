Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBZNL4T2QKGQEXEOUULY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFED1CD47E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 11:07:49 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id o6sf4965487wrn.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 02:07:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589188069; cv=pass;
        d=google.com; s=arc-20160816;
        b=UU/7OLfbvQ+viYG9SQ5AQyhRcBPCvHB1Aso0KIo14RzJY22TZBk+EZpruDafFiTb15
         NCVC3rSlFFxoiu3/qPQ18gc5Ofs7+imKSZRIqOMLTNV1gp4mZPdUC1NgKHuY2qj/qPTm
         qWL5QS8jxetCHnQ1z5Q7w3mhybxRS2t66nvuI88UF/Z0XFbBRN5pHSys7VjafQmy40PS
         eQOpW40NFmujrXZAc/qFKDiVACDeI9S1YYvwoaJh/EvlgPXny5liM4ob1rfLSyRUlnAZ
         SOkZ3x1TEd1ATXnJcYawKO/VcVo3ksc4fc3C+xuSgH5Tl4T5bSQLVetBf6nc9WRw/PDK
         PCiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=oI/b6l0vDWevv/TkSLKidYoQ7I1OiME7rzFkqZ0JgnI=;
        b=WrdA2Y1ap8ZanJXyhm3BbL6qlAbbm8rRDfXasPIdvbHAWTYDuKxyuBOyT4tOrfgxlT
         I99YUXNatkyRhhP04U5COc9iq6PoMYHNrOYYZeY3+gkplYSo4Oc39Hf6vKY9bTTQVXKQ
         IkTHa6X33aSbZ5icA3m13Di/lPZxiguZ5Po+2DsMJ9IvcxVObQbz37y9u2hPmm3ILr//
         VPOQwIhFyYwBKNz0fUJVYcinWYBonZuwIveSpeGwU/917HYu/2Si8GqIAU5ui+ZO9Qh/
         NNUFKzrVZz5HxL4fgfL2Yf+Hll7cUSeaEMMls3UAZbp5cPRabnjtC7MxXNFl3sRILrNn
         GDPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y8l19A8E;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oI/b6l0vDWevv/TkSLKidYoQ7I1OiME7rzFkqZ0JgnI=;
        b=mqHEpD7da9YFyX9Cj1Hgcw7TZAmDdcBZH7FSXEDXqRv9WV/pnRArHJOPkASLiwurdh
         lJ5RBelu7/BpISV9ceb9qrNFnupDKBEgdnK7iKuMWpKV82Dp8wxw6Hsbagn8oHPw69Za
         KzJLcHuZAN7V+DKtvxHANNpuK7t9KjO8RD9W4z7ssKEm5wjZQMPTirp08nJJPVoJ7TUe
         9zQHARrWlD4SO+3GltAfYpS5D+Nrkq750wuWFKhopRjDFKhO8FPY/c6zR3TJRJPFpfRS
         sam/GP55Ahm2jsm2aJitdFBqDYgfiIry/pCupaRVdqtEQWhV3ITupodarLLPmg5l7wDT
         w+uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oI/b6l0vDWevv/TkSLKidYoQ7I1OiME7rzFkqZ0JgnI=;
        b=BxhCNmWjyZFdN4RTtTahsQP9nPkM3pGz3CTe3Cybc2SuHjtrmKiB34wnYXJCuZX33v
         sZbA+0cvwuUK3V7moc5qvevoGctFo+RPAyZmmeOBt+zBk1JQRK+ovRHV0UqHImyXR/MW
         Nf+Yt6Sx8J0DHm+LdnX4c0O7E05nXTc2oA4c5qwCDAMe26scCxCCWB5dcigMhtzM64FP
         uBKshUtJvgf4oySrwcefV6HUOj1f8EVDL/8Xu9BgjnU7WlyLmTRFNFhCr13mEKu03dd+
         B4J5HyQm4gOBkEWzx92i+PZspgGBk/x7lRyzvMqsJ5FIQ1a300TjoL905NMUG5trVFAm
         ntPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oI/b6l0vDWevv/TkSLKidYoQ7I1OiME7rzFkqZ0JgnI=;
        b=Y2qVCKegeTd6grM8E/XFoI2fj+AacHb5HKl9Kog5Z7hUqMe1wWbUe7BKTnSApwl8ef
         gVi6PrdH7di5CdCORmL8QHEQQwxIjoRi+qvkWWTeg3TgMUuCGVLWNnBPdyil/mN7uQXx
         IcHmj3OfLgL6+8ekcX/saJugFGmaJMZfHHK3m+og62QqyW6lfm4QvxuOrGQK40LtX3PM
         iG2kUE8M171CY7S1TG9ALrwM2x9m70oCK37VtIJQk+jUrTw1UYozUgixHsAHCK2AEZEq
         qWj+TymJXB4ISVSSG1+FkPFOnK/C2rLRlWtVjnFtyOh5kspI2UP7xpQlVOsrBbiOx64+
         30Cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaJ551cbd3JBbGylORG0yC/rHRT/bb7aJvztfQupUheZBZl1mim
	zzNjC4Agp5RIa27vNoeaLGo=
X-Google-Smtp-Source: APiQypK9SWv+q+NZwJ9vTi0Sw/JIsHj7EW1lhah+/rzw/YpxJEzaw2JBuMm+XdPYKpno614/xdrl3g==
X-Received: by 2002:adf:e388:: with SMTP id e8mr17486695wrm.174.1589188069427;
        Mon, 11 May 2020 02:07:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:9:: with SMTP id h9ls6235774wrx.9.gmail; Mon, 11
 May 2020 02:07:48 -0700 (PDT)
X-Received: by 2002:adf:b30f:: with SMTP id j15mr19081123wrd.394.1589188068781;
        Mon, 11 May 2020 02:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589188068; cv=none;
        d=google.com; s=arc-20160816;
        b=lFDihtXglKSvHEJ78Ey568HdtRTQ6filTuzmVOGxqvQ3O0G2wBHoW8EzfZmo5uQEfI
         LMn6u9XghaPWm4qyB/36JaGoNQi7dP7xAGXmn93uARri3GK56MczcJ5KqvuKPGSPydj9
         kAZIcJrdsCCH9C5cztMopEeFoXkv8NxTnam48cr6Z5FosAsUcHubhJktOmibY/22akZV
         YzUXaYPWstGD9+tEU2dNxnCLwv/eWpQrGBGhrIYhO+kQPRWtCp6iG9LY99KXWzrDbrkp
         Uld3KO7TMMocPtFCHws9l+fiY/dFnWBbzeiwHyonVLLwpplANQec9tlGWrKyZr/FuOYL
         tecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:cc:to:subject:dkim-signature;
        bh=60hT4uau7F0hpSNw1+u9e4H5PLBQh5aSGLN6CvWaAR0=;
        b=c6EFKGVL875+rOysDBliaJ/P+jgR2bEp1Q05Hute3Y+/MTZdFDRb9bk31d7FVcDKyt
         eUpK/stDcJE/7FTrPz5q6WMJpXW+XHBVDm9xeIdiyie6H8VSkrbxtutqocIBuczoB4Jb
         fbXDlK7iNu5d+Xc3VDFOd1RHNkJgwtf4EZKg/LfVbRYQwRq/GsxDJ3Md8q5d5MjN1cvB
         Ob8PA585UYFVaoEnBe62DK3coxZSht85dAM38at5o1RmrYP58Rm0Rls13sQRhN4syDti
         ps9UIOv3vsR08KXcueUm5Hiw7b1OSTFTW1C7Qm78wmfkn/2ZXQYZ1nED/J4lccMo68JX
         GpAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y8l19A8E;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com. [2a00:1450:4864:20::444])
        by gmr-mx.google.com with ESMTPS id u16si1010233wmd.2.2020.05.11.02.07.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 02:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444 as permitted sender) client-ip=2a00:1450:4864:20::444;
Received: by mail-wr1-x444.google.com with SMTP id w7so9912144wre.13
        for <jailhouse-dev@googlegroups.com>; Mon, 11 May 2020 02:07:48 -0700 (PDT)
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr3501146wrm.404.1589188068443;
        Mon, 11 May 2020 02:07:48 -0700 (PDT)
Received: from [192.168.1.101] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id x6sm16599210wrv.57.2020.05.11.02.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 02:07:47 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] driver: introduce col_load_address for colored
 binaries loading
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
Cc: Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-4-ms@xt3.it>
 <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
 <0af1c1c8-52ee-f822-66e5-c7926fac8596@gmail.com>
 <b58259a7-4aa0-7182-1ba9-b762be5cb82d@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <b4c2716d-c5b3-b08d-6c2b-ebb7326102a9@gmail.com>
Date: Mon, 11 May 2020 11:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b58259a7-4aa0-7182-1ba9-b762be5cb82d@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tmEgGIjYeXq4O3KYe9VugjhDwDQfetUQi"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Y8l19A8E;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::444
 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tmEgGIjYeXq4O3KYe9VugjhDwDQfetUQi
Content-Type: multipart/mixed; boundary="8dHzFSPl3TDmGlYdBVA2ufMHbFPqIqx48"

--8dHzFSPl3TDmGlYdBVA2ufMHbFPqIqx48
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/6/20 6:54 PM, Jan Kiszka wrote:
> On 06.05.20 18:42, Luca Miccio wrote:
>>
>>
>> On 5/4/20 8:33 PM, Jan Kiszka wrote:
>>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>>
>>>> Currently Jailhouse loads inmate's binaries by mapping its memory
>>>> region
>>>> to the root cell. When coloring is enabled this operation becomes
>>>> not trivial. To avoid logic duplication in the driver module,
>>>> use a special memory space when loading to colored regions. This
>>>> convenient memory space starts from a fixed address defined by
>>>> `col_loads_address` and will be mapped by the hypervisor using the sam=
e
>>>> size and coloring configuration as the inmate.
>>>> Since there could be platforms with different memory space layouts, th=
e
>>>> choice of `col_loads_address` has to be done accordingly.
>>>> Allow the user to set this value in the root-cell configuration and se=
t
>>>> the default to 16 GiB. The latter has been empirically choosen as
>>>> default
>>>> value.
>>>
>>> This is better than the hypercall in v1, but I still dislike the
>>> approach for the complexity growth in the hypervisor.
>>>
>>> I see the point that some logic - namely the strip width calculation -
>>> would have to be duplicated into the Linux driver, but it feels to me
>>> that this would be a better alternative overall. Did you think through
>>> or even try such an approach at all?
>>>
>>
>> Yes. Actually it was our first implementation, the v0 one. Our concern
>> was (and still is) the duplication of coloring logic between hypervisor
>> and Linux driver. We put so much time into this problem and we came up
>> with this solution and we think it seems to be overall the best one. I
>> also understand and I agree that this solution adds some complexity to
>> the hypervisor but even if we move some logic to Linux, a part of the
>> complexity will remain in the hypervisor.
>> Moreover, moving coloring logic to the driver opens up the problem on
>> how to copy in "strided" mode based on the coloring configuration. We
>> did it by copying one page at a time, using the next_colored in the
>> driver module (duplicating the code) but this approach was too expensive
>> when loading larger images (e.g, Linux inmate).
>> One solution that I see is the following:
>> - during cell load, Jailhouse remaps the inmate memory to root cell as
>> usual but in colored mode
>> - the "special" memory region mentioned in the commit is created by
>> Linux instead of Jailhouse
>> - the copy is performed virtually sequential
>>
>> The idea here is to exploit the jailhouse_ioremap function in the driver
>> module.
>>
>> With this solution the only complexity that remains in the hypervisor is
>> the memory management for the root cell that is introduced in patch 5
>> without the "special" region part.
>=20
> I haven't fully thought this through, but I wonder if storing
>=20
> =C2=A0- maximum number of colors
> =C2=A0- color stride width
>=20
> instead of llc way size in the platform data and using that also in the
> driver would obsolete a lot of logic in the driver and the hypervisor.
> Granted, that would push some of it to an offline calculation. That that
> would be a typical Jailhouse pattern.
>=20

I see the point but who will provide this values in the platform data?
Are they calculated or?

Luca.
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b4c2716d-c5b3-b08d-6c2b-ebb7326102a9%40gmail.com.

--8dHzFSPl3TDmGlYdBVA2ufMHbFPqIqx48--

--tmEgGIjYeXq4O3KYe9VugjhDwDQfetUQi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl65FeEACgkQI/rjb1Ch
6Kum0xAAiWq9YXC84kAPBji8c0xbTa1LXL/E2dj+2d7VQe4gjxPhmq9TlV4KBzfz
VJYks3++9ETCp2rmAujseWSs0yIc0DfnfxexNnYIfN8t+evPBIcETOw7zP3zvk3P
REDbFs54EhnSYhxz6f+4WFyrZXSbxk1Vnwv5PHXM2bu1/IzxYoGc8Ix7hYbQo7xb
3XFip+rrTPhEZbj+jQWWW9Ln4jGa3Y+xO9LdmnE0sGEJa/+jCTztV/00pNCZCxhF
KuxxPLVGr2T8XO6siJ7bPVyfbWdnCm3KonL7A7CExIcVVkfS7JXD5kxMgOBi7NKb
KVHRJiv/PCWA0FuY5QzVpUIGYs4w++Sr9X9hk8jkJEa4RyaGeM3FgtwWNxegwBaw
VGkF6Cw6eb4inxLTb8edsbYsx6UnRtCYaUlzdYOTIFXq1mBNA3fpojOy8NhPIIYM
1ux8P5ldyEMh1gWMKWYDDf+zZP7ioEORZH3yc+I9oV1ij/V1+kL76oaAovVVU1GX
/saHflLvthXa5/dXR1XtLNIwjQkNkw66xXgi0T7AFXzLj+uSYU0MBDGvAYxPKCJL
yjUB6IKI4n8mTkiqRgG+5ov5TBAVKgsCmUesZj3ObrpkfFlE3wHbHFQ9ZFFA/JBg
uI7J58SRq23k9DIXFMYsUzqewWjCkwK9yNQ/CDrkPS6LjnCotEU=
=ixFC
-----END PGP SIGNATURE-----

--tmEgGIjYeXq4O3KYe9VugjhDwDQfetUQi--
