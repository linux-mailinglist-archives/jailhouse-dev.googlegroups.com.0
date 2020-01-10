Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUWV4LYAKGQEQ2S7CVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3513740B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 17:48:19 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id v17sf1176116wrm.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 08:48:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578674898; cv=pass;
        d=google.com; s=arc-20160816;
        b=rQvAdZsYnky/vXuHaar+BIhisp1yopgHbosz9NwS1bdtpSCd3VMGseano0Fhwj/68t
         AgT/97feWPADziwzwQYdPvEmprk18zfA4JsMTvTljZtkUeaDbpIOpQnqLaoRRFk7OypQ
         wruQrjwexJtjy5zc5vga+n3bZvhYSvaMInwlnKvUtQjm4ON0BkOVVzoRLfIbhrA4ubN2
         hUSKR0cBeb68wUYu8sQRcY5rvxbgTDzfgZOIVnNSYuI/ju5Lld2grOkMx4QVB2yTY/QX
         fMSHoEkK1XmZJztO9be2fp6P6K0Qfyha2uyLDsa92t5Sjf60s4AuXdoVjkXO0hvKSwo2
         r7iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tWhgKH5/6xwfFwOe3piTz6R2WafZh0D3pA8FEfRVIZU=;
        b=Eh99KFX2Nu++FMbDOkudj5eaphzILB0aj32rOhGA0KIgZoZJFMs4fDzd+sT4DUquIO
         cY15pC8af6HWLqkII0zzvF8YsBrhbwkd9yxC6fGR02O3GAD7MH9Y1gvB/yqGxlI5lJ0A
         6aouIv0y4K7ebhnWqpvN0orJ0swKcAr74VZd/i5dlYJ8yhrP8EtUz0j8l759h2n0xETS
         g8tQRrznsOlLnhWSiZ83XrlgEo+tv31xMDDY3/EOTIjWpt+sst+faOr9GR9DCFlOfJx7
         ZWwdadOFZVbKzxuPlaHm1pLaVpD/WBy6DbSi4NHi6Gh5x9fi++TDTumbr8usy0r5SxYd
         qDRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tWhgKH5/6xwfFwOe3piTz6R2WafZh0D3pA8FEfRVIZU=;
        b=Jg3poM0zhugJOE1VXtpv+oc3dbUjBgejJPU3NX7eNc2hPCzWAN0t6Hc3c6L+Y5CJFp
         6mwS2aOXZGN/aNht4dPzAtZ9zKrH+MLiw8biD1gd9QDlkTE8bmHKhLJn0hOY7Dnp7laa
         Xw6THkHhii/myvOIL9lk36rheytj2tCgXAxDC+oroNwyPvqsZ5SFTHYnBZRz/o+jrcxH
         pG1DME2nvOmRHTXXl65oRxonZpFGd/NHEPY2GXzQU7/gs62r+EUnNg7KShKdsGB3weTP
         4ix4fERuP2OoWsgEf7FF1FFmVp1admnvdXCB8vcSUffjwPjv5LFQgSUUcozRz4/MNC9i
         sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tWhgKH5/6xwfFwOe3piTz6R2WafZh0D3pA8FEfRVIZU=;
        b=UaS+FTkV7N/F+sZYoTwq/7jccocp6opVSnMz1Jflr4+Ik+qxyfeRF9pZl3yNaXbtmJ
         KOSgg+eJlaX/nEBYyIXwSXOQa2WRqGoYSQhPNM9tIqGPOBklc9aAoFS8vyGVqHIINGss
         b+93+UQz3dl6fx6fSykoPTwb/1GRPQ3QeVG0H4dbV8d6/6XGQ+qXC/Aa0ShT+AOcnNhm
         jcs72kw5kpHRne6bVqs4Ylny373LmiU50yOpIqy3/8imi8K+uTzaWHTHsfiNKTULy8xt
         THpbnjbq8SQ0czCKCwsGvL6TZsDAqn8nJHdtub/1Sa9J9+gA1SvKQ0X/FgLPqv8oJe+r
         9pug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZPAVO/Xs4kkxNDATsweKHKdUMETlpVp0m2fDOAwYZvVTXNikM
	d0XWGOuARrTyvSmxFpg2f1U=
X-Google-Smtp-Source: APXvYqxmBMBz3u6Cz3i9o3c9kTsKCw9lIe87zTA3lC/9ooZzJiYDbbGqT6vOUCkDNdXAMRgWrttJGg==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr4302828wri.95.1578674898688;
        Fri, 10 Jan 2020 08:48:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls2089205wrs.9.gmail; Fri, 10 Jan
 2020 08:48:17 -0800 (PST)
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr4602668wrr.312.1578674897906;
        Fri, 10 Jan 2020 08:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578674897; cv=none;
        d=google.com; s=arc-20160816;
        b=EmVAoNlIUxHfJsZYjVcRxzFmgfc10J3uEcONtq2j3LpbTL/y0K02qGtI+wABo//G2Q
         9qBHBuRivnMIYIGv6ejCxRbOJCGsSfzZF8rnFbJsdAYjwt6mM++cNbrQG2uNMeXbQgko
         ofTVWBbTw/tn+gdxlbST1hUa4cHv24TE2bePxaum09f/BMbsCcOb3/YwSahB5wxvams8
         OE7j5XdaCQPDeOn6gnCKK4paMcoa9ocLTSwnrINYizHPiigv83ZaH5EVh0rMDCJ8Ea+D
         4hddVkfR/recVgvEVXDef98LnXbrjQW0lbq2oI6UMiwbF1ro1J6H/GFe4b0+QgfpueYb
         xnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WvmlfBdMLLZpKHHt4X0WNSr1eBgzoqGcpcWBr+J8s4I=;
        b=lpMKhUHQT9LWSH7FvnMspvcBTozBjESLbLcObEV96ytK4J40iZiB6NbLICKeJcZw6D
         H1/Rn4y7XQ/vsP6Omo7lWJnnVlu/IGPEwMVy/6Q5BTZ6E0BKvWTi7yBwbDTKOBuIG+gc
         lCu0tBTD8BmG6RXFTsFEJNbhmIn+eLIAalm3hGtqRxLM60K9W0lRdo7jICjX7FMy5jdL
         NZ6FA+7ahRfFfiyunp4/Sfg+FPc1hjqgYaItk8D2AjcWH8CA6uYn0YrW27MutjWH05ru
         gcq4tb3KLftTOrHg9VrxZN+baGPPP6TSJrOTFqqmMh7DaxhwvTkIaHRomMcfxH1xNP68
         Tzng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m2si335635wmi.3.2020.01.10.08.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2020 08:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00AGmGSp030252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2020 17:48:17 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00AGmGx9010360;
	Fri, 10 Jan 2020 17:48:16 +0100
