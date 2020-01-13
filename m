Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAHG6HYAKGQEDPSUD5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 08641139251
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:39:13 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id p5sf1291979wmc.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:39:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578922752; cv=pass;
        d=google.com; s=arc-20160816;
        b=qLpATvDyKnqolJeddATIbvaWOqzdBi4ehZH0OHIWudtwn1KtCLfSvT2mNNQcdwVGL+
         SwtFSC1CgOhPr9EwutAaifJE+KUvw/Vlzb+uHiwtv1wRi6EY4R8Jzo5pEGm8I1+zhp1t
         POCYQoX+GKuzI0lvzBWLMsz8X7er3ZQ9I0g3fZ9HOxANsKGu+6hbRZSLTfw5nooCOk5+
         ca0f5kiB8s5Nj3Ua8+5u7/oLZVY7QNAgUHi84dtvtJG9afdasreH54xPedd5RJRv77HS
         IsfbFCZiK65M0ZZ0Y6V6elyvYbIvRwj3U3d927dfKGVjaFuKkEowvpgnvMsseYf5cZ1d
         dCXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=eKpfTXo6i6zhriZsKD5n8wGzVaJ284ZG+iQuJFX6dPc=;
        b=waPKrTUnqkSlDihLPSuX98xi2Zzl/c1Bm4RpgDy5EP0khuOii6Cy0Rw8jPj4IPry5Z
         7pkWn+P1EUFL4Q4GbxbPy48iJABtOAJePuHmO+g0sjvmRlXZjxqqoSnBHc3R8fYn97d8
         TuuUZf9vbI5naNRD2Rt+GNzA0QbcF6C26FMfITpaznKM9SoEo+5GGwn743y49tq1esCJ
         hgt8M6r99Tm8fSAZbNsebri0lnT1gpJ+ZN2570HFOl2Axww7yBf5JEOqOu7IMs/NfNfd
         05gPRCWMUpzKHmcsEZlSQasR3/MLyvebz0gM6xpl4c8BSzCnBtdLr0yX6e/3DxRtV8+P
         Z6ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eKpfTXo6i6zhriZsKD5n8wGzVaJ284ZG+iQuJFX6dPc=;
        b=g27+8qUQn2w+g772pCio9CfU/p3qCcojCr+9oaJek7QDrpM+8x2sbiuPn7cKm1WtYg
         HZ1B+VeKK13f8kGJFd+9p/8/d18lfnC0s5qMUrXCJMueV0PI5ws36jwgZ2ZDREgtzFgv
         C6mncpqvivppKTg6UAvAQPoXYjFW1xGcI/LHyPuJwFczJemHlSrg+3PdkEP1NwG3ruyp
         rR2yCqasEjO+hXd4FcC6qsqskll+4GUwMkLHPtSuSdZkKzQlmx2ICPX/HO83G53ZJIfL
         J3ucL0yRsl5qGItZZcLywuAJMsTw2Sz7/QiF843Qo8cMwYeRm9Mikk3/WiOo5mkB2WUM
         tgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eKpfTXo6i6zhriZsKD5n8wGzVaJ284ZG+iQuJFX6dPc=;
        b=Kzzc3l/8oq07m9LocxKL6tbT3Bv8PsG3GMBeFQF+paEvvAoG0qFcXgks6ALdjXrT6d
         OP/YxtmHnWjkADOZyNJEMQGwExgpjop++rdy9APPrLR7q27xW1KQyZLsXwhHsYRSM4P1
         H8Zpz1HfTiEbQFvmwhECIedDQFp0yJR35GSj+QPaO2S/Md65SF0AgdkEk7CBTu9cLXzY
         DHR95lwLPmA8qZxKGXB5Ix7s/228VTnGqpkZxNo5aPBV5zFpFozRcTbKaMKhOWic5xjV
         qOppalOlzq7WOYSGC4XE4HrI4L2OO38uMaD3TrcEf1isnndFr2woXGrc7NCI1qYdSay1
         aGpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYk601MM7Qbbf+qMKD5QEbeWpQvutJHWX4pA6G63FNQSBrv/5f
	dDn02wkEM7u7lnZG9fbTiws=
