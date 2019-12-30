Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBKEKVHYAKGQEGZ5M2RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2412D377
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 19:42:48 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id w3sf1653007edt.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 10:42:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577731368; cv=pass;
        d=google.com; s=arc-20160816;
        b=J7guiQKZzWn/dH0zWdU/WVcSyrh+sRjMAY8o/lMeKygvKdsbS7NZuWWKAHmPgaL+gU
         4/xS+HugZD5qzoYT6ylbicgtT9VTslBl/7tjr1o/+R+Q6a5Ms000HCzuHq4VUSqiJjYv
         R1z7o0QOt2CE+C1OPDWWBLV2rBMxphFuyPfnGsZZ1c3f3q7lIHKYlwi4JM0AzEe+6vQx
         2BvpP68cCKec3YxqD842b1tRbW+0NppqZqA2U1wOOrJyw9ew5+PfYAG42cXUoojYE74V
         ANWXXT1bCq6hTvPGbVC6XazCP/2zuVobqGhZBS+hF0TF7qUzLmBBpX28DPpcWjdu+Sz3
         YBnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:date:from:sender:dkim-signature:dkim-signature;
        bh=EEtX4y72vS4I7qvKkusxLFViMBm0IBcBkMNY9+02HZY=;
        b=JDHbe7ESN/seM4H8M34M4YtgZ3vmrokU57ToVW62LRJNH7yijtWQ/0CrprFyRVzLZH
         68krMpNtFBKpXiuTPr7lPpWUoksk2P6eWjetcvJMszcIh8e8EVpGSi1l+RGQgRxoVAQy
         wrbxN3edxG9hxQPIioWg+6vTq6ftPgJfhQJUlbS+2dAuBiKf6T1ZZUI47+yqv9p76Lmr
         /aL1rfiJf83QNmOezO647xuqD8Ii3LnXJ0eiruFZ1RmAJBZErjY16v5RqGfBRarldKp6
         2FqdihRT+ld4gQPzruEKp6l/6XK1pkCFgLAJDp0rfm7kpKAgmZyHeNpcy5Js8mgzY24e
         RiTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XnM21eX9;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::32e as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EEtX4y72vS4I7qvKkusxLFViMBm0IBcBkMNY9+02HZY=;
        b=lj/JmXCdIsSVgR0dGPb6c1bkJdWHPUvFfJeFQHtdnawpKhl2luFzvxej5uYvs8qNmZ
         mMduUBIOQLc7jUdQiy//G188C8NEoIZIli5A198DYFECic0NtqfQ3NjpI6hx3HTZYAJJ
         ABKuCognxYUVdGWX//ufMhDWF3gzDnmQ1UucfSJAwYoGnKvPhx5yky24Sxt88hDt8olv
         xFTaxauxkcjg9T/G/VECQ5TsfVIZKkwXgn0Q/6GGhm+VVmFj3aZviXIxU+1xe5Aj1DK5
         gmlfNev6qvWzv9HA59OWgHYzNwgfHjXb0WNnJq+GhGn4g1rNh+Xkz2gbrq4MALt/Sco0
         T38Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EEtX4y72vS4I7qvKkusxLFViMBm0IBcBkMNY9+02HZY=;
        b=jBVOfVGhkPQKLzUW66cc79Br7c7R2wUwNtJegj6zHmb+UTMDBB6uLjuH1i4rbaOKoF
         GfgscAqoLsqR1GErAKNGaVvff5dC30CBzhhNfbEvHB+74CQWDFeZhuOJK6dibdxcnPDx
         ToubLEpwFuWUsbkyqSQfPKG/Ko9sSQHXa3p3gRZ3I9IuTxY9aO5FFM+LAp8w1f36UACZ
         AM/9+lbbz9q5iABOufXrsgCjHM4jliP/ggdu5j4KHS4fDynSSy8VLfkkKQKIgI5rC5wV
         9h2hjvQD6mPLQu11HMKfGzqm+ZX59uJ80U5wX600Dk7tt4YL12JfhJQsjJSSaeLjAB2T
         MdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EEtX4y72vS4I7qvKkusxLFViMBm0IBcBkMNY9+02HZY=;
        b=eo8Rx9F4sT191uK9pb+v4iXjM3/XnGjSNXS/KW4FkEKPOFNh4eomN9L70hjo+5Swhs
         6BcLDnjuyRGF/Y5GVzQkWa4F7D/eR8qnJBPLAwbAfdgRafvUeYbSyEF8oZjdSj/q2IKn
         DtN//agjpZRoWrKNPDOJzEG8CQTy+BUnnER3Kx8S0qDuprQ+wphoVQPwz8fRA98Vfau9
         DtFwnU2etp+HfVoMP3u/7A7sDWDNd8zbg8qWDZJRQ0Xo8CvEcsLpiBrZftDjVCfAD8zi
         VZOAz+62A8+zsc/GIFSdBxXxoPFvnF5hrFxaTyD6qvu6/EZzX6YxUPVEY/ExJBTMKG/0
         +QLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWs8Kl1lrz8n6ogZl4U9wZUNUHdTZA8EoRsdmujXWUzv4HTDjl/
	uRxw+Gfu+xMoOAZ95eeWZpE=