Subject: Re: ssh don't work on jailhouse-images and how to create two cell one
 with application and another with linux on jailhouse-image demo
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <b33c1868-f6be-4e7c-8b23-7d7bdf75f15e@googlegroups.com>
 <3f685f85-d1ba-4619-6d0a-06b6b675c60f@siemens.com>
 <dd8368be-e94d-41cf-9bf7-654094e623f3@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2bff0717-8e2a-d017-4a68-96c1d54547fd@siemens.com>
Date: Fri, 10 Jan 2020 17:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <dd8368be-e94d-41cf-9bf7-654094e623f3@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 09.01.20 20:28, Saroj Sapkota wrote:
> *Yes, I tried after enabling=C2=A0 jailhouse by first command I tried to =
open=20
> jailhouse console by typing second command but it results same thing as=
=20
> jailhouse enable command as shown below:*
> root@demo:~# jailhouse enable /etc/jailhouse/qemu-arm64.cell
>=20
> Initializing Jailhouse hypervisor v0.11 (0-g58052a7a-dirty) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 87/996, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 12... OK
>  =C2=A0CPU 9... OK
>  =C2=A0CPU 6... OK
>  =C2=A0CPU 13... OK
>  =C2=A0CPU 15... OK
>  =C2=A0CPU 8... OK
>  =C2=A0CPU 14... OK
>  =C2=A0CPU 10... OK
>  =C2=A0CPU 11... OK
>  =C2=A0CPU 5... OK
>  =C2=A0CPU 2... OK
>  =C2=A0CPU 4... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 7... OK
>  =C2=A0CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
> Page pool usage after late setup: mem 143/996, remap 528/131072
> Activating hypervisor
> root@demo:~# =C2=A0jailhouse console
>=20
> Initializing Jailhouse hypervisor v0.11 (0-g58052a7a-dirty) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 87/996, remap 0/131072
> Initializing processors:
>  =C2=A0CPU 0... OK
>  =C2=A0CPU 12... OK
>  =C2=A0CPU 9... OK
>  =C2=A0CPU 6... OK
>  =C2=A0CPU 13... OK
>  =C2=A0CPU 15... OK
>  =C2=A0CPU 8... OK
>  =C2=A0CPU 14... OK
>  =C2=A0CPU 10... OK
>  =C2=A0CPU 11... OK
>  =C2=A0CPU 5... OK
>  =C2=A0CPU 2... OK
>  =C2=A0CPU 4... OK
>  =C2=A0CPU 3... OK
>  =C2=A0CPU 7... OK
>  =C2=A0CPU 1... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
> Page pool usage after late setup: mem 143/996, remap 528/131072
> Activating hypervisor
> root@demo:~#
> *why I don't get jailhouse console?*

"jailhouse console" does not provide an interactive console. It's just=20
an alternative ways to dump debug messages from Jailhouse to the root=20
cell, rather than just a physical UART (or the EFI framebuffer).

> *other command goes well and I can create cell for apic demo and load it=
=20
> and start it on the host terminal and it continuously run I can't=20
> destroy the cell as it is running on the same terminal. So, Main problem=
=20
> is i'm unable to get jailhouse console and control it from terminal. How=
=20
> can I do that?*

You control Jailhouse from the root cell with commands like those=20
suggested by the demo image. Study the jailhouse man page for more=20
details, but it should be fairly intuitive once the basic concept is=20
clearer. See also the various presentations and tutorial on the=20
Jailhouse architecture.

> *the sample output and command result is below: once cell is started=20
> neither I can destroy it or terminate it.
> *
> *
> *
> root@demo:~# jailhouse cell create /etc/jailhouse/qemu-arm64-gic-
> demo.cell
> Created cell "gic-demo"
> Page pool usage after cell creation: mem 154/996, remap 528/131072
> root@demo:~# jailhouse cell load gic-demo=20
> /usr/libexec/jailhouse/demos/gic-demo.bin
> Cell "gic-demo" can be loaded
> root@demo:~# jailhouse cell start gic-demo
> Started cell "gic-demo"
> Initializing the GIC...
> Initializing the timer...
> root@demo:~# Timer fired, jitter: 370435 ns, min: 370435 ns, max: 370435 =
ns

So, at this point you have a bare-metal demo running. If you destroy=20
that again and start the Linux demo, you will get a second instance of=20
it, and you can ssh to that from within the root cell.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2bff0717-8e2a-d017-4a68-96c1d54547fd%40siemens.com.
