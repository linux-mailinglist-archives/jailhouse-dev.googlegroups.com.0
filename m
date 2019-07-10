Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFU5TDUQKGQEBQ2SWDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1364A8D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 18:13:10 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id i6sf1153861wre.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 09:13:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562775190; cv=pass;
        d=google.com; s=arc-20160816;
        b=PPGvg8qqOTjmRwpElohUfg3xdxfVPqlcR9lcd7Hbfw2jLsH85Rke1yI+fYLF86Uo8M
         SlhWD1V1y+PZvtze9vmUxxkO7I0VDqCyBMSNISsgizSlH3Ss0Wxr42SXSF3BYGIZZKzM
         GricqmvbGWTimYs+8jnuYs7G3Z53C4Aio+7TkIGmL7QzHuSkqAjhEL+SVet5fI1Sk/uA
         CCaBsec2NH39wVyN4dPEPpTsmL6n6n78CuydLjTLpEwIQFWVJM78BaxBc+Du5kYIPKTs
         1PfCCle2uiLtzPZdCAsyb1A1hWTJk71MUKm9WPfoFqf3pZuld7BrYy/ZvQtb4KCOPn7w
         KoZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ucfLlomoafGlZSULqxvaQdftazZRu95f3d6Kt7lXngw=;
        b=nNlK4PFcGsYD/cW6zZrRbWrNmjUmLMF5k89EWSF+VfhrMYMcqr+YOCgVqXy5uJ+qX4
         5mqYa3VaX9HJ4l237sZyt/L+KKOp5JfG5ihXgYXc9k+eJArGQ4TjNdS2yVG94CiWwpzb
         vqJsqnVipPuvdLVvHlBLFfEHEOo3l2rEVwMTGoY3oD4Y1vs9dBfHm2ZOHuXg4BZLVqE/
         ekejGzN4Al7QoIdqLcPEZX7EkUhdMq2cPOJ9oA6fTaJDkuYBNYi2OzSGYIyXlXUOwLis
         B3fPciPgdRi4PPGLd/rKuKCZ8NZjgeuuYTVDVToJsgyDTa9/fIJrohPlb769p3Buoi8k
         B2jA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ucfLlomoafGlZSULqxvaQdftazZRu95f3d6Kt7lXngw=;
        b=i0ivBodmpq5yt2AHQxJb6n27Pdu8aZWzLugxeqkraQL9TkLTboCVLNTKTioThWPM/D
         KwIhBuvg/zdaO9b27Ex+dOVY3Klne78IaazDZb1IIRPnOPrXYA4zwCNS76zYk6Sq9ZqY
         zAD27M1V/XKqthgjb2e5zqdUfEtIhGStra00siHmbB5obkZ9J86kd8NqBI1iz8yd5THV
         JA4+eILblwf+MDBDDE4QobgMu+dj8ouUPMdvAPFx66WA0xgt2A3ZAUxoP9290FKoGscq
         QO897mdyl/iFnT3jqyN4/sbd4EeqLOoZ4oeYPqElrcq9fDmttgDiaZfPoopInesJX8kw
         OfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ucfLlomoafGlZSULqxvaQdftazZRu95f3d6Kt7lXngw=;
        b=s8DAN6eCmYWlVY7UT7dqDjP3cFWYkFuBuCUs3YibJwqARimZc8EiXkZohIclCL1gD4
         mmjK68Amx/pCMPWtPoObYIsTqdQxCdZyZ3kAVdoWoUqSxUa2roxIboxx5Mpgb4X9NggZ
         7f46O1rmY4GOSHOW8uiZGtsmD5llrbx7sLVYMkZhRBkIgKqGq6UEjyexPp8InSND0Msr
         OnQ3TNILoa6m1aJSaEsBUA7Qh9A52nPCXNqqGA4coYxku4dGP/n+OTsREecEwQY4TGdu
         Obdm6zygO+QOqvauojq4aNcg8/og/ZQK3sOhYUIbw/h5MUKQEtpp/3Z0aA6xfuh1jASK
         rmTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0F/SA0IsItUO765WDw4nw5ovhZikj+8wgyYbBKPhvNahwJR52
	L7yEnokVy/YhmYznB/NQ/iI=
X-Google-Smtp-Source: APXvYqyZEBwnwtTwhye6MgA9B4Ezbi3VrwQs6Tfm2HaeJIrtAg8yggaeqEIHeto44pAZKqKM+l9O0Q==
X-Received: by 2002:adf:f246:: with SMTP id b6mr33133185wrp.92.1562775190613;
        Wed, 10 Jul 2019 09:13:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5709:: with SMTP id a9ls880295wrv.12.gmail; Wed, 10 Jul
 2019 09:13:09 -0700 (PDT)
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr33909161wrw.266.1562775189831;
        Wed, 10 Jul 2019 09:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562775189; cv=none;
        d=google.com; s=arc-20160816;
        b=rhD2jgbc3S4/otf909ToD1ateDwUVWgjtwunuhVH8/nP64yfW9JlczAynTAvaaI3Di
         6qLeS7h1TFjRvLqBBV5c0nYuwNtADfSRD8MY2Revv++Udcngu4kRpnwrAD2BfUIXw7R6
         5dcoxCdx4iSGW4RJtRvIpxDsRKbFK/JrnHyaBxRTi6iFvEHEtiDQl9EN386OLznfV0Cd
         DjgXN29Y6hbHhAwy2WxBtd+gHhxPWgLtJhOgFPIrFnGIJks34/fwZUE+wkv1s53amnhd
         CNoG4z2RuAvyw1O/ogJJrMzeauM+h4r+1ioOQzJE8d4LQBb6UDFtWmL832PWDMbpMjrX
         uYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1C8qjQstfIede0CIPkCNYvuFpZGkk7DHupA279dXZuo=;
        b=UWpBrMFIzxSTR4dZgGgtXCRvfs8c4YHcCMCMH4T0L0wTdE/h1bEK554+fo6sJMfBbu
         6XWuojJ7D5eG1GGZSSdIXRipyXaU9H6wrtm+bxCNsSJgOsXlDkDcjOh6rinX0WD9o/2S
         wRrdnb1TdxCgMvOVsNzOKljoLpeywG84qUITSsWnjwPKKjuHEXmH7Bnv3u9cwaqFT9ox
         T0K23vDUvyMVi0Sewxc55HugYBfpjA4EyDwET6otIgpYsOEyvn3Ggw1XrBU3z1o9CeZC
         cidXogaYnjs2vjmE+RIWGXa156mb651thhCHuGvOuGIOmq1x0DhaN9JKeTsZqJrfeRkW
         nnfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s13si208457wra.1.2019.07.10.09.13.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 09:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6AGD9jr008784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 18:13:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6AGD9s9016655;
	Wed, 10 Jul 2019 18:13:09 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