X-Google-Smtp-Source: APXvYqykkBdjWGUcQToZ7ugQ5HefXQEFw9DXb7n9o7KA5yXqsrHyjgPMSgIamlsMoRbKYxIdlUHfog==
X-Received: by 2002:a05:6402:3047:: with SMTP id bu7mr72332049edb.44.1577731368228;
        Mon, 30 Dec 2019 10:42:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb11:: with SMTP id d17ls9994553edq.13.gmail; Mon, 30
 Dec 2019 10:42:47 -0800 (PST)
X-Received: by 2002:a50:e046:: with SMTP id g6mr73293837edl.172.1577731367601;
        Mon, 30 Dec 2019 10:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577731367; cv=none;
        d=google.com; s=arc-20160816;
        b=gNY+6a7tjVR3qt0eW+xqqAliwwRLkTSqORtbMLFSFzGN9lnqi89N1Q0zW/E5kwTKa+
         3v0tgN9iRxx/XhmNU08l/hrAA7/f6UoerHosFBTVeJ0teNlO6xnxDHCjJ/55eUuBGGco
         G+RptugYC9JpPI5fqkS+fqHpCnPxtShrhhSrUa7BTv/bN81AcmEoXD+Xt8daGYLq+uIJ
         mqvqnitIEOFM6Qc6G1c4pCTZ/Oq4T5W05Ws/ckZ+RH75UesyjgZ+SvUTQ7abKnQ1jrK9
         uHtd//01FXqYevcsRE/5F8GZrRvEOMmkWJz0x9LDNd+YKoF6K7aGgn0wkW4/CakinKfV
         RWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:dkim-signature;
        bh=lkULDfVvh/N3eP5rEUi6GHzTpS+GM/JgmgBZ076ysoI=;
        b=AnixtsSWZFl9M8iPVPn4W4wS49vjVz4J8FA+pZ1va5/7jEVhUaSLKlO9NSqzlY9X5e
         u//5iL0wCqhkkTCEVPJYGuuK0rWhxeTQoYHLhJjHQh9MnFhKAFFiaI9wRq3W4MNDEBaS
         unskLNo8Wsvf7T4ZG5COXtLXanyrnIltz1xOfQRNFeCPo6K3ywpkcJmHOam8UH6DCjvU
         lCav5cGhRPE+nRB5jfMqmBje40A4HLwe0EWSaE70fdhhLqpZCkW+VuRiYhHIRz5l6VAx
         TH0yue6zx7sIfsz00Fy5PC0R2uYiQki4LUZKKXqkHB6sev5YVQ5InrJUnmZm961Wj3mp
         R6LQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XnM21eX9;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::32e as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com. [2a00:1450:4864:20::32e])
        by gmr-mx.google.com with ESMTPS id k9si1508072edq.4.2019.12.30.10.42.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2019 10:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::32e as permitted sender) client-ip=2a00:1450:4864:20::32e;
Received: by mail-wm1-x32e.google.com with SMTP id q9so259022wmj.5
        for <jailhouse-dev@googlegroups.com>; Mon, 30 Dec 2019 10:42:47 -0800 (PST)
X-Received: by 2002:a05:600c:21c5:: with SMTP id x5mr354381wmj.72.1577731367156;
        Mon, 30 Dec 2019 10:42:47 -0800 (PST)
