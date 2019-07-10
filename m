Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBCG6S7UQKGQEVTFOG6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id D3065647B0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 15:58:32 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id l26sf1459802eda.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 06:58:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562767112; cv=pass;
        d=google.com; s=arc-20160816;
        b=c926vPv6Fs6x2zSzWUrxKcZFv6tCSx8aZuKT4kSWSOKc/A8L4aN05dThjI5dEgNELe
         Yc0zWsYQBpmeTbpOKLFXKRa0Y5Jae6Ylm/6OHKT8Qe1YhG8DiBNnUQI/Gwk9SQ4A1eJt
         nFV3u7tMMMnCohNxBWecKLxqQfZupb13N4EbXSPAZY74kqmcr3ziflE8lZuH2xxKihJU
         R9qqdOnxXyyah1vQiBI3lXRro3xUGvh/PryCgdEvvm07Bw1GJLjawdzaDPmCSJWPmsmv
         RIJ6AftkTZXJPvWXA9A2zqkMjC4GYIveUg0K+U90b5zZ0z3WewzD8Z6jBR3/nLxp7FHl
         dmGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=abQ6tzSHqrn0en6a0knIWBNBTflgAXa6e3fXdIj+aDA=;
        b=g7OAsVzV+ubuSaIzPzKtwt5osVUc+wbbsBEj3AuSzAJySxv2xzh7pwWwRhIRoAvj2E
         AMtDCcBksXXIBB3dnwAcvd7Udoy5ApIhVYVTfsQvsFfMPMMSRaAL2JCCDzzrDk3nenDd
         pn4pIV3yh+YV2jrPKOok/qoLzCtcjO6wSiMBEeaKXmiDJaMQFpvnHBABXUw+arfyi0o7
         Ha95T+LbzlJcEIx1mmB/RKCYtaYXKmM/EvC8878zjpPyTeeEbqxNZ2yX5q9P4WdGsP8A
         ia2JFnUZWjO/ee5gMTSlLUvqxutoZnkANn3pQ/wjA5bijdylZu3Pcwpychs36FYmHt+N
         B7Vw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DH8cnliP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=abQ6tzSHqrn0en6a0knIWBNBTflgAXa6e3fXdIj+aDA=;
        b=oVt0TMka5JXoDeJ6GT1WSru+5+qx7/1VcBPE8TI/5gpnnbvLl8iNvNi9hTI8gJ80jN
         guy0wPS3MXUmQkBsfjZu9YqId8XXJpQRi9tL/kh+BHJZlMC6HloMoKL4SGmvdhwsbFFV
         jdU4Nc+T9W3rcMm6FuFjakiKW7GIiPr/7gjA3bVkYq/CqYNE9oB2Bd9Zbk+GC3+lg8lq
         /EvXYfx1FupMTzi2EWPG7j45Qv+LmlRDjRJcZJdIA3NO/QvNoZOXTu1hg+D29AdVLPF9
         nem2lHrMOmuknBVJhx8I0t9bnyA4p5pfGqPLDk+uwhMUnU7rungUHxb3Pv+Oj3E0RARh
         W4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=abQ6tzSHqrn0en6a0knIWBNBTflgAXa6e3fXdIj+aDA=;
        b=hPWXxrH08C5Msi4T8psKKBCHL+asCnkyyeJKf2CDcXR8ImR3KUdFTQ9yEyPz0VDvOa
         G/fPNmIG7nDVEdJryiPiq+jnq+QnQSIjNjc6RPpWESwIV4+YuvsJlJ+k5g61QR0ESbN8
         OpJut999dC1U0fDBDZSXnsO9s7TC9KpL8MMJAFhy7XBlNdC3W42HwLnj7qp3FyK9YJVq
         Mh7+baWi3JLcaI4GXfWkDm7HDwRDZgCW44jcHF9DT8cy2E321FGHY2G9txS19D1yqq9T
         Joy2EnHrd4Nd+ZpLdK+BtBlnEOpabO2P/G4bIa8u4S21beaISh7J/A7Kz7BOtSG2OBYE
         iuNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKW/IpbpInGel1qHultchUCD8+7s4FUWQq147n8M8Wa2MO8dur
	HLiml9tWmLdtrHcZVvfGgcM=
