Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB7HV4TTQKGQEKXLAJTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id D720637934
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 18:10:36 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id a1sf50394lfi.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 09:10:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559837436; cv=pass;
        d=google.com; s=arc-20160816;
        b=giZmoWgi14clpFnnJbRpqnDp+aMhdtI3YEDORlujKwwL+kigwKwQVkEcnHBhE9b+qS
         NbPIWnqtd3JhSXgm+NdM0U6O7sBsTh3uzK2Fi2fq7Zq/EfDAKGO4+xM9HW7rxih1LRhp
         aTNeR8dr+ySzmJCsJweoQ9pcBiUSVVusj5AXcxTsgFkjKH0iAlb/0ART+VxfOOX7uUS8
         HJK/wiuHq8qJ2pYANarUE6FR8EDL7+PH8Nd+NE/gOKWs3zghq8BCoRyVe+gFrczFThnH
         qigHOeBpu7mQ2fIwehVErqpc3Wpr6KzcK91WuirWzEe6UqW7ddRBLyAXbIvwS7U0bSqw
         1lyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=gUPtpks28ZBTlf5rgRs+SfjsOVglRqYyWBgWnZIH63g=;
        b=iyyLA1Go9sZ5MHiwegOmAEnzPn7x/I1tZKopOBSsiRcIjozQLmbYuRqa9TcvnIkDdN
         EMCcvsYaLqfV5g1+3ELx8LQCtFASqicVkhc6hQOuzwYpX5zwe4EmDxBZCO42+PwQewHz
         IGdy4NJMEUQcykWCR49+w8NgmfTq/HfyxN0B3IaZ8vX/iAIb9qtDynt7ia87qHHydzHi
         MjUXglsFkFp13k68G2v+3fJSDKBkuwL2mUCQrgrrSNgZgu2QFWI29vz8zDfrT1wuBj0T
         j/e0cUi4aKZ0A+2gZCVR206VhdGwMDBawU+20vY6kobrlUtpXXI537zpLprNWqoQlVmD
         qZ/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tyk182ZH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gUPtpks28ZBTlf5rgRs+SfjsOVglRqYyWBgWnZIH63g=;
        b=WmEkxfNx0bSKBBEdmDjHdrUzSKz2dhpF/nOF3Z4haWtY8hoyPikOASK093cEV9Hblp
         FpOsRfnVu7qN4C9QmcTUcUmeaYZYvOaMYfNi102KFTptco0bkXLS2RFrSvYTnWij5YqL
         4xnAU+/JQBJtgA7oWJw36hbcsc8+MhKQsRXGpxzDqorPU5386glXdj1hkK22T23QPweW
         G2hGnPj7cV/XFQg+HqYQ7w0cQrbwQW9wHpuNN+fsV+rg3UtwGK2eSDQKFu4HAYByNKy+
         Furg/qCbT0TJezbdEA1HBbu4t5S5aZl4M1ts9R0g/ahvMDt73LEi09uSUdg8y7Optl0H
         PnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gUPtpks28ZBTlf5rgRs+SfjsOVglRqYyWBgWnZIH63g=;
        b=slXH0wBheLWXaPDksFtGG/AaZbXyGdF9jtD3DFXyqCofartQnp6TTNpO1en4BJHbxA
         JqWMEVVystr+ZwIWmh3nOHf1AYNT/3wzkCSF/IWn7mdv2tETRGrjGaLgXoogzwMPZNTS
         4gB4QMhcMmnSSLVzaPZVGZ0wapjuv4r4X30aR81pAMJrknCWFq9Wzh8+ny1hGr3cr/Ld
         XmrqTLJbf5Iojos/csnEUth97yIN00RiedWqjUQ7tvyoB1AYppKFKqQ5+raLYbdTiRHt
         P1/jxlrHUMOQy96vYhml99pVese1TVci5TKxTLWiLRoLyCa5ooyH5acUKtIkGz51Qwcw
         ITgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUZSfD1vHBdKMwBifoWLDYeDKlwa44M9yv9L5CfYFMM3En1YNch
	VhMmadF4uW06dkHSUQUqhO4=
