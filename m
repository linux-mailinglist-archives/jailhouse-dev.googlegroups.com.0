Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBWF77GEAMGQE3IF75CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24C3F1ACC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 15:42:49 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id c22-20020a0565121056b02903c8d745ff5csf1990089lfb.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 06:42:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629380569; cv=pass;
        d=google.com; s=arc-20160816;
        b=Iq477u5TYD8zKOfhf/O3QoPCXkF3UPJCdgrj9Wb729mDgvC0QSD4Fw82XDrynStguG
         2hPoOLaDlBJh4oeD8BKgwqL3PDVgwMbyCobpRMws94ZeB79jwa6Tq+SPBGS1XnJkOhcJ
         fhWC/tem8GEha8wCsAQ1b2Fr3SLg0cgCZ4ppUyMMdE4/wqj6vwEZJM69qo/RpFpHmchM
         cBqvKaTJ7U0lGu0LUun0nv9aHRGup3gUp1WbNNmiLdSvAVpThOTJ1/4R6SFpi6a/P6Kg
         0LjhgTET+yLV1bQbQ87nSlzYoNAl/Q5kPUlLYJo8PbYgMScamnR73uyIGzMHM0JEtZkr
         wntw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=AI5qzwhwLu7vab8g9ZMWWv/iek73qZTAl/JYM7lhtqU=;
        b=PMw6PfJnL4JHaXXGCIu4Gnaab70udK92Ybl2sTbc2SPMTQZZEOLqysgJRWzUYfEEca
         nHuLuHbOrEwACfoqn/TMGoTounR2GedwIQrYzLHPUmqtNKJzDE0kqW9As/IkuLYGCPk2
         T8/s60uZhBdrX16hrLkWEB9f3AXB3g05N7N44qVo96tbF1Xud8uaho+/f4xJCIeYllQw
         BQ9yYpj8FoNSG+5F32e47mkw53zRExw2OS9PiCJri9t3AtLs0H54dq5qXLJau6pDgrSx
         aNYpcUiIy1w7rzEaXroIDcbmTAlEGTtyT/d3SUfBQw6eQ3VxQaim2zqvbloyvZ4aA9St
         pm8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BIU+5yfB;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AI5qzwhwLu7vab8g9ZMWWv/iek73qZTAl/JYM7lhtqU=;
        b=VKiG8HeyWFaSUz8MYbXiXYVpSmSrQhr0TNKo2PEyCQJ6SVULa66wehfmVtLXrUgC5W
         8yKz6psWwzgLkdOwlosZS38EQzY72iwxJmvh2IEryZWw4NsioQ761Jo6MjpuwqGhrhLZ
         bFCYV11F+afviEoxkBqkPMdVSx7uYIIECL85xyBvaWRg2uYm5uUMBJStfUnz6yYhpStO
         5wXFLNiGKT6WwRcBmRGEKYly45qBFYKGLxVmsHT7Q3l/m4ggtpQ6kDHWp/ObmFi7+cZx
         viK25sup9SS3tjNKX7Qo+nxLn98ECXm8wuV7Kv6OjVOnO4GoUiuNJBSxylJp41Ydn7ox
         ZJ1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AI5qzwhwLu7vab8g9ZMWWv/iek73qZTAl/JYM7lhtqU=;
        b=EYkSNUvJNAcjMH3eb2wSy6LJYcikEE7NJDv4THYePPf07PQn6CRb1bseZLJMvfiGpC
         OqK7uVeebN6KblX7DsS1OF9N2namxEAdbFSxZKl/FBALiYsoWJ/46XuWiJSFe8BOT0+Q
         XYyHXoTNjtNp3uFfxiXN+GwQv1jxDazGhd3bxCU657o7kJJKUtZV7RmP50cMpcz4npvU
         9c1XmUD6qjd13p+czHsGPjNVIGvnSLKE6YMk7dMRlccahE8jqvZ7g6fEdZHE4u8PkK3e
         3buhdk/Ac/Qx+h2ky/5EZ9VZMtqFqHC8UrSzz7yh5pe2UcuAo6k/tq1hcijQhXUMCoMz
         XfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AI5qzwhwLu7vab8g9ZMWWv/iek73qZTAl/JYM7lhtqU=;
        b=YiUzD1fusMyu8im0GK9uowW3dF4hVkt8J6C9xyeYc9Vvcad2deNuH8Pc+Mqta/HWsJ
         41qkZDQEWkWD9I+urOegctiFq+dy5+yR57c/NEHdja1om1Jx77BfauWmrXd+lCXbUKOk
         K0j5DyW4NFQgtN/EoXnLgxRLrunHE2yxj7+kWTSNEi0x4hRR6Uo+JCC9paKomw8JF6h7
         MCSo37+Dhs4qe78gyA8pBlU0lAyLvp17lNpWr7Q/T6O6oVCEGo80zaHP/KZG1OAmUKrz
         eXJMfUnMtT+1BnLbLT11fQjsHN0ySX8KxdGu4b6UwI/I7IoG6IUvlOpsops1AoWFXmp3
         tFAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327nZZh1TRr4820ofMgXYDEzBWmJ8GqcshsZ1lKXS63+SPrf7wg
	Oea0k8mLX08D7w3NGY0C734=
