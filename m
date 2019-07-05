Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ6Y73UAKGQEHJHK4AQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEF60C05
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 22:00:40 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id b3sf5957516edd.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 13:00:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562356839; cv=pass;
        d=google.com; s=arc-20160816;
        b=igPAT0P6siXKl0M4FfCgXlx6l5ms1W1y43mhOGYgFtt+xY0obx7C40sIe1wnAKW5V8
         J06V9AUQp93hF4iO9ZyCNmp347Cv31WCLkFdrs+5VDvBXLYP0zPVAqipKv2D+YiQXfCZ
         deim663TZ9D9ZF+YiV6jjHWrHvDzkxohXkZitdGgsL7TU8NA+JTxvw5UzzEyKsWffONV
         GZUjN48jgdBgGeK1e/KBqOQSX7EBjGdiRlsI8rwvWvfdnDgJYx9Dh9jUD0X6rBP84Bu1
         SfnnNdQSc7ki+I7RFiOa9YuJXSpOGoFypK3bcA9mQAuQQYeaKaPRcweGjL2AAQ684vKY
         6PGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=wEQ7ZDU/VoFf9ySgf1zXzRVpyYR3U5JW1s+rK7SAV9c=;
        b=YrkYHN1F+QYCNAxY6kj/+CZfPrDQjk3bZ8y8CKnOWCRZbEhbmXK2J1/ch/62ZfsQ2J
         0LInLhphz9Neb0mjYAAoMDtvsKk33bzbf7Hd5C5ZwgNKA8yFK97IlRRIFSX3LCBubcI5
         bFHAA2PCjpjqs5njxoxwjkuhxZMtDc6NYja3H1oFdS+NJ+QnVxZevOQplwxpeX+af+AG
         n3xS5aMDuSLcqy3DaaxDPQ/Ea1s6z7WQ3/RVUinAM947rsSapdcyQnCCriDRpLut9l1r
         CT15ThpVFcIg1AcOoeZ65a3SAr7txq/TTZHPJuTGxzXIuJW6Cg1rOr4Q7XEoqlTYNbiO
         gdNA==
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
        bh=wEQ7ZDU/VoFf9ySgf1zXzRVpyYR3U5JW1s+rK7SAV9c=;
        b=L3IanUKKDk9HrUPdSOSEl6qvYJ9n/ip3frZzfuwKEGJhneoNImf0WsVEzch7jDnNat
         n8xLiV2gKNnixZueXKOIPRunRQcRUZoARhQpwukBfNqisweJ0oYMMptf+8H2eP+KM7z2
         OHOuvQvQMTW+E+K3bt6C+A9akw3UBJyn7LsHaHDmZZP5LgSyevjmhRaooy/Z1+1VsvfB
         lFYg++mcnSkCEg1/wsXS3PTZy2NWyX3D6zZJ9M1mQs90TBkZ6/rNxn33+d3IeHXBMqfL
         bR3gHcPiZcrhOnFWQB82w3zxDERyUBVeA1ZysGOyY6vd48jrFChHzcT8GvYyeOPpf2V8
         63qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wEQ7ZDU/VoFf9ySgf1zXzRVpyYR3U5JW1s+rK7SAV9c=;
        b=NU5FVeTmu11ujgRLtgvuci/W/ovbhR2A3Ws0FczzjAsIWY8lXXg5qAWAWXDJHUSn7/
         aFMBPBjb83V7iOjupzbQxDEXIGrVh01AUFUYWzwhvQ4/1xeW9n+aE7yySVDF4Dw6PpPw
         Tw5mDC9dYY3mif8oK1FGyNmQHwO63PHUX7qbZHgsJbm1P0MkvKEb1BCWcx0/lg8KFXO3
         r2pqXVJryQ5mcnFi5X6sI2T8enasbwCh2TtkinnL9V7vDyF5NHvA7Dp3/gvow9iBhz1X
         iFdnp83aK2hSLO3OZZ52Z5YgTYv8eo7iV6vavGjp2dPYRqIrYdKUVxiGsVpiTFy92SLT
         bcvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXWP4ezTfAmd0/WUY+XVy9auwMyOClJqD+bsRF2RN8Ap+ol7hll
	aRjIcAk+RCrVFzxbugVx7/A=
X-Google-Smtp-Source: APXvYqxC8HQ0nnGPdn/znlOqXjr8DRCQCXcy7n11rIL5O6YDs9QNvw66L4q3WSZuZCAwSCiahCP/uQ==
X-Received: by 2002:a50:f4d8:: with SMTP id v24mr6522827edm.166.1562356839814;
        Fri, 05 Jul 2019 13:00:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7345:: with SMTP id h5ls2440558ejl.16.gmail; Fri, 05
 Jul 2019 13:00:39 -0700 (PDT)
