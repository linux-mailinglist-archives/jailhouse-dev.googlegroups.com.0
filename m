Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP4L3X5AKGQEGY57WPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B0260E00
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 10:50:07 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id d22sf2151965wmd.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 01:50:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599555007; cv=pass;
        d=google.com; s=arc-20160816;
        b=IMX9Ii2lm0V3S+/J9r8qv+RD7WmhC3/o+M/anHSFNuiwQRqXqEql8j0+QuzejpKRSo
         YdTyMQZIAIgbEsUCSPt4fLLaKUwZyhCUrbpFbpNOE0dxmMw5EluSAv2X9hnU21nlsElS
         3dE4TOGD5QFaeOLLtinc1EWypiNtoHdn7iWPQ0eJzdfRunFpovGIvTpXcB87F5KlHO0c
         O+fBP09FnqgRL0q75859V/U/vwY0SUmVN3kIidmfJi1tDiuWY8WkRCIqMT6yG3POJWNR
         FKRjh0LDFMITdvYThDSMpaQ81W8UaGRzyNFaNpxqcwtYkZWrF/IH/8VH9fkGUxN1HqWP
         uxUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=5PLZIeFpiSRqyTpXirumtWvFAXruQg5UTUaW0t99RV4=;
        b=GgImF/2RQja37NildrxqnPb/xydU0vard4c+W7IY6vLuAlbsLq/4BIvrcpUciAiJng
         N1KZomAH9azCKFm+r98Cd2Jk32Ku0bERRuVhIDGP9n31VUSBlAHkyMTG96No0QH0ScOg
         iQhDvDhre4NpDfdVowDdEgm9qXyK/HlrTFZ1ak7zdt6Sgek2751gYUx94YH9C4Y9g8/M
         ekvhWlZmnNBH0CkOVUlu4mUwlbVBC8ORR2KpDu9e2at1EF85EIbhxB00uTkRLgby4E3Y
         TQ+nkWY8l3mA/PUmfuXZXQeAQ+qNMiPcjF9Yz974doxX1woFn714wTSNaYh9XNGd2tKd
         Ck1A==
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
        bh=5PLZIeFpiSRqyTpXirumtWvFAXruQg5UTUaW0t99RV4=;
        b=j2iY97EUip3qNWZvzmsr/ndcnKVimMbrDQuoA5n1TFCUqB2jWukPUagOhfyLUQ52dz
         TOFXirpoeZwPVRDshjuv4J9UVFFVpHtvdxx9HZe7cFyf3ojhl/7tgkEBlFs4WVpicY+Y
         JQNDjgAymqZ7RWSeoE5IIDnIeAB6/Ez4CHmjLfXBwq3Sk9CZ8fABH8ZetKEpGjQNjITV
         qMtQ0Mouhqz3uDa0zajMPwQKzGrjskDc7/66uBRaNObpa6/huHWNAhbrMsnGt+8qvjir
         /PID5/VD01PFQCV0Dn4cOfBX3nu8fEVhL6pSS9fMmAu1wP0DGIh4B5FD3JYeVDkxqmTc
         F3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5PLZIeFpiSRqyTpXirumtWvFAXruQg5UTUaW0t99RV4=;
        b=VS7j0UA/MVX2iyLee+oqalyeRXDEw8eDks1pHUIf9Nsga7hbwHP15UECbqegwRcGs3
         dC/5WXHVnHMyhsdao57xRybLDc8/hC7vXvQtq7pP+VxQKkz31b8nZJnW4VNVHP+/rstr
         QzfaYW366BuqHxUDjmUAHK9lvwXPlkhawVuH2vKBolk/OSMXhxhrQxQNHn0TKto0xTg3
         t+oNBpKABX4up47U9txcl53fEMdtlSPPOIcvz9yPRnXqRH2nxVU9OqGu6OsY4jXL2taY
         VG9qF1W6UNnJV1vsfLCfGDeadnRd7nP5sbNysd0SX8CxjSQcl1/Oae5k5OqzapX6iul9
         8iPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532S3DgFuPLwX1qm29d1swlSDFKmSnq1Fqe8ckezmsmjK9aOYx1c
	iHfr0FBh/F2HKV6f+45Ity4=
X-Google-Smtp-Source: ABdhPJwQswyT34/b7AMZqt4zPtJ4NS34W7UyJIKU5SegaL/0xBzch4GnQ8QinSdZNSB4T1ebpYsDWg==
X-Received: by 2002:adf:9591:: with SMTP id p17mr26680048wrp.237.1599555007646;
        Tue, 08 Sep 2020 01:50:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8288:: with SMTP id 8ls12743695wrc.0.gmail; Tue, 08 Sep
 2020 01:50:06 -0700 (PDT)
