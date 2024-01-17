Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBJMPT6WQMGQE3SJBCJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E783052C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 13:27:20 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id 2adb3069b0e04-50e7b7c85easf789067e87.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 04:27:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705494439; cv=pass;
        d=google.com; s=arc-20160816;
        b=eE0jJgOAbbQIWfKWcZLrxbs9VWrx3ggHAFfyXocWgj5C+0Qs+ztztlq/qtjdUpehmc
         zqtLT+wfsFaKo526PYbws9sNv+9MhRbAuHDGqOMbA7nc5i6Uj+5CVJw/cMFY8N4gLXAe
         wrCky+bivllPhrblmOCzPIETeMzqVsOqN/GSV+2/mfqdc/24uvLOsrCGqdGvi274xKX6
         wqWYIiy2ci97dB9422NtcCFb5fnEryOvFCKvyePySLWUTRFUIXL/UJVKuSQTFDGNZgBd
         oggzxqLS7mEQGd3D62DGAuym0MKr8Ty3woFSB7pv8Nod5raU/iSsj0r6+0iSKNHGOgp2
         vI6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=cz/0BCbn66bpQzrp0Tp1ebkyBEn5J8G07QWRICx3gy0=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=r4tPH9tLOMoTr0JpTd8plzKrbED5ms0mSadefKq77e8k4qfdVUWenKuum3ZU9pGRTh
         y9e2tc3t1efMYb6PWl2TYo2jkVYfAyZaA4v1CyYk2Bw1OoOMZ/ee6oBCOprd9jE5at3z
         N7UcHVto1EEik1YULui63djOaVzZf5jQNK5zzf/HiurWb8HfU6j7uYRniLI+TwAb0AdX
         Ze4Idsvnl2Vg4ZZuFWorqwBn+l3AMDFJM2FrfW+xRb7PADLFfK+KF6Y2H1nb3HLRgC0b
         jhs+MeuaaiwBT6BHh8m/pmmP2DT0hzqPvLlN5HJeS+62TjLNjWYCqufkqYwzyljVWolg
         TyQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=BhC+9HZR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705494439; x=1706099239; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cz/0BCbn66bpQzrp0Tp1ebkyBEn5J8G07QWRICx3gy0=;
        b=AhS7GyZw8hl6GMO8qaRiJpXgkoqShZMDLAkxWx9K+7S29MCk39FLojzID2OrNMaTb9
         xYQdsfk1FmX0HsCTe7d1y3LIzCIxV95VQrwYhPgMIZ05ZT5KCvwB85qWwOqURNg4bLaZ
         8ebiN1WYZYpAWxvLY+KPKVqyTcuAzvAocHY9sLTMwkE/nOtI9l6pz/HYvSHV2PTpoPeM
         qKwLujUUbwFoC8k5dgYZbc7Lipl37xZepsDD2watyhWqazyvjaDoeyLr3cXWpIA2IqTs
         j264lGk9gB0e17GHgkcRA7R72j51nCXs/iH59j8EInboLxGZG+Z1y90POjocjmDlpgJq
         ae6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705494439; x=1706099239;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cz/0BCbn66bpQzrp0Tp1ebkyBEn5J8G07QWRICx3gy0=;
        b=mbyyblXppQJ7MlBtBt3mxyFw1KLl9TGAY04vaXEUDeMGIAQZ4vMC2aiyrPBmKk+0Um
         osjufPQ7f/oQlLzIFWLW1ut5/FghpJVrnYUfJVhWte7d2RoY5lT6j8ZwTjIaCsuyFe+1
         J3hFw1bkgJOYCWvnba74AaWqU+mGrb3xUgdYmhwt5s40RDP0pbNPTOhCS2VzbbM/Rplv
         ifMDgtmYXt9pXbAWQ8EPUt6mN4Vbv/fFmfD4i0Bt6ZGZtAUbhrJZU4FhuJ0cOpD0gMjb
         k6EUBHuARUICuYLeg4wUijGxor1xKXicg82t5U1qxc/4dXFYdFy2Yk6rBdMrcpzz3WkK
         IaoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy4+68woEEDCgwxHcSgUTGNu21+SV7MLAqLPXs8rkCql0gt68Ha
	H/Om09yAftYyN7pvHEADusY=