Received: from oxygen (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id t1sm223188wma.43.2019.12.30.10.42.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 10:42:46 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Date: Tue, 31 Dec 2019 00:12:41 +0530
To: Saroj Sapkota <samirroj2016@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: installing jailhouse
Message-ID: <20191230184241.GA24630@oxygen>
References: <bb275f41-32a7-4ed0-96ba-c37bdd951a23@googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <bb275f41-32a7-4ed0-96ba-c37bdd951a23@googlegroups.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=XnM21eX9;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::32e as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Mon, Dec 30, 2019 at 10:10:21AM -0800, Saroj Sapkota wrote:
Hi Saroj,

Assuming that you are using an x86 host, for arm64 you would need to
crosscompile.
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export KDIR=<path to arm64 kernel build directory>

Please refer ./Documentation/setup-on-zynqmp-zcu102.md for some details.

LinuxInstallation.img is just and example name. You should replace
it with your image.

To get started you could try https://github.com/siemens/jailhouse-images
It builds the complete image with jailhouse for QEMU target and there is wrapper
script(start-qemu.sh) which you can run to launch the qemu instance.

For a complete list of targets supported, please see the readme.

Thanks,
Vijai Kumar K

> I download jailhouse 0.11 and try to make it by running command make and 
> there is no .cell and .bin file for arm 64 the output of command is listed 
> below.  Also running command for QEMU/KVM arm 64 it displays no linux image 
> file. Can you help me fix this issue.
> sarojs@engee-e121-d08:~/Downloads/jailhouse-0.11$ make
>   CHK     
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/config.mk
>   UPD     
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/config.mk
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/apic-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/apic-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/e1000-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/f2a88xm-hd3.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/f2a88xm-hd3.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/imb-a180.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ioapic-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ioapic-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivshmem-demo.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/configs/x86/ivshmem-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/linux-x86-demo.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/configs/x86/linux-x86-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/pci-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/pci-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/qemu-x86.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/smp-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/smp-demo.cell
>   CC      /home/sarojs/Downloads/jailhouse-0.11/configs/x86/tiny-demo.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/configs/x86/tiny-demo.cell
>   CHK     
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/version.h
>   UPD     
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/include/generated/version.h
>   CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/cell.o
>   CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/main.o
>   CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/sysfs.o
>   CC [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/pci.o
>   LD [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/asm-defines.s
>   GEN     
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/include/generated/asm/asm-defines.h
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/svm.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/amd_iommu.o
>   AS      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/svm-vmexit.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/apic.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/dbg-write.o
>   AS      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/entry.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/setup.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/control.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/mmio.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/iommu.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/paging.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/pci.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/i8042.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vcpu.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/efifb.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/ivshmem.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/ioapic.o
>   AR      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/lib-amd.a
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vmx.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vtd.o
>   AS      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/vmx-vmexit.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/cat.o
>   AR      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/arch/x86/lib-intel.a
>   LDS     /home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor.lds
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/setup.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/printk.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/paging.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/control.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/lib.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/mmio.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/pci.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/ivshmem.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/uart.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/uart-8250.o
>   LD      /home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor-amd.o
>   OBJCOPY /home/sarojs/Downloads/jailhouse-0.11/hypervisor/jailhouse-amd.bin
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/hypervisor-intel.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/hypervisor/jailhouse-intel.bin
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../alloc.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cmdline.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../pci.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../printk.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../setup.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../string.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../test.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../uart-8250.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cpu-features.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/excp.o
>   AS      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-64.o
>   AS      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-common.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/int.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/ioapic.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/mem.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/pci.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/printk.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/smp.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/timing.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/uart.o
>   AR      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/lib.a
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/cpu-features-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/excp-32.o
>   AS      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-common-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/int-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/ioapic-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/printk-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/setup-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/uart-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../alloc-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../pci-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../string-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../cmdline-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../setup-32.o
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../test-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../uart-8250-32.o
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/../printk-32.o
>   AS      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/header-32.o
>   AR      /home/sarojs/Downloads/jailhouse-0.11/inmates/lib/x86/lib32.a
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/tiny-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/apic-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ioapic-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/32-bit-demo.bin
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/pci-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/e1000-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/ivshmem-demo.bin
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/demos/x86/smp-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/mmio-access-32.bin
>   CC      /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tests/x86/sse-demo-32.bin
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.o
>   LD      
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader-linked.o
>   OBJCOPY 
> /home/sarojs/Downloads/jailhouse-0.11/inmates/tools/x86/linux-loader.bin
>   GEN     /home/sarojs/Downloads/jailhouse-0.11/pyjailhouse/pci_defs.py
>   CC      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse.o
>   LD      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse
>   GEN     
> /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-config-collect
>   CC      
> /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-gcov-extract.o
>   LD      /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-gcov-extract
>   GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse.8
>   GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-cell.8
>   GEN     /home/sarojs/Downloads/jailhouse-0.11/tools/jailhouse-enable.8
>   Building modules, stage 2.
>   MODPOST 1 modules
>   CC      /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.mod.o
>   LD [M]  /home/sarojs/Downloads/jailhouse-0.11/driver/jailhouse.ko
> 
> 
> sarojs@engee-e121-d08:~/Downloads$ qemu-system-aarch64 -cpu cortex-a57 -smp 
> 16 -m 1G \
> >     -machine virt,gic-version=3,virtualization=on -nographic \
> >     -netdev user,id=net -device virtio-net-device,netdev=net \
> >     -drive 
> file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
> >     -device virtio-blk-device,drive=disk \
> >     -kernel /path/to/kernel-image -append "root=/dev/vda1 mem=768M"
> qcow2: command not found
> ...,id=disk,if=none: command not found
> qemu-system-aarch64: -drive file=LinuxInstallation.img,format=raw: Could 
> not open 'LinuxInstallation.img': No such file or directory
> sarojs@engee-e121-d08:~/Downloads$ 
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb275f41-32a7-4ed0-96ba-c37bdd951a23%40googlegroups.com.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230184241.GA24630%40oxygen.