X-Received: by 2002:a17:906:f91:: with SMTP id q17mr5218922ejj.297.1562356839239;
        Fri, 05 Jul 2019 13:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562356839; cv=none;
        d=google.com; s=arc-20160816;
        b=fIUoHFYgOap+daXYOlzu99EvqLDm4PgNYFQKbJDgnyLhAsJlDkGvj0L2LJBiMLnpDJ
         Ml2WHEI3drmIzljpU3oy6dRMZMVdLNCr9mmO+7mxZ+9geQrwoILwkq78sCMDwWjImfVV
         N0GaeLzRp9SwaeJ64zF/GK7TadmRmEPr0rDBvW8UG5PU6r3q5eFHwosNvW4YtpQ1KIAd
         OsTql9M4jjRVRyjInzRwXR92WF3CuOYNAf0fNpRy8bfydbQZs+duo2mfOa9i8QTlVHd3
         JB2D4Wn13c5vGxJRm0Q5WtdmGf7zb4E3OGHkkOS1iNPd6dAWKUkH/rpkP3RmIU0wkOoB
         /ioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=kFkivtXtqFXn/KLLVbTx/oQLrW1PYGB4pWqBQygiLzA=;
        b=qd2EcF66T7yWWw4CL3BFSS9Kqx/soA/vLgWHS7fR2eQcARldW6F+0XTUnBX8pMF585
         ViWrAveBq+PfCHP3QxDoL42bun8OuCuM3n+KjuEPW7FKTpcIIWTRZFwgruT3AN6jfXm9
         DeAaMgnOLpjzr0gWtNUIWyAEo99R4jrzrvvjIe4NGpiGHHEoz6owyWSzJhLS4ahJ4FVW
         AbiiyXolrttD+Y3/4P4QdiC3Em2Xi4EM7sG50VDOjPZ7xxPdJfjfttXLbcQ4BhcauoZ6
         KkhloXny3R7joi5gCyXCdA3FhRip8kDHyxV0OIojEadlsETsOLjiifuaCfQ7pTl3Wbcz
         7J0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h23si732760edb.2.2019.07.05.13.00.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 13:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x65K0ca1008721
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Jul 2019 22:00:38 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x65K0c30001306;
	Fri, 5 Jul 2019 22:00:38 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
 <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
 <dd55c1a5-8863-5f94-b339-bebc221dfc6f@oth-regensburg.de>
 <7adc75a2-c777-6f35-6652-99dd5212926b@siemens.com>
 <479fadb9-f346-0666-fed5-a1bed2b298c8@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <aadf131b-b9be-abc1-73e4-99cc4c1e64c1@siemens.com>
Date: Fri, 5 Jul 2019 22:00:37 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <479fadb9-f346-0666-fed5-a1bed2b298c8@oth-regensburg.de>
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

On 05.07.19 21:49, Ralf Ramsauer wrote:
> Hi,
>=20
> On 7/1/19 6:46 PM, Jan Kiszka wrote:
>>> Got it running. The issue was that the config generator fully mapped al=
l
>>> PCI Bus regions:
>>>
>>> /* MemRegion: 380000000000-380fffffffff : PCI Bus 0000:00 */
>>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x3800=
00000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x3800=
00000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x1000000000=
,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE,
>>> },
>>> [...]
>>>
>>> So access wasn't intercepted at all as those pages were fully mapped.
>>> After commenting out all of those regions everything works as expected
>>> (well, not tested against another endpoint, but at least ivshmem-net
>>> successfully probes).
>>>
>>> The config generator created those regions. Happens on master, next and
>>> older versions. I guess this happens as those regions don't have any
>>> siblings -- they should probably be filtered out. Find the iomem
>>> attached.
>>>
>>> BTW: This behavior can be reconstructed by running the config generator
>>> on the qemu virtual target for x86.
>>
>> Ugh. Needs fixing...
>>
>> Seems the longer I wait with the release, the more pieces are falling
>> off (currently fighting against broken dt overlays, thus virtual PCI, on
>> ARM with latest kernels, including stable ones).
>>
>> Jan
>=20
> We still have some issues adding ivshmem-net to the root and non-root
> Linux cell. Devices successfully probe on both endpoints, the hypervisor
> reports that the connection is established. Nevertheless, I can't
> send/receive packets.
>=20
> Looks like the device doesn't come really up, but ifconfig reports the
> device would be up (on both sides). If I send packets over the
> interface, I don't get a call on any function of ivshmem-net.
>=20
> After initialisation, ivshmem_net_run immediately returns, as
> 'in->lstate < IVSHMEM_NET_STATE_READY' is true: in->lstate stucks in
> INIT state.
>=20
> I suspect this is probably caused by a configuration mistake, but I
> don't see anything suspicious in the configuration. Please find the
> sysconfig, and the inmate config attached. (dactales is just the name of
> our linux non-root inmate).
>=20
> Am I missing anything there?

Do you get interrupts? A typical source for trouble is broken interrupt lin=
k.
And that can be caused by IOMMU mismatch: you put the virtual ivshmem devic=
e on
iommu 0, but root Linux thinks it should be elsewhere.

>=20
> BTW: When are packets being sent over the interface? Do I need a remote
> endpoint, or are packets also sent without having a peer?

If both peers are present and ready, the link is reported up on both sides.
Before that, there are no packages sent.

>=20
> The reason why I ask: I'm not entirely sure, if I'm able to send/receive
> interrupts in the non-root world.
>=20
> There, ivshmem-net registers int 24:
>  24:          0   PCI-MSI 16384-edge      ivshmem-net[0000:00:01.0]

No interrupts, bad sign.

>=20
> Does the non-root cell the corresponding irqchip?

?

>=20
> IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
> IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-31
>=20
> Currently, non-root only sees IOAPIC[0], and afaict, the jailhouse
> paravirt driver only registers ioapic[0].

The ivshmem devices use MSI-X when the platform provides it. That is always=
 the
case on x86. So, no IOAPIC here.

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
jailhouse-dev/aadf131b-b9be-abc1-73e4-99cc4c1e64c1%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
