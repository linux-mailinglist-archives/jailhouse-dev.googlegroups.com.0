Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4O3TX7AKGQEJ4332WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0D2CBA9E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Dec 2020 11:35:29 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id 74sf2471347lfg.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 02:35:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606905329; cv=pass;
        d=google.com; s=arc-20160816;
        b=kv0Wg00U4FXpEJz5gNJSppaes46HdPmgFgGvfNubk0QHn7nhZhy7xJwlHiMf7lp5yT
         YkSCdrs8bH8LByUe/V9jqKBORH67lBUbg/pFTyXl3DHuhmT87xArzT5Qhe0qlOWSIeFV
         M/UPF/SLwUiNAQpMFxZyQM3ub61Ima60DhMWt10X2xct+5S9dp+h1ActBrYCopyxuBIH
         Y9pYlyo1PZCZv6jXKQu/KGgB5yzCjp0p5dnE+lMRGVsBa5iudr5pnGtq7iIU7qdhP5wX
         Vu5nNbdmieja7BFJqf8kFmYbAy8betTDVSHWwuOShacp5HAtWLAjDqKQYtM4H+0d/9u8
         NA3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EMyhaH33APGgkUJmJJ+A7MSqhGvZEwkYlDoDm0wNX/k=;
        b=Kon/7Rf0cGFd9Cw0xgioCI9nk+7R92XCCKcSKsIwrozSlasFGTvHQ1Y+4vSN09m8pF
         zpcjOiBmFBgJ2bD5K7lAHxWcJWQw9epH388RZR0oOURq9/hhYlYj5Kh0VajVZWsReB9F
         QLA8AkLW7nOxf1MKmctSqUmRkdc/2Msnm+L65iZqFQdy4biyJsuXjetpQw7vni5HJvuo
         BVUfhY+hqDx9W0XGrDTGYV9GKQdamuGv3Oc+JgStnaKiHYcNB3iuq/g8wS3tgqLVLvMI
         3niNyIiESV9A6hohmoVqYkdXg/lz8+64b34but8HM4raHKUq2hK0XN5MtqXP6ZrIbkRP
         /Zqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EMyhaH33APGgkUJmJJ+A7MSqhGvZEwkYlDoDm0wNX/k=;
        b=Kg6nt5yDMZKy0/SJccZfDtUdGWJT3/yDiixOpp+fOQHY8IXZkKcKaZZifYQMEyAv9F
         jFWKI9p1tHXrCtaZc7q9DahG5eUeKe67St9zlNWLrwBUNVQfIr4sawNBSOFjQdaQleR1
         WiNdMe5BFCvfjXIJeazi7VrOW7lQx2sOqbiW+O+QYYmWm8z8R59GCvUrJf83o/zlGXvT
         FOh2q5idDWtDIocuHclYXKMCk/5TI2kbWprjlYjBfKXKYvcBd0j1J6ABSLvmTi4HJPDC
         Q6UuOCBYGzAbR2v/MOIy/qT1KRYwiQaGABz7GlWnxvujCQLTkeXLNG69IqJJby9jbZ27
         86sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EMyhaH33APGgkUJmJJ+A7MSqhGvZEwkYlDoDm0wNX/k=;
        b=H9LrSPfVMs5r1QRTdIP6tVxCDMTAXDTu+fltnzgrJDtMi2Tjaozrk6GA05Q6sYzBg0
         4eSf8P8TAb/Bgj8sEybnmZQ5PYZj3z8HCjwSwVGemcwGaAgoDaKbRIWWUr8J0PTxkH6W
         nYSC3FFBsSEP42TeIcvG8Jjb/DL52F6N8umFQCthQ3k4Vz0UvNtzl9ChunT4nXtsJlgo
         tjeoUnR/gpgAD/RFSbvmOLyPxELq3UJxMIxIrDG1rTKpjmvKp3Q1ilB+VAGH0dDfPHqv
         4ymyVv0LXLkNjUPex31sMbiuj0f5FlXXE01kLSVHNriAZwOO3HMFNTqNxUJ7OXvDcFo7
         ABVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532lZ6ZuQqb/sfrvvqTusZbGhRRfIf/mD1XzLQtY5B4Tp8tCHzkS
	ae0Y/G8nds+72aYk9kqkBxY=
