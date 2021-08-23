Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBG77R2EQMGQEIRXGV7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E23F4D8F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 17:32:44 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id w28-20020a2e161c000000b001ba14fc0cd4sf6486219ljd.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 08:32:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629732763; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wei3qEjAMApPRNZfrnqAe+qYHMfJRM1R1lAn4uD489vwssQHCvwAMFyKDxknRpSiPd
         jBV3oUy03k3fCbGfvTGp8WO85qvvYOzN7GHzsdVjP7OxpiBUHRl6US9ug/KnQyt39mnn
         vNBjmqXMvo6iLdf2hewoJrN67FdvBKcizAabVsKEgE/6B6DlVdjlVxXscNZc27cCQ+jK
         0RAMNnPOgsE94A1JVEvKCNTy/KSM1d9LkNq7uSdUX7Mu/cgGzi0fDZKCxcCN1j264MrG
         ZQ45G04rf+2KC4n3665nkYE93RMf0+Hyq/aAQpfAhgDaKk9QRupXBJqJvcAKTZfxOYZL
         1+fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4OUyx7q96w9K+USWU7I2wTa+Xd2PAWVkN+2mzau9R+4=;
        b=ci/mWkplDqzqhB7CJqMoIdKYDAOgVgF6LM+mIB1cjd1TfZahjqdNRNi07+RIFeTgTp
         IUFwefpJ92NXS+J9BIOLYnJm5sYLL03kcjltYFtLB8OSghitv7l2KwBKHP3wfDEECuAz
         AQlczV1xreiWvuQ5hu58SvJpRmidiEIPiPPXOeAGayheoYDqno9scV8vM2qGiZFehSHU
         XB14kGktMLPCpON45kcF0WtUyZuSLW1K672M/lBbJe7gmoJvRNpv8tx6IQ79Zo2aceTC
         IJKp9W8ECHBwD8oYTNK6pXJY+tExL8vxsTnQldcXjliXcBZqKAuQc7g3N6LikMwfnf2r
         c9eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPkDQzuh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4OUyx7q96w9K+USWU7I2wTa+Xd2PAWVkN+2mzau9R+4=;
        b=gbrqRPHop+jY7rtWI1IKVnhrCngKSlQCz6fYVNk7vLdI5puL/vzZ1h7OO4JPblXz36
         IU4GaX1zUM38iyIe0GokmZ+iJLflS8l94jK5LVJ0/wFGH/WFol4/9hVx9T2EYMZJdCb6
         23YB+U0S/g5Y5+/719qjkSmHxQL95cIU+j8X6/55b3XCLlVGPLHCRFMeLbHwyBZQZpVI
         9t7Teu5HuMrx61ILeVmsSpG+C0ANZYlKZ7odg0lbrFEoKxb5TPbOLC4HNnmeulVPo5Mo
         +14rGg9R4rs++xKroVQoC3NSBSNSb2GrBAY8jua8NxucUMRVAsmS5PwSlK/DT3JZkS/5
         ILVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4OUyx7q96w9K+USWU7I2wTa+Xd2PAWVkN+2mzau9R+4=;
        b=YtYlPxOuSGEzykinhajYMILNXdveo+sm0iT8VgabZxsGodMmBQHstDiDQ/fs0VeCCc
         DytUyaDXyDxqwnJNQiK0b21Kd5a9VpH8hqCSVat1E1OX+9WvBzHa1zGNFiMcrfXnspY7
         tNMG5A9ssggPIezcXsdsucxlIVBjrxum5deEA7aFoJQc721/m0Ofb4CBtBjfduqbMz2A
         NoLyc4LR2Up8AZ5BYwuOMsVss9IoU/H9ljS+yqdn7vgKhmbc8wuC1USLvEsZXqDqXPeA
         8wUYwxsMIWXtSR2YTYgKcCJV9hai4hF7KyXmIk8KxB9F0yi+uC5MTeZAaFriu+4ME8Nu
         4h4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328EI+vVfbmITT4lu/+2vsdhHYiQelK0lhwC4juk1d4zBUZyZoY
	yfNkHLrS2LD7pr4BOcbutY8=
X-Google-Smtp-Source: ABdhPJwrApKd3VPJEuz9JL1PhmMsdsOpxeSVmzk8hWZlrGrQGq21IUrgRiqn6t5oxOIUyRk15N/unw==
X-Received: by 2002:a05:651c:1685:: with SMTP id bd5mr22426455ljb.505.1629732763608;
        Mon, 23 Aug 2021 08:32:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c13:: with SMTP id z19ls552670lfu.0.gmail; Mon, 23
 Aug 2021 08:32:42 -0700 (PDT)