X-Google-Smtp-Source: ABdhPJzLrxS0ZyPguZj9KyUlvbVhYORyogoLMhyncBbR1SnEbsip18vAchcfkvMk3ntUa4VYW4R/hQ==
X-Received: by 2002:a2e:9a97:: with SMTP id p23mr12149616lji.222.1629380569191;
        Thu, 19 Aug 2021 06:42:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c13:: with SMTP id z19ls697350lfu.0.gmail; Thu, 19
 Aug 2021 06:42:48 -0700 (PDT)
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr10490093lfu.482.1629380567989;
        Thu, 19 Aug 2021 06:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629380567; cv=none;
        d=google.com; s=arc-20160816;
        b=EYVUlvVkCElkBiInIN7QVZyQrgvkc59L/Kl9U3Fo5OPiOmCUbAI9swt6D6p/o1zBLw
         z4DrPF0rVM8kHJimBJ/vOhDYYAL19TlRVXCUYqgiUcNj/WZbgR/ea7xVemBmOfdgT/Ay
         izey/PagEH3/vp+TgPKH0wwoPhrcUp/owlZo3Fu2TkJBJoLNtqaW8o2Bdd9goXhsTowu
         duPSJE9Ul4yXSm/Tdf/0j3yJardBkX/DXx7ac5AtvMeE7UlYQdwaqqD4PFAZinJzaFOa
         x1UUE2Oo9+kKag7RqgOZ///Mrn4WSYYd2Yuvw6BsVnToQtrm3QK/euwB/HISPIJOzJ6n
         XcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ygTJyNxTPG/knhrwW/JxyadBf4+xSTjuXNQjd0LRdkI=;
        b=gfYUOzkkLgzI/wzk7mAyE29nXkdZ8kypnDuOznyBxMs9EVVvkHd9tbNSSljM7+uHDe
         tbkYHA7OIQz5ZQ2uDAHXV9PYvDd7XYK02bonVyvGVfM0l5otuly3B0f6yNS7D6tIRTxR
         weM8fKDwCBAKYn8JuoXKkffm8vXGvsE6Eoi1wAqV3NlKrAsGTo8gRDQwkS1ARxLADfwG
         sz1+L8KHJw72z1+lu/A78f5dtk8+PBF5YilQo/KZkHblYo5keFvlAPrfpPVvIJj6cMlt
         qqFyY8vsqW7O8TEXukP80I8C08KhW+gdTV98vtf7nEddXBB1M6/9ZPdyVB94FK2oM+Ah
         bdVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BIU+5yfB;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com. [2a00:1450:4864:20::22e])
        by gmr-mx.google.com with ESMTPS id h13si158374ljj.7.2021.08.19.06.42.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 06:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22e as permitted sender) client-ip=2a00:1450:4864:20::22e;
Received: by mail-lj1-x22e.google.com with SMTP id h9so11627343ljq.8
        for <jailhouse-dev@googlegroups.com>; Thu, 19 Aug 2021 06:42:47 -0700 (PDT)
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr11948676ljo.135.1629380567740;
 Thu, 19 Aug 2021 06:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com> <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com> <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
