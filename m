Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTX466VAMGQEWB4TKSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8637F4767
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 14:12:48 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id 2adb3069b0e04-507c4c57567sf6632424e87.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 05:12:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700658768; cv=pass;
        d=google.com; s=arc-20160816;
        b=dyuYhcfb1iSIXPo+kFQ1CFJpvINA29oZ6OfqmJBKA40OXpZLPuACl6GTb0KSpqRaBf
         UDL+2w0wkhO5izBWHrWUH67oM6zC0hyiXB2Qsk3+UfQnbvXfOVJfiNjRjyq/9P3p425z
         9v6Zzp0T6r6lmLAsBVjZd+dRMzL1BiBvepk5LpCXmPq8eNtsWEV/PpAjhhCAoX5M40tO
         UxfxhvGlB00xxg7WJSEoeAoJdy8JNDc2GNoiFFXCY4CfhJOgPVlpR76A6dc3NV4Hdz7/
         uR8J84zcZZMuALTIVj1B+Rngb9mb1mnkkRmBkPAI/w6+kAFQyhkaNsIaXiaHtkS1ZD/q
         TNDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=YaCC8rCeL8OsqGNr45saWQqBgOc+0VoryHoug8y4kiw=;
        fh=8SfdoBx/XJgInw4b9LBcr2wFSMupRjR7ptGMcTO0h8w=;
        b=NNV9rF3gR0ECHTqMQ2jwTeN0U/gzTplJ+rxDNqpPmLvMCQQxNY5RnS2KDZhWV554h3
         jTKUi1MtiVHA5ci1V5lSj39ApywBmX6G6q18Ff/rn+jkGB0D6Y11MZlizA1CKVpEJyQP
         zp+pO91ciP48+cHfIrzw8+IEiqvCvjxcb/FNXVqwzQGup71r2YUGO0d7eHZDsOMgPUnV
         ClHlJqduNCIQ/dGn2nFNpeLadT9KySh5rwRf0/ZFZWAhmBvyAU9Cmt6iNl7vMnKSMW3+
         3XEhs3dRkV/40AQFA5BEEbeASa3zwJ2Go6XwT2ZK+vfUnsvHPjPW9/eGcTKxIH63h5gs
         meFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i25QzE04;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700658768; x=1701263568; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YaCC8rCeL8OsqGNr45saWQqBgOc+0VoryHoug8y4kiw=;
        b=nWBPBwEXWf5/Ay3gLt1hydjYbLLEejiOf1W7riSA4AihVVbjqvJ5FgnmCBKMwzybCn
         3TiBAuUCe1/qUy3gURWBJZTLgkOqaBypLyzT+j59gmNIA16Qp/MshrgoaN6KMus4pwKh
         z9nsYP1PKrjBrDFSBwbHGyi+b0J0WHSfqmwZ7sJDkoZNdAQIz2ucDhRorkea7We8NxYu
         pdDE2o8DJ8r8vUI5lSxQw1spBXYLN891gYcEAmYxFu5YeSwFdAY+wwo3FY2G5tNL/VG3
         B8R7lpgAF1vEHqay2TvZSQXnxkgZBfPy7EaVN65nhhNWCp9GLke8o5SccuGDzP9VSZn2
         tqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700658768; x=1701263568;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaCC8rCeL8OsqGNr45saWQqBgOc+0VoryHoug8y4kiw=;
        b=GvA4RVtSpuQf7wD2mHHO9jQ5ZiRnuXl/c3K9HYQDW/cm66wekMX4vMauBOmkdC+gkh
         VCWAn8PRc7OitKUfpRSO81ncu5Z9+UtNjci9TQqttjBlRIC/JhIOmnNAG8HYxiyWzltW
         XxtaC2Sn6jKqdE8qRwSrqdmJwW4+2NC68ywxH+JaMpmPAf6dp/NtLORf9SlbXONHEfTf
         cvkJ5T08ufjRwW/+s1/BqdOUSZW6ViJHGW40iXdEh2zAmk3bhnNJ4DRWxfzP00YJ2H0f
         LRMGGkQtJO3tv6GNfu6ezt6QUJWMCTOAOaLSrhCbCT6Kh1bBzLpTtidDZOC0IRDrpokq
         3oaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw53xObLlqpQqqrZusiVqeLWdjhfc/brOybaF/sT0CjHYgWJ8eb
	UU7BlV3O/tCjVIyt2uexQrk=
X-Google-Smtp-Source: AGHT+IEVvEi8Z7MUNysOn3q8TBI6hZaEUwDHtWfiKApe3srOMtTpkACeyamg6FWwPR9VTN6OYqk4mQ==
X-Received: by 2002:a05:6512:360e:b0:507:f0f2:57bd with SMTP id f14-20020a056512360e00b00507f0f257bdmr1430994lfs.66.1700658766795;
        Wed, 22 Nov 2023 05:12:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d8a:b0:50a:a9bd:7eaf with SMTP id
 k10-20020a0565123d8a00b0050aa9bd7eafls655464lfv.2.-pod-prod-03-eu; Wed, 22
 Nov 2023 05:12:44 -0800 (PST)
