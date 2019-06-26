Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB5HJZ3UAKGQEGLMMKEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E665704F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jun 2019 20:09:58 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id z6sf3823847qtj.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jun 2019 11:09:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561572597; cv=pass;
        d=google.com; s=arc-20160816;
        b=LhSpYKvDvHaZ5h5zkW0zBZXy4CUM+07lj+PcJM5BbH2KMxbNaxJVT+WNyy6sMGJOcj
         lswLcwZ9xzwnqLF6zbNCyJXifjcqMXIQwMTZJa9MFKFFHgtOGM1Mj4kQ1P7ExBX9oFU0
         vqQ4Zr70DqEgd8AM5wpsyJNxoDa3epdwZSjDXUkW+Oh1SzqtWRG962QLXylNR7PTmYwH
         j3jjvPgxGtxXNYsdptMEcvbDU/boFCIMEEUyeuzxDuoh/+v2w4msKxiK5qRRape+SnY4
         eaTrK68CJ+qtmCmPrZTbevoKcngfmVwS4slBJ2jV+CAHhytSQCVw4Dy29nDF9E7z7uvA
         SIDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=kfZ+JI82Ie1kvR5KRrw9ibjrWfrYqHg7Xw6Fjouh8QU=;
        b=0kP1XXW/oR75P09MbsE2vYnsIW/73i63Kfw7s9R2TZotZU95IqHJ2YpnyytN+SnllO
         MpHAGEb+bzFQlisBTmsHk49/go0pVzc4EdGUhO5LSEjhzoL5IdiOAypQdAqCdQutNX/N
         xwQbBmD1K6LDfR5td4dJ4sy/zJHpI2GOFE5V1wEnEG2Fwxk5QxSnbsobmyTiepNNJFgR
         W74BjYAfrLWncqxjtrgqDHWczm30HzOE/TPMXDXb2a15jA1zrD+n6VQHmkBzwgDEC59e
         svsotZKYu1MQho1dS5l2oaayRaezp71/OqH8XqOZjKceUtfvc51dBQ9U+tpBrmhvko9C
         G9GQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F2L4Xliv;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kfZ+JI82Ie1kvR5KRrw9ibjrWfrYqHg7Xw6Fjouh8QU=;
        b=Io1FERMLHOwm23jasCqxjXzOp6RUq0rIjc89n6xJJZ+BEQdbPiXd7CHVPmsdRiY61Z
         PJFH1doedWoGRKR2V2A6jeG3AF+wq9UCJUT2+mEjaEFH+mFuMs3vRMsvTnYA1N1V1fpF
         kOZK/dFMnbfrBzG8GuWNfQ0Knq9ljTorDl6beQ/n1zbhoDw1LhlSqeLoV62ksCIjSzPG
         E/RV/wjnMWX1fmJ0IiU07poucMd8gH6/nNZNWpX6aGwi4qWiCAzM0aHS3xduQUySMQ4w
         cFoFvtOLDZUIa1r5ik5o9JdoNtS+2hLNsu7KMMtBH5bqaUZSJUzoTuTXwBgvZgCvI6Vh
         NMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kfZ+JI82Ie1kvR5KRrw9ibjrWfrYqHg7Xw6Fjouh8QU=;
        b=puK3lLWvXjYPm7RQuS21ywDcakMOO9Eh/WF3CAbUpvnNUShMjBIQCAtcUv2yDmdc2o
         53ETLgkjDuckKN3ERNnCaZDlH4XYEVkhTygHUiERiwBRZc10CtC8qiOQmHlTuvtg6xgR
         HklsOjG/+nYxOCTMABCZEy4MY5i32L+RZuXpZVHYjaDoCKC2u5g34GKrJajIq4sei70f
         O8l2f0iwJ9gcZ65NrzF7yeBs59NngxOoVPq6U7bds79dkYNVQj81HlF01DRiok0jnB0l
         I/burD1nMpR3ebWx6Em3yyKI7RYT2caoIScSziaaGrMEL3tCRue3/PM1PGUXJEXYCiNF
         arAg==
X-Gm-Message-State: APjAAAXBQkFk2WYmchOHc6FMGI7vAxOCrE+XJJrlMhO62BWSGd2LUdei
	4sHVA40oNcYrBkSImJwcJR0=
X-Google-Smtp-Source: APXvYqz08CB13JGAphqQb+12b34nG1raSadkZafThbLKWYMj3j4CxWR/+mzSWYD39/7pYbw9TY53lg==
X-Received: by 2002:a0c:baa1:: with SMTP id x33mr3637858qvf.200.1561572597101;
        Wed, 26 Jun 2019 11:09:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4897:: with SMTP id v145ls649029qka.5.gmail; Wed, 26 Jun
 2019 11:09:56 -0700 (PDT)
