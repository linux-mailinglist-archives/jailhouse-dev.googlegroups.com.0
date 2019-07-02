Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB76O5XUAKGQECU7OHLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADE5D158
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:17:36 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e6sf5474780wru.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:17:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562077055; cv=pass;
        d=google.com; s=arc-20160816;
        b=kQetYMc1ibaFBO8vF7NFQsySYiipj1RmCf7qteTryb2164Dw0J42WTp8Tkqw1HqECP
         CKPL66xqVsP8aPbQfuV59YlmUKThYGJuJnLXwLUY8cAR8j1mDIE1+/h0XI9LiqfxPcrR
         T88XjwVnNCb69W6K66u6m1f+YRjoVawYGzsiYGzKBmWBsyPo619Fp8bsoMxdK7l2IF8o
         0kkHHAPC2jroErvBrujDZ4vznqpMPSuUwTM/oLrFHaZXTazMCwY+IiD1DDX/oPukpEuj
         +DVl4tk9El/l4Zcxh82FmxD036+G3SNzX7I2i8JfoSS2Q9goiKU6yqHFoFv2/MvNr5YM
         lmbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=aYzyngGIDQn4NDk0QxmMOjPeSzgb1/0fvS3Y49G8ELU=;
        b=pbmQKiW0kGqxJbi+FOBWtEhGMU7lcuG5oDWsfeGXK7A3wiBu0AGhRzLoeAZ9JuY1g0
         GMeue9ZGOj3eqRS/na7bUu2CcTD2+Fh+ZGCyyXWM0VEhWDJN1nnK16q+es3qN0gl2HLS
         0jEGXNCDAbJY9Nok3hSLmfPQ54Cve2rMeB9QiLX1dSjmX7klO3YZO1VQs4rkrPp+7ymF
         7l2lnAG0CMEwt6Rj9qagaH0nNpGK7tKS+ObviNd6A8P/SezvBK9CWZtPJGsPTZyfLDLO
         t4OxAKhwI9sCuI/qDRexc+/+iaaBlDPh7CdCFNTKUwICn/puhu8yXurjplA63rhSf8tv
         Ubmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=dS6ZI6QG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aYzyngGIDQn4NDk0QxmMOjPeSzgb1/0fvS3Y49G8ELU=;
        b=saEdTWiAXUiNttIETyeJpgpDdeUv8F8iGAkLv/9nQLVxxM2S94LCQaq1/hW20tuwT4
         jkyk34sJ0kpKeQ9uYMfaFldmvpD1qkP0FEEzxCxLENRRbaGjnenWcBvC4qSeUIdbnU52
         uw4nLanSDDoGoKMCFfCb3c7FunMIMqAjJyzRZJEqm5ev4Cky4wwFPgLFh7PK0N6S+v1T
         ICJdThuRrCYIBSt+fI1yfdXrTgcmWC58C5b4Mqia8XzfXPlbYcE79vfKRj2QuXXLvHAu
         ZSMREfPLoBCo1kzTQUInXAqzGQeLw2epexfI0aGrMGhZldG1ghV7tG1BCRB/2OqXt7N0
         HdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aYzyngGIDQn4NDk0QxmMOjPeSzgb1/0fvS3Y49G8ELU=;
        b=dqSFZae7p7Fg62N8RCQFc2lfX8FXq+1a3iQxvfndnwl6Zr+kmfYwAAm8W7UU1+kWWw
         HhBXEifeI37/lzCli+h9TFSBu97EdYPyhJHv9aywo+epF0PoyAS1fQ9RbM5aLDJhIV2Z
         Bl+OPtseAtJMazCIN2E3fPyTEADbJj7iXi9bd9P8I117yt6bobuiNHf3r9bIVQDI0n5U
         8COyFtGlT6WbEn4M4P4H9rFhYZ5fpF2cSDktAYDJ+QLCofnbarX5mN4WJMqsMBM9FyDs
         Uvgvgz1NXWFqh6RiUbgHOkCQlHsMIpGSvky/fQA6XASjjdwi69mCAh0wq37Ak1qptfBp
         eqqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWljRrdLD+kGOC7aex5DO3n+oF0QqNOMjR75fk5cMrT5JYMhNL8
	ioTdIPi132JhA020UqRNrPo=