X-Google-Smtp-Source: AGHT+IEEkAdl1EDYLW8swA3WOhJezfPsl11wnjHkh3/4frum/4vyRl+bNpZtrsyIYJHEybl8/yoylQ==
X-Received: by 2002:a05:6512:950:b0:50e:d514:77bd with SMTP id u16-20020a056512095000b0050ed51477bdmr2406281lft.18.1705494438637;
        Wed, 17 Jan 2024 04:27:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:a8f:b0:50e:7eb7:bab8 with SMTP id
 m15-20020a0565120a8f00b0050e7eb7bab8ls2493352lfu.1.-pod-prod-01-eu; Wed, 17
 Jan 2024 04:27:16 -0800 (PST)
X-Received: by 2002:a05:6512:114f:b0:50e:74e9:69c9 with SMTP id m15-20020a056512114f00b0050e74e969c9mr4927265lfg.25.1705494435782;
        Wed, 17 Jan 2024 04:27:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705494435; cv=none;
        d=google.com; s=arc-20160816;
        b=q+miXpTik78BdpIPT8oM4t07zL6KWDKpIKjKy3yHBrkZ6Th93DZNpKsYYkO+L1Adv3
         /EyxRvpNP4aosWc+n2cTPC+G3aAUPAdN1NavTwToUzpoPdH9HJyFlrE9Y/J8bQHMq4nE
         y6MndD2Y82jTWDOoadMuxvO+Uxx+d6d5qaTqTvOki+QsRUqLfR1jWIh4ATZWRBobwgAA
         1VKjx28tSK/Gc0BssSh6YvYQBig7r9kw9evbmhNN4r7SOhlC52D/bZW1T24FLHET6zUN
         kJSH9U40gMc0jY7cUm745JtIRIO3kPp68SfM7n7H+HWnsDP3x+ODC4XP5KTtX/KIbPIu
         9bUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wj5vucL0Tbhs4aPAACk/Ht9LtSwavwWJHJPAY2MtQmk=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=pdNhE/QQw4kM4AafLJgcTXTdg4NufrbRszDuBy7j28tRscSVnkokpH5wFiLN3XFlCb
         PjuQXEbFgJRnm7XbHUK4/kBvYTpwTihrdSGIM9rRNT9HNyoMoH1TLRjRvBf2/TIDhICi
         sDlEGCVyBmvrzlYvEzXakn5s/fZbRJq92GtH5GQdFNwjTMss45oBvga9dzOr9QcdtAyk
         yWN7/1HrakPsd7erou6qquqFI23ydXm9PpsKUAzTvOTyaPOVU/QZkti8FXKbkmKm72P5
         Oc1Gg3wHNfvulmMcJSPcCViN1nxTo4kTsvF32eWH6GcUCnH3z/qiyoQMFyjHk/pB1486
         VOuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=BhC+9HZR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id br7-20020a056512400700b0050e80d4c615si43325lfb.0.2024.01.17.04.27.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 04:27:15 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [IPv6:2001:638:a01:1096::13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 9992F2E0214;
	Wed, 17 Jan 2024 13:27:13 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4TFQ9s2Fn6zxr7;
	Wed, 17 Jan 2024 13:27:13 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Jan
 2024 13:27:13 +0100
Message-ID: <e22563ea-abb2-4d80-b988-6bed42ab51a9@oth-regensburg.de>
Date: Wed, 17 Jan 2024 13:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
 <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
 <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
 <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
 <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
 <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
 <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
 <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
 <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
 <5fc9ef1f-e7ca-496f-aab5-c085c4586326@oth-regensburg.de>
 <0f1154fe-f680-47e6-a3da-9e1a37fd1f55n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <0f1154fe-f680-47e6-a3da-9e1a37fd1f55n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=BhC+9HZR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
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

On 17/01/2024 12:52, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> I checked again the configs with jailhouse config check and nothing came=
=20
> up. I'm attaching the configurations.

Please compare the qemu config with your config *precisely*. Your struct=20
pci_devices is at the wrong position in the header of the config. It has=20
to come *after* struct pio_regions and before pci_caps. Position is=20
important for the internal parsing.

In your case, it the parser will hit some bogus data.

   Ralf

>=20
> Thanks,
> Michele
>=20
> Il giorno mercoled=C3=AC 17 gennaio 2024 alle 11:52:18 UTC+1 Ralf Ramsaue=
r ha=20
> scritto:
>=20
>     Hi Michele,
>=20
>     On 16/01/2024 20:44, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > I'm trying to give network access to the non root cell, however
>     it seems
>      > that I'm not able to pass the right PCI device. It always
>     defaults to
>      > taking away the 00:00.0 pci device from the root cell causing a
>     crash
>      > for the root cell.
>      >
>      > In both the root and non root cell's configs I added the shared
>     memory
>      > regions using the macro JAILHOUSE_SHMEM_NET_REGIONS(0x60000000,
>     0) for
>      > the root and using dev_id=3D1 for the non root. The resulting
>     regions do
>      > not overlap other memory regions, config check does not return
>     any errors.
>      >
>      > I also added the following PCI device in both cells, where
>      > .shmem_regions_start is assigned to the correct index for the firs=
t
>      > shared memory region created using the aforementioned macro.
>      >
>      > /* IVSHMEM: 00:05.0 */
>      > {
>      > .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>      > .domain =3D 0x0,
>      > .bdf =3D 0x28,
>=20
>     [=E2=80=A6]
>=20
>      > .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>      > .num_msix_vectors =3D 2,
>      > .shmem_regions_start =3D 0,
>      > .shmem_dev_id =3D 0, =C2=A0 (1 in the non root cell)
>      > .shmem_peers =3D 2,
>      > .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
>      > },
>      >
>      > I tried using different values for the .bdf, none of which were
>     already
>      > used by other devices but none worked. The root cell always sees
>     the new
>      > device correctly when starting the hypervisor, I can also see it
>     with
>      > lspci and ifconfig, however once I issue the cell linux command
>     to start
>      > the non root cell, I get the following output followed by a
>     streak of
>      > errors from the hypervisor, forcing a manual reset.
>      >
>      > Removing PCI device 00:00.0 from cell "RootCell"
>      > Adding PCI device 00:00.0 to cell "linux-1"
>=20
>     .bdf =3D 0x28 doesn't correspond with 00:00.0. Would you please test =
your
>     current configs against jailhouse-config-check, and in case of no
>     errors, would you please attach the current versions again?
>=20
>     Thanks,
>     Ralf
>=20
>      > FATAL: unable to get MMIO instruction
>      > FATAL: Invalid MMIO/RAM write, addr: 0x0000000106d8c020 size: 0
>      > RIP: 0xffffffffa910ff4c RSP: 0xffffab85400f7de0 FLAGS: 93
>      > RAX: 0x0000000000000000 RBX: 0x000000000002f170 RCX:
>     0x0000000000000040
>      > RDX: 0x0000000000000414 RSI: 0xffff8b6000955400 RDI:
>     0x0000000000000001
>      > CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>      > CR0: 0x0000000080050033 CR3: 0x0000000106d8c000 CR4:
>     0x00000000003506a0
>      > EFER: 0x0000000000001d01
>      > Parking CPU 4 (Cell: "RootCell")
>      > (etc..)
>      >
>      > I'm not sure what I'm missing here, CONFIG_IVSHMEM_NET is enabled =
in
>      > both the root and non root kernel config, I also enabled
>      > CONFIG_PCI_HOST_GENERIC in the root linux as suggested in one of t=
he
>      > conversations on this site.
>      >
>      > Thanks,
>      > Michele
>      >
>      >
>      > Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi Michele,
>      >
>      > On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
>      > > Hi,
>      > >
>      > > There were PIO writes to ports 4e,4f,2e and 2f, each of size 1
>      > and each
>      > > one on subsequent restarts. I'm not sure how to figure out what
>     they
>      > > belong to.
>      >
>      > Easy and straight forward: Read the jailhouse crash dump.
>      >
>      > Look at the program counter, and maybe the return address.
>     Disassemble
>      > your kernel (objdump -d vmlinux) and lookup that address. Now you
>     know
>      > the name of the routine in the kernel that caused the crash.
>      >
>      > Don't simply whitelist ports. Only whitelist them, if you're sure
>     what
>      > you're doing.
>      >
>      > >
>      > > CONFIG_ISA_DMA_API is already disabled.
>      > >
>      > > I missed the irqchip for the uart. However as of right now I jus=
t
>      > copied
>      > > the whole fragment from the root configuration which means I
>      > could be
>      > > taking away other interrupts from the root cell, I still have to
>      > figure
>      > > out how to tune that
>      > >
>      > > /* IOAPIC 13, GSI base 0 */
>      > > {
>      > > .address =3D 0xfec00000,
>      > > .id =3D 0xa0,
>      > > .pin_bitmap =3D {
>      > > 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>      >
>      > With this, you take away ALL interrupts from the root cell, which
>     you
>      > don't want to do, you only want to take away the interrupt that
>      > corresponds to ttyS0 (i.e. Port 0x3f8).
>      >
>      > See here: https://en.wikipedia.org/wiki/COM_(hardware_interface)
>     <https://en.wikipedia.org/wiki/COM_(hardware_interface)>
>      > <https://en.wikipedia.org/wiki/COM_(hardware_interface)
>     <https://en.wikipedia.org/wiki/COM_(hardware_interface)>>
>      >
>      > COM1: I/O port 0x3F8, IRQ 4
>      >
>      > So you want to only assign IRQ 4 to your non-root cell. See
>      > linux-x86-demo.c to see how that works.
>      >
>      > > },
>      > > },
>      > >
>      > > Still, now I can finally login into the non root linux.
>      >
>      > Excellent!
>      >
>      > Ralf
>      >
>      > >
>      > > Thanks,
>      > > Michele
>      > >
>      > > Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf
>      > Ramsauer ha
>      > > scritto:
>      > >
>      > > Hi Michele,
>      > >
>      > > On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
>      > > > Hi,
>      > > >
>      > > > The problem was that the ram regions in the non root
>     configuration
>      > > > weren't detected as such because of the
>     missing=C2=A0JAILHOUSE_MEM_DMA
>      > > flag.
>      > >
>      > > Yikes, makes sense.
>      > >
>      > > > After adding that, I also had to add two pio_regions because
>      > the non
>      > > > root linux was crashing because of two ports which aren't
>      > present in
>      > > > /proc/ioports.
>      > >
>      > > Uhm - which PIO ports? Don't simply assign PIO ports. There must
>      > be a
>      > > reason for them. What ports did crash?
>      > >
>      > > Did you disable(!) CONFIG_ISA_DMA_API? Please disable it.
>     Therefore,
>      > > you
>      > > have to activate CONFIG_EXPERT first.
>      > >
>      > > I *bet* it was i8237=E2=80=A6
>      > >
>      > > > I also had to add mce=3Doff to the command line because i had =
an
>      > > unhandled
>      > >
>      > > or disable CONFIG_X86_MCE.
>      > >
>      > > > MSR error, I'll have to disable that in the kernel config.
>      > > > At this point the non root linux seems to start, I see the boo=
t
>      > > log. No
>      > >
>      > > Excellent!
>      > >
>      > > > way of interacting with it as there is not a login prompt or
>      > > anything, I
>      > > > think I need to ssh to the cell at this point, right?
>      > >
>      > > Was the initramdisk loaded correctly?
>      > >
>      > > Did you assign - in your non-root cell config - the irqchip and
>     the
>      > > corresponding interrupts of the uart?
>      > >
>      > > > That means I'll now need to work on those ivshmem net devices.
>      > >
>      > > If you need ivshmem, then this would be the next step.
>      > >
>      > > Ralf
>      > >
>      > > >
>      > > > Thanks,
>      > > > Michele
>      > > >
>      > > > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf
>      > > Ramsauer ha
>      > > > scritto:
>      > > >
>      > > > Hi,
>      > > >
>      > > > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
>      > > > > Hi,
>      > > > >
>      > > > > You are right, I got confused about those addresses, my
>     bad. At
>      > > > least
>      > > > > now I know that config is the correct one and I don't have t=
o
>      > > tinker
>      > > > > with it.
>      > > > > I'm back to a kernel panic from the inmate when booting the
>      > cell.
>      > > > It's
>      > > > > similar to the one I had earlier, not sure yet of what the
>      > > > problem may be.
>      > > >
>      > > > Great, we're a step further.
>      > > >
>      > > > >
>      > > > > Created cell "linux-2"
>      > > > > Page pool usage after cell creation: mem 406/32211, remap
>      > > > 16392/131072
>      > > > > Cell "linux-2" can be loaded
>      > > > > CPU 9 received SIPI, vector 100
>      > > > > Started cell "linux-2"
>      > > > > CPU 8 received SIPI, vector 100
>      > > > > No EFI environment detected.
>      > > > > early console in extract_kernel
>      > > > > input_data: 0x000000000275c308
>      > > > > input_len: 0x00000000008b0981
>      > > > > output: 0x0000000001000000
>      > > > > output_len: 0x0000000001fccb30
>      > > > > kernel_total_size: 0x0000000001e28000
>      > > > > needed_size: 0x0000000002000000
>      > > > > trampoline_32bit: 0x000000000009d000
>      > > > >
>      > > > > Decompressing Linux... Parsing ELF... done.
>      > > > > Booting the kernel.
>      > > > > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LI=
NUX-DESKTOP)
>      > > > > (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_rea=
l (Buildroot
>      > 2023.11)
>      > > > > 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2=
 SMP
>      > PREEMPT_DYNAMIC
>      > > > Fri
>      > > > > Jan 12 17:36:57 CET 2024
>      > > > > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,1=
15200
>      > > > > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > > > > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > > > > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0=
x001: 'x87
>      > > > floating
>      > > > > point regi =C2=A0 =C2=A0 =C2=A0 sters'
>      > > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0=
x002: 'SSE
>      > > > registers'
>      > > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0=
x004: 'AVX
>      > > > registers'
>      > > > > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A057=
6,
>     xstate_sizes[2]:
>      > > > =C2=A0256
>      > > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x=
7, context
>      > size
>      > > > is 832
>      > > > > bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.
>      > > > > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
>      > > > > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > > > > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>      > > > 0x0000000000000000-0x000000000009efff] usable
>      > > >
>      > > > Okay, here should be all memory regions listed. My non-root
>     Linux
>      > > in my
>      > > > Qemu VM, for example, shows here:
>      > > >
>      > > > [ 0.000000] BIOS-provided physical RAM map:
>      > > > [ 0.000000] BIOS-e820: [mem
>     0x0000000000000000-0x00000000000fffff]
>      > > > usable
>      > > > [ 0.000000] BIOS-e820: [mem
>     0x0000000000100000-0x0000000000100fff]
>      > > > reserved
>      > > > [ 0.000000] BIOS-e820: [mem
>     0x0000000000200000-0x00000000048fffff]
>      > > > usable
>      > > >
>      > > > Are you absolutely sure, that you have no further
>     modifications in
>      > > > Jailhouse or the Linux loader?
>      > > >
>      > > > Actually, in your case, there should be e820 as well (instead =
of
>      > > e801).
>      > > > Go to the Linux kernel sources, have a look at
>      > > > arch/x86/kernel/e820.c:1279
>      > > >
>      > > > and Jailhouse's jailhouse-cell-linux:638.
>      > > >
>      > > > jailhouse-cell-linux fills information of all memory regions
>     into
>      > > the
>      > > > zero page. Would you please instrument code (Linux/Jailhouse)
>      > to see
>      > > > where those regions are not parsed?
>      > > >
>      > > > > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] ena=
bled
>      > > > > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: ac=
tive
>      > > > > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > > 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=
=A0 sable
>      > > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > > 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=
=A0 sable
>      > > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > > 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=
=A0 sable
>      > > > > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > > > > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      > > >
>      > > > Just guessing loud: Hmm, you have guest support enabled, that'=
s
>      > > not the
>      > > > issue.
>      > > >
>      > > > > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processo=
r
>      > > > > [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as
>     E820_TYPE_RAM!
>      > > >
>      > > > Here's the next error that makes me curious, why you system
>     falls
>      > > back
>      > > > to E801...
>      > > >
>      > > > > [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =
=3D 0x400000000
>      > > > > [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled becau=
se
>      > > > CONFIG_X86_PAT is
>      > > > > disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
>      > > >
>      > > > Please enable CONFIG_X86_PAT and MTRR in your kernel.
>      > > >
>      > > > > [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =
=C2=A0WT =C2=A0UC- UC
>      =C2=A0WB
>      > > > =C2=A0WT =C2=A0UC- UC
>      > > > > [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
>      > > > > [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_l=
ow_pages:
>     can
>      > > not
>      > > > > alloc memory
>      > > >
>      > > > Yeah, that's the logical aftereffect after the errors above.
>      > > >
>      > > > Thanks,
>      > > > Ralf
>      > > >
>      > > > > [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not tai=
nted
>      > > 6.2.0-rc3 #2
>      > > > > [ =C2=A0 =C2=A00.052176] Call Trace:
>      > > > > [ =C2=A0 =C2=A00.054606] =C2=A0<TASK>
>      > > > > [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
>      > > > > [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
>      > > > > [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
>      > > > > [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
>      > > > > [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
>      > > > > [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
>      > > > > [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_i=
nit+0x11a/0x290
>      > > > > [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0=
x3b0
>      > > > > [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0=
xe7/0x145
>      > > > > [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x29=
8
>      > > > > [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
>      > > > > [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
>      > > > > [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
>      > > > > [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_ver=
ify+0xe0/0xeb
>      > > > > [ =C2=A0 =C2=A00.114085] =C2=A0</TASK>
>      > > > > [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing=
:
>      > > > alloc_low_pages: can
>      > > > > not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
>      > > > >
>      > > > >
>      > > > > Thank you for your continuous support,
>      > > > > Michele
>      > > > >
>      > > > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
>      > > > Ramsauer ha
>      > > > > scritto:
>      > > > >
>      > > > > Hi Michele,
>      > > > >
>      > > > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
>      > > > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
>      > > > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00
>      > > parameters
>      > > > > -a 0x1000
>      > > > > > jailhouse cell start linux-2
>      > > > > >
>      > > > > > I take it the kernel is loaded at 0xffbe00 which is right
>      > at the
>      > > > > edge of
>      > > > > > the low ram region. In fact after issuing the cell load
>      > command
>      > > > and
>      > > > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOA=
D:
>      > > > Invalid
>      > > > > > argument.
>      > > > >
>      > > > > Just tested cell-linux in a qemu machine, there it works, wi=
th
>      > > > pretty
>      > > > > similar addresses, which got me confused.
>      > > > >
>      > > > > After double-checking it: 0xffb.e00 is *not* at the edge of
>     low
>      > > mem:
>      > > > >
>      > > > > Low mem is 0x000.000 -- 0x0ff.fff
>      > > > > Comm region is 0x100.000 -- 0x100.fff
>      > > > >
>      > > > > 0xffb.e00 is (obviously) way above.
>      > > > >
>      > > > > Please try to set your high mem's .virt_start to 0x200000.
>     Then,
>      > > > > 0xffbe00 is offsetted ~16MB inside your highmem, and it shou=
ld
>      > > work!
>      > > > >
>      > > > > IOW:
>      > > > >
>      > > > > /* high RAM */
>      > > > > {
>      > > > > .phys_start =3D 0x42300000,
>      > > > > .virt_start =3D 0x200000,
>      > > > > .size =3D 0x11000000,
>      > > > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>      > > > > JAILHOUSE_MEM_EXECUTE |
>      > > > > JAILHOUSE_MEM_LOADABLE,
>      > > > > },
>      > > > >
>      > > > > Thanks
>      > > > > Ralf
>      > > > >
>      > > > > --
>      > > > > You received this message because you are subscribed to the
>      > Google
>      > > > > Groups "Jailhouse" group.
>      > > > > To unsubscribe from this group and stop receiving emails fro=
m
>      > it,
>      > > > send
>      > > > > an email to jailhouse-de...@googlegroups.com
>      > > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > > To view this discussion on the web visit
>      > > > >
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a=
72-79da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434=
169n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef=
-49cc-8a72-79da2c434169n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com <https://=
groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c43416=
9n%40googlegroups.com> <https://groups.google.com/d/msgid/jailhouse-dev/671=
2361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com <https://groups.googl=
e.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googleg=
roups.com>> <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-=
49cc-8a72-79da2c434169n%40googlegroups.com <https://groups.google.com/d/msg=
id/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com> =
<https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79=
da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse=
-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com>>>> <https://=
groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c43416=
9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://group=
s.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40=
googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter>> <https://groups.google.com=
/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups=
.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/ms=
gid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?=
utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/=
jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_=
medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailh=
ouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter>>> <https://groups.google.com/d/msgid/jailhou=
se-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-d=
ev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Dem=
ail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/6=
712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&=
utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/671236=
1a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_s=
ource=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-=
eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_sour=
ce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-=
49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3D=
footer> <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc=
-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfoot=
er <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72=
-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>>=
>>.
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to the
>     Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails from
>     it,
>      > > send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-92=
12-a3d87ad25b27n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25=
b27n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/86=
0c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f=
-4157-9212-a3d87ad25b27n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/860c1=
e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75=
-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f=
-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4=
157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9=
212-a3d87ad25b27n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>>.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-ab=
af-9a2be8c85be5n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85=
be5n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/61=
46e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
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
>     https://groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-91=
39-c11e9a9fc461n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc=
461n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/0f1154fe-f680-47e6-a3da-9=
e1a37fd1f55n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/0f1154fe-f680-47e6-a3da-9e1a37fd1f55n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e22563ea-abb2-4d80-b988-6bed42ab51a9%40oth-regensburg.de.
