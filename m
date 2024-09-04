Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBFPX4C3AMGQEWGTQCYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1696B92B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2024 12:51:04 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 38308e7fff4ca-2f403c3ffecsf63392141fa.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2024 03:51:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725447064; cv=pass;
        d=google.com; s=arc-20240605;
        b=KzITBcdPOqlKSQbT8bRosNv3MhXbsa5x3v59oA97GLkXj0yUBhFYci7mCu3UqaxUaw
         a1CXbLhxT1sf/fz9t8h68Y71r/7S+FwCyDLbX3Fkg5B+82AbXr3ujqQoXuMV8NQ8wwOG
         rlB0/A1Dt4yT21NBucwhJYL2zQM55kZ7DVji9wlUBC8fZvmknwO8FpL3eOz181qfoUCT
         Ttz3pmDLyQdbXbIC3h+vN0y0gtu5V9kSEQktVhDJhV8BtvrLgpHNrByFHk52y0ceO+pl
         YZ62YRSIX6mIFogdntN7/6TV9tY74TIGr9QC41Jf8L/WvL6UVcyu2sHh0FEUW09WY4NJ
         g+9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=o/DvlTJRoGswUiWUhUJlt/gSq/nlzDP+ipmGdYyrMtA=;
        fh=Ef0dw5GZAF/uYs2g5Uhe/JF8yTfjHQ/OWRLOBXiE8MQ=;
        b=AXzjSYXsb7aV17BR/RyMYKfQ/PZbaqkCGRZHE9jv/e2GC2gMID2mS5rm9+JUADFXBs
         r/20vSslpdpficZxl1/qfjWbZGsU23xb4Nj6iBeQuYi8U1EI0L8K+yxzfEPH2ih1eilQ
         +GU1RI/9GkDghUHZhVtx/lwhUnmXycaJ/v64vU6vFWNzmvA2PQ9g6BNS+z00geeSptIz
         KtvvleKrBng1LATIW1n73nH7Zx1ccGl8w6ebY5lCiREjPe6JDsy75yVj4kxclgz6wtgg
         5yDLAeLx9lUdMcKh9UsY02kT+Mk+Ohzs4YopAUA6CQYl2gjtqbPEb7XL//hYRITbyaTH
         iD3A==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sq4flRNJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1725447064; x=1726051864; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o/DvlTJRoGswUiWUhUJlt/gSq/nlzDP+ipmGdYyrMtA=;
        b=iuX4oIFQgPYcrM6X0A4ly1mn5g2wQBCazWU/yyOqCANa6RoWVd1qHrLkaZk2dibos4
         KCSxC9pGVGythzgfRseEws7heJV6RNSkyWm+AT9MclZEH1Qi2tG+OYRdDtvOGVCqmqot
         10MI2pVzJtuYMq4zjMwQoNEhZKjRKtlfwA4tP8uixqmD4MFPZl+XJ0UzvONhrPI+KmYV
         ALv+6iISf7gcAd0xV0J5iAsVoj2fpiPk4zmf+XTlBf/AydUf5ZQseOz2yYlE0XqPozg8
         WRAkXkQpItZzTtta6+/Qi/UbAse+P6ut1prd3RoR0lUt2APv0YU4wUaY4Y8sH+D86NwM
         KSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725447064; x=1726051864;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/DvlTJRoGswUiWUhUJlt/gSq/nlzDP+ipmGdYyrMtA=;
        b=RFk6452BqxB9uBoJ4SUSal1mAEgoDyC2JDeO5KG7/P/RGMmoBdS9MroGdNAFaqp5Vc
         m/GzjFKCGNH/sGT9Om739fS2k2iHqR6zyeEiZ2bcrTJDlSduCo+C5gPpJEZOhMvJ/3y0
         3NDPKYNrjj/qVsfVaEeqvbsrlctgC3aEvGdREKvc9JDlVp/HjOjhhFn/SdNg5SkyHyXQ
         Yayk2jIrJc1vMbE/pVkqJx/MLImt9+hsseCBZXpAL+yPbiY6VcMytPZ/Y99BwtwG0NIB
         Gq+WOmk4InXoapOmXFeLXqFo3XQ85e8ugnfZ3fkDgqLkb2u7T4rgLm+hJX2YBbN5fZJw
         a+8g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCUd3uBlAZSbUTm4ZtPJmRkW+OEedJM+I4cetRHjdxumwg/TiXHN5E4R6pFr0DVDtFYGq1aVUg==@lfdr.de
X-Gm-Message-State: AOJu0YxhM1BxAXUKh3T3wpMK4sYED6dnyl3Fx/P1wGiJBtjjJQE4hEi0
	ztTUjRWaHyZvrQnhCRknTTZve8B5aD0Y1vsj83fvd1SAuytCXjJj
X-Google-Smtp-Source: AGHT+IEehOT7240rz4xQ2PkO3tb+nDF1TONnvi53I8tudIAwV9SITPtWJ6VSs7oEogOLyUzIcB0Wuw==
X-Received: by 2002:a05:651c:221c:b0:2ef:2247:9881 with SMTP id 38308e7fff4ca-2f6104f28a6mr159931351fa.31.1725447063079;
        Wed, 04 Sep 2024 03:51:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3502:0:b0:2f6:60a2:a019 with SMTP id 38308e7fff4ca-2f660a2a077ls1190161fa.2.-pod-prod-08-eu;
 Wed, 04 Sep 2024 03:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuSy3syY+GojszSlCCmiz5odcsspLhfKuLeFxVfd2Zq6wl6SW+n6s1CvikB/TavRBlv61PrxLadFhc13fD@googlegroups.com