X-Google-Smtp-Source: ABdhPJxMMibjbufy/+8JBUNgtdEmvGZDD78vtaRC+zZu8M+BJFGnyqfWagaycoK4q3ff2TAW1aTBSA==
X-Received: by 2002:ac2:48b2:: with SMTP id u18mr919000lfg.313.1606905329344;
        Wed, 02 Dec 2020 02:35:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls879946lfn.0.gmail; Wed, 02 Dec
 2020 02:35:28 -0800 (PST)
X-Received: by 2002:a19:5e5e:: with SMTP id z30mr926629lfi.277.1606905327936;
        Wed, 02 Dec 2020 02:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606905327; cv=none;
        d=google.com; s=arc-20160816;
        b=rb1JwypyzGa4bDNRf+pxXkDRTwT6/TnwDkPfZQOlzWxgbVwx5UGkJHKUR8tzQ/2HIY
         bgutXRs/HPtACB35PmqowQQmtUk47j06C4ClSt9HlKTO00zTz1CtRnvRJv5IR0QqmDHL
         bPgrQzFgEsw6Q4S8kCpy0uN+PYfY8drhMbP6IQ4HZFH4TzCC70nl63GP9v7jmyMMac1W
         sOXI3niNWfjF17qZeTUuXU8Ecno4FKJCoaKW7Ap5JxgMWpj6PcikS63s9p3Lipkwq179
         oBkxsEi0CW2TFBFJRAfHid24Nxs5QHczUKtSvfU+Guar1q56PK831latJK0biPolw/Lb
         30jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=gBQ8FrWCczYSApeE8MYcD74dvrXfV/k6Y0M+s9mgi3Y=;
        b=Hpxxfko3qkswmtEk+Cl1TwfQOFDPJm5UB7AXf9NzkHkheLqbu1yGfc6DcOI8wRUwfA
         4HlvVXbpMYVwpGOtjTApn4eHYW6SbcM6JKW/QMlyAWgQ1oX1/Am0mt+xzdGIDV/vFSPP
         c8KURJK8lI39ro9UdGDHnK/PPYH9uaDNASY30CJHURb2Or9r+ILMC3qjePtYT58xgBZZ
         YPtDQSOVoQLiSIiMFW/WR10ZUhLUw7B1fFtqB/BM+NgbFvGE1ZQ7J0J+zubJ6ZDXdfJg
         eHFI2BFMmu5Ptc6+PvBFT9dmLK+kpNA2kVBx+Cl8Ur5hMzGUa8RgslYTw5d0uqU/GUV3
         O0Bw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v2si39363ljd.5.2020.12.02.02.35.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B2AZQMd003298
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Dec 2020 11:35:27 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B2AZQRN020989;
	Wed, 2 Dec 2020 11:35:26 +0100
Subject: Re: JAILHOUSE_ENABLE: Input/output error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
Date: Wed, 2 Dec 2020 11:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 02.12.20 10:37, Sainz Markel wrote:
> Well, I've been checking the related components. My env is being deployed into Qemu, using the same commands exposed on the Jailhouse Github docs:
> 
> qemu-system-x86_64 -machine q35,kernel_irqchip=split -m 2G -enable-kvm \
>     -smp 6 -device intel-iommu,intremap=on,x-buggy-eim=on \
>     -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
>     -serial stdio -serial vc \
>     -netdev user,id=net0,hostfwd=tcp::5555-:22 -device e1000,netdev=net0 \
>     -device intel-hda,addr=1b.0 -device hda-duplex \
>     -kernel vmlinuz -append "root=/dev/sda intel_iommu=off memmap=0x5200000\$0x3a000000 vga=0x305 console=ttyS0" \
>     -initrd initrd.cpio.gz \
>     -display none \
>     -parallel none \
>     -serial tcp:127.0.0.1:1234,server,nowait
> 
> The Qemu env is inside a Docker container which is being run in --privileged mode to share the kernel with the host:
> 
> docker run -it --privileged --net=host --volume ~/docker_tmp:/tmp selene-qemu:1.0
> 
> The mentioned host is a VMWare Ubuntu VM which has KVM enabled with nesting=1 parameter:
> 
> $ sudo modprobe kvm_intel nested=1
> 
>  and all the virtualization configs are active in the VMWare config panel:
> 
> Virtualize Intel VT -x/EPT or AMD-V/RVI yes
> Virtualize CPU performance counters yes
> Virtualize IOMMU yes
> 
> Any other thing I should check? Any change that must be done in the outermost Windows host?
> 

Run "jailhouse hardware check" in a first-level guest (can be any normal
Linux distro). It will tell you where VMware falls short in emulating VT-x.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/965e7e12-274d-42fd-2303-8a4b82ae8fa8%40siemens.com.
