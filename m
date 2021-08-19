Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBNWE7GEAMGQEXB7LMDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B13F1AEF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 15:52:55 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id e17-20020a2ea551000000b001ba24d10343sf2178036ljn.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Aug 2021 06:52:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629381175; cv=pass;
        d=google.com; s=arc-20160816;
        b=q7X26EkUDo4n0fXp//rcWrYkRDnOVS5EWcM3qhfXUlDDTtsl1Way8CTugRZaXdpxMg
         6tx1L4sogrGkLQtjcZt6UjiqeE2Caxu2lzXob59+u7q9SZ/C9QNvV9tvnxHu69ocprbf
         NbPfgaT6Bry7NxmyO5E1EbwXMA8PWgM69ZFV/3Rc9Zig7v20GFQvwWmoJovNT9q81Mt4
         jdNah0FwukjM8Ghx+87TLpaWIykA1S4WZk8gr8BKLkaSCKrwfhjRR8LXyIDKiSYj8I3n
         tjT3UpDYRpxKHIPSdU6TdeSBaMFKyjiL5sBavHQA2fGdi9GP5EeTO64UTIAjArDr35aV
         lWpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=o3vQNzjS045HThhBABmtT9NMwOdy1D3743bXoTtOs28=;
        b=tI2L/K1bmbK1FiNWPq8t7gY09mslzN3B5Rd0JtAMg64xWBRrEkhW171/ZFHfDlQJm5
         SjaQ2wdq7rl+xF/kHHfPBE6S8lqjOUscF40kgp4qSlsnPoK6Vubnyh/cRStnFzWwp/n3
         7HgxhyMpgpmQ1vdCKJKITUCQ1eQnci97wFHNCKWsGFcEKDO+s2Wl5QpRvu+MtxfO1cNO
         Yb3V4SUdILjyCDL+rCEggJf/12Vt+krekoKzSaNDYtWJeiDfOEFKpM0EWzhSJ3HWjVMu
         lqtKLWivuZzZ1CGmeK82KYBsUakVRsgkbPgEcgUCudthHDlTWnVIoU0JPtQnrYhNWSka
         GerA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UPflc83q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o3vQNzjS045HThhBABmtT9NMwOdy1D3743bXoTtOs28=;
        b=PZ3qfXJobyMj88r9mVRHgTimk1qebEgTRxpRmDF5ZPE3YGHjNIJjS+J7FO1vHzdE1Q
         UTKUze1zEVjfNss4EzRYIG/BgJJHEh3FWajkic5LEvGsg5jPVHv8xMD1zc1DnLuhmCfO
         9tFu9eL3lqx4pTkm27qxiVlEVrbSeI0MNtI2yJPfJK0lh4TmI+XH0cAvRoTIpoftrw3u
         O6udBK5/kMYBHWEaPpAC76KcLWBZPgIJGpur4zhnQh+J2QoZdrUEHJBRHlg9mn/P1wcV
         32ESg1ybsB7EU6g4/BjEX486t7r5+BjywrpBSF0VG7c/2x8+swwqlAtyF/Ov83Iybu1y
         s+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o3vQNzjS045HThhBABmtT9NMwOdy1D3743bXoTtOs28=;
        b=oKD4Ok1kjPygl+HHwR1hVTNdTgtmkB4d9h4tic42TguoA266UNFhk4w34ZhBHzHshY
         SIw3hay356or31/XZdLDBf5aBEUF1FJ7G/l5gE86sLHP2C/xWt50vItLBMueBeGDa+9V
         iO79L+J96N3jkPkWhNBauUwUtysaglHmh8DFvTp40FF2NtwrWNx7Jfl+bjEbd6VQ8zi4
         3yvABk21uAB9p0zQlJyUYNKBEDRzWoj6HDveESAsWIyet9lg6m+nZgZ79l1AowF1BpeP
         43G8jzuICvgWdKOQ5oJj9cxjTPBmgJTFIvG3OMKai67bVcXvqyaijMdo/68+si23cZgb
         r4iw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kY391EZYHyjeJsMRULfW961gpKEHIS2O8BvBasW/6BRFthprQ
	BOojBNAlon9rjjjjDbkwN9o=
