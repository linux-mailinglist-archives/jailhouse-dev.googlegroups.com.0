Return-Path: <jailhouse-dev+bncBCMKJ4OZ6MLBBFVBRO3QMGQEKGMNWIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD739767E1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2024 13:29:28 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id 2adb3069b0e04-53654420f0csf782387e87.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2024 04:29:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726140568; cv=pass;
        d=google.com; s=arc-20240605;
        b=OQcaO/ATLcV8p51bx2FwDl0nGZCeDtB6fiM1tQkaWyM31BDl3R8U5n9QFJFecWAJUz
         9nXTAVGXIMqISZEAfOMxByDD4urPFWB++XCcYWrE6aZhmb4oTRAAgGXPYTQYpqhV0ttH
         UhwqZZ+2DGZat4ph8u4dPPjnyhnzesl3x7bpX1O85vyMDFAE2JPA0ymrqkKCrCAcyEDb
         SVCQonndVfTyDA2QOzRW14Tkk7tIFvGsCzEI4Y0Phnk3bDME2sAwj67NtYbcdT+MtnhT
         ExUbIXFOXhTNRghUT9J2RdzwvUkO/xHgubFwTSPo+Cv0qa6stBPyHHr2PPKUhFsvMpsl
         BzHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=GQz3enGPt2wLyT4loW32pdE4/f7U/0tpkYgLCliwU38=;
        fh=FpflL4dEPiRheTulwePvaOulF2fLdHcX59Wb/IAiQqQ=;
        b=MT5ajq5evzow0ujkfClJ/LmJ32t2qM5mn7RvBbVHtixAGtBlBiz5Ps1URPCPoMHuKU
         TV65krukigNQpNMY7grykCqXQpJZH8Xd+dKtSjQ8VPvl6ZivW/g1IiFEspvDitaq/nDg
         RNmVNaUtMdknlTukIpJSMkIENSXhY7KNOMhYEIgB/RmkM++dtcpFqYruogQoQAtYOm3q
         7/K4BtqHi6jcHaK+uscZLoITekSJ09Hv0wKOYPuoFAwJ4E4WiWhOdcJXz+nbOwI5nlym
         pg1C2ucYStvVfHlsV7Ded+26bcWSLLeA2cQhdBcmpdEp4D8u7FtMdn7wBpeN5x8hs6du
         fsIQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=JbasKyg2;
       spf=pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) smtp.mailfrom=ralf@vmexit.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1726140568; x=1726745368; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GQz3enGPt2wLyT4loW32pdE4/f7U/0tpkYgLCliwU38=;
        b=xwwkg70NRr86/GQ1xTwxiGm97fUOBi12fVI2SbArizZ0WBfN5BRI2ZQ7uuT5elJhN/
         cwWIFCoVGjJV/UBWR95dD+DwmBH4cXTDs3xOfNvytrsx4DDsZAh64Z9EucRnULzi0fix
         ZNoTcIFD6LgGDwm0jEs0DPr1ylpW2PO/B9jZNU1kmSVGqgpc73BPsGRRC1oygPasvosZ
         fvsS09F6YI6qfmaTc1efcq7pKzggcqDT9pFwtiGvb9fv64i/aJK6Kx7UYOUbCRD6h1At
         tV2olGTa1zNCvHSN3IoZ+X9o3uOo6IEIv2rwMpqR3mqFMlQYKgKIoNMcGlO/YUz7ZaqF
         yUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726140568; x=1726745368;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQz3enGPt2wLyT4loW32pdE4/f7U/0tpkYgLCliwU38=;
        b=dsXYly5fBFI/M0z2xjLRxzfCyYxd6urbAJSk9tkv0GmA91UCawXn+sOuOukHV//sCX
         p8GbmXdT4aGNQ5paxy9UP38ep/uKZCTs1YkvTAV+eB/Fb4xVvprcpamymgS85eukhacS
         PuX33upKgmDSYZsYh5x+ymoJr2cZfHzUhI7PMNU7+auV8+43amfzbCDDXa+jGdVgcjvB
         cwayUL6InFiL/YhcxEo6BcdXM/so+JTJJ7dNe9crbcTh9JciPjpQVxAtlcoC0xsDrjA/
         p6gWSpq4KEzE1od2CodHxoH6eCzVuDjJZdYIgHJ7nZbjeAsvtJjWSwquZSQos56rP1Q1
         j1/w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCX2EJxURItOuoU+ZxUj4y+3LpuHPePVOiMxj6YlfY1eBQs6YhN5hEM3olyZekWXDlx+Cw/BiQ==@lfdr.de
X-Gm-Message-State: AOJu0Yy0GxvCJ9kipOfQnPRHOw3UnEfFUPaeAqT+1lGiEKsVSlhRb7vL
	QeQpGJpOfb57nlftHUA0uFK+/C5YIxFeSQzN0ajOb95Mx/Y23lqE