Date: Wed, 10 Jul 2019 18:13:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 10.07.19 15:58, Ralf Ramsauer wrote:
> Hi,
>=20
> On 7/10/19 3:20 PM, Jan Kiszka wrote:
>> On 10.07.19 12:19, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> on an Intel system, I'd like to assign a PCI Device (dual port serial
>>> controller, 8250 compatible chipset) to a non-root cell. Please find
>>> more details of the card in lspci-root.txt. This is the card as it is
>>> seen by the root-cell, before being assigned to the non-root cell.
>>>
>>> As exemplarily shown for an E1000e card in linux-x86-demo.c, I followed
>>> those steps to assign the card:
>>>   - Add memory regions
>>>   - Add the pci device
>>>   - Add its caps
>>>   - Add access bits to I/O ports
>>> ... to the non-root cell configuration.
>>>
>>> In the non-root cell, probing of the card fails with:
>>> [...]
>>> [    1.551079] serial 0000:01:00.0: enabling device (0400 -> 0403)
>>> [    1.559060] querying PCI -> IRQ mapping bus:1, slot:0, pin:0.
>>> [    1.574310] serial 0000:01:00.0: can't find IRQ for PCI INT A;
>>> probably buggy MP table
>>> [    1.582375] serial 0000:01:00.0: Couldn't register serial port 20c0,
>>> irq 0, type 0, error -28
>>> [...]
>>> (see dmesg.non-root.txt)
>>>
>>>
>>> AFAICT, while this card support MSI interrupts, the driver wants to use
>>> legacy interrupts, but can't find the IRQ. In the non-root world, lspci
>>> reports this would be 0, which is clearly not correct.
>>>
>>> In the root cell, the card has IRQ 16:
>>> [    1.921700] IOAPIC 0:
>>> [...]
>>> [    1.921811]  pin10, enabled , level, low , V(10), IRR(0), S(0),
>>> remapped, I(000F),  Z(0)
>>>
>>> The non-root cell knows this irqchip. Any suggestions what I'm missing?
>>
>> No. nothing. This is in fact an unsupported case.
>=20
> Damn. That's what I already feared=E2=80=A6
>=20
>>
>> The problem with PCI IRQ forwarding to other cells is that there are chi=
psets
>> between the PCI slot and the IOAPIC, and they can affect the IRQ routing=
. Plus
>> there is a high chance of interrupt sharing this way, something Jailhous=
e cannot
>> resolve when doing device pass-through.
>=20
> Yep, in fact, this interrupt is shared with i801_smbus.
>=20
>>
>> Therefore, we do not address this case and only support MSI/MSI-X for as=
signed
>> PCI devices on x86.
>=20
> Logical consequence, I understand. Crap.
>=20
> For what reason do we then assign irqchips to non-root cells at all?
> Just for rerouting platform interrupts?

Yes, specifically platform UARTs.

>=20
> Ok, there's one chance left: According to lspci, the device actually
> supports MSI. It's just not being used by Linux. Maybe I can somehow
> convince Linux to switch to MSI.

Latest kernel already?

>=20
>>
>>>
>>> I guess the kernel would like to access MADT tables, but we don't have
>>> those tables of course. So how can the kernel detect which IRQ is being
>>> used? Who or what carries this information (in case of legacy IRQs)?
>>>
>>>
>>>
>>> Not related, but this issue raised another question: On x86, we supress
>>> probing of non-existent platform serial devices in non-root cells with
>>> 8250.nr_uarts=3Dn. Why do we have to do this? My local machine doesn't
>>> have a single serial device, and the kernel doesn't even try to probe.
>>> So why does non-root Linux?
>>>
>>> Is it again due to missing ACPI tables that carry such platform informa=
tion?
>>>
>>
>> Exactly. We do not have any other platform information that tells it tha=
t there
>> are no platform UARTs to touch.
>=20
> Ok, so Linux's fallback seems to be to just register/probe everything. Hm=
m.
>=20
> This isn't a big issue at the moment (we can control Linux by cmdline
> parameters), but I always run into this pattern of issues/crashes when
> running non-root linux.
>=20
> Have you ever considered device trees for x86 non-root Linux inmates?
> Linux could also parse the commregion and only register and use the
> console that is listed there.

Yes, I looked at devicetrees, but x86 does not evaluate them sufficiently, =
does
not describe legacy resources this way (too much hard-coded probing remains=
),
and it seems no one is working on improving that. Looked to me like a dead =
end,
and I do not feel like we are in a position with Jailhouse (yet ;) ) to cha=
nge
that fundamentally.

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
jailhouse-dev/99f6615e-3621-3a7a-7bea-33839e48653e%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
