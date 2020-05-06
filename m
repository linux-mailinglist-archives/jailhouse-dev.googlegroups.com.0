Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBGOVZP2QKGQESZKNTAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id C69251C7706
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:49:29 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id j5sf1555536wmi.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:49:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783769; cv=pass;
        d=google.com; s=arc-20160816;
        b=oCOyiHCReDJmJet08dyFALtoajnrb2Qj8dz8hbg3kCSb1A2QR/CgC245s/ktLslx5I
         VkKZyKbn4xxPGMsI6oLwZcytPYUUk01AAvKtCb07CH8eTWtqH/A4UgN/pg0wn858MLfF
         DiXk4fTgficaDdQu0ivAdTbEr6O/fi8Mq+fm6CSEKL6KFPVf2wJ4ou21b/V4pIfAgHKN
         0bndhAKH6nKXIOygjKg5uOiuYmSIaHBhs4DYb/LJJt4dAR9gKY6sWWuw85eOge5JXJwi
         ushMToeCSWiRs7IyanFLq16BBlAsNPnOGxudG/R6FVgZy2qFjXuSRig1Au2r5iW1xQ2w
         /NHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=fXHyg1khEc+xuNl12sQ+m3QxVKjO0PXc44jIj9hjCJM=;
        b=kBw5Ry//0yl/ouqv7cbhdjKgtXncq+79VPglNwoSb4yg1QsvLAl9A6dBPKW2LNgxd+
         gNHhWBpwQicuoRi2yMchSik4XtKIT34t2m49TDyqaFJgUYAyDsusXKSGjkWyXaNUSDKQ
         /VIHXklS2MVw8LzQCUjTsFFUZFDldKgx185pDd6hlfGCAx71+MC9eGYZQy2aBrTwFEzj
         Ccw6Xfc9tTcnTjEfi7iFWNXE2UuLRKNeWkgD8l3I+IOz/sFEkhbqpxZJPDjriePGk/RA
         AeDbyMt9DP88uaO+7+Q3/x6HqW84j/irAsbzTJP+edO5eq2CLlnXEewp05W8NGqu0av1
         ZuNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0Co15uD;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fXHyg1khEc+xuNl12sQ+m3QxVKjO0PXc44jIj9hjCJM=;
        b=Vzc6OxLuCq/yaEjdQ5zZ6UrfJLm2BXqaHEY/47mH/Dyq6b0F5HZ7uP+6vSrq6nuhk+
         pD93zqbjFQv6BVFi3uZee5LYi691me7aDBRmI14M44hHt+q0+XM419rSB/TsZgvyw+Wi
         OvwR79eoAZoEz4UXter6xUB4hEEHItOozweN7aRapJcIpElnJCpc41/U+/0dtX7Vjb47
         xsFIYkfxOjAs/2grIPQ9m1h5SANrnp44B5OSQqmIdp9Opxov9GDzqZYOBJRSCgTrPYAY
         mjuLmDS0dmPhgarqs5Y/zXLThO6KTjAbhm8uIqBThV61ZyTnR38q4UmDElB1nOPFfmzy
         1e/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fXHyg1khEc+xuNl12sQ+m3QxVKjO0PXc44jIj9hjCJM=;
        b=CpMtepkVGck0ydYf7RIvpNR3H90Bl3qES3nPrkzEWBkkENKhdLwP2s8uXmgqH5huaO
         hE77YOPZHhfNgT1utRPvt6F3xvJsKNd/YLX+8DKOmYTn+hoR7rRRQTKoQeApchvFCG8M
         odmA9Ju5INJQlIy6I/mb1BOoIyKQ+l7DIOX+9O7pujGJV0rhpXoZ6Kf4yYvekTMnop7g
         xCWbKBBculRNIyew+fOveJJmlmgvbJJby6PH1T8gMTCBl5EqlGxLS6hyMnULy45IqlhO
         dWi/i5mqFJXq2N61l5Bza0ckCBez1zynGeRB0d1hiMsB9u6kF4zmO/LUiYZkiDkaqj0V
         B+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fXHyg1khEc+xuNl12sQ+m3QxVKjO0PXc44jIj9hjCJM=;
        b=LEqBqxPHCt8PiyLaU8un3vLUe9a/pGK9x75i/kp+JtrCnVqw0UwVzmfBb7ozh5zad8
         wPPVZCBirVZmDlDiK/xSOnk14X9UKyrGAoDHncTXyoKPmLDehk59qi4EUqTC7Qcnuk8g
         3HXoSm3QRreG2p9x+bcBiXf/reCXCt5vsgpeUgcTJMbSD8CkDoCSfJqSUAKBFN0Ty9C4
         m0yaDcgGwSGc8eiJA/RYsc//Tbe/Y7oSTD+jxH7w2BiHUzdWkYZRqI3tYy4pkmwkJXH5
         385955/pAfyhwZk57hIZB5Gv3jdnqChD/7Wha58nt9sRvJD7holODQhXplQq5c87S6Wk
         x72w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ9aFyTYgD81xYlh09DJ/qZIkNBNSTsUxll3Vyr7u45VN87pBfi
	I6ITZUOQIqrmaPeoD8AOMJQ=