X-Google-Smtp-Source: APXvYqzuBYnJibhAuqDjlYst+weu4zAT/mzWwkEpAFDJ1C+gGB7bMwr9pON80pxSnR1AJF8z9e986w==
X-Received: by 2002:a1c:f719:: with SMTP id v25mr20236492wmh.116.1578922752739;
        Mon, 13 Jan 2020 05:39:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7409:: with SMTP id p9ls6107051wmc.4.gmail; Mon, 13 Jan
 2020 05:39:12 -0800 (PST)
X-Received: by 2002:a1c:4907:: with SMTP id w7mr19674700wma.106.1578922752149;
        Mon, 13 Jan 2020 05:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578922752; cv=none;
        d=google.com; s=arc-20160816;
        b=R1TgO+xOnNVHEvwOnLNB1anc1CpxUZhnnJu+tAV59/8KDxVWDrKmCQ8ocUoaDFqSBe
         STMaxWFkjIqorr5A0o7M3/B/Q0cbQ0qhClGSZ3+NbIvNG9RliSQGuq2tky9PchiUjP2s
         Y2kP1XJ9ymtmmy5NYTQznvtKWqEsqYwv0+KUGkjpj3K4G2Gqbi3ININtX5ROeTtbrDMV
         xbfr4tWjzPfxohmXwl1v7eSKHKbD+7790OZGK5Zu+h75+LptgGy/PWDvlvSVdyC/f4yW
         GCg4qeATGTjqg27ZJsG4odZbuMct+RFyxBhIJDPQeopGlsFLQDE0LbbZWXcLhsURhFni
         RLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=/l9RSgJfqLr83abMBZlCrw2+cTcypwAghvdhJvkL1HQ=;
        b=mp/NZKNIJzlIZF+UjxAPLrGw0cew9ToYVdo/k+ECd64F7wxyEOiCcj4Z6ciLvX8gNg
         LxsZk7W0JjNhzw0wiV3lQtA5f5ITxoi8WLS+6kNvSBLDYj25SxWLdxqUTbd0ffQwDf4H
         onOK/SYJPjle+7Ztn0+/PRVGV1lLFC3e8cHovBLW1B/pS5Mgh9dMd1K+vn1GVwGeQ7/N
         TLj5ZJaffL0EXtS+kPaktVdnOqkPzHd5iSEgd4GUMRbI/kC/28FbDudOoa5X3lzKgJuK
         5Ip41PbNsRBzGPZS821ek1Hs02VaMpjE1KUivVNszQz62aoeGapugQIZVx1Sllm980Un
         dxyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id g3si481428wrw.5.2020.01.13.05.39.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:39:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00DDdAP0031104
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 14:39:10 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DDdAae010352;
	Mon, 13 Jan 2020 14:39:10 +0100
Subject: Re: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
From: Jan Kiszka <jan.kiszka@siemens.com>
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
References: <20200113104647.25884-1-nikhil.nd@ti.com>
 <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
 <ff79a00e-9b54-d9d7-81d8-a3c27165865f@siemens.com>
Message-ID: <946aebd2-b7cd-488e-fa61-68602634b71e@siemens.com>
Date: Mon, 13 Jan 2020 14:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ff79a00e-9b54-d9d7-81d8-a3c27165865f@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 13.01.20 14:37, Jan Kiszka wrote:
> On 13.01.20 13:38, Jan Kiszka wrote:
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
> Unfortunately, the ARM build is broken now. Looks like you need to=20
> rework patch

Forget it, I hit the send button in the wrong draft window. I reworked=20
the patch and just submitted it.

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
jailhouse-dev/946aebd2-b7cd-488e-fa61-68602634b71e%40siemens.com.
