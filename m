Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCGNZPXAKGQEVL7HQFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 12083100BAC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Nov 2019 19:44:25 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id f17sf11966575edv.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Nov 2019 10:44:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574102664; cv=pass;
        d=google.com; s=arc-20160816;
        b=AYkn/GZn8Zkq0AGilLC1/yMWDDNsibir+RB+Lp8GQHpeVq3nc9oK1jkBXSU+VUJBOv
         NnhK4I0b9H7pmvyy8ICirNz/43rnyeQP3QCPris+gggTfV7KnHca+GODJ+W190b2WG+f
         Xo2qTx4gRXw4b2vAYpVQG6vBcDjPm0Dj/i66usnDoFqZAWuehBjWfhbqjBReePNIEmKS
         G939fh0A2Nez8ZERwbeCi9RfJ+PwPLtU5bLwtmptW402RT4YOSuDbXyRVX3m5RzshZnF
         oO+00MmQjvDnIob3antf8tz/+/TTYOj1WbzVQklrcwv+XxLlahtyvWLRhVBE4e8bXTvu
         NNLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=vAsE/2znkJu2hyEJqVm9Vy3vJ3tH/41oU4zfI7mSCxo=;
        b=iEO6wW9UI24tfs9Ax+LlwPG/+OIo7thGlrMciKP0OQqzQSOIg2kuxpBSZxfXQt945S
         q09z1itXPKwuphyGTceHw1asRsTXz4QQa4grPotFXn2MfHF1+zWi1tF0fNG66hYCxb/Z
         TFULj1PusaQsn6OSbiwb9BVbGmSgxnNC2PZAP6rUDZm2T+otJj68kcZOK1GjlAt9eKVp
         NmdGxMNNsgfvrVT3dRVgrhj3YN96dUpn6tW9eIbu+iyiaz4pwvLSIY3ZeVSYhJvrx7BF
         22ESe7xbfrHIWgAqC3Vg6w4E/sgXnVVeGmR6pyRqhZHCGgAhQlJq9ozge3vfwel5uMj/
         xMCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vAsE/2znkJu2hyEJqVm9Vy3vJ3tH/41oU4zfI7mSCxo=;
        b=kB9gFHA+mD0/kYoic+y2QwcwwySprI+oIX5dGU+vpxiA0tG6Uy4HVvopOwXDU2SPWi
         Asy2SnJ7+M93pWZONoZPNeaj21UEx9NNyiEk5zNFJkyfgvuRX0nP3/jWx6s+V589t5OG
         jBrpgYPuNXS60TlaLkpzrf1FcERCRjPw7+8v2Mj1eqsq/5LAwBUUW3aSyirJMGFrimg2
         1L724JnQnUnNL5tBoIR99NyupMAJmLIX+7JOENDpSW7MLlPQ1ftYZtQ6r1Mcoa43r0bE
         wzPBurQwlVdDbJqI6UgBG0yKZHN2DwfLXKJqtrh6ygYks/DeKtBFhEmrQs8dx5GB5MNg
         8B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vAsE/2znkJu2hyEJqVm9Vy3vJ3tH/41oU4zfI7mSCxo=;
        b=IH/Jh6+jHqkiwCJ2byXgOKyFR7HO0Wcgjx/92DZFvTa833WpLxMHCryc/qyjvJefnA
         H+Jgcf5vhe+yvEHuYXqOtYxpwxwvj9HlUfWNgZEhlUFKKWGmCcGSrKgYqZ+DPz6rolEq
         mM4FuERSvKpZKNeUV5yL1NrRXsqZBUZzDTLCJBzREuILiUEDXlw1/lzZvEqI/Y/vrz6m
         3+D6V+snnMquqBWIq2/7APcH1aRUw7sM2x8S7HdVjpsupZoQ0PoVfWuMqg9XECQzHmQY
         bEGrt3oV0bXogJGExW88ZqIshbE27rmH9PzIDeybKd3Nz9psh2PaQQZqEEdBAP55tUT3
         /prA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8U8t312NI5Ddhwh55r0kHS09W5uiVJRxuPNNEQAq1nMEWnrYo
	Wt0ubyS8QPmK4n4RNdtMhyY=
X-Google-Smtp-Source: APXvYqxvjLyeG4NM1sq0b6h9lILV6ZUoExU/yTciWngV4DbjHdW1td9LGDn8IxQoXd3XtV+LGXdXow==
X-Received: by 2002:a17:906:e289:: with SMTP id gg9mr28199393ejb.71.1574102664732;
        Mon, 18 Nov 2019 10:44:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:80ca:: with SMTP id a10ls6018434ejx.0.gmail; Mon, 18
 Nov 2019 10:44:23 -0800 (PST)