X-Google-Smtp-Source: APXvYqyHnXvHty5GdzzXyI7mp1X66sLr2ce9sM8qrgmFtPS70ha0QpFYiJZhC2hIE3WrUzRj2QLZBQ==
X-Received: by 2002:a50:9729:: with SMTP id c38mr32682005edb.283.1562767112590;
        Wed, 10 Jul 2019 06:58:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7a05:: with SMTP id d5ls595562ejo.13.gmail; Wed, 10
 Jul 2019 06:58:32 -0700 (PDT)
X-Received: by 2002:a17:907:2177:: with SMTP id rl23mr26935573ejb.14.1562767112021;
        Wed, 10 Jul 2019 06:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562767112; cv=none;
        d=google.com; s=arc-20160816;
        b=u8NnR9aYVw7Uvaq/nMqWCQ/dBa5ZET/R4C/UsKFF9NXxDAHpcBq+g8t3Q6kq8FXz9O
         PQrAxBe66vF3CIfUQfbi6Et49+keimcQzqrlfzphYxlNf7xO75WBuvMsIZXikmH0ipqL
         /iFfxbtgSPNtKq7jdEUfRFkC2vNLke+YUfhR76FzcFeRBtRY/cF+fc13bsHb4JF8BHXE
         V81YxBrDkfxh44zOO50HNXm8sDEYqqZPMIyp7fIN/hD7xlgC1s3zdGmF7sqwEuKQth+D
         RexkVhnXwBfqzTuQ0hG2GGB3OtUH5gjpzYqNH9ytLd2uYzVh69nsjNKyX7kIgBFu0TAr
         4sJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=Kr/axvYyzwNwqsk+FC0zTT4C61XwwyfGm5+U3Cx8c3s=;
        b=fqegAXSHXFhk63vSVPkz3Xr3fH/+zH1I4X3GqnEInC3dH4jR1oNPrzuB9jsmhupzlR
         3Ifw/EX4D1sTcZV2JLZZ+qPIoOHFJvL4WEDy8XIodU5VxpACfQqP5MSTeJsB4hXb/D7X
         6CVZmi2d0//E1QfB3oMeXGV9XiDVNIbCoZ6UtW8YNiTQLOJF3+zlKDi58+cspm0+FGZI
         +SlSRuh6Cm1/Qq5GYPF5/+e9HYU63LQdSsXLPuylKOizeBqXBQ3qrzRT91MyDRNKSYAN
         qCmBnBIfHRBbDPpErGw/zhWBo61eA2Trru+xOBNXm3TsnkiObEizDTNTq5FM7zU6iFT9
         wSQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DH8cnliP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h23si125255edb.2.2019.07.10.06.58.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 06:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45kLPg3RW0zyMb;
	Wed, 10 Jul 2019 15:58:31 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 10 Jul
 2019 15:58:31 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
Date: Wed, 10 Jul 2019 15:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=DH8cnliP;
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

Hi,

