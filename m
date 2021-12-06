Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTFDXCGQMGQEXG6GXBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86346973F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 14:36:12 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbsf3790186lfv.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 05:36:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638797772; cv=pass;
        d=google.com; s=arc-20160816;
        b=MZxqGIUsx8ID6ze8jcSFqKrAuRNM5HZk8C6kprWhFnD5TTAkX4a+m3sMAU/cVVFQ/T
         XXDVUXw1PvmqL3CvvUgCiYk+pogMQlL8ck7zh1a+hhW04o+RpJdXlVz6iNUUIMZvWsXa
         +jG8jd+LNtUQoaVL7tqihOEWBxncgQMTAY3eWTjUL2PPdemTHa+0irp086LVocoWHbKX
         ABYMb1RwK+BNjsEX2q7LvMFqc/rWD7aF6w3V2NLfPtmBQzSHPu4Nn4d8oIIoM+J7WHL5
         4rP/sYtvXtry/GLIR2XVDcLsvebfcqMiblcfp5qMpPanCBuWI3A1ArVbbdSz0hjs6KFL
         qpHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=+SMDmnkfi7xWPUOv8GSRvVW917M6vwhTh48hre3SuKo=;
        b=cUZilITaIHGFJ6hNxAhG5JWVkT4cFbSatuaACH06lppwYYY124Jrqgylk6ijMIFvL+
         XIZcgRUGUpvJH610vJaLGhdQZma5rjQ5uo0yQaN1MTajUG3tbSub+/n0plhJpnk06Krm
         npCNr+JAcKox8wsAxATEtNROwRbpbRAzMiubPwptKBOZW1n0UGTNoKnZc466aFp/PYB1
         WIEAmDWC3sO0k82iW9VwApe9OYPmfbLCl29j/mNwCmhnaTUWrkyGU/h4HpWVzAzDd6PQ
         VlJ+XhZjvojXeRKe8MzrmybtUVYpBAHqJVll4GIdaFll8UB3wR13oIoAoLz8Tv7LkBbL
         578g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oMngRoWV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+SMDmnkfi7xWPUOv8GSRvVW917M6vwhTh48hre3SuKo=;
        b=nImw/WH35vjEKYabfOua+cLPN3xnxjCCnzNYCpzOiOQNbGBTn72L6FKzV7km8tJ0R6
         etlbSFkAeOAja6J6smgxxUmyURGIt4jqkiy5nO3cWs5gc8bHXFXeh0lWgX5PRP3pYmu9
         BkWgWbRfLQLdmOZfeQ01KCeG2r6etMUCzcGGqF4FzYUDAQtCh6ISZZnmtxOHWVp+zrEj
         1DklosRjdLPVTZhnk4BhUnVYQ3BMhmtBHBIY2QJvhs9vp4K7UVv0EWo2eJJ4gtwohn3F
         azRTQoK1csFhjTm73Al6SrtSdDbNNj2ZBDp7pv8yM3Mkj55Bv5trVHu7wwYFRb/NBzz9
         Wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+SMDmnkfi7xWPUOv8GSRvVW917M6vwhTh48hre3SuKo=;
        b=Mi+qso4xzGxouJN1lwNURYOkd2Mn53myVj0ztPcLINV+mMYrSr9ZBpOuChEWOs6ODx
         LTL/UbuRBZPYHsFE2+qmm1vNvumodrmatRQmaLwFwqNCT+avm9epANkoLD2WZ17lkVj1
         IpLN0/ZnGp72XCFOe1wKya6MgQV5LCax/+Y18XhypcY4niu/QyN1MNOIyjRrUxmPXFS8
         DdCgFWHGqdYRzZ03Zh3HcJGySMJSxXvfMD99N9veXiAq7LxVHDebGeCFNrVbLJ+vKpGC
         l7e2Pwwrm9V8qrx5IwFho5eJTwICpZnP8ZuZmr4XCmBoVgYnbAzBAesGkHnB4X+fRBsK
         4VFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KxIjhk/CnhsKUf+yTejaqovvFDgzciV0MMstJg3wHWvj2+/J/
	CJHoYVZRAyVLfudrn+7nZFU=
X-Google-Smtp-Source: ABdhPJzfigmyvcYz0lthz0cWRUxglIAFhV7No6GZVlGy8JvMbqOh9j+jMVFQDfS2rY7quF9uWhOdKw==
X-Received: by 2002:a05:651c:1101:: with SMTP id d1mr36269497ljo.373.1638797772252;
        Mon, 06 Dec 2021 05:36:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc09:: with SMTP id b9ls2582757ljf.2.gmail; Mon, 06 Dec
 2021 05:36:11 -0800 (PST)
