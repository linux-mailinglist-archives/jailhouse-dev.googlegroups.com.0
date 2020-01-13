Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXWJ6HYAKGQEWZTTOSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12913912D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 13:38:55 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id h23sf1921358ljk.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 04:38:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578919135; cv=pass;
        d=google.com; s=arc-20160816;
        b=KhC6yanNM8XrkMz0C7gzBxH56BXbTKtPTsv35OqJgG/4/0NwozLO7d6WcPvHHvhUpX
         Oer8rT4sZAY0ytf/F0uzqaEeiMDgz1u/rM2g7o3wR3ncAuV5whnbpBV5MVWSKOC4IIlG
         HWwU0Ea5GZ+A5W58KCqeTq7GlyLGCH7Ll64s6qBLywp4hqsBTBD2zd9BKhs9s3z4tAyP
         ceYgClpBbUnWlSZAnptbK265TAul7IrDJtCU9RXtYmdmT3q0BZW14zJDuSr6HW5VUbmD
         SJKijxrMaAVzUis3Cw6PLL+9/d7PCuPeHiNPWpQUCOrTpbMRcr2DQEc5f4pISJNc5ZAx
         ZRFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=mxEYJ/uJytv0+5/Wzxx3KtUSE9Cr7ywq2B/faRWwQb8=;
        b=EYfRbyMrII0Bp4PYR0xQEo2wFgHtbCG3yz6RjBI0CM/S8PZLi6zWT5qTP+aGeKVAqk
         jl8j64OkYGkq3Ulr2aNs0SjkC/pDfuv03f/rnOquwXaAbL6NCgNgBj70xMMH9RDZih4w
         rL9lJVIgOLwiPTB98IHwZW/eyqdRghTEzI0vxoFkhw8dFwjc9bWF+WDJDveINP12BVsS
         KhSK01nS6I5U1PEyoFtzp2JhVsKmRbRhttuA0u/pOap4UMQcKAJ9SfelAf8UrDiQyoOs
         DYuJIbgkyyOXK270k9oxgK5J2cd9KgMZVl4QSBpvxHURqPQyemB8WdU6Es0Eh7dkYTZ8
         gvxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mxEYJ/uJytv0+5/Wzxx3KtUSE9Cr7ywq2B/faRWwQb8=;
        b=NikS+uCguG7iPL01NysMD+JBvRMqoy+p86dq6Mv0ojOS7hRjkSgN+aoN/h3j+L0o1F
         BrZp8Frv9UY4NCQJZ/WLKnFgXcOdHEr98jpp0DrHluaJEshrSHSp8gWwOeu0Zh/IJCgy
         Q/+YubsP7Kx3o4P4uf8L+7EbE3uPMYuPx47/m6t6E+pkWBYwTt2Di+7i2aAAydlWGQBx
         Z/SUgm1y05DrnIw335aKE8OWXr4RMFHLlQQ+D7+J4aRbxt4KX6aAduWPVsyP1dzw/SQ4
         mfZ165JJCuJB19xvoe0oq0ZGOGUQOygBWTt52+6SzskBgaXpTKIwn/gHqV+snWtdux4A
         F4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mxEYJ/uJytv0+5/Wzxx3KtUSE9Cr7ywq2B/faRWwQb8=;
        b=CHs/Y9+/hez35fjHXnGJkCY12Y81I/d0xs2la2DrHhUeup0v5mD4cRqdR1MtdEvfxA
         vfgbUqoCBz5h/2+DiN16AGjLcSlyVscLKLHeb23Oskh8kWw5DoblzQ7bsRc/ROcgQ4s5
         A2pav+xjjriKI7SeO0qdOeQzZqYE/WFXfxq3dJiT9P47uEAXSgoHK/F3YODwVQolji6f
         reBz51PUmDPGvrPhVGovOkij/s94NgWih3w2dtjtRUvP7MLeKtq0FPM0OsBiSNa9Ujol
         EYxOyKrewFzjmsGyW4ENQ1T8OES1J32r5imvEnlLkZIlV1QW0xf08qC4HClfE7J5Z13V
         eOfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW8IDueCa4XHxxtf3x2WMh/QhaQAnCnYX8Xs4ZIAWB5JuGbGp9J
	ewNh3GUS0mWvyDR10b7uo38=
