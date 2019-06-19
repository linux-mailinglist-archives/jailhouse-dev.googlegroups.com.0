Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYWYVHUAKGQEPXFFAOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 176784BF59
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 19:09:55 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id d18sf21496lfn.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 10:09:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560964194; cv=pass;
        d=google.com; s=arc-20160816;
        b=QRqkOSdCW+gubxKxuQjUyLwegcYiAXBV9CiaUcjoV00iEav6vzOQEeBS9nyAVagWmk
         xl1GdgiM8zTEdVDWqJ9yeqRzDazAo3a2/cW9NWlSXoPj9bBEkN62qtQ99E74rgU4BvM1
         2P6e93ulMZkdD/wGJ9OLFPHAKMPW7DGf/Z9o7yFBVcEjZHZSv2Mqjrknmr0pTm/vLkiJ
         a3++AROqPA5Ojx4Pw2m242pcepcUWweJd1AnVzaIR/c9eAs6E3PG2p9M8QLX9PQLzzu8
         7wBH9+zJs072YnwhwVIRrj0YMr3BkQ3EPf/qj2ZRhQWnkkS753qEIMkEZ+oKezG+PEPY
         9ArA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=peOZE6ABuCvLeLMPxmvAXHJpElQ4DuXa09kSWJhshbo=;
        b=DLdzgeogmO7vTayTSujMgXWXLEdx+TzMwuXKfljGBGmbiWG+Nlrk4cN252ybe3ca/H
         HcJ2Y/n2it9m+gCpdr35Va0yOFEzq55eN9TEEyjrR1HA1rlYDt0uI43aT5hxHh1rfW10
         ILn3OVyWtQQS6vxtyK3Xt/KbNxIV+72xN4a/12N2isYVk3f8qCcFMYOi0fqpE3eM5tFV
         51me+PACq3q95pl6VuUmt3EN1NyukbwsAZeASrggWQB/2WWx52bTqkcJWXgZGvZMThTx
         uz6t3STrgCcVSte1xjVp8KF0K/gumfO2ywi5T4jiEWsA8Xoop0AxwhG5ZL7Y+Rspr0/J
         2epg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=peOZE6ABuCvLeLMPxmvAXHJpElQ4DuXa09kSWJhshbo=;
        b=n6M9xncqAVqb8vI/LuWzKZ/lkbVFV+aL3vw0NjRhfjLkzaql/380z92jAMUj6iScns
         1Fa6iq86gQJ2qKY9/+oM3qoH+olSIBJAEDJQaPmabEs7etbj/B1C8uglTRWJoxPd1cTb
         PaSTEoeSNbXirwMh/KmVA1jqTD4PE/y40JxRwhD68fjQG06GRMQP0KombbaB4vhlVbLk
         ZI5KOZ2wgLO4+JRCR32agqUXokF+teeBat16txY6To4IP7msC73w31WGNrMpA+3n8igC
         Wcq3uKtUKbL+VIBPcw+bvpp8VKXApEQtatMf0LdOkYE6ZMd1gTdqYyA1Tkdg7D+E5bum
         0sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=peOZE6ABuCvLeLMPxmvAXHJpElQ4DuXa09kSWJhshbo=;
        b=eL9ySYjmnJp/tJ0gr9ab15EXLw88fuM5rpARsfDIicKTMwG+vPCrTGumYweb9+qOm3
         dhK/2lYhmV2ynmoNDhr+mvcttLnbYZa0lODHir8MoYh+/l2ClqhUOcs05FtUWXgnkTo9
         LZkLIQa1SSwhxJfsrXVkL0G9eGzUgFLfNh2YNo9NaB4eZ2LJTtL3dvQtVViGciKvn1Xk
         odD1/UB9dAfnrNi5YwfRDbif5gsV5V0vUv4RJbHaHxKZec4/WtfFxVJ1xn0FCWfdksKY
         ixgFOrxGsaIJ+cxbSCRejEfS9v+DK0tNP1X6NfA/Vk2ho4xvhOKxN+9dpmjX5VPRBkt2
         dftw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUBgjNP9oARiG8EvptHwA45lnQTSHKflSrvqHKy+ancFAhWfQvq
	f0Z5ABDLb6unsDJA3Sf5DZo=
X-Google-Smtp-Source: APXvYqylbfy1OGPEJcKiiGsoUgmFaGB8OitL4yaPf1m8HCSnuqDvNQFAh204pn3J4kvnKrNyTLOKNw==
X-Received: by 2002:a2e:9a19:: with SMTP id o25mr4714385lji.63.1560964194641;
        Wed, 19 Jun 2019 10:09:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5189:: with SMTP id u9ls291064lfi.0.gmail; Wed, 19 Jun
 2019 10:09:53 -0700 (PDT)
