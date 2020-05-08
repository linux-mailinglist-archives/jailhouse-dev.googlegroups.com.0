Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU772X2QKGQE3AN47XQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D84681CB3EF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 17:50:44 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id p85sf705613lfa.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 08:50:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588953044; cv=pass;
        d=google.com; s=arc-20160816;
        b=zvgEM49blLfhZfUyvEv68CDLaQG3yxLOaFQ8h2PUNW9mWSdBoDZdeNw1DxKvEJ0HBG
         i4KhIAkL5ha9vuLNOcuwVUwYmJhrgKMBy1LDA3TalAiHV3/A/w067sOQNZY2M3bJzHqz
         Bx8TCTOwVVbRK9WgEni1KqKfHVEmrOnLJfE/MdwilPm9+mdNOL1NA8ilv7uG69QeqhZm
         mDm/XOl9L3MJ0rSWDw/yFIL8WZ2Qd87Hp4EIzdiu+m4iUYBQVdPZeHMRm8VKEwG1mKAQ
         YoL67KeS9qpEME8gjk04pGt2rxFoQ0uqZPfTdaxH47AW+37b4XJYTurglH+lCzuECUWf
         YdaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=OOFtsETNwHaZ0NKm5FhBMXDfKySCmymXHXKMvGGeTVA=;
        b=j3gAG6WwcCqwlfdY1FIk1qtju6pL7wpLxXflC9ODInwehZ4SW+5Kb43CXuiIN7VRj1
         Wgt/tjLY1z4P4e9Rl94i3e+eeNvOt5FEc5SeXZjBC+3OAXT94Vz0274w1cr3/Rhibw9B
         kA33pOsVROdVGDurnUMC1vYu0l+v35snkVwhlftcdQ8r5xYQbMIBPp+TLu3Zc83oILRO
         N2EWBEV1VKTaJOz5127q8denC/zsxL3UsFeU04Alaua6jOyLf/9sBxuH60EMZhGtLROa
         bcHOqSGal1zAtQasxE2YaeacLWtfx9KwRiifUffFGSyFw8stn11Rr+pxBeRGMcCeiGVP
         YCEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OOFtsETNwHaZ0NKm5FhBMXDfKySCmymXHXKMvGGeTVA=;
        b=SDQm5aDaVgHreQina3SQP4/yM1VdZmEaPVmK0n4Hx2QuDcIUelRdP2lKBVeBwyBef0
         eOPkPtlqJAhk6DwTy1VxD7eQku3l8gFVHy8ei3ow5b3D+0Iwdo/6ClLTnA/E7uoH5LrU
         bgUgAcyMiFGHXxL+YLWp97oa+idlNskyEGO4TevjGgS7FydZuMpUd9oo/7ncdazivw5M
         HYEfJnIua0r+EhC0Eu7pCJ/eToJ2k5rMVElwd7saRK9CVOCdlLzC0+yMuHzqZHXWOjMz
         8+L3cJR8GRMMMz/UqIL0AEmtjpEg2q7IDOwSSwhqv+CPrn0MsAELzC/jNA06zNvxYxUu
         tGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OOFtsETNwHaZ0NKm5FhBMXDfKySCmymXHXKMvGGeTVA=;
        b=WWhf6R+mRLyw6eODiCepDFT5ds4EdKE1b98uTcxd/7MX4sI/sXEX4UOM8JwBNQwyoF
         J/0D8HF+0+gCKgmIsStzK2jMRnT83X0N5PXgETUpgvthRz4M1IEPL0m53Uo9GYLBYUrS
         Tb9r6K4yg4BN4n6tQWLWvdX6QX6RbWulq0cGetHMFbYenLjfXcsGOWtf6NcmHc6+9qDL
         6ZvdrSwY25+rw2oX9ruenqos7bOEDU/S3/XXv5SjoWU+et7mAK4WjixGvH/suoE4P0tr
         Gp6NWt1oTxEsUT75HYcdKGlNZqeRABreYNVRffPoxzaTEDskF1WmrMZdZbTgTPa+LTHd
         pJtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xVj1XcJYD+ccDz4vsLiW6oJ9l9DU6R9G3QPlvqd9Gkad+D1UZ
	ZjyyHGUwz2xgNxI5rY6OayM=
X-Google-Smtp-Source: ABdhPJwUAlnPxFYZNTJZSJ8CU1s7ctV4ckrnVCLD0FCsN2xi5A0My/AeAJKZjsrtC+GouLAGsBSWJQ==
X-Received: by 2002:ac2:5602:: with SMTP id v2mr2339295lfd.52.1588953044155;
        Fri, 08 May 2020 08:50:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2002:: with SMTP id s2ls521255ljo.3.gmail; Fri, 08
 May 2020 08:50:43 -0700 (PDT)
X-Received: by 2002:a2e:731a:: with SMTP id o26mr2229278ljc.189.1588953042557;
        Fri, 08 May 2020 08:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588953042; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ54jKdX7c0bUa2ne9baMHuVsJPTMYOItXtBOUFluvu1T+mGnv7kdZnfhfBbGx3ZdL
         EB7kgTY82UAYUvB6JhrcJ0IRieFAN7cEXiqV8mfyB9ljqqGqdF6McyvPiOHq4PWH21qf
         j34C9I6YcXVLz16v6ZhAsxo5nsGi0Y5nNd7es5BYj9jjqYQXdFrAqf6Lka7AHXfdjqiT
         q3h8lG5RJV0aGD3UzyS0ucwsVjajbaAQRb1svzFXFuo42yBZOOWWzE/ajR8OIS0zTuNN
         FCt1ZfVEmQ9yJOH4TT+geqxAPdN/8eZXXmsIue+v5xAa7LnNHx796m3nd8QovmZct6v+
         JYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=sLLnWVhS5I7Bb8ahv63DXhbxh5CjLjN/Y71LQYgFyYs=;
        b=U5mLzgv/jeqIG3C9E8uA9bh+LbrOC+ISM9HFvt5MnIA8xNCzEiP20oV1bPq8kpDOF9
         r3D7fM5hYH1WDVHz88/HyoBeNcB2FI4WRdlNvnYZOdxY08yhgVKhCqMURsAm0Zx6G9al
         M9qzObySkLnK1I55X0bGopWpa4oOCvpB2B5Ybc0OkOw0P18nci4QSuCoyBLc8cK3dZOI
         VOek4EjQxRDm9RN6E0NiMCIU8Zswa66y2u7iCOX1MmZhlEYCdnNp1oihB+91LwHYoVy0
         k2DCe0qeP/Lriw6aSvESucayEH9dsZ1+uE85/L4eTKjpzCb/nu9nCAnInHJLmF/beorq
         sxwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f25si102400lfc.3.2020.05.08.08.50.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 08:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 048FofON019583
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2020 17:50:41 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 048FoeuR008137;
	Fri, 8 May 2020 17:50:40 +0200