X-Google-Smtp-Source: APXvYqxH2tD7pKF4QXGeIhRmR4JCTzMrSrNxQU0NafRzR7JtVRJD7fEcf24MqOgBGjhMdiyreL8N8w==
X-Received: by 2002:a2e:978c:: with SMTP id y12mr10136263lji.167.1578919134977;
        Mon, 13 Jan 2020 04:38:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8592:: with SMTP id b18ls1541206lji.13.gmail; Mon, 13
 Jan 2020 04:38:54 -0800 (PST)
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr10853805ljg.3.1578919133985;
        Mon, 13 Jan 2020 04:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578919133; cv=none;
        d=google.com; s=arc-20160816;
        b=XblC1tC3+GE6G9KSLwOGLKWDCq6Xf/t6W/C6DgAwHqyaC91PTwqNXYDrq7I4UsYRo5
         XwGnzAmGc1/e8BvImU1sP9h0A9uqQoQOMEfYjmp0vnmdMteT7WyMFWWD9bZcCGIIieOf
         SetX+YLC84/75gmVsEGj5uHzCVRRMs6eyXURmq9vmvzTMjqwP9mWMxcDDlIuzKTi97Qn
         BSXit2TPOTz58WCjJ55w9ddBr3pQnANWLZJ+b8OnEn5KFM98Rr4+12dI+ZNZBRm7u1Cw
         0m2U0OmSnUuPDfAk7Sn3WBboPA6pfFWr01uGd4vbRc7dKgNg7bU5xklXS298Tiuqg/DD
         7LWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+yNBmC106qq3whZBJYrhu6DQ8V34yAv8OX9mvNGgu4A=;
        b=uoSyFQRr4098LTU2/ruWPRPdLQvF5DftUwuVeZfzg3UMvMVDPjueadN62drqeDn8s2
         YsuzS9zy5qplF1lntOhjmIrZgz0bKDuR9VtcVhNPXW2ZE7K/9RBRhJZGw80w8bnvXyA2
         /J+K9qzAmKoIQ0KHluYyoNqqImPybYHAlLUK1C+fqGnYAI/C3ZXaHdAs9AznXAVkbD4/
         LTqDftnreK2y/RWrg8sOV1jXqM8+reC70o+CmclV6AOO3HGON7xuyFSAF8n5s6izEsEe
         XwD/m5tvR3yJ5cnQsH7NzZC7rliNHSuFrR/YEiSYstYTsqG4uhaRmTuthuYLb90z7aNX
         ALDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 68si554646lfi.3.2020.01.13.04.38.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 04:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00DCcraq017257
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 13:38:53 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00DCcqiZ020763;
	Mon, 13 Jan 2020 13:38:52 +0100
Subject: Re: [PATCH v3 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
References: <20200113104647.25884-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <10174a11-8fcb-5332-0762-bf6a7e429a37@siemens.com>
Date: Mon, 13 Jan 2020 13:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 13.01.20 11:46, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> This series adds support for TI PVU as an iommu unit.
> PVU is a 2nd stage only IOMMU which provides realtime address translation.
> 
> J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
> when running inside a virtual machine.
> 
> Nikhil Devshatwar (5):
>    core: Update cell_state while destroying the cell
>    configs: Move amd specific fields in separate struct
>    arm64: ti-pvu: Add support for ti-pvu iommu unit
>    configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
>    configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
> 
>   configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
>   configs/arm64/k3-j721e-evm.c                  |  36 ++
>   hypervisor/arch/arm-common/include/asm/cell.h |   7 +
>   .../arch/arm-common/include/asm/iommu.h       |   1 +
>   .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
>   hypervisor/arch/arm-common/iommu.c            |   5 +-
>   hypervisor/arch/arm64/Kbuild                  |   3 +-
>   hypervisor/arch/arm64/ti-pvu.c                | 580 ++++++++++++++++++
>   hypervisor/arch/x86/amd_iommu.c               |  26 +-
>   hypervisor/control.c                          |   2 +
>   include/jailhouse/cell-config.h               |  18 +-
>   11 files changed, 794 insertions(+), 20 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
>   create mode 100644 hypervisor/arch/arm64/ti-pvu.c
> 

Applied to next - with fixups (build fix for patch 2, whitespace warning 
for patch 3).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10174a11-8fcb-5332-0762-bf6a7e429a37%40siemens.com.
