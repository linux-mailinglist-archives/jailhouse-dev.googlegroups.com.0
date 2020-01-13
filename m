Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWW26HYAKGQEZ5YYCYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222F1391E2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:15:07 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id m133sf1280929wmf.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:15:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578921307; cv=pass;
        d=google.com; s=arc-20160816;
        b=nk7o/B5XeCt+gAwLcB+aVzd+ar9l1qE9fESKyJyPqJonzOsqFMXmEwz6Yo+Nz54DNW
         ZwTVNT+66Rz/3zHRiOxsVT46Elqi3j6d4s/5/HCkg+wB6Itra0/oAUlTfuFyXkdI8HTl
         P/wpJ5+HikBDGn+ZgcjzJEHHbm7kyVvpNy25IxOmslfkIcKmUbSA9jjC7xVwMXEbTejB
         ggxZJ81q0KtCLi/kRtgDipIVTGyBY8gA8oyH10zYwDRasRjd6M4gsA8I509kA6jw2O9W
         RFsM+Rtz0w5lnmaVuDt7XBUFAh+bjAiHLtrVhJ2sjhgw2Kd98RsKrPU2W17+i0vzxwZ1
         Bi8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XOhs3qKpFasuUzBELuEw+HQfWGpiuNQzcRmwTcfBxHE=;
        b=JAM+1bWc2hZSDnLNVmQBBGRKroVOFNT+XFtKYM74UFQNJ5p2y+9W4HJg8HnxUmQXr8
         fbhhfRpPgaOHhF90d8DhK8nZkO8Bwss6u2g9zXpOjGS0OeIBCS8b4pCmt34SFgfCHD8T
         ofYLYQ8igj/LPS3rnOdUT2tLRPeqVoLqMuejZQAHXQXXhisGzjy1hcFaOiNCxBseew8s
         h/1IlBhArf0wLnjRxEkvT/BTDBZoFMbdgIOJBNImT5gSbPqqJ+9JJpe3/60rRsA7cqF5
         5jfZ8kVRQvDhviiJLVB9OfrfuFi9oiA42MfQ9irtuPy+Ng8ZUv7kMmlpKdCrP97XSn2Z
         VmbQ==
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
        bh=XOhs3qKpFasuUzBELuEw+HQfWGpiuNQzcRmwTcfBxHE=;
        b=lI9PdVktVKlVsqnRR/efsX7omEU76F3+Rvr8U+SOUxMua9u+3gOisDXrUftVnAEyzn
         TeqUsdGAIxARQ48xizTkzbe5xLOq58U+ZQwZU9wvTlKEpx+PBMqcHbQ2ZnYoT2VNDAQD
         dM5edQjvTkhuHgfPIlMrutljDK5nBk5gJM75NaKgsIdAr4XWnm562MHwiKH8TNjUyNEB
         uP5iudWAAw+q6kqzZq0ixRK/Gv9tdZOsaw7MGxQfb9OyJtUTBM5MzmLjEgRBlhYZRxPt
         VJwMRjTKEQZSCog+b6NYP4lfCkEFRTe1W0TtrBcEhp+fuhRLKkqnxntJbQXkcKhBpKEF
         ZyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XOhs3qKpFasuUzBELuEw+HQfWGpiuNQzcRmwTcfBxHE=;
        b=dl+40jZPetOEqEQnqiMwfTat9mh3S/uzNYrMFSLX2LDULvSUR28D++mESRwUfPn1ri
         /b36CswuA4CM36TZII+j+tn8tMHm4t7gu3IzETB6SxW1RsjWz1wSVEZOe9deRqIF0ttM
         HLdmnpCVxAwifgKZxF/T4vk+vMVE9aeUdbfbrFddW4tn1+ogoGwDtK94obABzsKT8y0a
         c3R0cgpeIFTpHJ+DqKSaam5SHskUCW5B2Ip37eLea8nGRPdOF1zA8wDlaLyVND/D9uoz
         AtOwGWRvzTH2CODFGdH+7zwYXgl/57jzyTPZDHYi9AJxtAkO9zXQrcn1uGsF3F56augw
         1xEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWywdTavcG2/8YBrnHPfzf2TSFS8Qj7oxYu2NahgB+1uPHuozHx
	DDb9genDiI/gk1o2wsjXqqQ=
X-Google-Smtp-Source: APXvYqx62V2IkG69W1vKY8XoTQNxzjOa+AcIb1g5ARhNGql7EOFx3aNKxR9Effp4A3P9JU1xoV2Vvw==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr19891973wme.69.1578921306962;
        Mon, 13 Jan 2020 05:15:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls4499466wrg.10.gmail; Mon, 13
 Jan 2020 05:15:06 -0800 (PST)