X-Google-Smtp-Source: AGHT+IGn8X0cEPRoOjcNojzqc6Sz1g7fsggI0D3FtBvTQtd1Phl1viBRmgM7Ho0BxodZbJQUeEYk7Q==
X-Received: by 2002:a05:6512:a91:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-53678feb07bmr1480268e87.39.1726140567365;
        Thu, 12 Sep 2024 04:29:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:acf:b0:52e:9923:a1c2 with SMTP id
 2adb3069b0e04-53678f67aefls397197e87.1.-pod-prod-03-eu; Thu, 12 Sep 2024
 04:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPG6BpJwgcy5dtXbpd6day/xqUcX2/k9fbDSyUh4RrUaDNwRCgCswIx0zcAAkZ/zcLntXjpRlknsbGXy0Y@googlegroups.com
X-Received: by 2002:ac2:4e0a:0:b0:535:d4e9:28cf with SMTP id 2adb3069b0e04-53678ff48b4mr1720173e87.59.1726140563919;
        Thu, 12 Sep 2024 04:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726140563; cv=none;
        d=google.com; s=arc-20240605;
        b=Pvog5W7tovoYMhWmthtIxxYykvYhdscwW82+Unhd9GFDRI6rUI16tpkhWF+tt3vwVa
         XWI1o+eIZLdWgp0GxpTuB0mfN9mQ12HMxpwWyMfkmZczRBHwUm2buwYrIsXDbKXa/oqX
         04reS7psVxHCnfpa/7hsWdmP4Hs0T89rrZf7WjnE1CAAY5O44iIwCJChkwEK2uajOvzP
         AjlI/nZFC6kxpHoR2ZvSozQpOtTcYTHoWz0REKqjyUBxRE7N4z5zwgO32xMEojij82y9
         4PDhCNBm/AdIXSeQgjaDNX44ImPmHwg5ryidz35arBLvAnIV6EM6PpQbdgLWwwpha5Ua
         /8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nvJ9UKA+Ifcasj2TJqtviywI7rj7SKxBmPOcqonebYM=;
        fh=62lsEkyVSihdTwo9DXwVNrMR047Fyy3yKVbi/YBy210=;
        b=YtHJ/qkMMHib9U+xQcChrCTHLaQzv7trRavIu2RmMTBGTaO4GpePaifOi5CD93d9Ax
         sMGpf0omp7u56NbEe2TVIEBsj+XWk+K/dQAYqpKaRNk1UMvs37zVeJNLdyzI7gL/fYYJ
         hfkaN4zyowjBdOkcSAqx4Xv0PhoEd+u43hYA6utF4zgCgqw82K+MF9Gxz5G2b46bM7kz
         ZxfNoKM1s46FS9Bqu4ZmClobca4J+HF3XH53xlq09siToZP/4AJGDxqqQbZPVWFUOUNt
         SeuAmP6q+b0kzZzhNAb5xvutk7alHatv3RAZE67abv1IEufQRq279fhf1whS4NEd1Nbe
         Ibnw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=JbasKyg2;
       spf=pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) smtp.mailfrom=ralf@vmexit.de
Received: from mail.vmexit.de (vmexit.de. [2a03:4000:6:8069::2])
        by gmr-mx.google.com with ESMTPS id 2adb3069b0e04-5365f8c6eabsi255924e87.10.2024.09.12.04.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 04:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf@vmexit.de designates 2a03:4000:6:8069::2 as permitted sender) client-ip=2a03:4000:6:8069::2;