X-Received: by 2002:a05:6512:1689:: with SMTP id bu9mr26214893lfb.147.1629732762296;
        Mon, 23 Aug 2021 08:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629732762; cv=none;
        d=google.com; s=arc-20160816;
        b=V1BL6bU/JXVczWF60IbMUEWrYHQDNyIffjC9WhjHG2Je8KhUi/IfNOUQrrivJEEv7t
         X8+6SvBmsQYdJwjiLhotX7gGwVoBqNFLeiHbiOyyUwQIpfedgRCVD5ELwcOmCRrkOWrE
         VB7PQWLmnuG1vYcKGEoEwQpNco5dM6fp5X7qE4SqRfxzV2sq2944SZ+t0Cx6diBkwS9s
         lR8zQb3SZHV+GeLRowy0ihfJUt5qU3nOfSYW+CovnzwUtHOpkFVUk3kIHZksYBtRs4mJ
         DhiUUzpdFSIBqysLanuSLtL3luADlI27txKbqpTzt60PdgeI4wiMbH6+2szaL/4iGoZT
         UjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=J9JjI5f23FIGs1wdFcM+cHBbkcGY1NV0QFSLdAbZdiQ=;
        b=OU5bfJuzcUfxfxNT+kFCcKiqyTsmGVGIYda5QNRm/+szQxHVXcdrIuVc1XOT0ldBmn
         jVRCNyjGtblT38ZQrWpT5/50AnkkinNQO8r5ji7n53qrk0Jte1pargUcfvgfLAnTD6Oh
         n33dJhvGC/W++ZyNcWPoaq0WrVzCwe8V1J8JgQUvw8JXMnsyhdaDai+ig9LDUc+u6+gy
         gmPNGcEHTm804oFU5Xx6+AazgwZ6MHjnN0QxN/iCTlHjEKbwn08Nl+g+v5ejLIyvyc5L
         l7IhvIBS0DcO73JavLlqqgyRAcNAwTjHyvIpAs7cDNwNfM510dRMHb8CEebBG3zhM4t6
         9xBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPkDQzuh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id z4si121595lfr.2.2021.08.23.08.32.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Gtbpd2Zl6zxw5;
	Mon, 23 Aug 2021 17:32:41 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 23 Aug
 2021 17:32:41 +0200
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
 <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
 <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de>
 <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <6c3b1b62-84fc-fc39-1115-8f695897e712@oth-regensburg.de>
Date: Mon, 23 Aug 2021 17:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rPkDQzuh;
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

Hi,

On 23/08/2021 16:15, Moustafa Nofal wrote:
>>Last warning. :)
>=20
>>You answer in html inside response and use strange formatting: it's
>>really hard to read your mails and a fiddling finding out the spots
>>where you responded.
> I deleted the whole message and am answering to your message exactly,
> sorry for disturbance.

Reply-to-all=E2=80=A6

>=20
>>You need to use MAP_UNCACHED for MMIO devices. But keep in mind that we
>>use huge pages on arm, so 2MiB will get mapped, but that shouldn't be an
>>issue in your case.
>=20
>>     I could not find a signature, but I think I need a void pointer with
>>     address as an argument, am I correct?
>=20
>>How can you even not find the signature? There's nothing easier like that=
:
>>$ git grep map_range
>>void map_range(void *start, unsigned long size, enum map_type map_type)
>=20
>>But yes, besides you should use MAP_UNCACHED, this looks good.
>=20
> Yes, I have done all of this till here
>=20
>=20
>>OK - I think I don't understand what you refer to with "signature".
>=20
>=20
>>>Ok, now things get a bit complicated:
>=20
>>Usually, the finest granularity for assigning memory is the PAGE_SIZE,
>>which is, in case of ARM, 4KiB (0x1000). If you map anything below
>>0x1000 (e.g., 0xb4), then Jailhouse implements subpaging: The hypervisor
>>will trap on access, and dispatch the access. In this case, you must
>>specify JAILHOUSE_MEM_IO_${WIDTH} (with WIDTH=3D8,16,32,64), in order to
>>allow access within a specified width.
>=20
> Yes, this was tricky and I made your recommendation and used
> JAILHOUSE_MEM_IO_32=C2=A0 in inmate configuration file.
>=20
>>Otherwise, you will fault, as you can see here. "size 4" tells you that
>>the width was 4*8=3D32 bit (obviously, you used mmio_write32).
>=20
>>So now there are two possibilities how you can fix this issue:
>=20
>>1. Change the config flags of the memory region to:
>>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32
>=20
>>Advantage: You *exactly* only map 0xb4 byte of the device
>>Disadvantage: The hypervisor will trap on every access
> This option is working and does not contradict with the concept of
> static partitioning. There are different Peripherals in this area and It
> would be better to distribute on cells.

Depends on your goals and /how/ exactly you define static partitioning.

Still, in case there are different peripherals then subpaging is
probably the way to go.

>=20
>>2. Change .size from 0xb4 to 1*PAGE_SIZE. This will map 4KiB instead of
>>0xb4 byte. If there are no other devices behind that physical memory
>>region, then this should be the preferred choice, as no further
>>hypervisor activity will be involved.
>=20
> I used the first option and it is working like a charm. The second

Fine!

> option I tried with .size=3D0x1000 and I got:
> unhandled data write at 0xfe2000020(4), which is the GPIO_SET_Register
> unhandled trap (exception class 0x24)
> Then CPU 0 was parked
>=20
> unhandled data write at 0xfe2000028(4), which is the GPIO_CLR_Register
> unhandled trap (exception class 0x24)
> Then CPU 2 was parked

... Did you assign those two CPUs to the cell? It looks like someone
else would access those register (ie, the root cell?)

  Ralf

>=20
> So, I will avoid it apparently, unless you have an idea.
> Thanks so much for your help and I tried to avoid HTML emails as much as
> I can.
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/bf8c269c-0868-4296-b97a-e=
dc841ac530cn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/bf8c269c-0868-4296-b97a-=
edc841ac530cn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6c3b1b62-84fc-fc39-1115-8f695897e712%40oth-regensburg.de.