X-Google-Smtp-Source: ABdhPJzR54P6nGelDrpTZVyhfy8gXv7qrwxqECTgrOaePR3AuwvtUyDYSl7z4AtSO1AlC20vdSLTjw==
X-Received: by 2002:a05:6512:2355:: with SMTP id p21mr11236979lfu.187.1629381175100;
        Thu, 19 Aug 2021 06:52:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:15a3:: with SMTP id bp35ls718418lfb.1.gmail; Thu,
 19 Aug 2021 06:52:54 -0700 (PDT)
X-Received: by 2002:ac2:46c1:: with SMTP id p1mr10360585lfo.469.1629381174049;
        Thu, 19 Aug 2021 06:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629381174; cv=none;
        d=google.com; s=arc-20160816;
        b=grISkuoN8smzFjlEnBvOVledI+re+O8wgDse8gWaD9jZQmmPMrLPaFNt82LPHooxhT
         EL8xsg9Lf18VAOgjsRhKPRxDy3fnWXDhDc91aWnXB769DenlndOOgydot+1X6vCU0gy1
         XdxSKj+jnA4FLvnBFpDgCsrr3SAN7aTDxaTBXuRMn3VHGuUUcCxdvV1SCsgeRIsjhodx
         YRN0+DGsTZ3x/D84IlycDJpOicxUmNj8hQcC/Ve4yknLCRYqNg0PPrzNcpUzGJcXROL5
         pIZ8DFnTJjCJcOgK6j2baKdjlveTebuuRykBorNqIhB6BtY3hu9zAWHtiHM3DaczDGgQ
         fgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7zyM+Ngdr3JpYdjKwU6QgquJ6h37AbLHRv5kfkqmAIc=;
        b=KB0HGWO/Cx/74CdXkHYUQAVSatjjfchyQCGcV45ZuKSiC1LkvGW8/WjnPwt9PIFBzK
         ch9rEg/WCAtzg07JMsiv59cdvI9sNuIgai+u1eLYFjRjg/MfA+8Yp/BIpHTzxhsEA9TB
         5VX0lSr3GDuGXIimFJARYi0c+n/iDExScHcnfyquULQlJPATEjtdrmtDSccBuGdNoi2t
         S6AZ+41kMUCeZ3lxFHeg4CIRE9rJbYN0kiZLGNp0jEHXy7WicxQDWHGdqP0cyvn8jrib
         Geyy4XKQpZhe7gSpPJnYBOQRQFQ0M/agz6vkN/pvI0Mo+2B7s5WAkR51KqJHNheeWB7z
         aMrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UPflc83q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id h11si236039lfc.4.2021.08.19.06.52.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 06:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.0.29] ([88.215.87.227]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnFyI-1mximu2tmu-00jLap; Thu, 19
 Aug 2021 15:52:52 +0200
Subject: Re: Help needed regarding AGL with Jailhouse
To: Anmol <anmol.karan123@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
 <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
 <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de>
Date: Thu, 19 Aug 2021 15:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:mQG2qimQ1OTkkhzP6MLyHww19ObIw5ni3NFq0QEv792lGeFaZLN
 8seRqHkW7YYTwuETNo6HU+Ttxlxc9UqMZIZSCRuCGRxbj49hxL0Zg2OVJv1lF78GqJ5Ec3E
 NQzd8/ltJLWnP+qPOLbBoj7B4ndNLbxMjeqqHRD0NZNMXNFWmwLH50Kx88BBW2i6AI5EXZz
 /rpHeiAlkEPOIxnfIreeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1eMkG0VXcM8=:89FE8Yy1Vs43Ucn4/CGQG1
 buExczJhw7b6PdpXmdRe0uUcJ08FI9b+DA/Dw4rNCTgHk5J3CFU5yBrxzDePQj2tpWl/BOEK0
 1s33rC30rOCt81849n8Obs5d7t45HWvXUTg+KQF97xXwOFjEVTRLeBM+BxPyvrwEuO/QZO4Df
 XHXpjn4IcHzQU/eeT7zxe7fhjGu1d48iE6yx2SK5kgtHISNgKik3qUMijiliysP8ZcfJ4aOJi
 WPAof48SdzBU08eo9/Aybj+Rw/8WK0cfxL8jlztJmjHE7+W7zdC4XckoIfF+7mb51VW0y4L5U
 iHQYq0bRQUrm3KSjBrqSdlEpPZ1DHMsVVGM8jaNQPxBPaIvQnjSLb06ITOrOwamyAXFz7BJ52
 qLFqKN7k7CZC6hMYSl1mOpXpW04JN6aJqCxdyfwPLOeYa6mnDoJIvKlgMN27ru7wVj5sq8sJ4
 VjQh5byUuyzNGur8YYcVvO2xNz4xcvgm8A2h4nIkckpQ8Byv1lQfXPZ17QIP9Avn6tpFT41Tl
 hIMy8/A8cAQS9HhLb5hNwPmt0S4kBtCMeWsHXtnp9w2XJvGhAvH4WITew7hyk0UM0MfM0QVHZ
 qwMWRy1n5Zu+7cwxTKIjuErM1UvMTfzvrJvZucRdwQY9mmF14yDspyhQpD431TKEHtrM/Qg0q
 O7A10I/DERK4xDkINWclHPERzj4aQudSyrYj3FOCDJlaMNWb83uiuRj67x26WESH/6Ekp2Y47
 ReTuk5ogMmXjIRKKDG+igicF2b5xobAwAG2EMwJNbu+4I8DIkE3/ht/A+s90Utrn681xzNE8U
 moBM8MnlSALaXoV1U+QXIhcZ+csQdPXguf4HOPyaPeTRQA7YyPvwMPlgh4n+iMWeEQmnXpyLX
 IXEcVaxNBPaYiLHA6HX6sjQhXOGw1ZBKgmaho663//aTgCg5LZlhPPpXVe78q0k94jP0qZ7Hr
 t+eOEq/9KrLVQtqJWc2fs4FUHHog8VXhT5M2nEotyJSBDOrUScFRzvNubL1f+4Fbh+WuM8SEC
 OmjhTPlRoq/h6HkY8qyuKub0RUIxmCIVXzSQS/af7eRrM4c9LJIyXCTLu4wdLvFWY3+/L7BTH
 KJgivhFQXprEo0wBtEjKGihmzjWBpSePkYQxy+hlFhgFTEXkuFYR2FwsQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=UPflc83q;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 19.08.21 15:42, Anmol wrote:
> Hello,
>
> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 11.08.21 20:36, Anmol wrote:
>>
>> The echo should not show any response, but when you do an lspci -k, you
>> should see that the targeting devices are now driven by uio_ivshmem. If
>> not, the IDs might not be correct yet, or the devices are missing.
>>
>> Also check the kernel console of the cell where you issued this echo.
>>
>
> I have added the PCI devices to both the cells and set the
> `.shmem_dev_id` accordingly, please have a look at the cell config.
> files I have sent.
>
> here's the `lspci -k` output:
> qemux86-64:~# lspci -k
> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
> Subsystem: Red Hat, Inc. Virtio GPU
> Kernel driver in use: virtio-pci
> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
> Subsystem: Red Hat, Inc. Virtio network device
> Kernel driver in use: virtio-pci
> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
> Subsystem: Red Hat, Inc. Virtio RNG
> Kernel driver in use: virtio-pci
> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
> Subsystem: Red Hat, Inc. Virtio block device
> Kernel driver in use: virtio-pci
> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
> Family) High Definition Audio Controller (rev 01)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: snd_hda_intel
> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> UHCI Controller #1 (rev 03)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: uhci_hcd
> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> UHCI Controller #2 (rev 03)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: uhci_hcd
> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> UHCI Controller #3 (rev 03)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: uhci_hcd
> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
> EHCI Controller #1 (rev 03)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: ehci-pci
> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
> Controller (rev 02)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH)
> 6 port SATA Controller [AHCI mode] (rev 02)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: ahci
> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller (rev 02)
> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> Kernel driver in use: i801_smbus
>