Subject: Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
To: peng.fan@nxp.com, alice.guo@nxp.com, jailhouse-dev@googlegroups.com
References: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <014fcc0a-9754-d785-44de-c6f826a5a478@siemens.com>
Date: Fri, 8 May 2020 17:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
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

On 29.04.20 12:02, peng.fan@nxp.com wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Support smmu-v2 mmu500, add sid master support, only support stage2
> translation.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm64/Kbuild          |   1 +
>   hypervisor/arch/arm64/arm-smmu-regs.h | 220 ++++++
>   hypervisor/arch/arm64/smmu.c          | 926 ++++++++++++++++++++++++++
>   include/jailhouse/cell-config.h       |  15 +
>   include/jailhouse/sizes.h             |  47 ++
>   5 files changed, 1209 insertions(+)
>   create mode 100644 hypervisor/arch/arm64/arm-smmu-regs.h
>   create mode 100644 hypervisor/arch/arm64/smmu.c
>   create mode 100644 include/jailhouse/sizes.h
> 
> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
> index c34b0f32..e87c6e53 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -22,3 +22,4 @@ always := lib.a
>   lib-y := $(common-objs-y)
>   lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
>   lib-y += iommu.o smmu-v3.o ti-pvu.o
> +lib-y += smmu.o
> diff --git a/hypervisor/arch/arm64/arm-smmu-regs.h b/hypervisor/arch/arm64/arm-smmu-regs.h
> new file mode 100644
> index 00000000..a1226e4a
> --- /dev/null
> +++ b/hypervisor/arch/arm64/arm-smmu-regs.h
> @@ -0,0 +1,220 @@
> +/*
> + * IOMMU API for ARM architected SMMU implementations.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> + *
> + * Copyright (C) 2013 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>

Is this file a 1:1 copy of the kernel header? Or is it also adopted?

> + */
> +
> +#ifndef _ARM_SMMU_REGS_H
> +#define _ARM_SMMU_REGS_H
> +
> +/* Configuration registers */
> +#define ARM_SMMU_GR0_sCR0		0x0
> +#define sCR0_CLIENTPD			(1 << 0)
> +#define sCR0_GFRE			(1 << 1)
> +#define sCR0_GFIE			(1 << 2)
> +#define sCR0_EXIDENABLE			(1 << 3)
> +#define sCR0_GCFGFRE			(1 << 4)
> +#define sCR0_GCFGFIE			(1 << 5)
> +#define sCR0_USFCFG			(1 << 10)
> +#define sCR0_VMIDPNE			(1 << 11)
> +#define sCR0_PTM			(1 << 12)
> +#define sCR0_FB				(1 << 13)
> +#define sCR0_VMID16EN			(1 << 31)
> +#define sCR0_BSU_SHIFT			14
> +#define sCR0_BSU_MASK			0x3
> +
> +/* Auxiliary Configuration register */
> +#define ARM_SMMU_GR0_sACR		0x10
> +
> +/* Identification registers */
> +#define ARM_SMMU_GR0_ID0		0x20
> +#define ARM_SMMU_GR0_ID1		0x24
> +#define ARM_SMMU_GR0_ID2		0x28
> +#define ARM_SMMU_GR0_ID3		0x2c
> +#define ARM_SMMU_GR0_ID4		0x30
> +#define ARM_SMMU_GR0_ID5		0x34
> +#define ARM_SMMU_GR0_ID6		0x38
> +#define ARM_SMMU_GR0_ID7		0x3c
> +#define ARM_SMMU_GR0_sGFSR		0x48
> +#define ARM_SMMU_GR0_sGFSYNR0		0x50
> +#define ARM_SMMU_GR0_sGFSYNR1		0x54
> +#define ARM_SMMU_GR0_sGFSYNR2		0x58
> +
> +#define ID0_S1TS			(1 << 30)
> +#define ID0_S2TS			(1 << 29)
> +#define ID0_NTS				(1 << 28)
> +#define ID0_SMS				(1 << 27)
> +#define ID0_ATOSNS			(1 << 26)
> +#define ID0_PTFS_NO_AARCH32		(1 << 25)
> +#define ID0_PTFS_NO_AARCH32S		(1 << 24)
> +#define ID0_CTTW			(1 << 14)
> +#define ID0_NUMIRPT_SHIFT		16
> +#define ID0_NUMIRPT_MASK		0xff
> +#define ID0_NUMSIDB_SHIFT		9
> +#define ID0_NUMSIDB_MASK		0xf
> +#define ID0_EXIDS			(1 << 8)
> +#define ID0_NUMSMRG_SHIFT		0
> +#define ID0_NUMSMRG_MASK		0xff
> +
> +#define ID1_PAGESIZE			(1 << 31)
> +#define ID1_NUMPAGENDXB_SHIFT		28
> +#define ID1_NUMPAGENDXB_MASK		7
> +#define ID1_NUMS2CB_SHIFT		16
> +#define ID1_NUMS2CB_MASK		0xff
> +#define ID1_NUMCB_SHIFT			0
> +#define ID1_NUMCB_MASK			0xff
> +
> +#define ID2_OAS_SHIFT			4
> +#define ID2_OAS_MASK			0xf
> +#define ID2_IAS_SHIFT			0
> +#define ID2_IAS_MASK			0xf
> +#define ID2_UBS_SHIFT			8
> +#define ID2_UBS_MASK			0xf
> +#define ID2_PTFS_4K			(1 << 12)
> +#define ID2_PTFS_16K			(1 << 13)
> +#define ID2_PTFS_64K			(1 << 14)
> +#define ID2_VMID16			(1 << 15)
> +
> +#define ID7_MAJOR_SHIFT			4
> +#define ID7_MAJOR_MASK			0xf
> +
> +/* Global TLB invalidation */
> +#define ARM_SMMU_GR0_TLBIVMID		0x64
> +#define ARM_SMMU_GR0_TLBIALLNSNH	0x68
> +#define ARM_SMMU_GR0_TLBIALLH		0x6c
> +#define ARM_SMMU_GR0_sTLBGSYNC		0x70
> +#define ARM_SMMU_GR0_sTLBGSTATUS	0x74
> +#define sTLBGSTATUS_GSACTIVE		(1 << 0)
> +
> +/* Stream mapping registers */
> +#define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
> +#define SMR_VALID			(1 << 31)
> +#define SMR_MASK_SHIFT			16
> +#define SMR_ID_SHIFT			0
> +
> +#define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> +#define S2CR_CBNDX_SHIFT		0
> +#define S2CR_CBNDX_MASK			0xff
> +#define S2CR_EXIDVALID			(1 << 10)
> +#define S2CR_TYPE_SHIFT			16
> +#define S2CR_TYPE_MASK			0x3
> +enum arm_smmu_s2cr_type {
> +	S2CR_TYPE_TRANS,
> +	S2CR_TYPE_BYPASS,
> +	S2CR_TYPE_FAULT,
> +};