X-Google-Smtp-Source: APiQypKfBhKz4YPxovKyn0erCnA8uNRIeq1UCRF2Soc4w1n6cbN+kGD2cdSIuBNl3HtBVJAkPTUIkw==
X-Received: by 2002:adf:978c:: with SMTP id s12mr10255960wrb.312.1588783769555;
        Wed, 06 May 2020 09:49:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:11d0:: with SMTP id i16ls4620805wrx.10.gmail; Wed,
 06 May 2020 09:49:28 -0700 (PDT)
X-Received: by 2002:adf:b246:: with SMTP id y6mr10685329wra.205.1588783768769;
        Wed, 06 May 2020 09:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783768; cv=none;
        d=google.com; s=arc-20160816;
        b=IxQF013Lio99Q5uvSyui7l2v4sWiAiUV+QRmx3WZwSSwAtHCmCR82m+6tJq4VM2sdT
         bGp/ACZ7SUY4o3bWM5nOUEXyBhf70tGCikUgqSglC4QGNKuamXWRou9NaMKc9itNvwZH
         gvnlvUA+UeuJOvhG6sDOBfxLqe+GodGb2pJre0myfbzua0xp0NIOgB8T3MfuV5bY1Y1K
         cijceMqu81RxrY/OG5DNVuw9eN47+iNrhGRDCFHIScvfemrz4mbWHTIPB2ZKHWtry74n
         kzNvgyODTcta0p4+9HyZcehNNqXmvdK6p+IZ6Py8ybwtvOEazg/QOZiL0hi0DTMKxcl/
         uE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:cc:to:subject:dkim-signature;
        bh=kSbGmJd3N8XV2MEAYrwmi9AC4fHb4mWA9nk86VSvhZ8=;
        b=G6KgVAH5bBi438gQjsKPw/t4pmAjMBHZ/MLo9p/tQ2wBDijnNxch85e2HEPU5DjGKd
         BGRciNmoNC3UZ36xMl5cx4rpI9MXz0k9lCAa68rI5b54LIWEOFKHS3CKrn9BWppHwWtl
         0p80pLQUDR5huBIEQ+N/tlKtE5VeNBvftt8uA1BZMmH/N6ERuyeBpQxv7pf7DAQFtBWO
         NU4V37vuswZRZJa1cPLpIeiYQ/mtn6HUbpASJVYZpHjUjsCZIs3sVOeUYGszbT+mbCT4
         6YL9E4fPuqCCGiifGAlj2PUlWcMaShOJuIleqRxb8WGOmjhi2KuBG7kATv3vzxHtgxF4
         YupA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0Co15uD;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com. [2a00:1450:4864:20::442])
        by gmr-mx.google.com with ESMTPS id o186si375116wme.4.2020.05.06.09.49.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) client-ip=2a00:1450:4864:20::442;
Received: by mail-wr1-x442.google.com with SMTP id y4so2996528wrm.11
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:49:28 -0700 (PDT)
X-Received: by 2002:adf:e7cb:: with SMTP id e11mr9924318wrn.145.1588783768352;
        Wed, 06 May 2020 09:49:28 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id i17sm3810033wml.23.2020.05.06.09.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:49:27 -0700 (PDT)
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
 tomasz.kloda@unimore.it, giulioc@xilinx.com, claudio@evidence.eu.com,
 fabio.federici@utrc.utc.com, Angelo Ruocco <220530@studenti.unimore.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <73e484f4-5473-97a6-424c-15435fa67324@gmail.com>
Date: Wed, 6 May 2020 18:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XHmIN2viGUCzu6VhICtvTedTh4ukQglNc"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=T0Co15uD;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::442
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
--XHmIN2viGUCzu6VhICtvTedTh4ukQglNc
Content-Type: multipart/mixed; boundary="dGHDUmQEFagMycxrxsQRKlDNBKPKwbori"