In-Reply-To: <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
From: Anmol <anmol.karan123@gmail.com>
Date: Thu, 19 Aug 2021 19:12:36 +0530
Message-ID: <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
Subject: Re: Help needed regarding AGL with Jailhouse
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: anmol.karan123@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=BIU+5yfB;       spf=pass
 (google.com: domain of anmol.karan123@gmail.com designates
 2a00:1450:4864:20::22e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
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

Hello,

On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 11.08.21 20:36, Anmol wrote:
>
> The echo should not show any response, but when you do an lspci -k, you
> should see that the targeting devices are now driven by uio_ivshmem. If
> not, the IDs might not be correct yet, or the devices are missing.
>
> Also check the kernel console of the cell where you issued this echo.
>

I have added the PCI devices to both the cells and set the
`.shmem_dev_id` accordingly, please have a look at the cell config.
files I have sent.

here's the `lspci -k` output:
qemux86-64:~# lspci -k
00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
Subsystem: Red Hat, Inc. QEMU Virtual Machine
00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
Subsystem: Red Hat, Inc. Virtio GPU
Kernel driver in use: virtio-pci
00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
Subsystem: Red Hat, Inc. Virtio network device
Kernel driver in use: virtio-pci
00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
Subsystem: Red Hat, Inc. Virtio RNG
Kernel driver in use: virtio-pci
00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
Subsystem: Red Hat, Inc. Virtio block device
Kernel driver in use: virtio-pci
00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
Family) High Definition Audio Controller (rev 01)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: snd_hda_intel
00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
UHCI Controller #1 (rev 03)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: uhci_hcd
00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
UHCI Controller #2 (rev 03)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: uhci_hcd
00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
UHCI Controller #3 (rev 03)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: uhci_hcd
00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
EHCI Controller #1 (rev 03)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: ehci-pci
00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
Controller (rev 02)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH)
6 port SATA Controller [AHCI mode] (rev 02)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: ahci
00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller (rev 02)
Subsystem: Red Hat, Inc. QEMU Virtual Machine
Kernel driver in use: i801_smbus


> >
> > - In this command `$ virtio-ivshmem-block /dev/uio0
> > /path/to/disk.image`, I am not able to load the `virtio-ivshmem-block`
> > module, and is the `disc.image` a standard `LinuxInstallation.img`?
> >
>
> What do you mean with "load the `virtio-ivshmem-block` module"? The tool
> is no module, it's a plain Linux application you just need to start.
> When you do that, what errors do you get?
>

Yes, `virtio-ivshmem-block` can be built in the `tools/virtio`, but
when I am trying this in root cell, it's giving me the below error.

qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
-sh: ./virtio-ivshmem-block: No such file or directory

Also, I am not able to see the `/dev/uio0` in the root-cell.

> The disk image needs to be raw image. But its size matters as that
> defines the virtual disk size, but you may even leave it empty and only
> partition or format it from the front-end guest.
>

I am creating disk.image as follows:

$ dd if=/dev/zero of=disk.img bs=1M count=1024
$ mkfs.ext4 disk.img


> > - For `virtio-ivshmem-block`, do I need to compile the
> > `virtio-ivshmem-block.c` externally and copy the module to the QEmulated
> > Image?
>
> You need to have that application inside the guest that is suppose to
> act as back-end, yes. How you make it available to that guest is up to you.
>

I am trying to achieve Root Cell(backend) <--->
Non-Root-Cell(frontend) communication, instead of the VM1(backend)
<---> VM2(frontend).
Also, for the IVSHMEM2 I need to patch my current QEmu, right? so that
I can insert ivshmem `-chardev` and `-device` into my `qemuboot.conf`,
and run the `./ivshmem2-server`?


Also, Please let me know, should the exact procedure be this:

- In the server/local-machine run `./ivshmem2-server`.
- then add `... -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem
-device ivshmem,chardev=ivshmem` to the `qemuboot.conf`.
- then QEmulate/boot the Image with Jailhouse.
- enable root cell.
- `echo "110a 4106 110a 4106 ffc002 ffffff" >
/sys/bus/pci/drivers/uio_ivshmem/new_id`
- `virtio-ivshmem-block /dev/uio0 disk.img`
- boot the linux-non-root cell.


Thanks and Regards,
Anmol




> >
> > - Can we also use the `queues/jailhouse` kernel for this setup instead
> > of `queues/ivshmem2`?
> >
>
> Yes, queues/jailhouse contains all what is in queues/ivshmem2, and more.
>
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAC%2ByH-YxAb%2BqaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA%40mail.gmail.com.
