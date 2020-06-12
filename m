Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7WBRT3QKGQENZHZY5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBC1F73E9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:30:22 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id h6sf3537851wrx.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:30:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591943422; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ga5QGgqtDYo+9n8wZ0/rZOu4mIj5se1yDrfm5TxzFgzlvIAUiKnjYXLXTZHF5sbnS9
         D4lU2VbXS5XY8OwV17e/n3AvtDA2S5afRbuYZA28OYPdfMEMddNQ0M/ShD2q0lDqtxSh
         feQnVmnqLJf7Y48zGPyf3E9SPsg+CCY0f3BvCwMwyV0X393mqKE8oPGJruNNEUwC/JNy
         tDDP8w6c6kqri5AKRjZer83ZyIrqac3dPytVTdQ4VMIU21vjWm7cKX50EkPx9EPda/LX
         Qc7J+mxe3pW8cICIZQIVBBny5Z00BAEvpt5XbeNly3gfsZAOjD3VhbxvgpaMKg069Ppt
         nJuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=aMURFxK/EKNZd7qG62RFsTeQ7PbnXq7e38gAygdpOUE=;
        b=DXSoTTG5QmqbN/VlN9L0XCeVGK3Qx8oMEvsaIrXYB/qGjsLkhbOvGoFOMfBTIsPItz
         kB8+1Vf07WgSSRFatHhkIZgLlnTIjhMsfffw6W/Wkl77UVnadpYPdsMBapl/GWUDN6C8
         aaGj0clr4/M4WrB53OKQtNdmX0nhM0blKsmQko0orcexWxV71WeCNgR3ysvp9R14mpQw
         Vt/A4r25yZO3/fcPBp1oUfjejIKzMgvduqM/pQTOD7L/pxHME/jPHRbeq4HkDZETJnUJ
         hz9MZ/DPYoxZJOV6U50AQ2KR55onie7bnW7PETcJtRt90fY9MEJX+VauaPzhL2+PAXDb
         IPqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aMURFxK/EKNZd7qG62RFsTeQ7PbnXq7e38gAygdpOUE=;
        b=QMOXuowmIiCHWvTh+6m6UM3V5+HOVHHZdx/YKQIRXGVs6KJmphSDiWHsDYcK1nro9j
         t9iCjfXzZp6ZGaftdd5rs/3OBd5Qat6krYgyTtLvoR/9EEwaZN1CJsZTvzLPZywd1q56
         xV5+aBI9RHAAnao4oAT7DMP/o46BOEEN1ABr/3+zFYQJ5eZBKpWXgqGPP/VGV1HBpZiC
         +FAt+EBtGpK4iF62s27IgAxisJ4ZBQqJCL4L5xYajdMo+zyWT1MMu+8hIQjpo2T/X9rd
         K5sc7gID07BTsS8uDvqys6QpuMVYS9R36wg/fxeQbmnTe3A927WHjqz2KZxmM4U7LeaN
         xmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aMURFxK/EKNZd7qG62RFsTeQ7PbnXq7e38gAygdpOUE=;
        b=VriLNP4WsrawWO/NqptspDuqpk1FQs3KjPfIOs4x80dHDOKryNRODeAQV/WfvPWQxi
         JLtbYsaX5c8PLW3HJArxSdEG4OmVULLLdS+UOe/kZMTUTAVCOE4kTW7n2sKRCzQwFtRY
         7hBdAOfDTQf5LeTEpNHtCbBRb+/y2Nu+lN5vQs9/QzrL/o3+QQX7FHLCci1AC1IvAaJa
         FIxtTElGjfMLy5bEJsn2wO0RLds3krJZa2q2AL4G7B3E0ZNIX8hS2qbBQw3D9RnmDPk6
         ec+IcI27KYb/kKMFSA3aifJQOci3nAlE77YkY0lxvsylmE8nONoUoqSsoKiZtuk0W7Zu
         X5jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UDDg+f2ImyUfprD1i89hImjc3P+tZwXvJlI5TIXzz4csYzLCZ
	h79RGLDXWVF5knoPyzP+3lM=
X-Google-Smtp-Source: ABdhPJxNNjOcsj/jM5nqk7NHjx4zgO8imQfI7dfR1DSzy51u8DGF5HjvaB93hYpNNNoFf5n9CkQZDg==
X-Received: by 2002:a05:6000:10c3:: with SMTP id b3mr13997132wrx.53.1591943422473;
        Thu, 11 Jun 2020 23:30:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aace:: with SMTP id i14ls2864366wrc.3.gmail; Thu, 11 Jun
 2020 23:30:21 -0700 (PDT)