What is the advantage of modelling these as enum? And are we anywhere 
relying on their exact values for the width if those types? If so, then 
better use u* types and constant #defines.

> +
> +#define S2CR_PRIVCFG_SHIFT		24
> +#define S2CR_PRIVCFG_MASK		0x3
> +enum arm_smmu_s2cr_privcfg {
> +	S2CR_PRIVCFG_DEFAULT,
> +	S2CR_PRIVCFG_DIPAN,
> +	S2CR_PRIVCFG_UNPRIV,
> +	S2CR_PRIVCFG_PRIV,
> +};

Same as above.

> +
> +/* Context bank attribute registers */
> +#define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
> +#define CBAR_VMID_SHIFT			0
> +#define CBAR_VMID_MASK			0xff
> +#define CBAR_S1_BPSHCFG_SHIFT		8
> +#define CBAR_S1_BPSHCFG_MASK		3
> +#define CBAR_S1_BPSHCFG_NSH		3
> +#define CBAR_S1_MEMATTR_SHIFT		12
> +#define CBAR_S1_MEMATTR_MASK		0xf
> +#define CBAR_S1_MEMATTR_WB		0xf
> +#define CBAR_TYPE_SHIFT			16
> +#define CBAR_TYPE_MASK			0x3
> +#define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
> +#define CBAR_TYPE_S1_TRANS_S2_BYPASS	(1 << CBAR_TYPE_SHIFT)
> +#define CBAR_TYPE_S1_TRANS_S2_FAULT	(2 << CBAR_TYPE_SHIFT)
> +#define CBAR_TYPE_S1_TRANS_S2_TRANS	(3 << CBAR_TYPE_SHIFT)
> +#define CBAR_IRPTNDX_SHIFT		24
> +#define CBAR_IRPTNDX_MASK		0xff
> +
> +#define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
> +#define CBA2R_RW64_32BIT		(0 << 0)
> +#define CBA2R_RW64_64BIT		(1 << 0)
> +#define CBA2R_VMID_SHIFT		16
> +#define CBA2R_VMID_MASK			0xffff
> +
> +#define ARM_SMMU_CB_SCTLR		0x0
> +#define ARM_SMMU_CB_ACTLR		0x4
> +#define ARM_SMMU_CB_RESUME		0x8
> +#define ARM_SMMU_CB_TTBCR2		0x10
> +#define ARM_SMMU_CB_TTBR0		0x20
> +#define ARM_SMMU_CB_TTBR1		0x28
> +#define ARM_SMMU_CB_TTBCR		0x30
> +#define ARM_SMMU_CB_CONTEXTIDR		0x34
> +#define ARM_SMMU_CB_S1_MAIR0		0x38
> +#define ARM_SMMU_CB_S1_MAIR1		0x3c
> +#define ARM_SMMU_CB_PAR			0x50
> +#define ARM_SMMU_CB_FSR			0x58
> +#define ARM_SMMU_CB_FAR			0x60
> +#define ARM_SMMU_CB_FSYNR0		0x68
> +#define ARM_SMMU_CB_S1_TLBIVA		0x600
> +#define ARM_SMMU_CB_S1_TLBIASID		0x610
> +#define ARM_SMMU_CB_S1_TLBIVAL		0x620
> +#define ARM_SMMU_CB_S2_TLBIIPAS2	0x630
> +#define ARM_SMMU_CB_S2_TLBIIPAS2L	0x638
> +#define ARM_SMMU_CB_TLBSYNC		0x7f0
> +#define ARM_SMMU_CB_TLBSTATUS		0x7f4
> +#define ARM_SMMU_CB_ATS1PR		0x800
> +#define ARM_SMMU_CB_ATSR		0x8f0
> +
> +#define SCTLR_S1_ASIDPNE		(1 << 12)
> +#define SCTLR_CFCFG			(1 << 7)
> +#define SCTLR_CFIE			(1 << 6)
> +#define SCTLR_CFRE			(1 << 5)
> +#define SCTLR_E				(1 << 4)
> +#define SCTLR_AFE			(1 << 2)
> +#define SCTLR_TRE			(1 << 1)
> +#define SCTLR_M				(1 << 0)
> +
> +#define CB_PAR_F			(1 << 0)
> +
> +#define ATSR_ACTIVE			(1 << 0)
> +
> +#define RESUME_RETRY			(0 << 0)
> +#define RESUME_TERMINATE		(1 << 0)
> +
> +#define TTBCR2_SEP_SHIFT		15
> +#define TTBCR2_SEP_UPSTREAM		(0x7 << TTBCR2_SEP_SHIFT)
> +#define TTBCR2_AS			(1 << 4)
> +
> +#define TTBRn_ASID_SHIFT		48
> +
> +#define FSR_MULTI			(1 << 31)
> +#define FSR_SS				(1 << 30)
> +#define FSR_UUT				(1 << 8)
> +#define FSR_ASF				(1 << 7)
> +#define FSR_TLBLKF			(1 << 6)
> +#define FSR_TLBMCF			(1 << 5)
> +#define FSR_EF				(1 << 4)
> +#define FSR_PF				(1 << 3)
> +#define FSR_AFF				(1 << 2)
> +#define FSR_TF				(1 << 1)
> +
> +#define FSR_IGN				(FSR_AFF | FSR_ASF | \
> +					 FSR_TLBMCF | FSR_TLBLKF)
> +#define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
> +					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
> +
> +#define FSYNR0_WNR			(1 << 4)
> +
> +#endif /* _ARM_SMMU_REGS_H */
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> new file mode 100644
> index 00000000..ea1b4c1e
> --- /dev/null
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -0,0 +1,926 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2018-2020 NXP
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Modified from Linux smmu.c
> + */
> +
> +#include <jailhouse/control.h>
> +#include <jailhouse/ivshmem.h>
> +#include <jailhouse/mmio.h>
> +#include <jailhouse/paging.h>
> +#include <jailhouse/pci.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/sizes.h>
> +#include <jailhouse/string.h>
> +#include <jailhouse/unit.h>
> +#include <asm/spinlock.h>
> +#include <jailhouse/cell-config.h>
> +
> +#include "arm-smmu-regs.h"

