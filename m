Return-Path: <jailhouse-dev+bncBCZNXZV44IJBBKHN4KMAMGQEELH7YYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B395B0852
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Sep 2022 17:20:15 +0200 (CEST)
Received: by mail-io1-xd3c.google.com with SMTP id bf4-20020a056602368400b0068baaa4f99bsf9324459iob.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Sep 2022 08:20:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1662564009; cv=pass;
        d=google.com; s=arc-20160816;
        b=v+fAm/Z3zoU+Db9tl/S3sIDzVeLdS/BZFBQ6Et1x8/5MuOjfUpEGyopY6DUP47LjEr
         axWMZHmlHZ6xeOJa2BSH5521qNu9eAYoqRT621zzoVY9/5Qfrn9YG7YOkvIR8FQ7xazS
         pgiJWxWefz7wUre2/lEpCFL/u0aQpbzdIG8i5vELNtvP+nP0k54NVHyffAFUWlkonVkZ
         0E9XIyJDJk0SFRO/+QHBj99BBKVscJILxdNgjNzBbZme7nSG+7q3dmhIrb5g8k/cHyqy
         1dh30LZBtTV7wqd6qA1ej2ykPQR8KFP142zHBiysfp9enLZEgubD5Lr3d/pho1HDcrER
         312w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:sender:dkim-signature;
        bh=LWnRe0ZPu6BBJS9X+VF1MzfWXfxpeiTpJBWXgbBd73g=;
        b=q3Pbdsej61Pp9dhXpG3/BgvBb6mOYRPS+Ll+eKv9ppv/E6JaH8GPJ7yjGWM95XMgSC
         5TILOHEqtqSlRaoZjIPGEV67GlidCVRhtg+a98DLCnM7mmhWb0Q57pghOGvIlwlhqiTs
         zye+m98NAwJf4fmhH5Lfnu4+9Y+JSNYA0d8GoiRyCUm/zON0FKD5QWv6WmC5Ik0+XN/U
         QTzGqGB6qbgEt/FPMycvVJAMdr421dQnh4RjP9LbSCdWRuZUgax1wATx3JzA1MB+hrQF
         FyCEe7VlPuUlXkQCdyQYmBX9GbAQojUxzCmEx3GWHmz6t0roIDkIUDxd+oLCR0Njwz3J
         pCxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X27kb0uM;
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:references:in-reply-to:subject:cc:to:from:sender:from:to:cc
         :subject:date;
        bh=LWnRe0ZPu6BBJS9X+VF1MzfWXfxpeiTpJBWXgbBd73g=;
        b=PQ2XLVOM34rHSanU/RNuewYZSsHW1xUHPoNb+6wU+yVnP/Dph1zSRuG/HCH3do5Wcm
         cGwSSerkbHVUGanT6+YFJBP+A9A4oNB/8uZAuUAstuL4xO2iUPUxcQS70nTCFGztfBRj
         i+odgisNorfw7uJZw7m9opEVwqTZrBMeoNNbbq5y35MJplKCKrkBNI3ygC22paD96Jvo
         BHz29M8PsNlLJIX3RGCBkFupKRSzj6B60veacz+pTH+zOw5SREnMr+wBKWoaW8eD+Zqh
         0eLkwGjJuQ1kNU7zZBvh4FMstH4YQ0AZyML7IDXcJZIEzzQQUVXbQTCXy4jppZpgRTNF
         GqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=LWnRe0ZPu6BBJS9X+VF1MzfWXfxpeiTpJBWXgbBd73g=;
        b=Lh/q0Ymt11gm81BCpHaQz34/r0xegg63WqhtedqlYNTtv+BTjjpVCp3Ju5B9fP1sPT
         47/dWWs0FJ0kmqCY+ytIRrVtUiVAd7yXtDRlj/NEhreRt9djVWKLdsHuf+OAeOHmXdy2
         PFGSvmh3KRa/ifL+gXryvQnKWgjFLGvFE1DXaEqKF9T6SG3fVblidDsVOm5PzYEjM0mW
         Y8zR6i/Hq0UyZYqg1MJ5G9ym5zifccCRQtw8zPweUmSHso2+HHl1rC/3HhAuYLunaqbm
         Pg+lg6MJ0RgB4itFqP2iiINWEECZdvYOOIQq9xwXr+kUZC5VfBtLXezTKd042OVKAhux
         /lzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo3ZzFDmjohDhppGI1H/vfgm3TD24wDmhbF8zO6nN1izb4e+6QZk
	wLp6P+WjSX3zRzYeD29Jy84=
