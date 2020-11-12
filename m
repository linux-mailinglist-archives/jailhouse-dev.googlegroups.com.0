Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCXGWT6QKGQEDRFPYSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F252B05F1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Nov 2020 14:05:15 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id l24sf2261169edt.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Nov 2020 05:05:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605186315; cv=pass;
        d=google.com; s=arc-20160816;
        b=o8JSvxQs2CqGUSZAzL6dQF+6pFS3kirfX4dM7JY1lasZS4Th3k7PpGp7kHYiBrOsQ2
         4G/yK7PnL84Dacv58OWyan9/ebA7SdgSOYMvtR1jU7OQyTJB1hDLCGARtDKYAx6USXOl
         hk18vpIo49NLXz52I+U0Nv2VVvm0vkhd8TbkkDwSe9ZGLnUT2CZzkMSNJIzDdTQ/ZE0N
         wN6FshZL/QUc4DaARPs9JjORYfzA1xiPr+id/djN2fnPiKENLTLO+wCtekB+Fqn7G3QF
         2gbIZMmk4e+QU5B954cG8vS3UsQFJ7D2ihBWdtarCCCk1E86w8oJUeyKOotokr5NhoXT
         tQxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=uJU/ax5TkCj+f28bW7kyaepxJkxYZhadGk736zm2qIM=;
        b=Q1P0oOcdd6yQJwdlnkPVU+pGxi1AnnAPT6fjJELft/9FFdmbSRnxbR9Ee4lyRBFRR2
         ZgnIeekpOn6II+cZT0rRbCqS+pwqoSDeoudafZHPQku0zNpzoFf5Zjyk81vZgXxMmCu0
         fbNK26sg2/ncUwLyoTVJRo32UvGgYc19VybpitmiKMHGwfH6M84G7pPMAebXmKrGj1RL
         ab82wo1j8WxuLUG4T76Iu0bwBxf7MReYzcJ7vJ19tT5+nLPvKEXvis1gGDBFJHTUmAC2
         IukR07kDEz+yFpK9Z0tabs6gysayS+whsrCnCtyWKa70LUVWDjMbq9LzbE5m58EYgkOn
         rDWg==
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
        bh=uJU/ax5TkCj+f28bW7kyaepxJkxYZhadGk736zm2qIM=;
        b=VPSp+TJuicpv5TmUe6upuIXRvEBQmxvvjcEAoH4wMOZB9ntpZxROgQnAgG0De9eXft
         phv0LlN3rBQqgGtP3sTURNqHRaP4kAo2a2z6hnDu0lIik8uRJnam3RswGn/WeAvsYmfF
         KSv9ILhHMGJGc9ktbeKUz/LEjzZWX4UMixnHVxAQPrvYsS3Rw4hYErO/pO6YqY4sVjuH
         f0+pKr3KHkaqqwkf94cLjX9xk/xfQS2+65sV1j/OCd1PeuLJGK+lDC4OF1ZHoOyVWeD5
         3A9DN5s8zG/DvBlfeZwccAQv0p5eba0nsEsgLUbzFiWM/kbQcn/QE2IwfFpQcoCK3sRN
         A4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uJU/ax5TkCj+f28bW7kyaepxJkxYZhadGk736zm2qIM=;
        b=le2hOtZR0om8FzcxlejJvEKUEE8hc3IDZyY6yY6M04lIj6M5vu/HNg7u44GHeEU/7g
         wp8TnxEP0lNAlc7Lg97n9bMxUdGOjzogcQqyJaWArGcm4bo7vZQBNh/fj3oV3lHSb4Ax
         Jla+UVlVUzq9KWRP5rncaq49OAsWBSCBQdb7r0rvOQ5ff8uqootvu83utVaKw4EzDcCj
         yoTNI7Q/gD4TO/lQ3usjg27u+U5DxAAI4CDQYv0a0PNB6wxtSl60wKcmDu4KshFmRoql
         FWVaInwjFtEpDnAzIFbd1h8GRzUVyoZabqI+/adTLBlNOQPUMujQ70vpzMJlomd49l+x
         8OjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530A1hjVrqdbK8SHOhdMrCnzpIbgyELvFXm3BRLcKQA4ycOb7R9z
	2ivimUxLIrRqVdyJKUAP0yc=