X-Google-Smtp-Source: APXvYqzg2V/ej5i81jjAFwUZRJCig8kl1xW2hrxQVnogpFYEsCVNy4OXu+oWS8/bICx2FWEGlVEdeg==
X-Received: by 2002:a2e:860d:: with SMTP id a13mr9167921lji.215.1559837436443;
        Thu, 06 Jun 2019 09:10:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:83c4:: with SMTP id s4ls717722ljh.13.gmail; Thu, 06 Jun
 2019 09:10:35 -0700 (PDT)
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr7679783ljq.184.1559837435624;
        Thu, 06 Jun 2019 09:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559837435; cv=none;
        d=google.com; s=arc-20160816;
        b=ABWgh+LTaLUFkYRGm6GKfQ0al8ka4GPQhTQARSR7/8KpmJjET2ydfZFy/qlzhHSEze
         Q+be/5UgeUDQbgUT5ZPClKqK1fcoBOvUBpYj1xJYnESwkgvIeQn85SGhY028xs5fQlK1
         OjbbeYCYkxmvHn/ta/6V1w9r0ue54saMSZTMHb9OchL0uTwaB5lPGnHdAp4aqY+893jV
         L0vlnsIuSmChqq2OfVgSMyCjb/wcQaGpVK883hpk8T0Hxe7xVGSu0lH0D1o2sgUFMLwt
         sXl+kcUUO3F8/h17JaN9qUI+9xAM6fb9ROEFoVyqYCs1adO7s44R//lwPY4R1vXQmLWo
         49ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=eZuOaHHSuXC3bFpfRWjB8pEu6fXHdmGvtzIZIcOP6qI=;
        b=C7AKztBE27Yn60MHbDgRs481uVwMxzMSPTsFupxPlHR6TK0F0UMGFW7F+YMsgV6yDS
         nvPd+4w8pz1BPQ0WJKRrKX5o/+HZEfTTXtosVWm2TFi9RTITLlNoBEGvVshLe767z/6W
         dUAL29ZXEk1Hz4EUcCkNwPUt7jqyjNMH41R7R5eCiPuI4WDNVpzR71IuLRnnztfbKqE6
         F9zUzKQ9oh+aCbWSLTjwMM2MbAEd/UPTHIH2OZjgullzW4klZ+8BGCAPbLibvqFMMNeC
         MJiCq54GQAMM4YUqzIxICyjDGWNDOe642P64FMRXG1X4qCoWWqSxMJDeLnoWVteTKeLg
         cVVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tyk182ZH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a20si142237ljb.3.2019.06.06.09.10.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45KVxk2swXzyQd;
	Thu,  6 Jun 2019 18:10:34 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 18:10:34 +0200
Subject: Re: Freertos-demo bare-metal boot
To: Johannes Maisch <johannesmaisch95@gmail.com>, "Dr. Johann Pfefferl"
	<johann.pfefferl@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Daniel Schmid
	<dascit16@hs-esslingen.de>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <95b6464e-f439-9b8f-8df6-2ad7281c5cf9@oth-regensburg.de>
Date: Thu, 6 Jun 2019 18:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=tyk182ZH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Hans,
hi all,

is the inmate actually supposed to run on bare-metal w/o jailhouse?

Correct UART consoles are set? I'd try to add a very early printk inside
freertos just to check if that part is 'alive'. As you have already
remarked, the UART requires clock gating on bare-metal, while we in
Jailhouse, we may handover a gated uart device.

And then there's paging: AFAIR, u-boot hands over with id-mapped paging
enabled, didn't it? On jailhouse, we hand over with paging completely
disabled.

On 6/6/19 5:52 PM, Johannes Maisch wrote:
> Hello,
> thanks for your assistance. However, we can't boot freertos at the
> moment. I adapted the linker script like this and rebuilt the
> freertos-demo:
>=20
> ENTRY(vectors)
>=20
> SECTIONS {
> =C2=A0=C2=A0=C2=A0 /* jailhouse arm inmates have to start at address zero=
 */

That comment is no longer up to date - inmates don't have to start at
zero, I added the CONFIG_INMATE_BASE option a while ago, for exactly
this case: it allows to use the same inmates on bare-metal, as well as
as jailhouse guests.

The motivation of my patches were motivated by your exact use-case:
Having the same inmate for both, bare-metal and in jailhouse, is ideal
for benchmarks or comparisons.

  Ralf

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D 0x48000000;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .boot=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : { *(.boot) }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4096);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack_top =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
> =C2=A0=C2=A0=C2=A0 irq_stack_top =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss_start =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(.bss)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(COMMON)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> after that i tried to boot freertos in u-boot with the following commands=
:
>=20
> =3D> load mmc 0:1 0x48000000 freertos-demo.bin
> reading freertos-demo.bin
> 198508 bytes read in 45 ms (4.2 MiB/s)
> =3D> go 0x48000000
>=20
> But the Freertos-demo still doesn't work. Is there anything else we have
> to do?
>=20
> Johannes
>=20
>=20
> Am 04.06.2019 um 12:27 schrieb Dr. Johann Pfefferl:
>> Hello,
>>
>> the start address can be adapted in the linker script file
>> "lscript.lds".
>>
>> The UART is initialized completely by FreeRTOS itself including the
>> clock gating (hopefully).
>>
>> Hans
>>
>> Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> On 04.06.19 11:09, johannesmaisch95@gmail.com wrote:
>>>> Hello,
>>>>
>>>> we want to do a comparison of running FreeRTOS on the Banana Pi with
>>>> Jailhouse and running FreeRTOS bare-metal on the Banana Pi for a
>>>> study-project at Hochschule Esslingen. We were successfull in doing
>>>> this with the Jailhouse hypervisor, but we currently didn't find a
>>>> way to boot FreeRTOS bare-metal on the banana pi. So our question
>>>> is, if there's a way to boot the freertos-demo.bin from the
>>>> freertos-cell bare-metal on the banana pi.
>>>>
>>> Conceptually, you need to make the demo executable at a different
>>> physical
>>> address (it's configured to run from address 0, but RAM starts at
>>> 0x40000000
>>> on the board), and then you could load it there via u-boot and jump
>>> to it.
>>> You also have to ensure that the demo configures its uart itself and
>>> doesn't
>>> rely on the root cell to do anything. I don't recall if that is
>>> already the
>>> case. Hans may tell more about that.
>>>
>>> Jan
>>>
>>> --=C2=A0
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> Corporate Competence Center Embedded Linux
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95b6464e-f439-9b8f-8df6-2ad7281c5cf9%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
