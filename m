Return-Path: <jailhouse-dev+bncBCMKJ4OZ6MLBBDG2UCJAMGQE5Y6FRCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A274F00E2
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Apr 2022 13:01:33 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id l7-20020a05600c1d0700b0038c9c48f1e7sf4264949wms.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Apr 2022 04:01:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648897292; cv=pass;
        d=google.com; s=arc-20160816;
        b=l3JaOiwq4pC4TJGHKC/zlh4zaIs675SHh3BcHrzadaAo99QfGH8PFFU1Lq6gIyvsOI
         3mDBIZa1RtxZrXfR6YHCGKjDfqb7/1v70b8aIbGXyaMYR1E7WxHaaYl1bkahSXUhzAVJ
         ggHV2MzSJiRVBKV4UKZQY0wb+84FSQ5ugjd1hcs7kPzmXFnzsAMgOeSgiNiu7YEAddbd
         4S7N1Uoiw6cLjfpcZWmzzWMuhibjcybyn/V8Hf+uQbMOcuoTjRSB/FiK+FesuGsEbrdK
         uvT8eVWMJ4EWjmo/bd7b2c3z1wECNQ9NBJDNlsb1VJhJdgVogIZC+DjTNXMsO9Ts24A8
         JkUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=qjETiSE+4iqNLux4B8kMHHpkDn7lFGqMx+Bb8xWOppk=;
        b=nAU9BszW1q7iEA2cRxWbtSxhH9dpsvse+Xxs0kRYMi1SAPLxz/qcMZ8fnnpeNo6qsv
         0Gurct4f2suxPh1A6sTXge2w2oM3L1aDt8hY6qagxFrkVSAe0eQ+uv3S/JCNVR8DCzPH
         afufREMjBfhAiXEBlHBw9LNZUIsp6bhKVvzqEmNEmNJHXSPkQVujI5BXAOjZ+mXNoEHT
         FfMrFmMocyg2i9bo9vzvWYOeEX+qwYSdBLlac8txI9Tr5ZIbCEujutBkt+7HAkqA+WDN
         i0eQ397z/VllI6hj+eg672DTIH+pVRkUODo0m3n997hT6aMXSJ1IaID1UXO+ko4P1W6p
         P1BQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmexit.de header.s=20180813 header.b=AnWXXkYA;
       spf=pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) smtp.mailfrom=ralf@vmexit.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qjETiSE+4iqNLux4B8kMHHpkDn7lFGqMx+Bb8xWOppk=;
        b=MxreEs8kv6dqii+I/pmqTLi42RkYaEY+ffVotuUyYDgRmAaoVeffTmO+Q38V67Hav1
         D25dNTnbeK9TaEU35yyIxKy4zGDdftzjfoenzAR6Ce2+8WCp+A7TO+aP3kg0y9uzyXvc
         OSOs5skSL3fWbPqqm6KrPuoaOV6EpZijimkegUUm6hmgHUEajnI+x+NR+hd5mFkRI0SM
         YCm+HxSmQHw5SAyMEeRKLl2fqb3IPdrQPcm4dWvB/9OS4R0kVIFo3u04p2sEZhrExXo2
         9tHLh///LQDJk3FJNQD9Kx3zq9kWj4X6A/pHFa1+PcHwCefJfBQVcys4PeCC6Tc5uRBy
         sHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qjETiSE+4iqNLux4B8kMHHpkDn7lFGqMx+Bb8xWOppk=;
        b=nYRntGJKIVt05GUheWZ6G5y7Ms82R2Dwz9U1ekUueavQwg1Fg5/GlffeasHstZGGRm
         7sXrU7hnZp9KGIPwN7MOrvrsGsNMXHg9zxZrL//ed7LFLCRlb6ePURf69iPkyGmBLxo1
         bIg4rKRgugTcOZZCLVqULYFCdZZQgMDwYayrqf6ts+HfFLAQiTNMIrTuf7P850m5F5Bh
         Y0icwqpaaLcaBqgy5/SocwFT/SP8JmQ+Q02N2fdRQdfhEv3HvfrWQbA7P5LR9xrV6tHB
         eEAD0ySc81Mo7lzVq3MR36E2R8/prE1SCDjkaiBwm/1Xl78Z5iKXc/E79LIyT2wDBiM8
         /17g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531T48NJfh/X+ofIB5ZSo1u4AmLQmG6qVKH41E5WbX4M7tRtnbYv
	8JYqULmXiZ6ax6PebKo/T9Q=
X-Google-Smtp-Source: ABdhPJx8QVYt3fI/W/wmhMeLvKixOMInhiqO6kYfReRypssPQUloczahH0DEFvbG3bhwl42lx4ZQ4A==
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id w22-20020a1cf616000000b0037d1e1cf90amr12549717wmc.148.1648897292779;
        Sat, 02 Apr 2022 04:01:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f5cf:0:b0:205:e1d9:2a6b with SMTP id k15-20020adff5cf000000b00205e1d92a6bls768967wrp.1.gmail;
 Sat, 02 Apr 2022 04:01:31 -0700 (PDT)