X-Received: by 2002:ac2:446b:: with SMTP id y11mr57370379lfl.158.1560964193969;
        Wed, 19 Jun 2019 10:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560964193; cv=none;
        d=google.com; s=arc-20160816;
        b=nSAIzLk0xQjttgQLnAT5j4XjRSwDf7oF+j+F2wOGIMtvk2MKYb+4+p+OTRu43Xngtm
         YiJB3fYmbanbW2rA+MgrF7im+sK3aV9xZ8mw/hkU40+DTy5Gga9U9jBI0CuJTFrrErFR
         n4OiQ3or0+zv8PBYGfd9DWsUH122JTEnvdv8hHoxmWoucPmG/ECL8oYV9nBWi1/uKQU2
         T0Xazds1gXniSEF4IZJbRWHA2XedDEOGeNjotOChKUN2be3r3St0y0TWIKIobko/Sil9
         JX4Mmsrs0mocb/Ry9oewAa3x4iJ6rzGGEZ0ebh7VoUDC4dXI4dtmrGxRazARbWL4kgZO
         W8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=eanh4lN0ePDSU+mT19ItTSZJf/ymKQ05otHeFe4Yx6c=;
        b=BVbpFTWEUHtnRqBVk15+APO0e99KXaNhUwax1YzAp4WRQsWWQroOiQyPjg4Id9wZPW
         NQY9XvukcGgitB5zF+jJfpf+YUC+bpMIFz1QfKYnSBNosmaY/JjYYJ6cnD5AD1U5JXZK
         nW5dPuk/Lyzsjcy5U6mJdJjQlB0/njl9aAX1JZpftsNOtQyc1Ch9h/aNN3ILhuRTmBEF
         ICqryTczJKaN7aPyzH/vn7CPURrw8IOarrNQz/AZeStRyYoQHGMt2zNvv6mta1vvfbN/
         3OPquHw2z4nith+6wQoed+eNBWnin6IdjOWDKXpKnCXxPcJaHbha/jH4QwX/div3llbE
         7QGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p85si426762ljp.4.2019.06.19.10.09.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 10:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5JH9qK8013226
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jun 2019 19:09:52 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5JH9qmv011098;
	Wed, 19 Jun 2019 19:09:52 +0200
Subject: Re: [PATCH] pci: Replace mmio_write64 with mmio_write64_split
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: jeanne.romefort@gmail.com,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>
References: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7ff27074-8628-cf0c-3812-2c5810f58307@siemens.com>
Date: Wed, 19 Jun 2019 19:09:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 19.06.19 18:52, Ralf Ramsauer wrote:
> MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
> set them.
> 
> This conforms the PCI specification: "For all accesses to MSI-X Table and MSI-X
> PBA fields, software must use aligned full DWORD or aligned full QWORD
> transactions; otherwise the result is undefined" (PCI Local Bus Specification
> Rev 3.0, chapter 8.1.2).

Chapter 6.8.2.

> 
> Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom ethernet
> cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.
> 
> Replace mmio_write64 with a wrapper mmio_write64_split that substitutes the
> 64-bit write with two 32-bit write operations. This accessor first writes the
> upper 32 bits and then the lower 32 bits.
> 
> Credits go to Jan, the root cause of this bug was found in a private off-list
> discussion.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Only tested on x86, untested on ARM. I lack PCI devices with MSI-X
> suppport.

I will throw this on our Seattle eventually.

> 
>   hypervisor/arch/arm-common/pci.c    |  4 ++--
>   hypervisor/arch/x86/pci.c           |  8 ++++----
>   hypervisor/include/jailhouse/mmio.h | 15 +++++++++++++++
>   3 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-common/pci.c
> index 60ffabb8..4f35175f 100644
> --- a/hypervisor/arch/arm-common/pci.c
> +++ b/hypervisor/arch/arm-common/pci.c
> @@ -58,8 +58,8 @@ int arch_pci_update_msi(struct pci_device *device,
>   int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
>   {
>   	/* NOTE: See arch_pci_update_msi. */
> -	mmio_write64(&device->msix_table[index].address,
> -		     device->msix_vectors[index].address);
> +	mmio_write64_split(&device->msix_table[index].address,
> +			   device->msix_vectors[index].address);
>   	mmio_write32(&device->msix_table[index].data,
>   		     device->msix_vectors[index].data);
>   	return 0;
> diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
> index 492e9859..560c5697 100644
> --- a/hypervisor/arch/x86/pci.c
> +++ b/hypervisor/arch/x86/pci.c
> @@ -393,8 +393,8 @@ int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
>   				     irq_msg);
>   	// HACK for QEMU
>   	if (result == -ENOSYS) {
> -		mmio_write64(&device->msix_table[index].address,
> -			     device->msix_vectors[index].address);
> +		mmio_write64_split(&device->msix_table[index].address,
> +				   device->msix_vectors[index].address);

Unlikely that QEMU shares this problem, but let's be consistent. Hope we can 
remove that path one day...

>   		mmio_write32(&device->msix_table[index].data,
>   			     device->msix_vectors[index].data);
>   		return 0;
> @@ -402,8 +402,8 @@ int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
>   	if (result < 0)
>   		return result;
>   
> -	mmio_write64(&device->msix_table[index].address,
> -		     pci_get_x86_msi_remap_address(result));
> +	mmio_write64_split(&device->msix_table[index].address,
> +			   pci_get_x86_msi_remap_address(result));
>   	mmio_write32(&device->msix_table[index].data, 0);
>   
>   	return 0;
> diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jailhouse/mmio.h
> index 61b4647e..567901d0 100644
> --- a/hypervisor/include/jailhouse/mmio.h
> +++ b/hypervisor/include/jailhouse/mmio.h
> @@ -73,6 +73,21 @@ DEFINE_MMIO_WRITE(32)
>   DEFINE_MMIO_WRITE(64)
>   /** @} */
>   
> +/**
> + * Write a 64-bit value to a memory-mapper I/O register. Perform two 32-bit
> + * write operations instead of one 64-bit write operation.
> + *
> + * @param address	Virtual address of the register.
> + * @param value		Value to write.
> + * @{
> + */
> +static inline void mmio_write64_split(void *address, u64 value)
> +{
> +	mmio_write32(address + sizeof(u32), (u32)(value >> (sizeof(u32) * 8)));

Why do we need to that dance around the hot pot? u32 says in its name that it's 
32 bits.

> +	mmio_write32(address, (u32)value);
> +}
> +/** @} */
> +
>   /**
>    * Read value from 32 or 64-bit MMIO register field.
>    * @param address	Virtual address of the register.
> 

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ff27074-8628-cf0c-3812-2c5810f58307%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