Is this taken while Jailhouse was enabled? It's missing your ivshmem
devices (00:0c.0 - 00:0f.0).

>
>>>
>>> - In this command `$ virtio-ivshmem-block /dev/uio0
>>> /path/to/disk.image`, I am not able to load the `virtio-ivshmem-block`
>>> module, and is the `disc.image` a standard `LinuxInstallation.img`?
>>>
>>
>> What do you mean with "load the `virtio-ivshmem-block` module"? The tool
>> is no module, it's a plain Linux application you just need to start.
>> When you do that, what errors do you get?
>>
>
> Yes, `virtio-ivshmem-block` can be built in the `tools/virtio`, but
> when I am trying this in root cell, it's giving me the below error.
>
> qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
> -sh: ./virtio-ivshmem-block: No such file or directory
>

Seems the build generated a non-working executable. How exactly did you
build it? What does "file virtio-ivshmem-block" tell you?

$ file tools/virtio/virtio-ivshmem-block
tools/virtio/virtio-ivshmem-block: ELF 64-bit LSB executable, x86-64,
version 1 (SYSV), dynamically linked, interpreter
/lib64/ld-linux-x86-64.so.2,
BuildID[sha1]=834ea23dab86f332e8eeae98b3493fe9612dbb7c, for GNU/Linux
3.2.0, with debug_info, not stripped