X-Received: by 2002:a05:651c:211f:b0:2f3:b081:114c with SMTP id 38308e7fff4ca-2f61054a1acmr143470911fa.40.1725447059076;
        Wed, 04 Sep 2024 03:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725447059; cv=none;
        d=google.com; s=arc-20240605;
        b=BeLSaBFLR4PnACyNw/FZWwFT5m6oud5Meji/rR7VjtxktsAwvkYkfAwOouP6OlWFgL
         0LqeLwdny9+hZwzxijhLrdQdCs64em/zXfAo88gXvq3G35B8Ce/06ciYoi3qS8O1oEz+
         1WPk6DIxAwOlhlhNHMUxIGLYwmhJxSE5psGqwzonuO0/5vAr1tFGVw5nxlnaSfRiOwjG
         3R6vbbGfr/Np8ttqxsUleq828LpLfG9WkUPzd3Sw3fEnk7vcO/pr+cnE9F/6L5wlJ9TM
         ncDgddp9GtnzlSeWU07mkY8Kckb3vuW8Y+zTJjCJRu/ozpY5NVqwlXnfC+utuWjPCDJF
         6gMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/bw7scUcjcBylcLSY7rl8b+7/qj6sUMrNJ1n1DrpCjg=;
        fh=QRkorzGsnGMmMwYQlkYy3MSQyZxi5aCeVlaXXbCDjEg=;
        b=jJjOxe9zs/Xk5XC7DYc7kYWv6BxEQdWsssDUn0rTesx2JHydx7+cyMwp1042xEKkF7
         BoSJgNsMqO6FNLT0cxb1pW5lF5L4DCscT4D/2SGoXyqeErdnK/3Gah3WYsW7ZG0WPL6a
         GQI+XqMj3NPaKrvQClwp5Cy17JD8xTGj2AndqjUsxzqgna34EbyjWYL4trYRWaNnu2Fx
         BZGrV7guM79joZc6S0bd2HCa5J3KE+wkIslLeepXi02SafQXnGNsOlLOElkCckOOBK7b
         TYBXj6ViYkr/rFVZrzd2xy12pE06YEY6GZM7Lhbvbi5Byz+cs7ttWjmLXJNdRpo8A/Cj
         8mww==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sq4flRNJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id 38308e7fff4ca-2f61d9ec029si2369681fa.1.2024.09.04.03.50.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 03:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 8870A2A0125;
	Wed,  4 Sep 2024 12:50:57 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4WzK6923NHzxq2;
	Wed,  4 Sep 2024 12:50:57 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 12:50:56 +0200
Message-ID: <56b684d3-7bcd-444e-b7d0-2f01429fdc72@oth-regensburg.de>
Date: Wed, 4 Sep 2024 12:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse triggered exception #14
To: qiang xu <qiangxu431@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm+5WSxvr3-A@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm+5WSxvr3-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sq4flRNJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
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

Hi,

On 04/09/2024 05:35, qiang xu wrote:
> Hi Jailhouse Team,
>=20
>  =C2=A0 =C2=A0 I am trying to run Jailhouse on a real physical machine(x8=
6).When I=20
> run jailhouse enable xx.cell. I encounter the following error. I'm not=20
> sure what is happening. Can you help me?
>=20
> 'Initializing Jailhouse hypervisor v0.12 on CPU 2
> Code location: 0xfffffffff0000050
> Using x2APIC
> Page pool usage after early setup: mem 48/974, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 2... (APIC ID 4) OK
>  =C2=A0CPU 3... (APIC ID 6) OK
>  =C2=A0CPU 1... (APIC ID 2) OK
>  =C2=A0CPU 0... (APIC ID 0) OK
> Initializing unit: VT-d
> DMAR unit @0xfed90000/0x1000
> DMAR unit @0xfed91000/0x1000
> Reserving 120 interrupt(s) for device f0:1f.0 at index 0
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding PCI device 00:01.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:01.0 at index 120
> Adding PCI device 00:02.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:02.0 at index 121
> Adding PCI device 00:14.0 to cell "RootCell"
> Reserving 8 interrupt(s) for device 00:14.0 at index 122
> Adding PCI device 00:14.2 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:14.2 at index 130
> Adding PCI device 00:16.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:16.0 at index 131
> Adding PCI device 00:17.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:17.0 at index 132
> Adding PCI device 00:1c.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.0 at index 133
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.2 to cell "RootCell"
> Adding PCI device 00:1f.3 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1f.3 at index 134
> Adding PCI device 00:1f.4 to cell "RootCell"
> Adding PCI device 01:00.0 to cell "RootCell"
> Reserving 8 interrupt(s) for device 01:00.0 at index 135
> Adding PCI device 01:00.1 to cell "RootCell"
> Reserving 4 interrupt(s) for device 01:00.1 at index 143
> Adding PCI device 01:00.2 to cell "RootCell"
> Reserving 3 interrupt(s) for device 01:00.2 at index 147
> Adding PCI device 01:03.0 to cell "RootCell"
> Reserving 16 interrupt(s) for device 01:03.0 at index 150
> FATAL: Jailhouse triggered exception #14
> Error code: 9
> Physical CPU ID: 4
> RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef50 FLAGS: 10093
> CR2: 0xffffff800400b000

would you please disassemble your hypervisor binary with objdump, and=20
see what routine executed behind 0xfffffffff000b250?

  Rlf

> Stopping CPU 2 (Cell: "RootCell")'
>=20
> Regards,
> Qiang
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn7=
0mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com <https://groups.google.com/d/=
msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%4=
0mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56b684d3-7bcd-444e-b7d0-2f01429fdc72%40oth-regensburg.de.