X-Received: by 2002:adf:a491:: with SMTP id g17mr14085347wrb.132.1591943421716;
        Thu, 11 Jun 2020 23:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591943421; cv=none;
        d=google.com; s=arc-20160816;
        b=t6OJN1bzwci1jZnT+CQNPB7iMdZsesG951y9tyjCd565ni/Dx09toKTDM9+2nMNVm9
         FZUOcPd3d6LugBbxEwQVb5mL8Q3nKJNtK6Nz6pG8QC44JdVGUJf/hkGeOSm3bwyT/4YB
         5PPat36HwV9vpYEI4VC41DnzPXqsZa2Vr6BgsoG1aRG2FNwn1aaHRr4BrOMlBPuocHVa
         1p+zj37J3h0S7cj7xXiQwSvGvo8EOAjXpOE8T5Ohlq9bRoZYpwPXMqa41U1BjffjwYuS
         GttIJ3VHb3IL5z8ngN8y+3l1VYgce27HeV1xcdgapeVyhK35oFqQXnSjpFof2dn3k0Cu
         rXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=B2KwOWPTiWLQ4wFd9bHmaMb7/7pfNDrUlUueUmbzZzM=;
        b=hUGvf6IbOKhgBMROjKXxOQwKXkAZ4EVcKmJTT3Y3BJX8dw0h0VFvdPAd1ZeGiibWQI
         M1lcHWQf/+8IU3dT5+YZS0eU5b1Tj09CKDXUuA1Leocb2Om4Z7HoNlkM/vRceJhWwf1u
         4HKlRp/LtwPjTDdCvelRv1nUIKHNRiQMyGcwLj/oOPSorMb4EZOd+igrBMiYK/wcTecR
         gtO2Wy3L6hVVIRI/H7gsIVT+CRvTNtY5vNYXAmvWUPYvwtxZbgWxL1QSGg6tbHh0Y6ge
         /jWTxcgetxMfmA+ot0IaDZMHeA0/Fj+/e8YTf2gEGiMlVuwJBf7G6vplV5ImlCujbQ+3
         8mxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n27si202144wra.3.2020.06.11.23.30.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 05C6ULUe014074
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 08:30:21 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05C6UKIc010407;
	Fri, 12 Jun 2020 08:30:20 +0200
Subject: Re: [PATCH v3 0/9] Enable IVSHMEM demo for k3-j721e-evm
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200611125423.16770-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a2c46323-9726-3795-aa7f-dd420ae7288b@siemens.com>
Date: Fri, 12 Jun 2020 08:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 11.06.20 14:54, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> This series adds support for ivshmem demo for the k3-j721e-evm
> platform. Since TI kernel uses 64k page size, there are few
> improvements in the Jailhouse PCIe driver to support this.
> 
> Also, it generalizes the linux application and baremetal demo
> to work on different platforms with different configurations
> for ivshmem demo.
> 
> Last patch fixes some overlaps detected by config checker.
> 
> Nikhil Devshatwar (9):
>   include: cell-config: Add new macros for 64K aigned BAR
>   driver: pci: Use page size to set the aperture size
>   configs: dts: inmate-k3-j721e: Increase range for PCIe aperture
>   configs: k3-j721e-evm: Add IVSHMEM demo device
>   configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
>   tools: ivshmem-demo: Map memory regions with correct sizes
>   tools: ivshmem-demo: Pass peer_id command line
>   inmates: ivshmem-demo: Parse target from cmdline
>   configs: k3-j721e-evm: Fix memory overlaps
> 
>  configs/arm64/dts/inmate-k3-j721e-evm.dts |  2 +-
>  configs/arm64/k3-j721e-evm-inmate-demo.c  | 66 ++++++++++++++++--
>  configs/arm64/k3-j721e-evm-linux-demo.c   | 54 +++++++++++---
>  configs/arm64/k3-j721e-evm.c              | 84 ++++++++++++----------
>  driver/pci.c                              |  3 +-
>  include/jailhouse/cell-config.h           | 12 ++++
>  inmates/demos/ivshmem-demo.c              |  6 +-
>  tools/ivshmem-demo.c                      | 85 ++++++++++++++++++-----
>  8 files changed, 241 insertions(+), 71 deletions(-)
> 

Thanks, applied with v4 of patch 7.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a2c46323-9726-3795-aa7f-dd420ae7288b%40siemens.com.