X-Received: by 2002:a37:4793:: with SMTP id u141mr5272844qka.355.1561572596532;
        Wed, 26 Jun 2019 11:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561572596; cv=none;
        d=google.com; s=arc-20160816;
        b=UAS6BH3QrE4XAVrzqoP9yarHxh0vGxrvss8m4LXIvhP4r1OagHYXIvetEj2fjl18Hf
         NT8XrLMa16TFoaOhqk2jrY79bcUaiB6+QWsT9kCAuEJA1MgQ1AHvO3iRZwQoMvyZx3L4
         IZ9BueQJrV27vYJPmcUpBU8yal44WIIFelXHP2kFrLS6YRtu+xJFGwFCZQaQ4/33LhHQ
         VI7CAvvt0FdRvd/BT0DV76RFUaLlDe/ETHYoko7MvKnVekOTs1ougFxktVV4Q2pdjEUi
         Nu+zRpeefsc0I8PxHUpFqUe/ykAA8JHKpHXiKMs1pUUmEPwTYSx1/WK0f15KFCW8RorA
         uetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=2xR/gDOdKI3IUUVSWnuMIr+tPQiLJUUFSIJsYvFebfA=;
        b=x0F8oR3jMUwiKYLMxWDVhClD8GwCKhVCeQdB6ljMla+wYc+aVcKf4XdtR/fKz42Yki
         D5EVJX2vOak5YvAAW/iNtw/Q2nAfV8Zi2LvltsUBWOhGkibDwDLqVm32VLEPnQ9G+sCj
         gxiwZDzzAQ7XJ/McCuVUGYQ7+8OoPnZ7tCAf1fPFnlWHQRF38NmOOBEY4i/3kZtNugL8
         IL4KOI1idxhbWNYdmjxHfkLsCadxBZ/rKQm0STnSc9gvccR9H8MnTpoG6RL4khilGfo1
         R9apYsqVqe1+xuFiRTwH53AiXXu+rJI6myJ3DEs47+0Bm+9cXbrJHeGAR7yFmhxZU2HF
         89Hg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F2L4Xliv;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id g41si1184314qte.4.2019.06.26.11.09.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QI9tFJ033978;
	Wed, 26 Jun 2019 13:09:55 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QI9t6B029905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2019 13:09:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 13:09:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 13:09:55 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QI9sCj043468;
	Wed, 26 Jun 2019 13:09:55 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
Message-ID: <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
Date: Wed, 26 Jun 2019 14:06:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=F2L4Xliv;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

On 06/26/2019 07:38 AM, Vitaly Andrianov wrote:
> On 06/25/2019 11:50 AM, Jan Kiszka wrote:
>> On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:

[skip]

>> Check - when in doubt via instrumenting the calls - if the regions at th=
e faulting addresses are=20
>> actually mapped -> arch_map_memory_region.
>>
>=20
> arch_map_memory_region 0x48020000/0x48020000/0x00001000=C2=A0 0x00000093
> arch_map_memory_region 0x48424000/0x48424000/0x00001000=C2=A0 0x00000093
> arch_map_memory_region 0x48826000/0x48826000/0x00001000=C2=A0 0x00000093
> arch_map_memory_region 0x4a000000/0x4a000000/0x00e00000=C2=A0 0x00000093
> arch_map_memory_region 0xee000000/0x00000000/0x00800000=C2=A0 0x00000047
> arch_map_memory_region 0x00000000/0x80000000/0x00001000=C2=A0 0x00000023
> Created cell "AM57XX-EVM-timer8-demo"
> Page pool usage after cell creation: mem 62/4073, remap 6/131072
>=20
> Each region from the am57xx-evm-ti-app.c are mapped.

Using the CCS debugger I started the inmate and paused it immediately on in=
mate_main() entrance and=20
checked memory referenced by TTBR0 register.

TTBR0 =3D 0x00017000

0x0000017000	00019003 00000000 00000000 00000000 0001A003 00000000 00000000=
 00000000

Looks like only 2 last regions are mapped (application memory and communica=
tion regions)
None of the peripherals regions are mapped, or may be I don't see them.

-Vitaly


[skip]

>>
>> Jan
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e46d5280-8add-4900-e084-dbc839fb2b05%40ti.com.
For more options, visit https://groups.google.com/d/optout.