X-Google-Smtp-Source: ABdhPJwl49lHpstV0+ewuGLsYrME/yoawWNcmEkD7TAbxIWvZoB0VRhyPUezT3CFvAEa+nHY+OJwwQ==
X-Received: by 2002:a05:6402:3089:: with SMTP id de9mr5156357edb.100.1605186315626;
        Thu, 12 Nov 2020 05:05:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8585:: with SMTP id v5ls1338881ejx.1.gmail; Thu, 12
 Nov 2020 05:05:14 -0800 (PST)
X-Received: by 2002:a17:906:14d1:: with SMTP id y17mr30800880ejc.15.1605186313955;
        Thu, 12 Nov 2020 05:05:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605186313; cv=none;
        d=google.com; s=arc-20160816;
        b=JZ4eFtXmarhJF64W/+vI5firlwxhiXZvc3kfnjsnIQLpNB0853aRZ2J67PZyVToxF8
         6Z6iUQiXP612I750dDAwCA2b0SNyzu55/rASkM+KbZM6f3cgPSKX18DsuvaLL9lm9Sde
         fL5WW7JYJvJGCIB7yXheO8Rzg410MGsvugrcPxoGNOXHWD44ZVTO1bovstnE0SNwCu6F
         uzmUDX+INa4vOJRPEm0GBeA9jhNkxLD6egMeFkfRaA6XWprZiSUl/FPJT4ut4ZjEjNaL
         O2vLMEHg5JyeMsZDsJ/KnnB77QMROhfrtIAdPsDJolyZqYvnAuNFf5gh42o3eGex6rLb
         hHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=mMr8WgATzlhyhcwk8EUcfGPoQDwoLBLWCni5dgWu6Yg=;
        b=TcCJm5ylGyeu0NKxBtW3XC+EW5nvx5eR2009DrrGCdrzG91juXqkMxnLEl3S5GsTCY
         qAUtsHkD6A70p1c3JG8LJ4w4CXMpPX4KmEhlHAiFa6JinPM8XwaX9xabmUz/Gq+2xpvy
         sexWbMutcvyG7iIIe5n72qpTSonCgQj+TNg1m2P1cF6G0gqROJ6aDr02Sf9OX4XY3FRs
         y+pduKmOe71U7wcDWpYW8BXtdqICwbzLjIYL1NpbmaWftvgXe/5GfIvCVm2jVc3aEuxN
         cFmtQ1Sj+XOziE/eRLkIiPl0ru/3NQ4nDPiR1/7mpT2DmvhYpKqWvIKXES1KiHozmgN6
         jWXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v7si291422edj.5.2020.11.12.05.05.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2020 05:05:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0ACD5Cia029704
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Nov 2020 14:05:12 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0ACD5Bnm020617;
	Thu, 12 Nov 2020 14:05:12 +0100