Received: from [172.16.2.23] (unknown [212.77.164.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.vmexit.de (Postfix) with ESMTPSA id 48AF1CD7DDE3;
	Thu, 12 Sep 2024 13:29:28 +0200 (CEST)
Message-ID: <f9f09503-807d-4393-8757-9da544d82a39@vmexit.de>
Date: Thu, 12 Sep 2024 13:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Jailhouse triggered exception #14
To: qiang xu <qiangxu431@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm+5WSxvr3-A@mail.gmail.com>
 <56b684d3-7bcd-444e-b7d0-2f01429fdc72@oth-regensburg.de>
 <e934ce47-a4c0-435e-95f8-204ff6b2e76an@googlegroups.com>
From: Ralf Ramsauer <ralf@vmexit.de>
Content-Language: en-US
In-Reply-To: <e934ce47-a4c0-435e-95f8-204ff6b2e76an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: ralf@vmexit.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral
 (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=JbasKyg2;
       spf=pass (google.com: domain of ralf@vmexit.de designates
 2a03:4000:6:8069::2 as permitted sender) smtp.mailfrom=ralf@vmexit.de
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

On 11/09/2024 08:17, qiang xu wrote:
> Hi Rlf=EF=BC=8C
>=20
> Thank you for your reply. I solved the issue based on your suggestions.=
=20
> However, I've encountered another problem. As shown in the image below,=
=20
> I found that the MSI Capabilities of a PCIe device are being read=20
> incorrectly as '0xff'. When I don't enable the Root Cell, the readings=20
> with setpci are normal. However, when the Root Cell is enabled, the=20

Please don't use images, it's very hard to understand what's going on.=20
Please describe your issue in a temporal flow.

> device hangs, and after adding print statements, I found that reading=20

What means the device hangs? Does Jailhouse crash?

> msi_registers.raw is abnormal. I have verified that mmcfg_addr is=20
> correct, but the read values are still incorrect. How should I proceed=20
> with further debugging?

Would you please share (as text attachments):
   - lspci -vvv (before enabling jailhouse)
   - jailhouse-config-collect yoursystem.tar
   - Jailhouse System Configuration as C Source

Why are you trying to change in PCI config space, what are you writing,=20
and what would you expect?

The device should not hang and there should be no need for you to modify=20
config space after enabling jailhouse, the device should continue=20
working as before.

Thanks,
   Ralf

>=20
> Screenshot from 2024-09-11 14-02-51.pngScreenshot from 2024-09-11=20
> 14-03-23.pngScreenshot from 2024-09-11 13-55-20.png
>=20
> Regards,
> Qiang
> On Wednesday, September 4, 2024 at 6:51:03=E2=80=AFPM UTC+8 Ralf Ramsauer=
 wrote:
>=20
>     Hi,
>=20
>     On 04/09/2024 05:35, qiang xu wrote:
>      > Hi Jailhouse Team,
>      >
>      > =C2=A0 =C2=A0 I am trying to run Jailhouse on a real physical
>     machine(x86).When I
>      > run jailhouse enable xx.cell. I encounter the following error.
>     I'm not
>      > sure what is happening. Can you help me?
>      >
>      > 'Initializing Jailhouse hypervisor v0.12 on CPU 2
>      > Code location: 0xfffffffff0000050
>      > Using x2APIC
>      > Page pool usage after early setup: mem 48/974, remap 0/131072
>      > Initializing processors:
>      > =C2=A0CPU 2... (APIC ID 4) OK
>      > =C2=A0CPU 3... (APIC ID 6) OK
>      > =C2=A0CPU 1... (APIC ID 2) OK
>      > =C2=A0CPU 0... (APIC ID 0) OK
>      > Initializing unit: VT-d
>      > DMAR unit @0xfed90000/0x1000
>      > DMAR unit @0xfed91000/0x1000
>      > Reserving 120 interrupt(s) for device f0:1f.0 at index 0
>      > Initializing unit: IOAPIC
>      > Initializing unit: Cache Allocation Technology
>      > Initializing unit: PCI
>      > Adding PCI device 00:00.0 to cell "RootCell"
>      > Adding PCI device 00:01.0 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:01.0 at index 120
>      > Adding PCI device 00:02.0 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:02.0 at index 121
>      > Adding PCI device 00:14.0 to cell "RootCell"
>      > Reserving 8 interrupt(s) for device 00:14.0 at index 122
>      > Adding PCI device 00:14.2 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:14.2 at index 130
>      > Adding PCI device 00:16.0 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:16.0 at index 131
>      > Adding PCI device 00:17.0 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:17.0 at index 132
>      > Adding PCI device 00:1c.0 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:1c.0 at index 133
>      > Adding PCI device 00:1f.0 to cell "RootCell"
>      > Adding PCI device 00:1f.2 to cell "RootCell"
>      > Adding PCI device 00:1f.3 to cell "RootCell"
>      > Reserving 1 interrupt(s) for device 00:1f.3 at index 134
>      > Adding PCI device 00:1f.4 to cell "RootCell"
>      > Adding PCI device 01:00.0 to cell "RootCell"
>      > Reserving 8 interrupt(s) for device 01:00.0 at index 135
>      > Adding PCI device 01:00.1 to cell "RootCell"
>      > Reserving 4 interrupt(s) for device 01:00.1 at index 143
>      > Adding PCI device 01:00.2 to cell "RootCell"
>      > Reserving 3 interrupt(s) for device 01:00.2 at index 147
>      > Adding PCI device 01:03.0 to cell "RootCell"
>      > Reserving 16 interrupt(s) for device 01:03.0 at index 150
>      > FATAL: Jailhouse triggered exception #14
>      > Error code: 9
>      > Physical CPU ID: 4
>      > RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef50 FLAGS: 10093
>      > CR2: 0xffffff800400b000
>=20
>     would you please disassemble your hypervisor binary with objdump, and
>     see what routine executed behind 0xfffffffff000b250?
>=20
>     Rlf
>=20
>      > Stopping CPU 2 (Cell: "RootCell")'
>      >
>      > Regards,
>      > Qiang
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
>     https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn=
_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com <https://groups.google.co=
m/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3=
-A%40mail.gmail.com> <https://groups.google.com/d/msgid/jailhouse-dev/CACFR=
-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com?=
utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/e934ce47-a4c0-435e-95f8-2=
04ff6b2e76an%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/e934ce47-a4c0-435e-95f8-204ff6b2e76an%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
Ralf Ramsauer
PGP: 0xC85252CC

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f9f09503-807d-4393-8757-9da544d82a39%40vmexit.de.