> Also, I am not able to see the `/dev/uio0` in the root-cell.
>

See above: no such PCI devices.

>> The disk image needs to be raw image. But its size matters as that
>> defines the virtual disk size, but you may even leave it empty and only
>> partition or format it from the front-end guest.
>>
>
> I am creating disk.image as follows:
>
> $ dd if=/dev/zero of=disk.img bs=1M count=1024
> $ mkfs.ext4 disk.img
>

Thanks fine.

>
>>> - For `virtio-ivshmem-block`, do I need to compile the
>>> `virtio-ivshmem-block.c` externally and copy the module to the QEmulated
>>> Image?
>>
>> You need to have that application inside the guest that is suppose to
>> act as back-end, yes. How you make it available to that guest is up to you.
>>
>
> I am trying to achieve Root Cell(backend) <--->
> Non-Root-Cell(frontend) communication, instead of the VM1(backend)
> <---> VM2(frontend).
> Also, for the IVSHMEM2 I need to patch my current QEmu, right? so that
> I can insert ivshmem `-chardev` and `-device` into my `qemuboot.conf`,
> and run the `./ivshmem2-server`?
>

Don't confuse ivshmem (whatever version) provided by QEMU with the one
provided by Jailhouse. You may run Jailhouse in QEMU, but even then it
will still be Jailhouse to provide ivshmem2 devices to the root and
non-root cell. Therefore, QEMU does not require any patches or specific
configuration.

Jan

>
> Also, Please let me know, should the exact procedure be this:
>
> - In the server/local-machine run `./ivshmem2-server`.
> - then add `... -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem
> -device ivshmem,chardev=ivshmem` to the `qemuboot.conf`.
> - then QEmulate/boot the Image with Jailhouse.
> - enable root cell.
> - `echo "110a 4106 110a 4106 ffc002 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id`
> - `virtio-ivshmem-block /dev/uio0 disk.img`
> - boot the linux-non-root cell.
>
>
> Thanks and Regards,
> Anmol
>
>
>
>
>>>
>>> - Can we also use the `queues/jailhouse` kernel for this setup instead
>>> of `queues/ivshmem2`?
>>>
>>
>> Yes, queues/jailhouse contains all what is in queues/ivshmem2, and more.
>>
>> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7244017d-6e9f-544e-9dfa-fefcb4827cd3%40web.de.
