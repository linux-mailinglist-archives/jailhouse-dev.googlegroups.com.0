Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBPGIQSTAMGQEXQV7Z6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BB763803
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 15:48:45 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-3fbb0fdd060sf40615915e9.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 06:48:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690379325; cv=pass;
        d=google.com; s=arc-20160816;
        b=J7064vspelMC8EDC/SD/551LRVIbMr54Nq9hKJU7bu/qBTC0cGS3hNNIKBn35k4JjC
         l3soEJzgG0jOBKgIZutp8iSh9FPI/h+11HifenT7xK1K6CkdhPbftdjOAKQ9tXfNYW3S
         bnCBjdpHOKxOmGpfsJYgsU1/2wasalQwRigr5FZ8rBUqYovm3JzYvhaaWbxp40WIbUOv
         Dr2ydgqbNj5slTINlYGV7JtcnhyYNJNSjJBw7nQIGt/c5rV6aifBNVVfUW+L4IBvjTKa
         e+XY0pFdqXCdasLjZWibKA3jtRvd0s6SpQDQTdkcUDx80kWmZhl2XORIM2T0Vzc8hSKy
         lX/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Fjv6aRT1PJcRhLjFg3feN0Txs5v8p4K039JXVM+tu90=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=t8UWUIYZR31OEhq0VBv0shDpo/87280e/nLIfYRcWOnnGIhwE6zDLJK8KEMB9ncedC
         1FQDlQm4QYA2c3K2ShTx0tMhXkF+IsVXv4ZlnqjH8uB1HYM+pQq8zM5D9a+bUWdw4JZF
         C+6RTgijxlx53w3vu8dNRNnU381GyaCfg2fmKQxvCRACqOtJalP1wj8VxI3JvduwoJQT
         DAmiD7JrGDoRr2H4jrpaJ15iFlTebRPJ5teMmjeIxcB7PLeFYK6JB0NmUzD0rqGQFRK6
         Eo3I3Xog40rrSCiVgXYF2pje1/TVBSLXwNRcNw4vxt1G6TW2sEHgr9V3MmHddzcYFqSG
         mfOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mk0NBpAL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690379325; x=1690984125;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjv6aRT1PJcRhLjFg3feN0Txs5v8p4K039JXVM+tu90=;
        b=QjFccV1CDI+krsAuRGrjlNr7u4kIrb05oe0Sm3pG+isUf1TyVr3Y5aL8CyA+y3kHW2
         yW9SctEfqoQqSVwGhlOK7OB2CUcerWCYtDux3ptzTDvKv6EQRqM2OYhbK7DGhscAymkJ
         /b5c4JYhcec7mWXmLXFCWBsc9VJjEKPqbMdZK6NbTPlmHOy7DPMaNMVxFE2EDFe8ZU3f
         S3LbLy8uoKj02loYIoXSE3VmO3x6PQoIFxqAd6HnwQmPcRrx+pbyC05wFLnQQrCtDTgE
         HeZ4nHsU3QVmGyUwBuuP7mG90T4c+7/VFbiJSqu+bClkEoC3MF4PdhYnMrwFQOk4tXPB
         Hdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379325; x=1690984125;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjv6aRT1PJcRhLjFg3feN0Txs5v8p4K039JXVM+tu90=;
        b=B0NBDDya0Z3QsKhcJ1xOKUNS3cE67a/sCsaUEQD/YehI0pw9Hio/XxH/fiAZt8oE71
         y5aiN9Xrsb9WMXT5TdYt6ZxJwyWBi9a9wCqBCf1EOWbnqnyP3ZR1B9Ij68qW9ivHg0Fm
         67yGJafmn9Q+BlWyqv/jriuIthaueM3oLIlPXgItTy61bgTqt+Tn8k0k9bRr3hhzBh16
         uaq3AOytpkSdL72dZrjo83L+wDSsblmr0YwAZRRWDKFPrRn3VfHBb0BzaIXBqSWFQHcE
         KB0C6WGdlEX2QKxuIvM/tjCdh1WQy3X0h15L6w1bYQeBkwjc3eLgr9yggLakoVg7RG8F
         GL/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLb7GABMemctmFmCY5t7e+zvJBm0j8MoI8pGr+5TFJxYipVNmFOi
	VvfWlZHtKowM+bHOyflmL8U=
X-Google-Smtp-Source: APBJJlGBeXPplXZZXGiHIV8ejPjHKnsfLCf0lrbWR4fqkcpt9GOz7eNo7i/LLbuWq/acWE9yJKmD5A==
X-Received: by 2002:a05:600c:2286:b0:3fa:91d2:55b6 with SMTP id 6-20020a05600c228600b003fa91d255b6mr1552500wmf.9.1690379324683;
        Wed, 26 Jul 2023 06:48:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3554:b0:3fb:b5d7:1040 with SMTP id
 i20-20020a05600c355400b003fbb5d71040ls1009659wmq.1.-pod-prod-05-eu; Wed, 26
 Jul 2023 06:48:42 -0700 (PDT)
