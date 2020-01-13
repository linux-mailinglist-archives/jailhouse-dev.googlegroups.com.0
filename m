Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXF6HYAKGQEWWIDL4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id C83EE139247
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:37:51 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id v1sf1978363lja.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:37:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578922671; cv=pass;
        d=google.com; s=arc-20160816;
        b=SXZXy9eKxC4fMWO/IbsB7MGAlAMYwSkFo/HezJOymIuH9cz2OBZtSRLJzpKlpeGMwm
         OcM5eTpKBTdcUsX+0/BK84rBNTIbP779uz/egY6/5k3Lo4iRilpSxXfyk0FW3hgQGG7j
         6tzHvbD6JXZ5JKLf5F3GzdpAktJ3PGGjiFvMK+flolAqsprozyVxI9XUgL4DwIa3XT4l
         /4HZ4GKNRW7zrl2gQ7UdkoQUkJOt8wB/zWv4t6R90pXbGg9jfEppRQGrPCJ5AQXS4AVA
         e4dqKxYAUaQ1kYHE8HFCucWc9o9GF0E682xDQ+07TnWn4eXd/g6KfiJaxXuBbmPKmz6V
         2LGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=V5fJj0mOnWaYwVhpiJnUslKE7tN8Z1KpbrZKZBznZko=;
        b=EFJ5oKqFNkLHBEHZoH0EDfC4VPeC38+CkfG6+VHdlDetWFyccPtZcF3c0f+c7E0Gp6
         lPPCZlSzIbyt16YMuKWFCZaZNXudQnImyWd/Xi2GxDUaHtGSeNBcSpT6SiDNk9Hp8ayw
         loVobsaub/GTCx5UubeJnvN1UvrjYzdDkDVCJpQqdAZ8gdi1dRYtrGkl8WwdcYHFIMVM
         MyOWUlUFZyGPSewHafbL9eGOd3ZePoO0rhRHOJuvDaWb7nIIDMXvMnat3KutyjaQpohA
         a4aOqHHTFGaPhAoivaBN46z4FhU4zKaLDBtSYJ1wAZvIiI+St0nrGxXc11o+DcALI5OH
         vj4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V5fJj0mOnWaYwVhpiJnUslKE7tN8Z1KpbrZKZBznZko=;
        b=fnqL8+9Imuj/DskZtF9zJcB/vSDo0Z651KIAEJw9zyBwBQpc7vCwwDMo7ZRUmlhsMn
         /JCqTLvrXBICK+4AL9MdQFCUilTNwcoQuLDIgCQLd15d6gYGYWnGmkXFARzECqMtw307
         CVzXYIzHhdQKmOjbvzikANbMQicPNvEyunuhKvLk04JEqqJPFRuoPtC0SJMOYucZE4lJ
         Ikip171s0Xoyn2L/Qk+U68GO6NmlacUS4Wq52OvOMnNW/nNEYFxyStVwG5yVQTZSp4Wa
         l+VELc0dZvk6EM9Efcao7c11ecO0BoBWXi7dN//okqUmI7zTuCkdbDN4Ma2Tc48PDlkF
         5wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V5fJj0mOnWaYwVhpiJnUslKE7tN8Z1KpbrZKZBznZko=;
        b=mndzg72etM1B+NyK/NNo61V7JQonSLOWhkHMjpBD2z97IueyOCVLZX1jyuoRngmn8L
         up1J8DqNVNGF/MoIjicoPtTFYuI1nFmpJNwPcaQhup2qMcLgX/R7ggLsmUksRyXULnos
         0hPv9LWfSdJsx84MMsMzQXifJjNQRbOtRYxQJFMD9LhyabOTcwCUGrNhGF0qSBQNMvcu
         Ux7NMhnMqueAXI92edJtQCdOVwdVuwLD5XfTZzisRfZYlpMo9wpoWMc6/0NtnWxUUDyD
         UH3ms6dhuBYJCFdnMlFvfh47AWqp8uPkgJAqxbXoyJ3GpYgPHE/32hrz+CeyiYhqoEp2
         w0gA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRj4CXSrVjGM+9g6zTgOqi/XX1Lg+aCqnTjOFT5t7jYPy7m79a
	WstrdPbxjRi74+KlLxD//Zc=