On 7/10/19 3:20 PM, Jan Kiszka wrote:
> On 10.07.19 12:19, Ralf Ramsauer wrote:
>> Hi,
>>
>> on an Intel system, I'd like to assign a PCI Device (dual port serial
>> controller, 8250 compatible chipset) to a non-root cell. Please find
>> more details of the card in lspci-root.txt. This is the card as it is
>> seen by the root-cell, before being assigned to the non-root cell.
>>
>> As exemplarily shown for an E1000e card in linux-x86-demo.c, I followed
>> those steps to assign the card:
>>   - Add memory regions
>>   - Add the pci device
>>   - Add its caps
>>   - Add access bits to I/O ports
>> ... to the non-root cell configuration.
>>
>> In the non-root cell, probing of the card fails with:
>> [...]
>> [    1.551079] serial 0000:01:00.0: enabling device (0400 -> 0403)
>> [    1.559060] querying PCI -> IRQ mapping bus:1, slot:0, pin:0.
>> [    1.574310] serial 0000:01:00.0: can't find IRQ for PCI INT A;
>> probably buggy MP table
>> [    1.582375] serial 0000:01:00.0: Couldn't register serial port 20c0,
>> irq 0, type 0, error -28
>> [...]
>> (see dmesg.non-root.txt)
>>
>>
>> AFAICT, while this card support MSI interrupts, the driver wants to use
>> legacy interrupts, but can't find the IRQ. In the non-root world, lspci
>> reports this would be 0, which is clearly not correct.
>>
>> In the root cell, the card has IRQ 16:
>> [    1.921700] IOAPIC 0:
>> [...]
>> [    1.921811]  pin10, enabled , level, low , V(10), IRR(0), S(0),
>> remapped, I(000F),  Z(0)
>>
>> The non-root cell knows this irqchip. Any suggestions what I'm missing?
>=20
> No. nothing. This is in fact an unsupported case.

Damn. That's what I already feared=E2=80=A6

>=20
> The problem with PCI IRQ forwarding to other cells is that there are chip=
sets
> between the PCI slot and the IOAPIC, and they can affect the IRQ routing.=
 Plus
> there is a high chance of interrupt sharing this way, something Jailhouse=
 cannot
> resolve when doing device pass-through.

Yep, in fact, this interrupt is shared with i801_smbus.

>=20
> Therefore, we do not address this case and only support MSI/MSI-X for ass=
igned
> PCI devices on x86.

Logical consequence, I understand. Crap.

For what reason do we then assign irqchips to non-root cells at all?
Just for rerouting platform interrupts?

Ok, there's one chance left: According to lspci, the device actually
supports MSI. It's just not being used by Linux. Maybe I can somehow
convince Linux to switch to MSI.

>=20
>>
>> I guess the kernel would like to access MADT tables, but we don't have
>> those tables of course. So how can the kernel detect which IRQ is being
>> used? Who or what carries this information (in case of legacy IRQs)?
>>
>>
>>
>> Not related, but this issue raised another question: On x86, we supress
>> probing of non-existent platform serial devices in non-root cells with
>> 8250.nr_uarts=3Dn. Why do we have to do this? My local machine doesn't
>> have a single serial device, and the kernel doesn't even try to probe.
>> So why does non-root Linux?
>>
>> Is it again due to missing ACPI tables that carry such platform informat=
ion?
>>
>=20
> Exactly. We do not have any other platform information that tells it that=
 there
> are no platform UARTs to touch.

Ok, so Linux's fallback seems to be to just register/probe everything. Hmm.

This isn't a big issue at the moment (we can control Linux by cmdline
parameters), but I always run into this pattern of issues/crashes when
running non-root linux.

Have you ever considered device trees for x86 non-root Linux inmates?
Linux could also parse the commregion and only register and use the
console that is listed there.

>=20
>>
>> Last but not least: The dual-port serial card has one interrupt, two I/O
>> regions and some MMIO regions (that I don't need). To assign the card, I
>> could also 'just' map the I/O ports and the interrupt to the non-root ce=
ll.
>>
>> Just out of curiosity: In this manner, would it be possible to share an
>> interrupt between two cells? If so, it should be even possible to
>> partition the card.
>=20
> See above: Interrupt sharing is only possible if there is a single truste=
d
> instance that terminates the common interrupt and then forwards it to the
> different drivers. Splitting this between guests means driving the UART f=
rom one
> or the hypervisor and emulating the other UART. Not our style.

True, just wanted to know if there would generally be limitations.

Thanks for clarification! Argh, I hope the driver is able to switch over
to MSI...

Thanks
  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/46aff85a-01ba-875e-1752-cb40f9080b31%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