X-Received: by 2002:a1c:4c19:0:b0:3fb:c990:3b2 with SMTP id z25-20020a1c4c19000000b003fbc99003b2mr1419133wmf.34.1690379322423;
        Wed, 26 Jul 2023 06:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690379322; cv=none;
        d=google.com; s=arc-20160816;
        b=PZq99PBqNxyMF3YuUrOUMLWqQZOIsIXtalB+W7sV1oIvyI6zWi+P67rYq7fX2SckXI
         geJPNUc8LbDMNezPAmPD/7OGnKVmVOOaL2sSFlMImlwhfzGgEmnWxEJ3xz5ooThg3UXi
         SkW4VcyZV3ZZa37XSZhqWfsIawICPl1CVAPVUNdtOXolLqANmPD2/w0mm7/ixdZaJAPz
         qd4JlaWyDCS3v9zM7UOVEWl9sAHj6RvzZ5CPcKUmGhZIyh7Q2vbVLsqshzeSCZCHXMRu
         Sm44DWq3vnFMj0a1VuqV91DTU57/p4uHpr0VNQmTqIxeDZaAdQ5WsmiU9pot7VpzRhXw
         qPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VRKnj9Az0G0b6jrKnPf5f7K9PP0gtofO7E9nMEiYxsc=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=TqH0t2Qe73be+Gh7LgYBTlRRcl+YfpWD/MXe94zrSz0whdoHYdohXR6IwM3eyNdBLz
         YVo8z+r9qzHeao8BhqWzPpAiLg5oml5kgI3Zphy8OxTPFgKA6bfKtrjKU/gtZCRg8aTF
         5PTPfyjFX8VEdzr1CxAx6CBkToOybfS88YDDk9RNMuAmlSHMnv88aIeWXbMG9v4mtrXZ
         sJedTxw7YhXZ/u2GVESoai/EEhxmCmLHjc5Cbvjy4lMMWzJh5iit7Hf1KqnQx4+2uagU
         HKd5dxN+hjry1jhetdQ3H7uPLuOuSyvKe12dXkGNCMjpl5SQt4LN6kKzY3XrN7eyaeuh
         LVog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mk0NBpAL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id p26-20020a05600c1d9a00b003fbd2175fc3si285573wms.1.2023.07.26.06.48.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 82A4A3E00EE;
	Wed, 26 Jul 2023 15:48:41 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4R9wGd1GBJzxqw;
	Wed, 26 Jul 2023 15:48:41 +0200 (CEST)
Received: from [192.168.178.66] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 15:48:40 +0200
Message-ID: <27f131ff-b744-05fc-0e81-bd2b1267d394@oth-regensburg.de>
Date: Wed, 26 Jul 2023 15:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Configuration with 2 guest cells
Content-Language: en-US
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
 <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
 <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=mk0NBpAL;
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



On 26/07/2023 14:41, Jan-Marc Stranz wrote:
> Thanks for the tip to increase the memory area for the hypervisor!
>=20
> I have increased the memory area for the hypervisor from 6 MiB to 9 MiB=
=20
> and can now successfully start both guest cells with a size of 512 MiB ea=
ch.
>=20
> I don't know if there is a hint in the documentation for the hypervisor=
=20
> "Jailhouse" (in the GIT repository).
> If not, it would certainly be very helpful if this correlation (guest=20
> cell size - required memory for hypervisor) is described somewhere (e.g.=
=20
> in the file "Documentation/non-root-linux.txt").

Patches welcome! I'd rather recommend to print a proper error message in=20
the hypervisor that gives a pointer to this issue.

Just a short explanation what happened: Jailhouse tries to map huge=20
pages to minimise pressure on TLB. In your case, the area isn't aligned=20
with huge pages, so Jailhouse must map tons of 4k-Pages to cover that=20
memory region. Mapping those pages requires memory for page tables, and=20
apparently, 6MiB weren't sufficient.

Thanks
   Ralf

>=20
> Jan-Marc.
>=20
> Ralf Ramsauer schrieb am Mittwoch, 26. Juli 2023 um 13:12:02 UTC+2:
>=20
>=20
>=20
>     On 26/07/2023 12:56, Jan-Marc Stranz wrote:
>      > Of course, I checked the configuration for the root cell with
>     "jailhouse
>      > config check".
>      > However, this is not changed at all while I change the
>     configuration for
>      > the guest cells.
>      >
>      > Also, everything is fine as long as I don't set the size for the
>     guest
>      > cell larger than 320 MiB in the guest cell configuration.
>      > This only uses about 62% of the memory area reserved for the
>     guest cells
>      > in the configuration for the root cell.
>      >
>      > I will follow up on the tip to increase the memory area for the
>      > hypervisor ( hypervisor_memory.size).
>      > So far, 6 MiB is reserved for the hypervisor itself.
>      > To what size should I increase this memory area?
>=20
>     Just a bit more. Try 10 MiB or so.
>=20
>     Ralf
>=20
>      >
>      > However, to find the cause in the driver or hypervisor, I lack the
>      > necessary knowledge about the structure and relationships.
>      > So I have to rely on external help.
>      >
>      > Thanks a lot!
>      > Jan-Marc.
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a6=
18-1955e237cc87n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237c=
c87n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/57a4477a-2c32-49ef-8ccc-e=
95e1d9fb815n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/57a4477a-2c32-49ef-8ccc-e95e1d9fb815n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/27f131ff-b744-05fc-0e81-bd2b1267d394%40oth-regensburg.de.