X-Google-Smtp-Source: APXvYqxQdJksaeCs9v0Gy5FnPcNOkDmep/iWfXnXFkMqP3bknGuM5YMv8VotMGRC86LdJkWHkvmQZA==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr11026278ljg.3.1578922670653;
        Mon, 13 Jan 2020 05:37:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:518f:: with SMTP id u15ls1084621lfi.3.gmail; Mon, 13 Jan
 2020 05:37:49 -0800 (PST)
X-Received: by 2002:ac2:4212:: with SMTP id y18mr9839149lfh.2.1578922669936;
        Mon, 13 Jan 2020 05:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578922669; cv=none;
        d=google.com; s=arc-20160816;
        b=FHblLWeFWP9LqRMMTi78zlEZ/kmNIj36MpC/Qk6TL/ZvvxCm7L+S4z4cTate+cclzf
         s2Z6rQ+jMbcqEbADVRjw8vDqfHCF8auo4y8olrgXsGKSoSBD1Ti7/VJ2msQuvN2OTQkP
         RbiY7yPXNr7gy4cMB16KoY2JwmfRov4NS12eNlmHdn+eXCSVfd8X+45smR6yAqAveTZc
         n7GWxKdJI+XRprJZnwIhry7KT9t/2rUoerZ/HD/M1sZwAqkokhOOkwUfpbXRrx49eWmz
         foawDNoGaqFOvrcVa7tU9QUpO/9xaOiOP6WsD+MXmZOThNYwAFks1e85niRx2aPjooYP
         ogbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=iK2gYb3usMLmuPZ8DvKbRK+EQJqA7sEkObcH1x9sz8U=;
        b=scciKaKRx5qcRgkAZnOnEUy6FBlBzRO9KMvz8n2jJAGbxze3NI1vuiE/Wu2/Vf+jaY
         tcfQWBaJ0+xrHpyRr3V6MGK9XkGkiSKWL8eJvVo5RVyckDrOqny6DmKdoeLOvX8fkgS7
         406pu653/vow+/njvIw3AfxnTDX2o8lEkCIeU+pgxYX7ELHI7lmVGbG9Vo1E6sfuwtge
         PEcCH3StRjm+pG3M+gABguLIHELC2pvvEeg85elLCVb+2Il/dcV295fF9ARztCBGfwMA
         4ZZ7E/vmq2+BVkn1wU9lX+qW+8cH0G0EmO9ZtVbZsN4bBPq6S+3GJ2A1HIiVqLsB/bE5
         Y6Hg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o24si514748lji.4.2020.01.13.05.37.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00DDbmIZ017301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 14:37:49 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DDbm2n004308;
	Mon, 13 Jan 2020 14:37:48 +0100
Subject: Re: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
From: Jan Kiszka <jan.kiszka@siemens.com>
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
References: <20200113104647.25884-1-nikhil.nd@ti.com>
 <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
Message-ID: <ff79a00e-9b54-d9d7-81d8-a3c27165865f@siemens.com>
Date: Mon, 13 Jan 2020 14:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 13.01.20 13:38, Jan Kiszka wrote:
> On 13.01.20 11:46, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> This series adds support for TI PVU as an iommu unit.
>> PVU is a 2nd stage only IOMMU which provides realtime address=20
>> translation.
>>
>> J721e has 3 instances of PVU and all the DMA traffic can be routed via=
=20
>> PVU
>> when running inside a virtual machine.
>>
>> Nikhil Devshatwar (5):
>> =C2=A0=C2=A0 core: Update cell_state while destroying the cell
>> =C2=A0=C2=A0 configs: Move amd specific fields in separate struct
>> =C2=A0=C2=A0 arm64: ti-pvu: Add support for ti-pvu iommu unit
>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in plat=
form_data
>> =C2=A0=C2=A0 configs: arm64: k3-j721e-evm: Add stream ids for devices be=
hind IOMMU
>>
>> =C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>> =C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
36 ++
>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 7 +
>> =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 129 ++++
>> =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
>> =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 580 +++++++++++=
+++++++
>> =C2=A0 hypervisor/arch/x86/amd_iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-
>> =C2=A0 hypervisor/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
>> =C2=A0 11 files changed, 794 insertions(+), 20 deletions(-)
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.=
h
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>>
>=20
> Applied to next - with fixups (build fix for patch 2, whitespace warning=
=20
> for patch 3).
>=20

Unfortunately, the ARM build is broken now. Looks like you need to=20
rework patch

> Jan
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
jailhouse-dev/ff79a00e-9b54-d9d7-81d8-a3c27165865f%40siemens.com.