Are those regs common to anyone? SMMUv3? If not, better fold in. If 
there is something to share, then move to include/asm/,

> +
> +#define ARM_32_LPAE_TCR_EAE		(1 << 31)
> +#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
> +
> +#define ARM_LPAE_TCR_EPD1		(1 << 23)
> +
> +#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
> +#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
> +#define ARM_LPAE_TCR_TG0_16K		(2 << 14)
> +
> +#define ARM_LPAE_TCR_SH0_SHIFT		12
> +#define ARM_LPAE_TCR_SH0_MASK		0x3
> +#define ARM_LPAE_TCR_SH_NS		0
> +#define ARM_LPAE_TCR_SH_OS		2
> +#define ARM_LPAE_TCR_SH_IS		3
> +
> +#define ARM_LPAE_TCR_ORGN0_SHIFT	10
> +#define ARM_LPAE_TCR_IRGN0_SHIFT	8
> +#define ARM_LPAE_TCR_RGN_MASK		0x3
> +#define ARM_LPAE_TCR_RGN_NC		0
> +#define ARM_LPAE_TCR_RGN_WBWA		1
> +#define ARM_LPAE_TCR_RGN_WT		2
> +#define ARM_LPAE_TCR_RGN_WB		3
> +
> +#define ARM_LPAE_TCR_SL0_SHIFT		6
> +#define ARM_LPAE_TCR_SL0_MASK		0x3
> +#define ARM_LPAE_TCR_SL0_LVL_2		0
> +#define ARM_LPAE_TCR_SL0_LVL_1		1
> +
> +#define ARM_LPAE_TCR_T0SZ_SHIFT		0
> +#define ARM_LPAE_TCR_SZ_MASK		0xf
> +
> +#define ARM_LPAE_TCR_PS_SHIFT		16
> +#define ARM_LPAE_TCR_PS_MASK		0x7
> +
> +#define ARM_LPAE_TCR_IPS_SHIFT		32
> +#define ARM_LPAE_TCR_IPS_MASK		0x7
> +
> +#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
> +#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
> +#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
> +#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
> +#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
> +#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
> +#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
> +#define ARM_MMU500_ACTLR_CPRE		(1 << 1)
> +
> +#define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
> +#define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
> +#define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
> +
> +#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
> +#define TLB_SPIN_COUNT			10

How do those numbers map to real-time? Are they truly CPU(-frequency) 
independent?

> +
> +/* Maximum number of context banks per SMMU */
> +#define ARM_SMMU_MAX_CBS		128
> +
> +/* SMMU global address space */
> +#define ARM_SMMU_GR0(smmu)		((smmu)->base)
> +#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
> +
> +/*
> + * SMMU global address space with conditional offset to access secure
> + * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
> + * nsGFSYNR0: 0x450)
> + */
> +#define ARM_SMMU_GR0_NS(smmu)						\
> +	((smmu)->base +							\
> +		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
> +			? 0x400 : 0))
> +
> +/* Translation context bank */
> +#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
> +
> +#define MSI_IOVA_BASE			0x8000000
> +#define MSI_IOVA_LENGTH			0x100000
> +
> +struct arm_smmu_s2cr {
> +	enum arm_smmu_s2cr_type		type;
> +	enum arm_smmu_s2cr_privcfg	privcfg;
> +	u8				cbndx;
> +};
> +
> +struct arm_smmu_smr {
> +	u16				mask;
> +	u16				id;
> +	bool				valid;
> +};
> +
> +struct arm_smmu_cb {
> +	u64				ttbr[2];
> +	u32				tcr[2];
> +	u32				mair[2];
> +	struct arm_smmu_cfg		*cfg;
> +};

Is any of those data structures shared with the hardware? Or are they 
just for internal book-keeping? I'm asking because of aligments, packing 
etc. Applies to almost all structs you define.

> +
> +struct arm_smmu_device {
> +	void	*base;
> +	void	*cb_base;
> +	u32	num_masters;
> +	unsigned long			pgshift;
> +
> +#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
> +#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
> +#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
> +#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
> +#define ARM_SMMU_FEAT_TRANS_NESTED	(1 << 4)
> +#define ARM_SMMU_FEAT_TRANS_OPS		(1 << 5)
> +#define ARM_SMMU_FEAT_VMID16		(1 << 6)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
> +#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
> +#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
> +#define ARM_SMMU_FEAT_EXIDS		(1 << 12)

I would prefer those defines outside of the struct. Also below.

> +	u32				features;
> +
> +#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> +	u32				options;
> +	enum arm_smmu_arch_version	version;
> +	enum arm_smmu_implementation	model;
> +
> +	u32				num_context_banks;
> +	u32				num_s2_context_banks;
> +	struct arm_smmu_cb		*cbs;
> +
> +	u32				num_mapping_groups;
> +	u16				streamid_mask;
> +	u16				smr_mask_mask;
> +	struct arm_smmu_smr		*smrs;
> +	struct arm_smmu_s2cr		*s2crs;
> +	struct arm_smmu_cfg		*cfgs;
> +
> +	unsigned long			va_size;
> +	unsigned long			ipa_size;
> +	unsigned long			pa_size;
> +	unsigned long			pgsize_bitmap;
> +
> +	u32				num_global_irqs;
> +	u32				num_context_irqs;
> +	unsigned int			*irqs;
> +
> +	spinlock_t			global_sync_lock;
> +};
> +
> +enum arm_smmu_context_fmt {
> +	ARM_SMMU_CTX_FMT_NONE,
> +	ARM_SMMU_CTX_FMT_AARCH64,
> +	ARM_SMMU_CTX_FMT_AARCH32_L,
> +	ARM_SMMU_CTX_FMT_AARCH32_S,
> +};
> +
> +struct arm_smmu_cfg {
> +	u8				cbndx;
> +	u8				irptndx;
> +	union {
> +		u16			asid;
> +		u16			vmid;
> +	};
> +	u32				cbar;
> +	enum arm_smmu_context_fmt	fmt;
> +};
> +#define INVALID_IRPTNDX			0xff
> +
> +enum arm_smmu_domain_stage {
> +	ARM_SMMU_DOMAIN_S1 = 0,
> +	ARM_SMMU_DOMAIN_S2,
> +	ARM_SMMU_DOMAIN_NESTED,
> +	ARM_SMMU_DOMAIN_BYPASS,
> +};