X-Google-Smtp-Source: AA6agR6oca97FrJDX3T2lsGHWA0/OldNtlmO9Y1RD3qufsNPRKRS+cKadfzZ0l4t/S2/nQCWeMZTcw==
X-Received: by 2002:a05:6638:4917:b0:34f:dc56:4a39 with SMTP id cx23-20020a056638491700b0034fdc564a39mr2607554jab.36.1662564009208;
        Wed, 07 Sep 2022 08:20:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:1087:b0:2f1:5940:1480 with SMTP id
 r7-20020a056e02108700b002f159401480ls1840325ilj.6.-pod-prod-gmail; Wed, 07
 Sep 2022 08:20:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:17cc:b0:2e8:f067:ae90 with SMTP id z12-20020a056e0217cc00b002e8f067ae90mr2185442ilu.196.1662564008125;
        Wed, 07 Sep 2022 08:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662564008; cv=none;
        d=google.com; s=arc-20160816;
        b=mAGyBQNiznEKwpuXTehFJgkp7c95qsc5BzTJWgD9MoLvq/+9LOY5UELnqsOQATocdm
         Y4bcd4d0k6pHoo2TI9yxGqhS/tHBQuX00L1PEFS3IQzYHrPnnYH6mgTiEuVqHvp+qzCk
         18x4F+PaPvMFp82/X0Bh9JinbzfNU7ePJ2yLHiFY1lPzj09iH4/4ac+vTe+C4V0hgoLM
         Y3TSsOtYVwAX0CB0YRY2+UF+KJVHT/SAnxmrOlp2bUhvFyVRqLhE0V+e6zEm7+HvAxLy
         cdFuf9pQK3GzMIEhPchL3c1hNUyTzHczAy+KuPscmvWvkkEpDU2TFRKw8PLgvyNXktN+
         aHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=6xYRHulRFq0HQCbPn97D2YEnCLSwRHPaOy9i5aW24Q8=;
        b=qfDyM4SPXDTWfJPOd5L/2I/4dUGJzTa6Lr6oCmOatYENMf6nfnwBL1ojBh0KxT5/XY
         5J7FD134swQ+R7AkMBeBfc2FjzZ9ZLYNMMAsmnZ9Kzom63JS1oXH8tt6VMmJVZRaHSyL
         3f4y5j5BFKMVqnU8HDQESIDSx+yvdsnpjiNvRRB73zjFEL2Xvql9Pp5uaX3WiurzpyKM
         btkhXqVIxXHm+2llhGd+lkm674NmNU1OwkVwSMqz2uVZd3eDPVX//KR1iYN3lkNUj4uz
         lBQbVKkG2Iq7XtOVut8f3JR+LU0Ko8mSaR9UsBga7g1A86HKvMeWvyRhzoVwi6MsX6Cg
         SIRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X27kb0uM;
       spf=pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by gmr-mx.google.com with ESMTPS id g7-20020a056638060700b0034a5a969388si1240458jar.4.2022.09.07.08.20.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 08:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of vkuznets@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-ebsv9hZiPwe1G8BeHfxziw-1; Wed, 07 Sep 2022 11:20:04 -0400
X-MC-Unique: ebsv9hZiPwe1G8BeHfxziw-1
Received: by mail-wr1-f71.google.com with SMTP id e18-20020adfa452000000b00228a420c389so2940939wra.16
        for <jailhouse-dev@googlegroups.com>; Wed, 07 Sep 2022 08:20:04 -0700 (PDT)
X-Received: by 2002:a5d:59ab:0:b0:228:28df:9193 with SMTP id p11-20020a5d59ab000000b0022828df9193mr2471687wrr.323.1662564003269;
        Wed, 07 Sep 2022 08:20:03 -0700 (PDT)
X-Received: by 2002:a5d:59ab:0:b0:228:28df:9193 with SMTP id p11-20020a5d59ab000000b0022828df9193mr2471659wrr.323.1662564002953;
        Wed, 07 Sep 2022 08:20:02 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id f25-20020a1c6a19000000b003a840690609sm29360122wmc.36.2022.09.07.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:20:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ajay Kaher <akaher@vmware.com>
Cc: x86@kernel.org, hpa@zytor.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, srivatsab@vmware.com,
 srivatsa@csail.mit.edu, amakhalov@vmware.com, vsirnapalli@vmware.com,
 er.ajay.kaher@gmail.com, willy@infradead.org, namit@vmware.com,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 jailhouse-dev@googlegroups.com, xen-devel@lists.xenproject.org,
 acrn-dev@lists.projectacrn.org, helgaas@kernel.org, bhelgaas@google.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
In-Reply-To: <1662448117-10807-1-git-send-email-akaher@vmware.com>
References: <1662448117-10807-1-git-send-email-akaher@vmware.com>
Date: Wed, 07 Sep 2022 17:20:00 +0200
Message-ID: <8735d3rz33.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: vkuznets@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=X27kb0uM;
       spf=pass (google.com: domain of vkuznets@redhat.com designates
 170.10.129.124 as permitted sender) smtp.mailfrom=vkuznets@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
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

Ajay Kaher <akaher@vmware.com> writes:

> During boot-time there are many PCI config reads, these could be performe=
d
> either using Port IO instructions (PIO) or memory mapped I/O (MMIO).
>
> PIO are less efficient than MMIO, they require twice as many PCI accesses
> and PIO instructions are serializing. As a result, MMIO should be preferr=
ed
> when possible over PIO.
>
> Virtual Machine test result using VMware hypervisor
> 1 hundred thousand reads using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 8.517 seconds (~33.5% faster then PIO)
>
> Currently, when these reads are performed by a virtual machine, they all
> cause a VM-exit, and therefore each one of them induces a considerable
> overhead.
>
> This overhead can be further improved, by mapping MMIO region of virtual
> machine to memory area that holds the values that the =E2=80=9Cemulated h=
ardware=E2=80=9D
> is supposed to return. The memory region is mapped as "read-only=E2=80=9D=
 in the
> NPT/EPT, so reads from these regions would be treated as regular memory
> reads. Writes would still be trapped and emulated by the hypervisor.
>
> Virtual Machine test result with above changes in VMware hypervisor
> 1 hundred thousand read using raw_pci_read() took:
> PIO: 12.809 seconds
> MMIO: 0.010 seconds
>
> This helps to reduce virtual machine PCI scan and initialization time by
> ~65%. In our case it reduced to ~18 mSec from ~55 mSec.
>
> MMIO is also faster than PIO on bare-metal systems, but due to some bugs
> with legacy hardware and the smaller gains on bare-metal, it seems pruden=
t
> not to change bare-metal behavior.

Out of curiosity, are we sure MMIO *always* works for other hypervisors
besides Vmware? Various Hyper-V version can probably be tested (were
they?) but with KVM it's much harder as PCI is emulated in VMM and
there's certainly more than 1 in existence...

>
> Signed-off-by: Ajay Kaher <akaher@vmware.com>
> ---
> v1 -> v2:
> Limit changes to apply only to VMs [Matthew W.]
> ---
>  arch/x86/pci/common.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
> index ddb7986..1e5a8f7 100644
> --- a/arch/x86/pci/common.c
> +++ b/arch/x86/pci/common.c
> @@ -20,6 +20,7 @@
>  #include <asm/pci_x86.h>
>  #include <asm/setup.h>
>  #include <asm/irqdomain.h>
> +#include <asm/hypervisor.h>
> =20
>  unsigned int pci_probe =3D PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROBE_=
CONF2 |
>  				PCI_PROBE_MMCONF;
> @@ -57,14 +58,58 @@ int raw_pci_write(unsigned int domain, unsigned int b=
us, unsigned int devfn,
>  	return -EINVAL;
>  }
> =20
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +static int vm_raw_pci_read(unsigned int domain, unsigned int bus, unsign=
ed int devfn,
> +						int reg, int len, u32 *val)
> +{
> +	if (raw_pci_ext_ops)
> +		return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, val);
> +	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +		return raw_pci_ops->read(domain, bus, devfn, reg, len, val);
> +	return -EINVAL;
> +}
> +
> +static int vm_raw_pci_write(unsigned int domain, unsigned int bus, unsig=
ned int devfn,
> +						int reg, int len, u32 val)
> +{
> +	if (raw_pci_ext_ops)
> +		return raw_pci_ext_ops->write(domain, bus, devfn, reg, len, val);
> +	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +		return raw_pci_ops->write(domain, bus, devfn, reg, len, val);
> +	return -EINVAL;
> +}

These look exactly like raw_pci_read()/raw_pci_write() but with inverted
priority. We could've added a parameter but to be more flexible, I'd
suggest we add a 'priority' field to 'struct pci_raw_ops' and make
raw_pci_read()/raw_pci_write() check it before deciding what to use
first. To be on the safe side, you can leave raw_pci_ops's priority
higher than raw_pci_ext_ops's by default and only tweak it in
arch/x86/kernel/cpu/vmware.c=20

> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  static int pci_read(struct pci_bus *bus, unsigned int devfn, int where, =
int size, u32 *value)
>  {
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +	/*
> +	 * MMIO is faster than PIO, but due to some bugs with legacy
> +	 * hardware, it seems prudent to prefer MMIO for VMs and PIO
> +	 * for bare-metal.
> +	 */
> +	if (!hypervisor_is_type(X86_HYPER_NATIVE))
> +		return vm_raw_pci_read(pci_domain_nr(bus), bus->number,
> +					 devfn, where, size, value);
> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  	return raw_pci_read(pci_domain_nr(bus), bus->number,
>  				 devfn, where, size, value);
>  }
> =20
>  static int pci_write(struct pci_bus *bus, unsigned int devfn, int where,=
 int size, u32 value)
>  {
> +#ifdef CONFIG_HYPERVISOR_GUEST
> +	/*
> +	 * MMIO is faster than PIO, but due to some bugs with legacy
> +	 * hardware, it seems prudent to prefer MMIO for VMs and PIO
> +	 * for bare-metal.
> +	 */
> +	if (!hypervisor_is_type(X86_HYPER_NATIVE))
> +		return vm_raw_pci_write(pci_domain_nr(bus), bus->number,
> +					  devfn, where, size, value);
> +#endif /* CONFIG_HYPERVISOR_GUEST */
> +
>  	return raw_pci_write(pci_domain_nr(bus), bus->number,
>  				  devfn, where, size, value);
>  }

--=20
Vitaly

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8735d3rz33.fsf%40redhat.com.