--dGHDUmQEFagMycxrxsQRKlDNBKPKwbori
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/4/20 8:54 PM, Jan Kiszka wrote:
> On 22.04.20 10:51, Jan Kiszka wrote:
>> On 22.04.20 09:22, Marco Solieri wrote:
>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>>> Predictability of memory access latency is severely menaced by the
>>>>> multi-core architectures where the last level of cache (LLC) is
>>>>> shared, jeopardizing applicability of many Arm platform in real-time
>>>>> critical and mixed-criticality scenarios. Support for cache coloring
>>>>> is introduced, a transparent software technique allowing
>>>>> partitioning the LLC to avoid mutual interference between inmates.
>>>>> [...]
>>>>
>>>> Thanks for updating this! I will refresh my caches on the topic and
>>>> provide feedback soon (I already have some questions and remarks but
>>>> I'd like to double-check them).
>>>
>>> Looking forward to hear from you.
>>>
>=20
> Done with the deeper review. Overall, the series looks fairly good. I
> see just two bigger open issues:
>=20
> =C2=A0- inmate loading interface
> =C2=A0- more architectural independence
>=20
> But I think those should be solvable.
>=20

Hi Jan,

Thank you for your time and for the deeper review. All my comments are
in the related commits. I also think that the two bigger issues you
pointed out can be easily solved.

Luca

>>>> As you likely read, there are better chances in sight to also address
>>>> the root cell issue by booting Jailhouse from a loader.
>>>
>>> I share the same view.
>>>
>>> On the other hand, it ties the cache colouring with the
>>> Linux-independent boot.=C2=A0 This is not ideal from an quality perspec=
tive,
>>> because it introduces a dependency between otherwise unrelated features=
,
>>> including one definitely optional (as long as Jailhouse will stay a
>>> "Linux-based hypervisor").=C2=A0 Also, from a process perspective, it f=
orces
>>> the colouring-related activities and deliveries to be postponed after
>>> reaching a somewhat stable architecture for the independent loader
>>> (colouring pages is a loader matter).
>>>
>>> The other option is the hot-remapping of the root-cell memory, which we
>>> already wrote and tested on an older version of Jailhouse extended with
>>> a SMMU support.=C2=A0 From a quality perspective, it looks comparable, =
and it
>>> does not introduces constraints on the development process.
>>>
>>
>> As pointed out back then, there are still open questions regarding the
>> reliability of such a hot-remapping approach, besides the complexity.
>>
>> Anyway, we now do have SMMU support in Jailhouse (first issue to
>> report against your series, patch 9 ;) ), we could look into that
>> systematically.
>>
>>>
>>>> That would then leave us only with the question how to handle the
>>>> hypervisor itself /wrt coloring.
>>>
>>> Correct.
>>>
>>>
>>>> Provided that can buy us worthwhile improvements.
>>>
>>> We already have experimentally proven on two other hypervisors (Xen and
>>> Bao) that the interrupt response time hugely depends on the cache
>>> performances of the hypervisor's routines for guest injection.=C2=A0 Ca=
che
>>> partitioning is therefore mandatory for predictability.
>>>
>>
>> What measures did you apply on the hypervisors? Replicate the code
>> into memory that has the "right" local color? Ensure that core- and
>> guest-local data is in color memory? How did you handle naturally
>> shared r/w data structures?
>=20
> These questions are still open. I don't see hypervisor coloring as a
> must-have for starting to merge things at all. But I'd like to have some
> idea of the structures and interfaces we merge will not cause massive
> breakages when adding that later.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/73e484f4-5473-97a6-424c-15435fa67324%40gmail.com.

--dGHDUmQEFagMycxrxsQRKlDNBKPKwbori--

--XHmIN2viGUCzu6VhICtvTedTh4ukQglNc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6pUACgkQI/rjb1Ch
6KvJqw//ezURkXHQYt2IWG3url45vzk60ldKku9nDmJZYbS4NiTbZmC4Unjgpyx3
C8o4+RRPOhonechJrro3yrMM3BjEvVJO5GMMDElgQFGyzQwP40pofY2SzSMMhqvZ
9qnGN6kkQjl2LATx6Vtk9NOAROpeVeV2s5h6sao0CxJtDP+3fjLGiQxBrQAog+5W
MvRBxr2duYg14cdyTPYxp8CQhgKnSBo9ZeErMcnwddJLdFX9mofpG6tYAVlpEWPD
WSxvPnbrJgMPbJIrzxZwjMzL+8MiUieiKeswwwX/QCaWNvwKFKz5mZ61hzW0lApa
FuhknRJx3isnNXAJb7vFuib4K08JLRkLIGX3pbmyTmcUUg6pHDe4Hf7jN1ZCm/D9
jXDbrIMaR9XVSSJu1nkYylYfAnjWjU5t3++2O3F5j8sPmTYcN18o4VAUMxZ5uZVb
NT3BWPRAzVhBvQPv/RGinHYbRoISoOt3iNGtkXngf/roUobTwO2JapzV8TOcTIQ7
SqNf1YyKwDrhaQS3aZhktwYnNL+6rT/w/+2giB8rK7158y+4QiAwiquJb3tFWYt5
x9S+z2mO0S6LKCmjJmizxLZoE7PLwdXm6T6GFgDLph40TQBdGa8+gcmGvIflNOcz
EErgoXClSxE0p8/jGJIjAStdtRQUNR6Dp9fQlJCcCjOwgn1DZQE=
=tfMk
-----END PGP SIGNATURE-----

--XHmIN2viGUCzu6VhICtvTedTh4ukQglNc--