This enum is even not uses for typechecking. So, simple #defines suffice.

> +
> +#define s2cr_init_val (struct arm_smmu_s2cr){	\
> +	.type = S2CR_TYPE_BYPASS,		\
> +}
> +
> +
> +static struct arm_smmu_device smmu_device;
> +static unsigned long pgsize_bitmap = -1;
> +static u16 arm_sid_mask;

Why a global arm_sid_mask when it is configured per SMMU instance?

> +
> +static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
> +{
> +	struct arm_smmu_smr *smr = smmu->smrs + idx;
> +	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
> +
> +	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
> +		reg |= SMR_VALID;
> +	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
> +}
> +
> +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
> +{
> +	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
> +	u32 reg = (s2cr->type & S2CR_TYPE_MASK) << S2CR_TYPE_SHIFT |
> +		  (s2cr->cbndx & S2CR_CBNDX_MASK) << S2CR_CBNDX_SHIFT |
> +		  (s2cr->privcfg & S2CR_PRIVCFG_MASK) << S2CR_PRIVCFG_SHIFT;

We already have the GET_FIELD macro. Maybe some SET_FIELD would be 
useful. It would allow to encode the fields in-place, without #defines.

> +
> +	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
> +	    smmu->smrs[idx].valid)
> +		reg |= S2CR_EXIDVALID;
> +	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
> +}
> +
> +static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
> +{
> +	if (smmu->smrs)
> +		arm_smmu_write_smr(smmu, idx);
> +
> +	arm_smmu_write_s2cr(smmu, idx);
> +}
> +
> +/* Wait for any pending TLB invalidations to complete */
> +static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
> +				void *sync, void *status)
> +{
> +	unsigned int spin_cnt, delay;
> +
> +	mmio_write32(sync, 0);
> +	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> +		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> +				return;
> +			cpu_relax();
> +		}
> +	}
> +	printk("TLB sync timed out -- SMMU may be deadlocked\n");

Hmm, end then? Contiue with eyes shut? Shouldn't this error be 
propagated? Seems doable, at least for the cases I checked.

> +}
> +
> +static void arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
> +{
> +	void *base = ARM_SMMU_GR0(smmu);
> +
> +	spin_lock(&smmu->global_sync_lock);
> +	__arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
> +			    base + ARM_SMMU_GR0_sTLBGSTATUS);

Just fold that function in - single user.

> +	spin_unlock(&smmu->global_sync_lock);
> +}
> +
> +#define ARM_SMMU_CB_VMID(cfg)		((cfg)->cbndx + 1)

Unused.