X-Received: by 2002:adf:9591:: with SMTP id p17mr26679993wrp.237.1599555006817;
        Tue, 08 Sep 2020 01:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599555006; cv=none;
        d=google.com; s=arc-20160816;
        b=BM9YBbZ7GGEiK60CQ4mDBvvZrTj9ggHlwKWsll/Ny5wvG1igVW+fC6aI+17vafOZuu
         TvNJ9kMWMasYmBWoldQ+dmNEdHl4Fo1dXLmytAh8m5n23mgZG7Xy0/z6/0mFGQ4y5vHq
         PQHhUkWsRb26utSJOs7+4/SoR1rK4B5azkLf1dp6W54eajFSWCG/4DrRGvkMIcDwD+K6
         RGTzmhRCMYR2HiHEJzoRlYJrvJ2+UubxlsoP1+VM1YIkydP2tcxaT8FTXkWSB0en77cj
         DLFHUa5irH44AGrSQlhcXYsRfjlwxb0OE9cMJk+SSuHMbxJN13wlT3Nn3ABvqP9BwWoA
         +zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WO3+la/tigHMsYe/gE6XvqdcVqVHnPDu3iWneBr1Iuk=;
        b=e5BHmnHEaAqSZIMG4pueTS0Asic7nuvV4DEBuRQOGwbmX/f84nDYN6B6AuhBWBVAr5
         3uce9rwuclyvoRu0xWR9yzBhiqz9vEI53OrSP/vVYnKolo5f3oXYe5Qj/GL9Rsz+kDim
         oqIxJ4PC+qK2QFTQYNpGa077b/d0NCcx8m1rdSb4AaHLi1xJo6uYmi1cgMLjMev0u2NT
         T3cRh/IKo95UnJhkfQXLrUCzXOtVGgBPXS6A4UR6vrToFAy+uV8L5XQ2FwV4XPrs2+IC
         iL0+YT4bmeUOhJxh1z1OVcWjh3IOg6FckCesmpnHnde6C+nzYvBMtakNXxeisukaI/C2
         nqeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d19si141892wmd.0.2020.09.08.01.50.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 01:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0888o6h2012101
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 10:50:06 +0200
Received: from [167.87.35.249] ([167.87.35.249])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0888o5mL023575;
	Tue, 8 Sep 2020 10:50:05 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
Date: Tue, 8 Sep 2020 10:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 08.09.20 10:00, Jan-Marc Stranz wrote:
> Hello everyone!
>=20
> Now I have build the BSP (Linux Kernel 5.4.61, Root-FS with hypervisor
> "jailhouse") with Yocto/Poky "dunfell".
>=20
> I'm using an embedded PC with "Intel Core i7-8559U".
> This CPU supports "VT-x" and "VT-d".
>=20
> Now I don't have the errors with "python" either.
>=20
> However, I still cannot create a configuration for the root cell!
>=20
> If I execute the command "jailhouse config create sysconfig.c", I get
> the following messages:
>=20
> Traceback (most recent call last):
> =C2=A0 File "/usr/libexec/jailhouse/jailhouse-config-create", line 270, i=
n
> <module>
> =C2=A0=C2=A0=C2=A0 (iommu_units, extra_memregs) =3D sysfs_parser.parse_dm=
ar(pcidevices,
> ioapics,
> =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 377, in parse_dmar
> =C2=A0=C2=A0=C2=A0 raise RuntimeError('DMAR region size cannot be identif=
ied.\n'
> RuntimeError: DMAR region size cannot be identified.
> Target Linux must run with Intel IOMMU enabled.
>=20
>=20
> These messages are similar to the messages when I run the "jailhouse
> hardware check" command.
> (I had already reported that.)
>=20
> What can be the problem?
> What else could I explore or try out?
>=20
> The kernel command line is:
> BOOT_IMAGE=3D/boot/bzImage
> root=3DPARTUUID=3D4f8941f9-aabf-4b0e-ae9f-5857dc993a3d rootwait
> net.ifnames=3D0 biosdevname=3D0 ro quiet loglevel=3D3 console=3Dtty1
> consoleblank=3D0 intel_iommu=3Doff
>=20

During "jailhouse config create", intel_iommu needs to be on. Later on
during usage, it must be off.

Jan

> I've tried to read out "/sys/firmware/acpi/tables/DMAR", but this is
> probably a binary file.
> I suspect that I need to use the "Intel ASL compiler / decompiler".
> However, this is not included in the BSP.
>=20
> I've tried a lot now, but so far without success.
> I really need help now!
>=20
> Best regards
> Jan.
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/033bbd67-9d28-c615-2120-765f0a93ab00%40siemens.com.