X-Received: by 2002:a17:906:8548:: with SMTP id h8mr28301781ejy.290.1574102663899;
        Mon, 18 Nov 2019 10:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574102663; cv=none;
        d=google.com; s=arc-20160816;
        b=ao8eI8YyLb0bRGaAVxAce+QhuEbPaX8656oDUurTz3EOUJfT8MYCiBnOrgQRdvmZoS
         Cwzcb4G5I039ZQD+EwihTQf26W3w42ZrV3fRNtx2tPZue2r/b27nKn/vpbXga/LD7bgt
         LVvgXjCESQrdDhE8ANsmQufRTH/QnDLjTKnB5l5LWsZADBpDzOaBXh2QqV4FbZ4B0z+t
         d6zqRsxPGgIVvS0ODf18+5HjQJuCWGpgXct/uqUZjUKgj2eEbEcPFUJ7YoPIeNMfZjaE
         4XW7Ii+0I7ZbuZpHLxlORHj2/wXUx67AxPuGYddwonfxg7SShS4ZDMH/12pcfk7GRh6I
         pqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YlstlOqYSlILC3KYvi4WBhkWJnWK6cbD1uisrH+fxgk=;
        b=sA99iHGdmsStkf4EMryMlEqYEBoG+DaTIEAt6vhB7hLVS4UL2o40UJQS/BthELyI8b
         jkGnc0/W6m/U0TmAXEqiaK9EfkBOiigEFpGCSOTHQG2pxh3LEEPrHEi75NLYjY2IJ7gR
         Sw1QJhKkZmEy8/ywiYgIk7w7GdNEnzAUJe6tWj+s27LIVGry41TgDX2IwBvewuiXuFsD
         NuF6HVxQ6vQfqTV1ogU/PUnGhqloEHnxpCdK+w+Rrl+3d90hPmd6HhbdHj33JcSARXgC
         RrJCgKAao47RIDRfURT1SUD97785ngusz4BvygteWBI0JMn0ql1j0hjHn19D/xajxMp/
         ajPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c12si772851edy.1.2019.11.18.10.44.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 10:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xAIIiNk2007818
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Nov 2019 19:44:23 +0100
Received: from [139.22.38.2] ([139.22.38.2])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xAIIiMhl013030;
	Mon, 18 Nov 2019 19:44:23 +0100
Subject: Re: ITS emulation in Jailhouse
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
Date: Mon, 18 Nov 2019 19:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Hi Nikhil,

On 18.11.19 14:26, Devshatwar, Nikhil wrote:
> HI Jan,
>=20
> Current Jailhouse implementation has support for partitioning the SPI=20
> interrupts on a GICv3.
>=20
> However, the LPI interrupts managed by the GIC ITS cannot be partitioned.

Is this something we would need a GICv4 for?

>=20
> Typical usage of LPI are for connecting PCIe devices on arm64 platforms=
=20
> where the endpoint sends MSI interrupts.
>=20
> Kernel drivers for GIC assumes full ownership of the ITS module.

Means, it also touches registers it does not own? Or are there=20
conceptually shared resources in the ITS that everyone needs to access=20
when programmed own parts of it?

>=20
> To enable partitioning of PCI devices/functions (from same or different=
=20
> PCI controller) across VMs,
>=20
> One of the key important feature that will be needed is the ITS=20
> virtualization.
>=20
> Since the GIC ITS does not support per VM tables, one option would be to=
=20
> use emulation of the ITS module.
>=20
> Here is the proposal for such an approach.
>=20
> =C2=B7GIC kernel driver allocates separate ITS table in its VM address sp=
ace
>=20
> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS table and=
=20
> copies the descriptors from root cell
>=20
> =C2=B7All accesses to the ITS registers are trapped and emulated in the J=
ailhouse
>=20
> =C2=B7Any attempt from a VM trying to setup the descriptor for a certain=
=20
> device needs to be policed against VM ownership
>=20
> =C2=B7Jailhouse validates and updates the physical ITS table descriptors =
to=20
> match the VM maintained tables
>=20
> This will be similar to the approach taken for SMMU stage1 emulation=20
> developed by Pratyush Yadav.
>=20
> What so you think about adding this support in the Jailhouse?
>=20
> Would you be willing to accept patches for the ITS emulation?

Well, we do want assignment of PCI devices to different cells when this=20
is feasible, and we do want not only DMA partitioning but also safe &=20
secure interrupt handling. OTW: Yes, we need something that enables that.

And when the hardware does not (yet) support us in enforcing the=20
partitions during runtime, we need to emulate that in software. It's=20
just the question how complex that emulation needs to become, for Linux=20
or for "educated" guests.

BTW, those accesses to the ITS will not be on the interrupt handling=20
path, will they? Only for the setup and maybe affinity adjustment?

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
jailhouse-dev/81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40%40siemens.com.