> +static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
> +				       struct arm_smmu_cfg *cfg,
> +				       struct cell *cell)
> +{
> +	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
> +	struct paging_structures *pg_structs;
> +	unsigned long cell_table;
> +	u32 reg;
> +
> +	cb->cfg = cfg;
> +
> +	/* VTCR */
> +	reg = ARM_64_LPAE_S2_TCR_RES1 |
> +	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> +	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> +	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> +
> +	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		reg |= ARM_LPAE_TCR_TG0_4K;
> +		break;
> +	case SZ_64K:
> +		reg |= ARM_LPAE_TCR_TG0_64K;
> +		break;
> +	}
> +
> +	switch (smmu->pa_size) {
> +	case 32:
> +		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 36:
> +		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 40:
> +		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 42:
> +		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 44:
> +		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 48:
> +		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 52:
> +		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	default:
> +		printk("Not supported\n");
> +		break;
> +		/* TODO */
> +		//goto out_free_data;

If this is possible, please return an error and make the caller fail.

> +	}
> +
> +	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
> +
> +	cb->tcr[0] = reg;
> +
> +	pg_structs = &cell->arch.mm;
> +	cell_table = paging_hvirt2phys(pg_structs->root_table);
> +	u64 vttbr = 0;
> +
> +	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
> +	vttbr |= (u64)(cell_table & TTBR_MASK);
> +	cb->ttbr[0] = vttbr;
> +}
> +
> +static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> +{
> +	u32 reg;
> +	struct arm_smmu_cb *cb = &smmu->cbs[idx];
> +	struct arm_smmu_cfg *cfg = cb->cfg;
> +	void *cb_base, *gr1_base;
> +
> +	cb_base = ARM_SMMU_CB(smmu, idx);
> +
> +	/* Unassigned context banks only need disabling */
> +	if (!cfg) {
> +		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
> +		return;
> +	}
> +
> +	gr1_base = ARM_SMMU_GR1(smmu);
> +
> +	/* CBA2R */
> +	if (smmu->version > ARM_SMMU_V1) {
> +		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
> +			reg = CBA2R_RW64_64BIT;
> +		else
> +			reg = CBA2R_RW64_32BIT;
> +		/* 16-bit VMIDs live in CBA2R */
> +		if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +			reg |= cfg->vmid << CBA2R_VMID_SHIFT;
> +
> +		mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
> +	}
> +
> +	/* CBAR */
> +	reg = cfg->cbar;
> +	if (smmu->version < ARM_SMMU_V2)
> +		reg |= cfg->irptndx << CBAR_IRPTNDX_SHIFT;
> +
> +	/*
> +	 * Use the weakest shareability/memory types, so they are
> +	 * overridden by the ttbcr/pte.
> +	 */
> +	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
> +		/* 8-bit VMIDs live in CBAR */
> +		reg |= cfg->vmid << CBAR_VMID_SHIFT;
> +	}
> +	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
> +
> +	/*
> +	 * TTBCR
> +	 * We must write this before the TTBRs, since it determines the
> +	 * access behaviour of some fields (in particular, ASID[15:8]).
> +	 */
> +	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
> +
> +	/* TTBRs */
> +	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
> +		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
> +		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
> +	} else {
> +		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +	}
> +
> +	/* SCTLR */
> +	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
> +		SCTLR_M;
> +
> +	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
> +}
> +
> +static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +{
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	int i;
> +	u32 reg, major;
> +
> +	/* clear global FSR */
> +	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
> +	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
> +
> +	/*
> +	 * Reset stream mapping groups: Initial values mark all SMRn as
> +	 * invalid and all S2CRn as bypass unless overridden.
> +	 */
> +	for (i = 0; i < smmu->num_mapping_groups; ++i)
> +		arm_smmu_write_sme(smmu, i);
> +
> +	if (smmu->model == ARM_MMU500) {
> +		/*
> +		 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
> +		 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
> +		 * bit is only present in MMU-500r2 onwards.
> +		 */
> +		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
> +		major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
> +		reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
> +		if (major >= 2)
> +			reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
> +		/*
> +		 * Allow unmatched Stream IDs to allocate bypass
> +		 * TLB entries for reduced latency.
> +		 */
> +		reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
> +		mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
> +	}
> +
> +	/* Make sure all context banks are disabled and clear CB_FSR  */
> +	for (i = 0; i < smmu->num_context_banks; ++i) {
> +		void *cb_base = ARM_SMMU_CB(smmu, i);
> +
> +		arm_smmu_write_context_bank(smmu, i);
> +		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
> +		/*
> +		 * Disable MMU-500's not-particularly-beneficial next-page
> +		 * prefetcher for the sake of errata #841119 and #826419.
> +		 */
> +		if (smmu->model == ARM_MMU500) {
> +			reg = mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
> +			reg &= ~ARM_MMU500_ACTLR_CPRE;
> +			mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
> +		}
> +	}
> +
> +	/* Invalidate the TLB, just in case */
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
> +
> +	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
> +
> +	/* Enable fault reporting */
> +	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
> +
> +	/* Disable TLB broadcasting. */
> +	reg |= (sCR0_VMIDPNE | sCR0_PTM);
> +
> +	/* Enable client access, handling unmatched streams as appropriate */
> +	reg &= ~sCR0_CLIENTPD;
> +	reg &= ~sCR0_USFCFG;
> +
> +	/* Disable forced broadcasting */
> +	reg &= ~sCR0_FB;
> +
> +	/* Don't upgrade barriers */
> +	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +		reg |= sCR0_VMID16EN;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
> +		reg |= sCR0_EXIDENABLE;
> +
> +	/* Push the button */
> +	arm_smmu_tlb_sync_global(smmu);
> +	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
> +}
> +
> +static int arm_smmu_id_size_to_bits(int size)
> +{
> +	switch (size) {
> +	case 0:
> +		return 32;
> +	case 1:
> +		return 36;
> +	case 2:
> +		return 40;
> +	case 3:
> +		return 42;
> +	case 4:
> +		return 44;
> +	case 5:
> +	default:
> +		return 48;
> +	}
> +}
> +
> +static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	unsigned long size;
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	u32 id;
> +	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
> +	int i;
> +
> +	printk("probing hardware configuration...\n");
> +	printk("SMMUv%d with:\n", smmu->version == ARM_SMMU_V2 ? 2 : 1);
> +
> +	/* ID0 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
> +
> +	/* Restrict stage 2 */
> +	id &= ~(ID0_S1TS | ID0_NTS);
> +
> +	if (id & ID0_S2TS) {
> +		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
> +		printk("\tstage 2 translation\n");
> +	}
> +
> +	if (!(smmu->features &
> +		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
> +		printk("\tno translation support!\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * In order for DMA API calls to work properly, we must defer to what
> +	 * the FW says about coherency, regardless of what the hardware claims.
> +	 * Fortunately, this also opens up a workaround for systems where the
> +	 * ID register value has ended up configured incorrectly.
> +	 */
> +	cttw_reg = !!(id & ID0_CTTW);
> +	if (cttw_fw || cttw_reg)
> +		printk("\t%scoherent table walk\n", cttw_fw ? "" : "non-");
> +	if (cttw_fw != cttw_reg)
> +		printk("\t(IDR0.CTTW overridden by FW configuration)\n");
> +
> +	/* Max. number of entries we have for stream matching/indexing */
> +	if (smmu->version == ARM_SMMU_V2 && id & ID0_EXIDS) {
> +		smmu->features |= ARM_SMMU_FEAT_EXIDS;
> +		size = 1 << 16;
> +	} else {
> +		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
> +	}
> +	smmu->streamid_mask = size - 1;
> +
> +	if (id & ID0_SMS) {
> +		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
> +		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
> +		if (size == 0) {
> +			printk("stream-matching supported, but no SMRs present!\n");
> +			return -ENODEV;
> +		}
> +
> +		/* Zero-initialised to mark as invalid */
> +		smmu->smrs = page_alloc(&mem_pool,
> +					PAGES(size * sizeof(*smmu->smrs)));
> +		if (!smmu->smrs)
> +			return -ENOMEM;
> +		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
> +
> +		printk("\tstream matching with %lu register groups", size);
> +	}
> +	/* s2cr->type == 0 means translation, so initialise explicitly */
> +	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs) + sizeof(*smmu->cfgs))));
> +	if (!smmu->s2crs) {
> +		page_free(&mem_pool, smmu->smrs,
> +			  PAGES(size * sizeof(*smmu->smrs)));

If this can happen during cell-create, we should clean up. If this ony 
happens during init (jailhouse enable), no need for the rollback, just 
return the error.

> +		return -ENOMEM;
> +	}
> +
> +	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
> +
> +	/* Configure to bypass */
> +	for (i = 0; i < size; i++)
> +		smmu->s2crs[i] = s2cr_init_val;
> +
> +	smmu->num_mapping_groups = size;
> +
> +	if (smmu->version < ARM_SMMU_V2 || !(id & ID0_PTFS_NO_AARCH32)) {
> +		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
> +		if (!(id & ID0_PTFS_NO_AARCH32S))
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
> +	}
> +
> +	/* ID1 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
> +	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
> +
> +	/* Check for size mismatch of SMMU address space from mapped region */
> +	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
> +	size <<= smmu->pgshift;
> +	if (smmu->cb_base != gr0_base + size)
> +		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
> +		       size * 2, (smmu->cb_base - gr0_base) * 2);

...and? Fail?

> +
> +	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
> +	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
> +	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
> +		printk("impossible number of S2 context banks!\n");
> +		return -ENODEV;
> +	}
> +	/* TODO Check More */

HW compatibility? Or what should be checked? Just for my understanding.