X-Received: by 2002:a2e:a696:: with SMTP id q22mr34674412lje.423.1638797771222;
        Mon, 06 Dec 2021 05:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638797771; cv=none;
        d=google.com; s=arc-20160816;
        b=HW/3r6Q297KAtVVukaCZrlIcVVs+SzNQoguBIe3iQbyhGKNHHhkHOQJxVbl1SmHnmW
         +JCobqIxGdC8ZSCGgptFfdGvzeTeMO0XDxdUyhDkL2Ocapkra9Ju+SgZ3gHqnAAaE+rS
         spl98o+wJh58lh3kZH8e76TLBEUDcqPzxzXDYJmPl91IZKFXkoNcnRcr/6MyTVJ6jTiH
         LlKuvJX+S2r2QCG/3rMb+ZwQAIzn5uVcDILWO+J3MpS63NAzfneM/Hc+i6ReijMRpS97
         7Wllm6pcBA7/lIbtnPBBQBhNScOfNuIC1BExs0cGub2FqySTndNBqA4u2Z8HK6GD1L5v
         Hhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L3K6XaH6ePqeLoNi7eZNFajd8F7IRqj5D54x/kz43NU=;
        b=sxQrhHCI5IR+DlOw+ytVJB6TuufTEF6Z1TG5obN356kfKlnGlDp03d81VvH/IYCuuW
         dIuhY/OCYORKgp0r9F9SfcxxMGP8I4L9+a46UBBpGf86WRxONHTCH0Q2k4ConJehnwAc
         uBXSWc2bo8QaXuW/IlFB79rZQ0gUD/hiFeOUeUjZcGQb/miRLtrE3Ttj6OhotTSHQYEP
         lol5e5q9q/Pwk4pRTsEiUDoHbxJbRkXvusZlP8PxPPM1e57Z8Xfk8ZuCiRvTt8sAu7Db
         piOl8+72Ltik+x0qs86QDUI0OR9RpQTmZ20F3v+n4AYnpDr/00IMy4vIy3Eg0KrNterd
         /HEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oMngRoWV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d8si718614lfv.13.2021.12.06.05.36.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4J74Fk2zM5zy86;
	Mon,  6 Dec 2021 14:36:10 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 14:36:10 +0100
Message-ID: <f030cdc5-c6ea-78d0-8e39-93b098b27036@oth-regensburg.de>
Date: Mon, 6 Dec 2021 14:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] configs: x86: qemu: Add an extra variant for AMD
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: <meep@binary-kitchen.de>
References: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oMngRoWV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 06/12/2021 14:34, Ralf Ramsauer wrote:
> If we want to use the qemu-x86.c on AMD platforms, we must not define
> Intel IOMMU units. Build an extra variant for AMD platforms.
>=20
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   README.md              |  8 ++++++--
>   configs/Makefile       | 11 +++++++++++
>   configs/x86/qemu-x86.c |  2 ++
>   3 files changed, 19 insertions(+), 2 deletions(-)

=E2=80=A6 The stats and the Makefile-fiddling show why I still prefer v1 of=
 this=20
patch over this one.

   Ralf

>=20
> diff --git a/README.md b/README.md
> index f1b0cbe3..ac457119 100644
> --- a/README.md
> +++ b/README.md
> @@ -288,11 +288,15 @@ installation steps.
>   The Jailhouse QEMU cell config will block use of the serial port by the=
 guest
>   OS, so make sure that the guest kernel command line does NOT have its c=
onsole
>   set to log to the serial port (ie remove any 'console=3DttyS0' argument=
s from the
> -grub config). Reboot the guest and load jailhouse.ko. Then enable Jailho=
use
> -like this:
> +grub config). Reboot the guest and load jailhouse.ko. On Intel x86 platf=
orms,
> +enable Jailhouse like this:
>  =20
>       jailhouse enable /path/to/qemu-x86.cell
>  =20
> +On AMD platforms, use:
> +
> +    jailhouse enable /path/to/qemu-x86-amd.cell
> +
>   Next you can create a cell with a demonstration application as follows:
>  =20
>       jailhouse cell create /path/to/apic-demo.cell
> diff --git a/configs/Makefile b/configs/Makefile
> index 327043b7..5af0647a 100644
> --- a/configs/Makefile
> +++ b/configs/Makefile
> @@ -28,6 +28,17 @@ OBJCOPYFLAGS :=3D -O binary --remove-section=3D.note.g=
nu.property
>   CONFIGS =3D $(shell cd $(src); ls $(SRCARCH)/*.c)
>  =20
>   always-y :=3D $(CONFIGS:.c=3D.cell)
> +ifeq ($(SRCARCH),x86)
> +	always-y +=3D x86/qemu-x86-amd.cell
> +	targets +=3D x86/qemu-x86-amd.o
> +endif
> +
> +$(obj)/x86/qemu-x86-amd.cell: $(obj)/x86/qemu-x86-amd.o
> +
> +$(obj)/x86/qemu-x86-amd.o: $(obj)/x86/qemu-x86.c FORCE
> +	$(call if_changed,cc_o_c)
> +
> +CFLAGS_x86/qemu-x86-amd.o +=3D -D__IS_AMD
>  =20
>   targets +=3D $(CONFIGS:.c=3D.o) $(CONFIGS:.c=3D.cell)
>  =20
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index 9ca5c528..3f8f673b 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -45,6 +45,7 @@ struct {
>   		.platform_info =3D {
>   			.pci_mmconfig_base =3D 0xb0000000,
>   			.pci_mmconfig_end_bus =3D 0xff,
> +#ifndef __IS_AMD
>   			.iommu_units =3D {
>   				{
>   					.type =3D JAILHOUSE_IOMMU_INTEL,
> @@ -52,6 +53,7 @@ struct {
>   					.size =3D 0x1000,
>   				},
>   			},
> +#endif /* !__IS_AMD */
>   			.x86 =3D {
>   				.pm_timer_address =3D 0x608,
>   				.vtd_interrupt_limit =3D 256,
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f030cdc5-c6ea-78d0-8e39-93b098b27036%40oth-regensburg.de.
