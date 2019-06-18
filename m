Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBEETUTUAKGQE3NIPKGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B514A5EE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 17:56:01 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id x8sf1642019lff.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 08:56:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560873361; cv=pass;
        d=google.com; s=arc-20160816;
        b=VvHsFIH6OFN7DPhlZWEhAgLeYQKF8+NoXqXhWqsBptFkG07TtCk/gtu87kVwtKvL1A
         glNg4ipU2ed0EiF/wKFUgZnHVmyGvslbOdddfhREHNecA+62n5mSvHMoZZXFE9eDs2HU
         SROs7C3aByg+RqObP94S7MOUl65TA1akVvbRSzQFxcJSSeCj8mp4GsLqokD+NJlSB2mM
         1FnfQ4Gmc8LqC3Su60gFgtudfyb6yaujv3Q7KkzlLXupXPo+i2fb5ZHTJyHggT2Htvs4
         /V5sI7I3QiR4+dpglP7ZaOr/9YMM1dgR1cNdRicfp4oje7kHMYpnkyIigvIg9u3/gUZa
         dBoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=zpEQFMVHWYciwB9mci2unftSJNzymqv49YveA4CI/6I=;
        b=Rf2SLRoPzvspvsY9FSYJwGskvGp0+C8KPZQC6O/e99Pv4CWBN3SiFBz3eGROxlo4WI
         E6XHoxRroaz0OTUrembroJjLmO5GGyC9o4x4kzIicFkkNfkC8BJjfWL3tEPua5SWsYUf
         mRUoLdqAvkNj1QjEpqUCHWtL4rrFUs8x8B0m/tcMbF64aa7oTbdlnCU66Kgd4pskj4PH
         oXm4gYEMp+az5Ttyb4mNa3V00x7wRvlxnmCyUcB9DloFMxx11/5vm5PDBJEB024LeWkP
         obl9+r3lY4Md3wK9w8mtXv87q1L1nz/QBAhE9m3FgY73wFpMwiUmFEPrfSRZI+PgA2dJ
         cpFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="H/fu0yr0";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zpEQFMVHWYciwB9mci2unftSJNzymqv49YveA4CI/6I=;
        b=amIxRM3oDnbr9LfF3m6w6Oz4ep/VzIQAT/Sb3u5P7DXNPYA9IxDcHKDNheJOaE0dog
         boUl4O/TK1dvrjfmSKD+sT+Hxya1/SGNQ1PTeUpUNuCiufrOuydtGqtoWCT47loEICvb
         ozbYcEoygvNS5r7/JUAbKRKFEXBBpDarUiFUJK1TjZxivCo1Puv+joCO7q2rX8swPaBx
         dTfWq1eo/E79pJfBU6PABCVMrQio3Xf6VbdE03isy05q4eDmkv38c31UlqM3+sW2oUdH
         b2YLvA2nNKxbmNb5r1MBsDKISb7opkAoZ6gfxtt3EyjXD/x7q/GbIyf+AXCT4r1wXRqW
         TkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zpEQFMVHWYciwB9mci2unftSJNzymqv49YveA4CI/6I=;
        b=QA3QV8X989Zk1Q4QsBBbLe2SC5eVCOrH8gJI0JdS7a1i3M1qQvp/u67BQ3vdSWYcYZ
         vxIvFSB4SlQv1OLgS52/XrQPNjbaJLkvv38W2z5HUDj6TbQQoNc2cpuUtn4tUGJ/4Z2O
         t+PsILh+/euFPgtkePByO2EaAP3XtDxTMq94lwoKsuhqgyd3fOcD5vf9+RUmHLQ5JWch
         JO8JW+zoPRreTLzWyz3RGIPNPG5/vDbZxf7clRApVLBXyal1diGsN8lsKwnCYHVP4Lor
         wGdkAe5A7ejcOdCoDeLHiNL6thgLKFS+Zz0E5VCsjVefT3vqrYlCHTCS0aQvmOe0uVYM
         Zf1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXxKHCI5jlkG5n04gRh/aaR2m6/zhOnbGRezx9FIvR05JmffV/5
	R+Yr6feq2/TQlycToRJd8eg=