Subject: Re: one question about MSI-X support for vPCI
To: Peter pan <peter.panjf@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
Date: Thu, 12 Nov 2020 14:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 12.11.20 09:50, Peter pan wrote:
> Dear Jailhouse Community,
>=20
> I am runing Jailhouse on kernel v5.4, and port some ivshmem patches
> from=C2=A0http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary
> <http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary>
>=20
> The issue I have is uio_shmem and ivshmem-net will probe failed when I
> use MSI-X mode for vPCI after I run Jailhouse enable command.=C2=A0 Pleas=
e
> find the folowing log:
>=20
> [=C2=A0=C2=A0 21.581019] jailhouse: loading out-of-tree module taints ker=
nel.
>=20
> [=C2=A0=C2=A0 30.000988] pci-host-generic fb500000.pci: host bridge /pci@=
0 ranges:
>=20
> [=C2=A0=C2=A0 30.000997] pci-host-generic fb500000.pci:=C2=A0=C2=A0 MEM
> 0xfb600000..0xfb603fff -> 0xfb600000
>=20
> [=C2=A0=C2=A0 30.001028] pci-host-generic fb500000.pci: ECAM at [mem
> 0xfb500000-0xfb5fffff] for [bus 00]
>=20
> [=C2=A0=C2=A0 30.001081] pci-host-generic fb500000.pci: PCI host bridge t=
o bus 0003:00
>=20
> [=C2=A0=C2=A0 30.001085] pci_bus 0003:00: root bus resource [bus 00]
>=20
> [=C2=A0=C2=A0 30.001087] pci_bus 0003:00: root bus resource [mem
> 0xfb600000-0xfb603fff]
>=20
> [=C2=A0=C2=A0 30.001105] pci 0003:00:00.0: [110a:4106] type 00 class 0xff=
0000
>=20
> [=C2=A0=C2=A0 30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x00000000-0x00=
000fff]
>=20
> [=C2=A0=C2=A0 30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x00000000-0x00=
0001ff]
>=20
> [=C2=A0=C2=A0 30.001340] pci 0003:00:01.0: [110a:4106] type 00 class 0xff=
0001
>=20
> [=C2=A0=C2=A0 30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x00000000-0x00=
000fff]
>=20
> [=C2=A0=C2=A0 30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x00000000-0x00=
0001ff]
>=20
> [=C2=A0=C2=A0 30.002389] pci 0003:00:00.0: BAR 0: assigned [mem 0xfb60000=
0-0xfb600fff]
>=20
> [=C2=A0=C2=A0 30.002397] pci 0003:00:01.0: BAR 0: assigned [mem 0xfb60100=
0-0xfb601fff]
>=20
> [=C2=A0=C2=A0 30.002403] pci 0003:00:00.0: BAR 1: assigned [mem 0xfb60200=
0-0xfb6021ff]
>=20
> [=C2=A0=C2=A0 30.002409] pci 0003:00:01.0: BAR 1: assigned [mem 0xfb60220=
0-0xfb6023ff]
>=20
> [=C2=A0=C2=A0 30.002478] uio_ivshmem 0003:00:00.0: enabling device (0000 =
-> 0002)
>=20
> [=C2=A0=C2=A0 30.002505] uio_ivshmem 0003:00:00.0: state_table at
> 0x00000000fb700000, size 0x0000000000001000
>=20
> [=C2=A0=C2=A0 30.002512] uio_ivshmem 0003:00:00.0: rw_section at
> 0x00000000fb701000, size 0x0000000000009000
>=20
> [=C2=A0=C2=A0 30.002520] uio_ivshmem 0003:00:00.0: input_sections at
> 0x00000000fb70a000, size 0x0000000000006000
>=20
> [=C2=A0=C2=A0 30.002524] uio_ivshmem 0003:00:00.0: output_section at
> 0x00000000fb70a000, size 0x0000000000002000
>=20
> [=C2=A0=C2=A0 30.002576] uio_ivshmem: probe of 0003:00:00.0 failed with e=
rror -28
>=20
> [=C2=A0=C2=A0 30.002620] ivshmem-net 0003:00:01.0: enabling device (0000 =
-> 0002)
>=20
> [=C2=A0=C2=A0 30.002664] ivshmem-net 0003:00:01.0: TX memory at
> 0x00000000fb801000, size 0x000000000007f000
>=20
> [=C2=A0=C2=A0 30.002667] ivshmem-net 0003:00:01.0: RX memory at
> 0x00000000fb880000, size 0x000000000007f000
>=20
> [=C2=A0=C2=A0 30.047630] ivshmem-net: probe of 0003:00:01.0 failed with e=
rror -28
>=20
> [=C2=A0=C2=A0 30.047714] The Jailhouse is opening.
>=20
>=20
> After some investigation I found the dts node of vPIC is added to root
> cell by using vpci_template.dts,=C2=A0 the Jailhouse
> driver=C2=A0create_vpci_of_overlay() in=C2=A0driver/pci.c can't add the h=
andler of
> "msi-parent" to this PCI node,=C2=A0 but the kernel driver of the virtual=
 PCI
> device use the following function=C2=A0
> ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ_MSIX);
> So the=C2=A0 driver will probe MSIX irq for the device, because there is =
no
> msi controller is speficied to vPCI, the result is no irq-domain is
> provided to this PCI and irq allocated failed.
>=20
> so how to fix such issue? Appreciate any comments and suggestions, thanks=
.

The vPCI support in Jailhouse injects interrupts as legacy INTx. For
that, you need to provide up to 4 (less if you have less ivshmem
devices) consecutive SPIs that are not in use by real devices (in any
cell). See other arm64 configs, specifically look for vpci_irq_base.

Jan
--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7552cacf-519e-9cde-ba5a-c2e2121c5a54%40siemens.com.