> +	smmu->num_context_irqs = smmu->num_context_banks;
> +
> +	printk("\t%u context banks (%u stage-2 only)\n",
> +	       smmu->num_context_banks, smmu->num_s2_context_banks);
> +
> +	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks * sizeof(*smmu->cbs)));
> +	if (!smmu->cbs) {
> +		/* TODO: Free smrs s2cr */

See my comment above.

> +		return -ENOMEM;
> +	}
> +
> +	/* ID2 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
> +	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
> +	/* Reuse cpu table */
> +	smmu->ipa_size = MIN(size, get_cpu_parange());
> +
> +	/* The output mask is also applied for bypass */
> +	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
> +	smmu->pa_size = size;
> +
> +	if (id & ID2_VMID16)
> +		smmu->features |= ARM_SMMU_FEAT_VMID16;
> +
> +	/*
> +	 * What the page table walker can address actually depends on which
> +	 * descriptor format is in use, but since a) we don't know that yet,
> +	 * and b) it can vary per context bank, this will have to do...
> +	 * TODO: DMA?

???

> +	 */
> +
> +	if (smmu->version < ARM_SMMU_V2) {
> +		smmu->va_size = smmu->ipa_size;
> +		if (smmu->version == ARM_SMMU_V1_64K)
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
> +	} else {
> +		size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
> +		smmu->va_size = arm_smmu_id_size_to_bits(size);
> +		if (id & ID2_PTFS_4K)
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
> +		if (id & ID2_PTFS_16K)
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
> +		if (id & ID2_PTFS_64K)
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
> +	}
> +
> +	/* Now we've corralled the various formats, what'll it do? */
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
> +		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
> +	if (smmu->features &
> +	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
> +		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
> +		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
> +
> +	if (pgsize_bitmap == -1UL)
> +		pgsize_bitmap = smmu->pgsize_bitmap;
> +	else
> +		pgsize_bitmap |= smmu->pgsize_bitmap;
> +	printk("\tSupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
> +
> +
> +	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
> +		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
> +		       smmu->va_size, smmu->ipa_size);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
> +		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
> +		       smmu->ipa_size, smmu->pa_size);
> +
> +	return 0;
> +}
> +
> +static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
> +{
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	u32 smr;
> +
> +	if (!smmu->smrs)
> +		return;
> +
> +	/*
> +	 * SMR.ID bits may not be preserved if the corresponding MASK
> +	 * bits are set, so check each one separately. We can reject
> +	 * masters later if they try to claim IDs outside these masks.
> +	 */
> +	smr = smmu->streamid_mask << SMR_ID_SHIFT;
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
> +
> +	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
> +}
> +
> +static int arm_smmu_find_sme(u16 id, u16 mask)
> +{
> +	struct arm_smmu_device *smmu = &smmu_device;
> +	struct arm_smmu_smr *smrs = smmu->smrs;
> +	int i, free_idx = -EINVAL;
> +
> +	/* Stream indexing is blissfully easy */
> +	if (!smrs)
> +		return id;
> +
> +	/* Validating SMRs is... less so */
> +	for (i = 0; i < smmu->num_mapping_groups; ++i) {
> +		if (!smrs[i].valid) {
> +			/*
> +			 * Note the first free entry we come across, which
> +			 * we'll claim in the end if nothing else matches.
> +			 */
> +			if (free_idx < 0)
> +				free_idx = i;
> +			continue;
> +		}
> +		/*
> +		 * If the new entry is _entirely_ matched by an existing entry,
> +		 * then reuse that, with the guarantee that there also cannot
> +		 * be any subsequent conflicting entries. In normal use we'd
> +		 * expect simply identical entries for this case, but there's
> +		 * no harm in accommodating the generalisation.
> +		 */
> +		if ((mask & smrs[i].mask) == mask &&
> +		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
> +			return i;
> +		}
> +		/*
> +		 * If the new entry has any other overlap with an existing one,
> +		 * though, then there always exists at least one stream ID
> +		 * which would cause a conflict, and we can't allow that risk.
> +		 */
> +		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
> +			return -EINVAL;
> +	}
> +
> +	return free_idx;
> +}
> +
> +static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
> +{
> +	smmu->s2crs[idx] = s2cr_init_val;
> +	if (smmu->smrs) {
> +		smmu->smrs[idx].id = 0;
> +		smmu->smrs[idx].mask = 0;
> +		smmu->smrs[idx].valid = false;
> +	}
> +
> +	return true;
> +}
> +
> +#define for_each_smmu_sid(sid, config, counter)				\
> +	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
> +	     (counter) < (config)->num_stream_ids;			\
> +	     (sid)++, (counter)++)
> +
> +static int arm_smmu_cell_init(struct cell *cell)
> +{
> +	struct arm_smmu_device *smmu = &smmu_device;
> +	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
> +	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
> +	struct arm_smmu_cfg *cfg = &smmu->cfgs[cell->config->id];
> +	struct arm_smmu_smr *smr;
> +	const __u32 *sid;
> +	unsigned int n;
> +	int ret, idx;
> +
> +	/* If no sids, ignore */
> +	if (!cell->config->num_stream_ids)
> +		return 0;
> +
> +	if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
> +			      ARM_SMMU_FEAT_FMT_AARCH64_16K |
> +			      ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
> +
> +	cfg->cbar = CBAR_TYPE_S2_TRANS;
> +
> +	/* We use cell->config->id here, one cell use one context */
> +	cfg->cbndx = cell->config->id;
> +
> +	if (smmu->version < ARM_SMMU_V2) {
> +		/* TODO */

Error out? Or what is the TODO?

> +	} else {
> +		cfg->irptndx = cfg->cbndx;
> +	}
> +
> +	cfg->vmid = cfg->cbndx + 1;
> +
> +	arm_smmu_init_context_bank(smmu, cfg, cell);
> +	arm_smmu_write_context_bank(smmu, cfg->cbndx);
> +
> +	smr = smmu->smrs;
> +
> +	for_each_smmu_sid(sid, cell->config, n) {
> +		ret = arm_smmu_find_sme(*sid, arm_sid_mask);
> +		if (ret < 0)
> +			printk("arm_smmu_find_sme error %d\n", ret);

return error?

> +		idx = ret;

...or use that negative idx? Better not.

> +
> +		if (type == s2cr[idx].type && cfg->cbndx == s2cr[idx].cbndx)
> +			printk("%s error\n", __func__);

return error? Rollback needed? Or impossible?

> +
> +		s2cr[idx].type = type;
> +		s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
> +		s2cr[idx].cbndx = cfg->cbndx;
> +
> +		arm_smmu_write_s2cr(smmu, idx);
> +
> +
> +		smr[idx].id = *sid;
> +		smr[idx].mask = arm_sid_mask;
> +		smr[idx].valid = true;
> +
> +		arm_smmu_write_smr(smmu, idx);
> +	}
> +
> +	printk("Found %d masters\n", n);
> +
> +	return 0;
> +}
> +
> +static void arm_smmu_cell_exit(struct cell *cell)
> +{
> +	const __u32 *sid;
> +	struct arm_smmu_device *smmu = &smmu_device;
> +	unsigned int n;
> +	int ret, idx;
> +	int cbndx = cell->config->id;
> +
> +	if (!cell->config->num_stream_ids)
> +		return;
> +
> +	/* If no sids, ignore */
> +	if (cell->config->num_stream_ids) {
> +		for_each_smmu_sid(sid, cell->config, n) {
> +			ret = arm_smmu_find_sme(*sid, arm_sid_mask);
> +			if (ret < 0)
> +				printk("arm_smmu_find_sme error %d\n", ret);
> +			idx = ret;

Same bug as above.

> +
> +			if (arm_smmu_free_sme(smmu, idx)) {
> +				arm_smmu_write_sme(smmu, idx);
> +			}
> +
> +			smmu->cbs[cbndx].cfg = NULL;
> +			arm_smmu_write_context_bank(smmu, cbndx);
> +		}
> +	}
> +}
> +
> +static int arm_smmu_init(void)
> +{
> +	int err;
> +	__u64 phys_addr;
> +	__u32 size;
> +	struct arm_smmu_device *smmu = &smmu_device;
> +
> +	smmu->features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
> +
> +	phys_addr = system_config->platform_info.arm.iommu_units[0].base;
> +	if (!phys_addr) {
> +		printk("No SMMU\n");

Won't that also print "No SMMU" on SMMUv3 targets?

> +		return 0;
> +	}
> +
> +	size = system_config->platform_info.arm.iommu_units[0].size;
> +
> +	smmu->version =
> +		system_config->platform_info.arm.iommu_units[0].arm_smmu_arch;
> +	smmu->model =
> +		system_config->platform_info.arm.iommu_units[0].arm_smmu_impl;
> +	arm_sid_mask =
> +		system_config->platform_info.arm.iommu_units[0].arm_sid_mask;
> +	smmu->base = paging_map_device(phys_addr, size);
> +	if (!smmu->base)
> +		return -ENOMEM;
> +
> +	smmu->cb_base = smmu->base + size / 2;
> +
> +	err = arm_smmu_device_cfg_probe(smmu);
> +	if (err)
> +		return err;
> +
> +	if (smmu->version == ARM_SMMU_V2 &&
> +	    smmu->num_context_banks != smmu->num_context_irqs) {
> +		printk("found only %d context interrupt(s) but %d required\n",
> +		       smmu->num_context_irqs, smmu->num_context_banks);
> +		/* TODO: page free smr s2cr cbs */

Nope, not needed for hypervisor init.

> +		return -ENODEV;
> +	}
> +
> +	/* TODO: request irq */

What will that IRQ do?

> +
> +	arm_smmu_device_reset(smmu);
> +	arm_smmu_test_smr_masks(smmu);
> +
> +	/*
> +	 * For ACPI and generic DT bindings, an SMMU will be probed before
> +	 * any device which might need it, so we want the bus ops in place
> +	 * ready to handle default domain setup as soon as any SMMU exists.

I suspect that comment comes from Linux and makes no sense here, right?

> +	 */
> +	/* TODO: How handle PCI iommu? */

Valid TODO?

> +
> +	return arm_smmu_cell_init(&root_cell);
> +}
> +
> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
> +DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
> +DEFINE_UNIT(arm_smmu, "ARM SMMU");
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 30ec5d06..a6a7d8c1 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -266,6 +266,10 @@ struct jailhouse_iommu {
>   			__u32 tlb_size;
>   		} __attribute__((packed)) tipvu;
>   	};
> +
> +	__u32 arm_sid_mask;
> +	__u32 arm_smmu_arch;
> +	__u32 arm_smmu_impl;