X-Google-Smtp-Source: APXvYqwxi3iHxomdi6AkFu+DWi88IkVx7z+gP13anDfkxoimySEdLR/TBGguUbUxl7Odb3s0xe3saQ==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr3725555wmg.48.1562077055777;
        Tue, 02 Jul 2019 07:17:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d12:: with SMTP id t18ls53495wmt.0.experimental-gmail;
 Tue, 02 Jul 2019 07:17:34 -0700 (PDT)
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr3764383wmk.88.1562077054947;
        Tue, 02 Jul 2019 07:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562077054; cv=none;
        d=google.com; s=arc-20160816;
        b=fSl5zqf0O4NWidcDILTqRz9lUTHTtZlfp2s6h8AJ9iRoCkYqwX1cSWnMCXjugwzNAP
         /0m/FrpHjkLyGAovuTp9cbhJ4EWMfd5s1Q45ZAidlRoCFZxUOrw8WIEUbgilpl4GfDL/
         yR+jL9GIDdlTYbqe41yjaZ242u4uPdFNDOXsHMDy/NjCPnV7+x2x7ZoxAS/BgHPG39ZT
         kLgSRqANMlFIT3i30+1atDruynm5AMadvZcbr/1zHJCy03T8VAhbW2ARstYqkESul+e2
         DiFri802bnWk7sUYicae8/F5pKgY6LqlYuLl4lb/+eeJFyQwNJnw2iOSccRCBtdeN0wF
         wUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8Vsrkco70cDE+NqSxh1k0FvNyfRQ956kF7P9jAjU98M=;
        b=MUcoB0DYfr0zylCMcwN5hVMOMYD6aTzlI6+c8uSwWBxQAzw0LVxgPCCzujzUq8rJYn
         sHkcdy07jGwYYpnEmh68RZGqZ9l/7ykGsFFqbRf5NGFh+t5SqZXedXfWxFX2OJH6M1fY
         HsTXIcDzxv25vLztOpEqb8quspBfXvvbZGXA4u56W3hRSREu76lmiZuQaPCkL/9I4pRu
         WSP6rpQzRX4qdIYVas7OV308XXHftP4Fe8Syz6uu/00jV1qA4MsV6a5QsnDZO86k8bTV
         w0LvxcRx5Xsuhfni6m0rcHGQ3Q4PiCyjNhdOaAEf1YMtPksqHJpHNxnsl8H6FME+a0d6
         lkOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=dS6ZI6QG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id t3si128404wrp.3.2019.07.02.07.17.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45dRCL3yP8zyF0;
	Tue,  2 Jul 2019 16:17:34 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 2 Jul 2019
 16:17:34 +0200
Subject: Re: [PATCH] pyjailhouse: sysfs_parser: Ignore empty PCI bus regions
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190702135846.20045-1-andrej.utz@st.oth-regensburg.de>
 <6d75be0a-73ee-bd9c-2982-7e262f82b637@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <caa1784e-d110-ffcc-6fd0-d0aadd71ea04@st.oth-regensburg.de>
Date: Tue, 2 Jul 2019 16:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6d75be0a-73ee-bd9c-2982-7e262f82b637@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=dS6ZI6QG;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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



On 02.07.19 16:12, Jan Kiszka wrote:
> On 02.07.19 15:58, Andrej Utz wrote:
>> On some systems the config generator permissively maps huge chunks of
>> PCI Bus MMIO space. This area needs to be intercepted by the hypervisor,
>> as parts of ivshmem-net devices may be behind that area.
>>
>=20
> Just the make the boundary conditions clearer: This mapping only happens=
=20
> when the PCI bus memory region has no device resources so far. If=20
> ivshmem then adds a region later on, we are doomed. But if there is=20
> device already, nothing was broken so far. Am I right?

Correct.

>> Hence, ignore such regions.
>>
>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>> ---
>> =C2=A0 pyjailhouse/sysfs_parser.py | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index f48f249f..4a06ccdc 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -105,6 +105,10 @@ def parse_iomem(pcidevices):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D []
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for r in regions:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # filter empty PCI buses
>=20
> "Filter PCI buses in order to avoid mapping empty ones that might=20
> require interception when becoming non-empty." Or so.

Certainly an improvement.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if r.typestr.startswith('PCI=
 Bus'):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cont=
inue
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 append_r =3D True
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # filter the list=
 for MSI-X pages
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for d in pcidevic=
es:
>>
>=20
> Looks good.
>=20
> Jan

Andrej

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/caa1784e-d110-ffcc-6fd0-d0aadd71ea04%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