X-Google-Smtp-Source: APXvYqzT1vhG9rIfU7ey/uKpKSOY2GLUtFZwg2X+RelTUYP41FM1mxw42dYyLUt5hlSzmBZ1k+Rw3Q==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr1340882ljj.92.1560873361110;
        Tue, 18 Jun 2019 08:56:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2b43:: with SMTP id q64ls1644226lje.10.gmail; Tue, 18
 Jun 2019 08:56:00 -0700 (PDT)
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr12266681ljg.37.1560873360314;
        Tue, 18 Jun 2019 08:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560873360; cv=none;
        d=google.com; s=arc-20160816;
        b=shFQqlok7EOkLmlxT57eN6qlvPZ2YzU4rxzTspGz8ZX6JF0JCGv/9geYqwXGH2kzuX
         z+FDnP2rjmqHfOYht8MGNPH4eIuyQoKV9aFiK9baSCvZnCvcR+b1vSgDXVBHCV0l2Z6z
         ULWNdaOye26HVRryOtxN6F1f5pxv5ID+h87YYnpiWQXKJ+wYWU4lrbiEQN6WRuWFzgu4
         VEC3ETlFnW+jmB5GVmkcaJ/HJssJ75Zq6i8SUrQPwl4sEobwCRJOYYUD+TUmbolNStXQ
         3MEGq5H7DC03BiM5cDlLfHsB9xWT8k0C1LurA5NRPqT7EJOAeTmDCsPRYJfB29l1iPSi
         6CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=twuu3KftTCZa4CncufVnhj1vI04qWUycyDwAGK24q/E=;
        b=VAY/M0Q45g13z80Yq/4zCjoVCvSwSZ10l4dhPFf0wPL7TlyeYlXEvV/5SaU+21C5MZ
         jzqQpUZlk0xDno6JO+a4Qh/MdOuCfvnGfu97rj66+etHVsuYAJeDFlL/PHxND00A0SSF
         wNT8mV4b6Om/F36cGQKLYIhbhsn/11Bq2V8i+XM5qE7nzlwJL2HNkbQRxt+C9Ygsg5aA
         PE77o1F1GTNFUYPxiffAITk2vxHbzKoy+l8TLHYgQmaHVKNsURRcg+akfJSbZ9iojdBD
         vvFxQh3BlD/UPeJkH7s3VaLfkRmprP1rnbb6Dw+SHD9UlBSG/UomF1rPynuw2OXyo6sh
         OtYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="H/fu0yr0";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z18si769569lfh.1.2019.06.18.08.55.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 08:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45St3M0hBtzy31;
	Tue, 18 Jun 2019 17:55:59 +0200 (CEST)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 18 Jun
 2019 17:55:58 +0200
Subject: Re: [PATCH 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
 <20190605161745.2389-2-andrej.utz@st.oth-regensburg.de>
 <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <8d1f8f9c-8cdd-e4df-acd3-cecff65a2612@st.oth-regensburg.de>
Date: Tue, 18 Jun 2019 17:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1facd54e-88f5-b3c0-91e9-85a2aa821245@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-CH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="H/fu0yr0";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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


Hi Jan,

On 07.06.19 09:23, Jan Kiszka wrote:
> On 05.06.19 18:17, Andrej Utz wrote:
>> This replaces the old static port list with actual port regions from
>> '/proc/ioports'. The static regions from said list are kept and override
>> the data in case of region overlap to retain compability.
>> The generated port list is virtually identicall to the old one but eases
>> manual configuration.
>=20
> IOW, the whole PCI IO space remains accessible, is now just partitioned=
=20
> in order to ease manual disabling? I wonder if we could not go one step=
=20
> further and only allow known regions.

But isn't this the same as the static regions ...

>>
>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>> ---
>> =C2=A0 pyjailhouse/sysfs_parser.py=C2=A0=C2=A0 | 135 +++++++++++++++++++=
+++++++++++++++
>> =C2=A0 tools/jailhouse-config-create |=C2=A0 14 +---
>> =C2=A0 tools/root-cell-config.c.tmpl |=C2=A0 15 ++--
>> =C2=A0 3 files changed, 142 insertions(+), 22 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 56265fb5..d06a476a 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -142,6 +142,57 @@ def parse_iomem(pcidevices):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret, dmar_regions
>> +def parse_ioports():
>> +=C2=A0=C2=A0=C2=A0 regions =3D IOMapTree.parse_ioports_tree(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMapTree.parse_iomap_file('=
/proc/ioports', PortRegion))
>> +
>> +=C2=A0=C2=A0=C2=A0 tmp =3D [
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # static regions
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x0, 0x3f, ''),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x40, 0x43, 'PIT'=
, allowed=3DTrue),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PortRegion(0x60, 0x61, 'NMI'=
, allowed=3DTrue), # NMI=20
>> status/control

... do here? Or how do you define "known regions"?

> We should preserve the property "hack" for this one, and that ideally as=
=20
> comment in the generated config. Could you enhance this in that=20
> direction? Benefit: you could add the originating device as comment to=20
> other port ranges.

Ack.

Andrej

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8d1f8f9c-8cdd-e4df-acd3-cecff65a2612%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