This belongs as one struct into the union - unless there is a system 
which also has an AMD IOMMU or a TI PVU... Another advantage: That would 
not change the binary layout of the config, and we would not have to 
bump its revision (like it is needed now).

Do we have a lot of permutations of arch and impl? Or would multiplying 
them out into a single type be reasonable? At least arch should use the 
generic type field btw.

>   } __attribute__((packed));
>   
>   struct jailhouse_pio {
> @@ -290,6 +294,17 @@ struct jailhouse_pio {
>   #define SYS_FLAGS_VIRTUAL_DEBUG_CONSOLE(flags) \
>   	!!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
>   
> +enum arm_smmu_arch_version {
> +	ARM_SMMU_V1,
> +	ARM_SMMU_V1_64K,
> +	ARM_SMMU_V2,

JAILHOUSE_IOMMU_SMMUV1...

And please use defines for directly readable values.

> +};
> +
> +enum arm_smmu_implementation {
> +	GENERIC_SMMU,
> +	ARM_MMU500,

Same here.

> +};
> +
>   /**
>    * General descriptor of the system.
>    */
> diff --git a/include/jailhouse/sizes.h b/include/jailhouse/sizes.h
> new file mode 100644
> index 00000000..ce3e8150
> --- /dev/null
> +++ b/include/jailhouse/sizes.h
> @@ -0,0 +1,47 @@
> +/*
> + * include/linux/sizes.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#ifndef __LINUX_SIZES_H__
> +#define __LINUX_SIZES_H__
> +
> +#define SZ_1				0x00000001
> +#define SZ_2				0x00000002
> +#define SZ_4				0x00000004
> +#define SZ_8				0x00000008
> +#define SZ_16				0x00000010
> +#define SZ_32				0x00000020
> +#define SZ_64				0x00000040
> +#define SZ_128				0x00000080
> +#define SZ_256				0x00000100
> +#define SZ_512				0x00000200
> +
> +#define SZ_1K				0x00000400
> +#define SZ_2K				0x00000800
> +#define SZ_4K				0x00001000
> +#define SZ_8K				0x00002000
> +#define SZ_16K				0x00004000
> +#define SZ_32K				0x00008000
> +#define SZ_64K				0x00010000
> +#define SZ_128K				0x00020000
> +#define SZ_256K				0x00040000
> +#define SZ_512K				0x00080000
> +
> +#define SZ_1M				0x00100000
> +#define SZ_2M				0x00200000
> +#define SZ_4M				0x00400000
> +#define SZ_8M				0x00800000
> +#define SZ_16M				0x01000000
> +#define SZ_32M				0x02000000
> +#define SZ_64M				0x04000000
> +#define SZ_128M				0x08000000
> +#define SZ_256M				0x10000000
> +#define SZ_512M				0x20000000
> +
> +#define SZ_1G				0x40000000
> +#define SZ_2G				0x80000000
> +
> +#endif /* __LINUX_SIZES_H__ */
> 

That header is worth a separate patch if you see use cases in the config 
files or elsewhere. Some small examplary conversion would then be nice. 
Otherwise, just take the few defines you use into the smmu module.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/014fcc0a-9754-d785-44de-c6f826a5a478%40siemens.com.