X-Received: by 2002:a5d:534d:: with SMTP id t13mr18572818wrv.77.1578921306286;
        Mon, 13 Jan 2020 05:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578921306; cv=none;
        d=google.com; s=arc-20160816;
        b=ksQGHmZY7h8v9eDwrsWNW+ZonCECyZ1VuX0W7jgmtggfI/P2Oadb4A72OQVVKzSipS
         Hcxscgac2CIynRtLcQeQQL1E6vn/hO+4ZOw+8uFB2jbU/FymD1tsjcSaDTJpPlysMOsw
         ZbEYfU/vthvLC2YKbef+iAVYoyazrTT+AD+9GC/24BXoC8Hf+wLH2HCWW3+rYviV7Na8
         269I4ESWixxcqaMjrJjk3jo+PMPNJmNv9VIiJi5NQJanzaQ/b200nv2OPFfq/0JwblNQ
         qc2t7zk3Po7WWXLIJal+rT7Fh/xb9VVVCC0VfKRWFp5ntf6svC+COZmyOq+7U18fX6Wr
         6oMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=E0/4XYhEpYlgbBol5BFQ3y0FTrpGl90GMsl6Q90S6dA=;
        b=dMC/NKj346xD9TJ04Ve3PWZG6+l75uCUlSaMNCWhDhA6Dq6IomOH8T2uLPbZYkmPB2
         AWaP7NmYIOO/LGzn0yBEc/xutJvdx8uzS9AwBajpYHr/mS6jeOvpHweT8MCPZ+W5bYZ6
         kOcWZUvozmm3UQaqhRtRscHJbJ/mqmuMtp3JH1M6RAOdpbBUPGwcsQzWkJT7IFG2D/ki
         mFSmPXtOpRX4SZyiv0jfLotawS4T+IbXSbXYaLVHmh65oaBCOd94CgdeYVvsQWEej3TZ
         3f4KpPIeJwEvOBZFUiZu8N+W0aoiWdZrpy8LoX5lXazLGnfs/RA7QyL4htIIE4A4YCGA
         IEig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p16si450338wre.4.2020.01.13.05.15.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00DDF5sl012486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 14:15:06 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DDF5an006347;
	Mon, 13 Jan 2020 14:15:05 +0100
Subject: Re: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20200113104647.25884-1-nikhil.nd@ti.com>
 <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
 <6bf7a660-228f-1ba0-c5df-233357a5b148@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <86309d54-49ee-cca7-fdb5-df2777e9f50d@siemens.com>
Date: Mon, 13 Jan 2020 14:15:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <6bf7a660-228f-1ba0-c5df-233357a5b148@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 13.01.20 14:09, Nikhil Devshatwar wrote:
>=20
>=20
> On 13/01/20 6:08 pm, Jan Kiszka wrote:
>> On 13.01.20 11:46, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> This series adds support for TI PVU as an iommu unit.
>>> PVU is a 2nd stage only IOMMU which provides realtime address=20
>>> translation.
>>>
>>> J721e has 3 instances of PVU and all the DMA traffic can be routed=20
>>> via PVU
>>> when running inside a virtual machine.
>>>
>>> Nikhil Devshatwar (5):
>>> =C2=A0=C2=A0 core: Update cell_state while destroying the cell
>>> =C2=A0=C2=A0 configs: Move amd specific fields in separate struct
>>> =C2=A0=C2=A0 arm64: ti-pvu: Add support for ti-pvu iommu unit
>>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in pla=
tform_data
>>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add stream ids for devices b=
ehind IOMMU
>>>
>>> =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>>> =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
36 ++
>>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 7 +
>>> =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 129 ++++
>>> =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
>>> =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 580 +++++++++++=
+++++++
>>> =C2=A0 hypervisor/arch/x86/amd_iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-
>>> =C2=A0 hypervisor/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
>>> =C2=A0 11 files changed, 794 insertions(+), 20 deletions(-)
>>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu=
.h
>>> =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>>>
>>
>> Applied to next - with fixups (build fix for patch 2, whitespace=20
>> warning for patch 3).
>>
>=20
> Thanks. I didn't search for those fields in the configs. Thanks for=20
> fixing it.

There will be another fix squeezed in soon: ARM is broken.

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
jailhouse-dev/86309d54-49ee-cca7-fdb5-df2777e9f50d%40siemens.com.