X-Received: by 2002:a05:6512:38a7:b0:50a:a337:1f42 with SMTP id o7-20020a05651238a700b0050aa3371f42mr1432757lft.36.1700658764065;
        Wed, 22 Nov 2023 05:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700658764; cv=none;
        d=google.com; s=arc-20160816;
        b=Rs+XWx0379HvfvwWZoVrVjd9Rg9pzs9OJglfaTIo3tiyUzx+yqVJGIdV97dKaKCYBx
         L/FxULD7Q8Yx3VqqdI2kUXZNDNq/WUqB5R+5xiR9LG2S+2RC2Sd8JMtNftK+KqHPT6O/
         FHstj1AB0zUpKt/Xj+03Z2RSHJxQkAVjiqKR48hCcuRth1pkZCgzieV9CRq+bxH7MRjb
         8AGI+WGnsHpsrmAzSfNyx/ZRL26zFGuW2dUkiUeR/v8PdWEeJ8MhfHowKFAkG8dIzQMA
         8/67Lkj5YFn4gqBG+NvlFtLLlakOUNYVghU3ZVgE5fOCyuF++rKhW7xyWLmIIpSKhzTW
         DJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=brPIyG3cTvhvA+nN5biGg4Em+P8QfHRMjUfTCu9aMtk=;
        fh=8SfdoBx/XJgInw4b9LBcr2wFSMupRjR7ptGMcTO0h8w=;
        b=AkeMbz7S2qkF8Jpz8xOqY702rtqF4Tbo7BmDQmxf0+QzyUPNpBE13MrAzxCjkFv4nM
         FO+JgWJVznGLgbxdGryzt1UUNk8DO4kWjakFLDreq3mQlnADAmynC1KN39TYqnK4a9Vq
         l2689/6FFnZnxODGFzyFTdd8sdLVeCDmStgTsPz4BjQv2DuOf6NJPxm5y1h+ECHGAbQt
         uS/dHBOXhRhqdf0Fv1t5R4O0g/IJsD4tIMJJWDhv0VilV2toJK8WBCRmiGh6zV2LnG4q
         IixH4UKWps/zWWrCIkWsCMyafINqpfPlCAiyEMWv3DZWEfYUB4tKvynqt1WY0feVsT0h
         I7gA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i25QzE04;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id fb13-20020a056512124d00b0050a72e696casi565522lfb.6.2023.11.22.05.12.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id E778B3E00E9;
	Wed, 22 Nov 2023 14:12:41 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Sb1r93NRSzxqw;
	Wed, 22 Nov 2023 14:12:41 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 Nov
 2023 14:12:41 +0100
Message-ID: <184a93de-9ba3-4ad2-9771-f114000eeaf5@oth-regensburg.de>
Date: Wed, 22 Nov 2023 14:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_arm_cortex_A55_support=EF=BC=9F?=
Content-Language: en-US
To: =?UTF-8?B?5byg5bmz?= <2022280902@qq.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n@googlegroups.com>
 <CAEfxd-9ruixKv7sB=EFhnH6Uw4GsYgDnpKjtCqBrRGtkbtxuSg@mail.gmail.com>
 <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=i25QzE04;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
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



On 22/11/2023 06:53, '=E5=BC=A0=E5=B9=B3' via Jailhouse wrote:
> I am trying to transplant jailhouse on the A55 core, but now I have=20
> encountered some problems. After I execute the following command, the=20
> system will freeze.
> $ jailhouse enable renesas-r9a07g044l2.cell

No error log? Is the debug console configured correctly?

>=20
> What are the possible consequences?
>=20
> I made sure I did the following:
> 1.Linux kernel version 5.10
> 2.Linux starts in EL2
> 3. Turn on KVM

Do not use KVM in combination with Jailhouse. Disable KVM in your kernel.

   Ralf

> 4. Turn off kernel CONFIG_ARM64_VHE
>=20
> Best regards
> zhang,
>=20
> =E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 11:04:24<Peng Fan> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>     There is no difference to run jailhouse on A55 cores.
>=20
>     '=E5=BC=A0=E5=B9=B3' via Jailhouse <jailho...@googlegroups.com> =E4=
=BA=8E2023=E5=B9=B411=E6=9C=8820=E6=97=A5=E5=91=A8
>     =E4=B8=80 13:47=E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>         Hi All
>=20
>         I would like to know, are there any examples that are adapted to
>         arm cortex A55?
>         Or are there any SOCs that are arm cortex A55 and have
>         successfully transplanted the jailhouse program?
>=20
>         I saw that A57 and A53 products have suppressed jailhouse
>         applications, but I didn=E2=80=99t see A55?
>=20
>         Cheers,
>         Zhang
>=20
>         --=20
>         You received this message because you are subscribed to the
>         Google Groups "Jailhouse" group.
>         To unsubscribe from this group and stop receiving emails from
>         it, send an email to jailhouse-de...@googlegroups.com.
>         To view this discussion on the web visit
>         https://groups.google.com/d/msgid/jailhouse-dev/ab8484e8-cb54-4c1=
b-ac78-ef67bb1bf4b3n%40googlegroups.com <https://groups.google.com/d/msgid/=
jailhouse-dev/ab8484e8-cb54-4c1b-ac78-ef67bb1bf4b3n%40googlegroups.com?utm_=
medium=3Demail&utm_source=3Dfooter>.
>=20
>=20
>=20
>     --=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/f23d0d17-ca3c-4807-a7b6-0=
e2154ccbe75n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/f23d0d17-ca3c-4807-a7b6-0e2154ccbe75n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/184a93de-9ba3-4ad2-9771-f114000eeaf5%40oth-regensburg.de.