X-Received: by 2002:adf:f949:0:b0:203:e87d:1d38 with SMTP id q9-20020adff949000000b00203e87d1d38mr10840059wrr.137.1648897291405;
        Sat, 02 Apr 2022 04:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648897291; cv=none;
        d=google.com; s=arc-20160816;
        b=aGDzoLp9w193V+KsD4MEr++2vSf5oYRmkM79GOskrR1VzQJAb1hgkwkMz7IzNjhlpZ
         MUpBejhBf5U92EotVdv/8kzub92KdEGXaGahPN/vGnwSYNl2b2BB+6yHMo4CghhMRHKJ
         5yKFDvlEjmWvT7y6JZpwGvePbSjYwYPDtC5jYCWHxRnFfhJYjt8OJcWXb4MOVOeb+pyO
         yIARzSHvkhuKosFr0nBmYCEs+QOilQLS3mRJy53bTATw03rgk9MZBELbV80r1sksjAXh
         j95hZYErZXfr9xH3EgsFuUmZqz0FpDPNpLU6YASRfZyoa6+TDPqN9T3/1Z4QIwk6mlQg
         ST8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Df7VN3h01Zf4kZ3ERd5OWi9z1Grop6t58GwDJBfs0cs=;
        b=FfAHwPiOfwFMkgLlZ0qOxBkVfbgqXOdMEbVB3NA6P4rTffA0Atse5pUTRzLzklVDQH
         aMikYHySFNdQycN/1MI22gmCi852m5QVjV0ukyDYJgQEoJIVnoHa5TV3SrCxDd3cy2gr
         vAL8tqolLqJQ763xnS3jZxOfTOrvU8Okhtpc9v5TP/ffuoZKPiRvOfQ7Zw88YxYmxz7W
         nrOkjNJ6F271gTQkB2vyVOiZDkTHSjjGeBowYxDWnXRSQVBHX2Pmk0rHWGx7h/6istJa
         +bSJB05X2U/hSQLa2II/pKrGSExXBBNV8O4hdBjnhiZ/7C/YOdQeICdjrHvAjK/SsZdp
         6YqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@vmexit.de header.s=20180813 header.b=AnWXXkYA;
       spf=pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) smtp.mailfrom=ralf@vmexit.de
Received: from mail.vmexit.de (vmexit.de. [2a03:4000:6:8069::2])
        by gmr-mx.google.com with ESMTPS id y11-20020a05600015cb00b00205db67de65si130939wry.2.2022.04.02.04.01.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) client-ip=2a03:4000:6:8069::2;
Received: from [IPV6:2a02:810d:8fc0:44bc::60b] (unknown [IPv6:2a02:810d:8fc0:44bc::60b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by mail.vmexit.de (Postfix) with ESMTPSA id 252B46EEBBA4;
	Sat,  2 Apr 2022 13:01:23 +0200 (CEST)
Message-ID: <bd0cbbc1-7abb-8924-5228-da22e2aa51c5@vmexit.de>
Date: Sat, 2 Apr 2022 13:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Jetson TX2 - access to peripherals from inmate
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@web.de>,
 johannes lex <johannes.lex.5@googlemail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <b708cd52-3034-4d11-a61c-1e4c992c096dn@googlegroups.com>
 <27e635ef-500f-6f19-a461-9a5e88d12c8d@web.de>
From: Ralf Ramsauer <ralf@vmexit.de>
In-Reply-To: <27e635ef-500f-6f19-a461-9a5e88d12c8d@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: ralf@vmexit.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmexit.de header.s=20180813 header.b=AnWXXkYA;       spf=pass
 (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as
 permitted sender) smtp.mailfrom=ralf@vmexit.de
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



On 02/04/2022 10:14, Jan Kiszka wrote:
> On 25.03.22 16:11, 'johannes lex' via Jailhouse wrote:
>> Hello everybody,
>>
>> i'm investigating the jailhouse hypervisor for a research project of an
>> automotive company.
>>
>> As a first step, i want to set up the Jetson TX2 Board and add an inmate
>> which toggels one GPIO Pin. I used the VM from the ERIKA V3
>> (https://www.erika-enterprise.com/index.php/download/virtual-machines.ht=
ml)
>> as a base development platform.
>> So far, Jailhouse is running and my configs seem to work.
>>
>> However, I can't access (not even read) the registers of the GPIO or any
>> other peripheral which i assign to my cell, except the already
>> configured UART.
>> The cell config and assignment of the registers themself seems to work:
>> i can, for example, read the register=C2=A00x02210890 from the Linux hos=
t
>> before creating the cell. After creating the cell, a read attempt from
>> the Linux host leads to a system crash.
>> Unfortunately, i can't read that register from the inmate as well :/
>>
>> Do you have a clue why i can't read the register in my setup? I've
>> attached my configs and the source code for the bare metal application
>> of the inmate.
>>
>> Or do you have any examples in which you access the GPIOs (or other
>> peripherals) of the Jetson TX2 from an inmate which you could share?
>=20
> Already checked your configs for undesired overlaps (jailhouse config
> check)?
>=20
> Looking at the jetson-tx2-demo.c config you shared, the GPIO range is
> exclusively assigned from the root cell to the non-root demo. So, any
> further accesses from the Linux root cell should indeed trigger a
> violation. But accesses from the demo cell must be possible. However,
> I'm not seeing any violation reports regarding that cell.

We had a offlist converstation - map_range in inmate + ROOTSHARED solved=20
the issue.

Thanks
   Ralf

>=20
> Jan
>=20

--=20
Ralf Ramsauer
PGP: 0xC85252CC

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bd0cbbc1-7abb-8924-5228-da22e2aa51c5%40vmexit.de.
