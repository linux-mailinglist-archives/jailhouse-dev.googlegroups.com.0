Return-Path: <jailhouse-dev+bncBDLLFRUURMIBB4FT72EAMGQELTXA6BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 544573F2BB0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 14:02:57 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id i4-20020ac25b44000000b003d4f64fefe4sf3261742lfp.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 05:02:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629460977; cv=pass;
        d=google.com; s=arc-20160816;
        b=NzdqTrf/AOBafRYb3UqvbWnYe472HdCUtlnYP0ZYr9mhmcZAcLqdNDWQisrG/r63kc
         gnTdToCxWYikHU+zhtX5Z1++AGoziA+XY1L1LxMoHmu5kGaxr9uGWa9BxV8htZL0CVb9
         nuD50GHXyzVJy84kfRmmSxgjBR7CsLQwWpxXvkcy4tbhZEtTqLuVItHDTkGglfCKCpV9
         OUphl0oclJJoXX9QhfLajxEl8FxjLowvqTvLqBmhuLj8CE4ICA4z2+MwgA90QoWsW3PE
         dwOYmc5lQFNr/IbUwcR5ZIXeExAr4dIgsQOWivvf7NrIzVOO19NeZ4KFWhXxTEq9WJ4t
         a0kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=IPbtfburqZvvcjeGIyESEAN6DRveTDQz54VUOOLVTKE=;
        b=QxlLDkn2uFSknLjH616sAlNuItQtuGGT0V7jpBCUiqqQVtJQKVr6aHq3gRVZVDrNmY
         uWWsVOwdrETRCIqcy2eELK0ej8SVSvPFQCVei8gdRMUjs4qSvmLCV95fmqHUSzOV9xCg
         XJQgZjcb2cHwT6BHr2EdxbZ0vYGKCjcduXr8oSMI9hYFOhvf4QIWGe/DLWKhadUhy57+
         52pvw9PcskN+qbxpM3W2jxFq25loE8tmFGwzCHykYofvTLsQtNMOo6QIbRgvOP9qLcOx
         RrIdxA4l6kjuBfjNfjtl+SzX86z2lp+NUX8uMpuzy6PFe+AdGt6XW2n+2fpM2HfSwoNU
         4klQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C3p/L6TT";
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IPbtfburqZvvcjeGIyESEAN6DRveTDQz54VUOOLVTKE=;
        b=VqSQZ60YryCn5K2J1Z3gq5EajbWrKlsBOK3ZnWBx/jEpq0GWbY2mpBRCGwMhgjTusx
         CMpLS+b8B3yQwImT4S6MP3nnTmT3U12nIubxq4KhlpoalkI+V+VtA0tR+iJKhWI6klnD
         cp50DEwayezj6KQzy9CvPgJOGulFTJZpRT79tFpo/lSfY24Y2XlSt+rblW5r3jK8PQwV
         JISJl9AKAiIo6WIoaH+ZXIPxi97yvWtdptPuLsLUHk6WZh1kbTXlSCRtsvWcIEU7ZDm5
         FT4pcJMNFqZo17vsBwZEPLRSOjhBa96iQlVFNlt7l5H06xhT7oxxJd31m150//hUNESM
         7Icw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IPbtfburqZvvcjeGIyESEAN6DRveTDQz54VUOOLVTKE=;
        b=oAZYhBwvBxCdKjM5AV5N0FguUdv6IYCuNfaAiy6Hcm/AZEgXdoTXA6dF/cYbvsn4KY
         p2hbRClsdjfPKTCFld3yAbE0l48qLn+lClEmHf0O96WenPDC1d99b2+amVEY/Adm+z5r
         D9GncxdQeC63cqSPOCAUcQU0YBTJI+rNzMYF85vN3o/nA/xZ6tb042ZtuKIAHxTc15F1
         Uik3gdvW4Zqwu9du/gteW5tXpWVPpAH2NhUGeHJh7OXmyz79PZS/tFHl6UOrlAAWPDyJ
         Hk4Z0IP862zHHD/RmKk9mOAPIlzzh9B0T2k8FB1mkSKdjVXdbG2+zzYiNyPHSSJ+Jrna
         QdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IPbtfburqZvvcjeGIyESEAN6DRveTDQz54VUOOLVTKE=;
        b=O8QNCeVxBWVAkkfF66iQklZKlzvzZdyjKEuHoylvJFDeThTq9GcgZZEHjjxEdJ8bCK
         Vv8Q1blBzItGPUJhuhoROL6xEZnwIre6u2p4hIyRtjzBWInDOCCduDuf6mBnRZiQEZ0p
         evQQmiGhtJ+bETVIvnjuEaxsTbHXEfnkNd4KGWm6hAyBdHhvEAJii0eaGgVkbrBB0ptQ
         +HflRZtXS36jc+yl+0DR8sbjgvH0+PZbokxqKdfdSx1tuyKXNofC0nY57rxxhVhadBWq
         xVpcZHsYpNOJ/ymtiAAFN9eyMOBviPatIfSgKMFBFDbVpnLtgd0r7wqqP0UmEwXdtFq9
         Pzaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533e3bc6WWdKFAFxxcSCj40t57Jwsf27zlG7rbCMu3s7ZReXBc12
	sePoiHLCaLC5uuIRFncUFgQ=
X-Google-Smtp-Source: ABdhPJyOXL5mngwF9ZSpIeZYG6EryVOX/P1ksopTZwBQdD3nqyCDDxmBo6RxQu57A0oCG2Yqdw0sSQ==
X-Received: by 2002:a19:f719:: with SMTP id z25mr14389455lfe.339.1629460976813;
        Fri, 20 Aug 2021 05:02:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8945:: with SMTP id b5ls1591839ljk.8.gmail; Fri, 20 Aug
 2021 05:02:55 -0700 (PDT)
X-Received: by 2002:a05:651c:1242:: with SMTP id h2mr1073240ljh.114.1629460975503;
        Fri, 20 Aug 2021 05:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629460975; cv=none;
        d=google.com; s=arc-20160816;
        b=Tbj4o9rPORaEfs/YtKs3Qo279GUQeJnKOpNuN4QMKdd9e3LvTljrcbSjp3g7m8S+p7
         On97j2C5J7LtCOoHLba2B6liARkOl5cwbmR0heknls54oglllxGpz4hf4rEvhwqoeIHi
         wk4dZgI7uyiwkCpi3goNQIQyZ03Ro+vdkh2zNXNFeKYFzpnG7IfgdserL+3cgkdfVVZr
         tpBZc39Jo9YzOiQlTX4Th6lP//wb4THF6G8PiZ/FOKarLj2JH1VONsfFVaUsq9zMNSHf
         0K0ykf96Wbex8GP2E1OJDEQUTsFSw38tATw0s7AaPyihRXEqp4r8LC5bF4ytWbB3rT3a
         RqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RU8uTrxn9Sj89Vpmq/8eyhZjDavgKX4a3wQdTmlPixs=;
        b=pYnk35AgqBmGxAYa9umLrrujnI4oeMKooeDCn5hUATM1SVRp48KP8A99ftgmDSSNGl
         Vwwc8XRouAGNhzdlB/rpH9JFXkfEVa6RwY4B43tC5fo/Xe51WGF0lCgC9sZ8lrbaSPSh
         E9MB6V3V3euq7n4pGgzv2UtdMywJZog42uUmaGBrD+952yChnf45R1pc2Imhc00hiFkR
         rM09rarvCsICd4rYE/AGVF7sM1+qOD9/pJ0GRepDVD5d6SzMEa4+Tf0zXN2QhtxC5UxR
         ATtCG8N+3QSDsP/vdHVgypAYyTCRXwHQx2wMcQn1UzJzMdLzfBSRzMG0U+naZjbquibc
         BJXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C3p/L6TT";
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com. [2a00:1450:4864:20::12e])
        by gmr-mx.google.com with ESMTPS id x17si220075ljp.0.2021.08.20.05.02.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 05:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12e as permitted sender) client-ip=2a00:1450:4864:20::12e;
Received: by mail-lf1-x12e.google.com with SMTP id r9so20169768lfn.3
        for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 05:02:55 -0700 (PDT)
X-Received: by 2002:ac2:5326:: with SMTP id f6mr14233953lfh.131.1629460975045;
 Fri, 20 Aug 2021 05:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com> <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com> <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com> <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de>
In-Reply-To: <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de>
From: Anmol <anmol.karan123@gmail.com>
Date: Fri, 20 Aug 2021 17:32:43 +0530
Message-ID: <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
Subject: Re: Help needed regarding AGL with Jailhouse
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/mixed; boundary="0000000000009815e605c9fc7245"
X-Original-Sender: anmol.karan123@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="C3p/L6TT";       spf=pass
 (google.com: domain of anmol.karan123@gmail.com designates
 2a00:1450:4864:20::12e as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
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

--0000000000009815e605c9fc7245
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 19.08.21 15:42, Anmol wrote:
> > Hello,
> >
> > On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> On 11.08.21 20:36, Anmol wrote:
> >>
> >> The echo should not show any response, but when you do an lspci -k, yo=
u
> >> should see that the targeting devices are now driven by uio_ivshmem. I=
f
> >> not, the IDs might not be correct yet, or the devices are missing.
> >>
> >> Also check the kernel console of the cell where you issued this echo.
> >>
> >
> > I have added the PCI devices to both the cells and set the
> > `.shmem_dev_id` accordingly, please have a look at the cell config.
> > files I have sent.
> >
> > here's the `lspci -k` output:
> > qemux86-64:~# lspci -k
> > 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM C=
ontroller
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
> > Subsystem: Red Hat, Inc. Virtio GPU
> > Kernel driver in use: virtio-pci
> > 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
> > Subsystem: Red Hat, Inc. Virtio network device
> > Kernel driver in use: virtio-pci
> > 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
> > Subsystem: Red Hat, Inc. Virtio RNG
> > Kernel driver in use: virtio-pci
> > 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
> > Subsystem: Red Hat, Inc. Virtio block device
> > Kernel driver in use: virtio-pci
> > 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
> > Family) High Definition Audio Controller (rev 01)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: snd_hda_intel
> > 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> > UHCI Controller #1 (rev 03)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: uhci_hcd
> > 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> > UHCI Controller #2 (rev 03)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: uhci_hcd
> > 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> > UHCI Controller #3 (rev 03)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: uhci_hcd
> > 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
> > EHCI Controller #1 (rev 03)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: ehci-pci
> > 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
> > Controller (rev 02)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH)
> > 6 port SATA Controller [AHCI mode] (rev 02)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: ahci
> > 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller =
(rev 02)
> > Subsystem: Red Hat, Inc. QEMU Virtual Machine
> > Kernel driver in use: i801_smbus
> >
>
> Is this taken while Jailhouse was enabled? It's missing your ivshmem
> devices (00:0c.0 - 00:0f.0).
>

I did some changes to the root-cell config files, and now it=E2=80=99s show=
ing
the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
only):

qemux86-64:~# lspci -k
.
.
.
00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
Subsystem: Siemens AG Device 4106
.
.
.

But it=E2=80=99s not showing any association with the `uio_ivshmem`, and al=
so
I am still not able to find the `/dev/uio0`.

I am attaching my config files, please tell me what I am missing.

> >
> >>>
> >>> - In this command `$ virtio-ivshmem-block /dev/uio0
> >>> /path/to/disk.image`, I am not able to load the `virtio-ivshmem-block=
`
> >>> module, and is the `disc.image` a standard `LinuxInstallation.img`?
> >>>
> >>
> >> What do you mean with "load the `virtio-ivshmem-block` module"? The to=
ol
> >> is no module, it's a plain Linux application you just need to start.
> >> When you do that, what errors do you get?
> >>
> >
> > Yes, `virtio-ivshmem-block` can be built in the `tools/virtio`, but
> > when I am trying this in root cell, it's giving me the below error.
> >
> > qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
> > -sh: ./virtio-ivshmem-block: No such file or directory
> >
>
> Seems the build generated a non-working executable. How exactly did you
> build it? What does "file virtio-ivshmem-block" tell you?
>
> $ file tools/virtio/virtio-ivshmem-block
> tools/virtio/virtio-ivshmem-block: ELF 64-bit LSB executable, x86-64,
> version 1 (SYSV), dynamically linked, interpreter
> /lib64/ld-linux-x86-64.so.2,
> BuildID[sha1]=3D834ea23dab86f332e8eeae98b3493fe9612dbb7c, for GNU/Linux
> 3.2.0, with debug_info, not stripped
>


I have tried again building it and this time with the yocto, now it=E2=80=
=99s
showing this:

qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
./virtio-ivshmem-block: cannot open /dev/uio0: No such file or directory

Also, o/p of the `file virtio-ivshmem-block`

qemux86-64:~# file virtio-ivshmem-block
virtio-ivshmem-block: ELF 64-bit LSB shared object, x86-64, version 1
(SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2,
BuildID[sha1]=3D3434d7bc3510384cf6e0faab08a1cdcfab9d9828, for GNU/Linux
3.2.0, with debug_info, not stripped

> > Also, I am not able to see the `/dev/uio0` in the root-cell.
> >
>
> See above: no such PCI devices.
>
> >> The disk image needs to be raw image. But its size matters as that
> >> defines the virtual disk size, but you may even leave it empty and onl=
y
> >> partition or format it from the front-end guest.
> >>
> >
> > I am creating disk.image as follows:
> >
> > $ dd if=3D/dev/zero of=3Ddisk.img bs=3D1M count=3D1024
> > $ mkfs.ext4 disk.img
> >
>
> Thanks fine.
>
> >
> >>> - For `virtio-ivshmem-block`, do I need to compile the
> >>> `virtio-ivshmem-block.c` externally and copy the module to the QEmula=
ted
> >>> Image?
> >>
> >> You need to have that application inside the guest that is suppose to
> >> act as back-end, yes. How you make it available to that guest is up to=
 you.
> >>
> >
> > I am trying to achieve Root Cell(backend) <--->
> > Non-Root-Cell(frontend) communication, instead of the VM1(backend)
> > <---> VM2(frontend).
> > Also, for the IVSHMEM2 I need to patch my current QEmu, right? so that
> > I can insert ivshmem `-chardev` and `-device` into my `qemuboot.conf`,
> > and run the `./ivshmem2-server`?
> >
>
> Don't confuse ivshmem (whatever version) provided by QEMU with the one
> provided by Jailhouse. You may run Jailhouse in QEMU, but even then it
> will still be Jailhouse to provide ivshmem2 devices to the root and
> non-root cell. Therefore, QEMU does not require any patches or specific
> configuration.
>

Okay, but I didn=E2=80=99t understand this:

```
To instantiate a ivshmem v2 device, just add

... -chardev socket,path=3D/tmp/ivshmem_socket,id=3Divshmem \
-device ivshmem,chardev=3Divshmem
```
And from where I should get the `./ivshmem2-server` binary?



Thanks and Regards,
Anmol

> Jan
>
> >
> > Also, Please let me know, should the exact procedure be this:
> >
> > - In the server/local-machine run `./ivshmem2-server`.
> > - then add `... -chardev socket,path=3D/tmp/ivshmem_socket,id=3Divshmem
> > -device ivshmem,chardev=3Divshmem` to the `qemuboot.conf`.
> > - then QEmulate/boot the Image with Jailhouse.
> > - enable root cell.
> > - `echo "110a 4106 110a 4106 ffc002 ffffff" >
> > /sys/bus/pci/drivers/uio_ivshmem/new_id`
> > - `virtio-ivshmem-block /dev/uio0 disk.img`
> > - boot the linux-non-root cell.
> >
> >
> > Thanks and Regards,
> > Anmol
> >
> >
> >
> >
> >>>
> >>> - Can we also use the `queues/jailhouse` kernel for this setup instea=
d
> >>> of `queues/ivshmem2`?
> >>>
> >>
> >> Yes, queues/jailhouse contains all what is in queues/ivshmem2, and mor=
e.
> >>
> >> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAC%2ByH-aewTCrKXB%3DQOM_h%3Dn2umO9p2nvpTmBmbwaVjmKuBQWmw%40m=
ail.gmail.com.

--0000000000009815e605c9fc7245
Content-Type: text/x-csrc; charset="US-ASCII"; name="agl-qemu-root-cell.c"
Content-Disposition: attachment; filename="agl-qemu-root-cell.c"
Content-Transfer-Encoding: base64
Content-ID: <f_kskauqk00>
X-Attachment-Id: f_kskauqk00

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAxNC0yMDE3CiAqCiAqIFRoaXMgd29yayBp
cyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNl
ZQogKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogKgogKiBB
bHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHVzZSBvciByZWRpc3RyaWJ1dGUgdGhpcyBmaWxlIHVuZGVy
IHRoZSBmb2xsb3dpbmcKICogQlNEIGxpY2Vuc2U6CiAqCiAqIFJlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAogKiBtb2RpZmlj
YXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnMKICogYXJlIG1ldDoKICoKICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11
c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2Yg
Y29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgogKgogKiAyLiBSZWRpc3Ry
aWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdo
dAogKiAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlCiAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVy
aWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCiAqCiAqIFRISVMgU09GVFdBUkUg
SVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFT
IElTIgogKiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCiAqIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFO
VEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFCiAqIEFSRSBESVND
TEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERFUiBPUiBDT05UUklC
VVRPUlMgQkUKICogTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwg
U1BFQ0lBTCwgRVhFTVBMQVJZLCBPUgogKiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRgogKiBTVUJTVElUVVRFIEdPT0RT
IE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MK
ICogSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4KICogQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQg
KElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkKICogQVJJU0lORyBJTiBBTlkgV0FZ
IE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRgogKiBU
SEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAqCiAqIENvbmZpZ3VyYXRpb24gZm9yIFFF
TVUgU3RhbmRhcmQgUEMgKFEzNSArIElDSDksIDIwMDkpCiAqIGNyZWF0ZWQgd2l0aCAnL3Vzci9s
aWJleGVjL2phaWxob3VzZS9qYWlsaG91c2UgY29uZmlnIGNyZWF0ZSAtYyB0dHlTMSBxZW11LWFn
bC5jJwogKgogKiBOT1RFOiBUaGlzIGNvbmZpZyBleHBlY3RzIHRoZSBmb2xsb3dpbmcgdG8gYmUg
YXBwZW5kZWQgdG8geW91ciBrZXJuZWwgY21kbGluZQogKiAgICAgICAibWVtbWFwPTB4NTIwMDAw
MCQweDIyMDAwMDAwIgogKi8KCi8vIEZvciBleHRlbmRpbmcgdmlydGlvLWJsayBvdmVyIElWU0hN
RU0uCiNkZWZpbmUgVVNFX1ZJUlRJT19CTEsKLy8jZGVmaW5lIFVTRV9WSVJUSU9fTkVUCi8vI2Rl
ZmluZSBVU0VfVklSVElPX0NPTgovLyNkZWZpbmUgVVNFX1ZJUlRJT19ERU1PCgojaWZkZWYgVVNF
X1ZJUlRJT19CTEsKIyBkZWZpbmUgQkxLX01FTSA0CiMgZGVmaW5lIEJMS19QQ0kgMQojZWxzZQoj
IGRlZmluZSBCTEtfTUVNIDAKIyBkZWZpbmUgQkxLX1BDSSAwCiNlbmRpZgoKI2lmZGVmIFVTRV9J
VlNITUVNX0RFTU8KIyBkZWZpbmUgREVNT19NRU0gNQojIGRlZmluZSBERU1PX1BDSSAxCiNlbHNl
CiMgZGVmaW5lIERFTU9fTUVNIDAKIyBkZWZpbmUgREVNT19QQ0kgMAojZW5kaWYKCiNpZmRlZiBV
U0VfSVZTSE1FTV9ORVQKIyBkZWZpbmUgTkVUX01FTSA0CiMgZGVmaW5lIE5FVF9QQ0kgMQojZWxz
ZQojIGRlZmluZSBORVRfTUVNIDAKIyBkZWZpbmUgTkVUX1BDSSAwCiNlbmRpZgoKI2lmZGVmIFVT
RV9WSVJUSU9fQ09OCiMgZGVmaW5lIENPTl9NRU0gNAojIGRlZmluZSBDT05fUENJIDEKI2Vsc2UK
IyBkZWZpbmUgQ09OX01FTSAwCiMgZGVmaW5lIENPTl9QQ0kgMAojZW5kaWYKCgojZGVmaW5lIENP
TU1fTUVNX1JFR0lPTlMgKEJMS19NRU0gKyBERU1PX01FTSArIE5FVF9NRU0gKyBDT05fTUVNKQoj
ZGVmaW5lIENPTU1fUENJX1JFR0lPTlMgKEJMS19QQ0kgKyBERU1PX1BDSSArIE5FVF9QQ0kgKyBD
T05fUENJKQoKCiNpbmNsdWRlIDxqYWlsaG91c2UvdHlwZXMuaD4KI2luY2x1ZGUgPGphaWxob3Vz
ZS9jZWxsLWNvbmZpZy5oPgoKc3RydWN0IHsKCXN0cnVjdCBqYWlsaG91c2Vfc3lzdGVtIGhlYWRl
cjsKCV9fdTY0IGNwdXNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX21lbW9yeSBtZW1fcmVnaW9uc1sx
NyArIENPTU1fTUVNX1JFR0lPTlNdOwoJc3RydWN0IGphaWxob3VzZV9pcnFjaGlwIGlycWNoaXBz
WzFdOwoJc3RydWN0IGphaWxob3VzZV9waW8gcGlvX3JlZ2lvbnNbMTVdOwoJc3RydWN0IGphaWxo
b3VzZV9wY2lfZGV2aWNlIHBjaV9kZXZpY2VzWzEzICsgQ09NTV9QQ0lfUkVHSU9OU107CglzdHJ1
Y3QgamFpbGhvdXNlX3BjaV9jYXBhYmlsaXR5IHBjaV9jYXBzWzE0XTsKfSBfX2F0dHJpYnV0ZV9f
KChwYWNrZWQpKSBjb25maWcgPSB7CgkuaGVhZGVyID0gewoJCS5zaWduYXR1cmUgPSBKQUlMSE9V
U0VfU1lTVEVNX1NJR05BVFVSRSwKCQkucmV2aXNpb24gPSBKQUlMSE9VU0VfQ09ORklHX1JFVklT
SU9OLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9TWVNfVklSVFVBTF9ERUJVR19DT05TT0xFLAoJCS5o
eXBlcnZpc29yX21lbW9yeSA9IHsKCQkJLnBoeXNfc3RhcnQgPSAweDIyMDAwMDAwLAoJCQkuc2l6
ZSA9IDB4NjAwMDAwLAoJCX0sCgkJLmRlYnVnX2NvbnNvbGUgPSB7CgkJCS5hZGRyZXNzID0gMHgy
ZjgsCgkJCS50eXBlID0gSkFJTEhPVVNFX0NPTl9UWVBFXzgyNTAsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9DT05fQUNDRVNTX1BJTyB8CgkJCQkgSkFJTEhPVVNFX0NPTl9SRUdESVNUXzEsCgkJfSwK
CQkucGxhdGZvcm1faW5mbyA9IHsKCQkJLnBjaV9tbWNvbmZpZ19iYXNlID0gMHhiMDAwMDAwMCwK
CQkJLnBjaV9tbWNvbmZpZ19lbmRfYnVzID0gMHhmZiwKCQkJLmlvbW11X3VuaXRzID0gewoJCQkJ
ewoJCQkJCS50eXBlID0gSkFJTEhPVVNFX0lPTU1VX0lOVEVMLAoJCQkJCS5iYXNlID0gMHhmZWQ5
MDAwMCwKCQkJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJCX0sCgkJCX0sCgkJCS54ODYgPSB7CgkJCQku
cG1fdGltZXJfYWRkcmVzcyA9IDB4NjA4LAoJCQkJLnZ0ZF9pbnRlcnJ1cHRfbGltaXQgPSAyNTYs
CgkJCX0sCgkJfSwKCQkucm9vdF9jZWxsID0gewoJCQkubmFtZSA9ICJBR0wtSmFpbGhvdXNlLVJv
b3RDZWxsIiwKCQkJLmNwdV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJCS5udW1f
bWVtb3J5X3JlZ2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJCS5udW1f
aXJxY2hpcHMgPSBBUlJBWV9TSVpFKGNvbmZpZy5pcnFjaGlwcyksCgkJCS5udW1fcGlvX3JlZ2lv
bnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5waW9fcmVnaW9ucyksCgkJCS5udW1fcGNpX2RldmljZXMg
PSBBUlJBWV9TSVpFKGNvbmZpZy5wY2lfZGV2aWNlcyksCgkJCS5udW1fcGNpX2NhcHMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5wY2lfY2FwcyksCgkJfSwKCX0sCgoJLmNwdXMgPSB7CgkJMHgwMDAwMDAw
MDAwMDAwMDBmLAoJfSwKCgkubWVtX3JlZ2lvbnMgPSB7CgojaWYgZGVmaW5lZCBVU0VfVklSVElP
X0JMSwogICAgICAgICAgICAgICAgLyogSVZTSE1FTSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiAodmly
dGlvLWJsayBmcm9udCkgKi8KICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAg
ICAgLnBoeXNfc3RhcnQgPSAweDI2ZTAwMDAwLAogICAgICAgICAgICAgICAgICAgICAgICAudmly
dF9zdGFydCA9IDB4MjZlMDAwMDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaXplID0gMHgx
MDAwLAogICAgICAgICAgICAgICAgICAgICAgICAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQg
fCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAucGh5c19zdGFydCA9IDB4MjZlMDAwMDAs
CiAgICAgICAgICAgICAgICAgICAgICAgIC52aXJ0X3N0YXJ0ID0gMHgyNmUwMDAwMCwKICAgICAg
ICAgICAgICAgICAgICAgICAgLnNpemUgPSAweGRmMDAwLAogICAgICAgICAgICAgICAgICAgICAg
ICAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAogICAg
ICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsgMCB9LAogICAgICAgICAgICAgICAgeyAw
IH0sCiNlbmRpZgoKI2lmIGRlZmluZWQoVVNFX1ZJUlRJT19DT04pCgkJLyogSVZTSE1FTSBzaGFy
ZWQgbWVtb3J5IHJlZ2lvbiAodmlydGlvLWNvbiBiYWNrLWVuZCkgKi8KCQl7CgkJCS5waHlzX3N0
YXJ0ID0gMHgyMjBlMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDIyMGUwMDAwLAoJCQkuc2l6ZSA9
IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFELAoJCX0sCgkJewoJCQkucGh5
c19zdGFydCA9IDB4MjIwZTEwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgyMjBlMTAwMCwKCQkJLnNp
emUgPSAweGYwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9N
RU1fV1JJVEUsCgkJfSwKCQl7IDAgfSwKCQl7IDAgfSwKI2VuZGlmCgojaWYgZGVmaW5lZCBVU0Vf
SVZTSE1FTV9ETUVPCiAgICAgICAgICAgICAgICAvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVn
aW9ucyAoZGVtbykgKi8KICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAg
LnBoeXNfc3RhcnQgPSAweDIyMGYwMDAwLAogICAgICAgICAgICAgICAgICAgICAgICAudmlydF9z
dGFydCA9IDB4MjIwZjAwMDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaXplID0gMHgxMDAw
LAogICAgICAgICAgICAgICAgICAgICAgICAuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgICAgICAucGh5c19zdGFydCA9IDB4MjIwZjEwMDAsCiAg
ICAgICAgICAgICAgICAgICAgICAgIC52aXJ0X3N0YXJ0ID0gMHgyMjBmMTAwMCwKICAgICAgICAg
ICAgICAgICAgICAgICAgLnNpemUgPSAweDkwMDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwKICAgICAg
ICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIC5w
aHlzX3N0YXJ0ID0gMHgyMjBmYTAwMCwKICAgICAgICAgICAgICAgICAgICAgICAgLnZpcnRfc3Rh
cnQgPSAweDIyMGZhMDAwLAogICAgICAgICAgICAgICAgICAgICAgICAuc2l6ZSA9IDB4MjAwMCwK
ICAgICAgICAgICAgICAgICAgICAgICAgLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9ST09UU0hBUkVELAogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICAgICAgLnBoeXNfc3RhcnQgPSAweDIyMGZjMDAwLAogICAg
ICAgICAgICAgICAgICAgICAgICAudmlydF9zdGFydCA9IDB4MjIwZmMwMDAsCiAgICAgICAgICAg
ICAgICAgICAgICAgIC5zaXplID0gMHgyMDAwLAogICAgICAgICAgICAgICAgICAgICAgICAuZmxh
Z3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsCiAgICAg
ICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAu
cGh5c19zdGFydCA9IDB4MjIwZmUwMDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC52aXJ0X3N0
YXJ0ID0gMHgyMjBmZTAwMCwKICAgICAgICAgICAgICAgICAgICAgICAgLnNpemUgPSAweDIwMDAs
CiAgICAgICAgICAgICAgICAgICAgICAgIC5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEpBSUxI
T1VTRV9NRU1fUk9PVFNIQVJFRCwKICAgICAgICAgICAgICAgIH0sCiNlbmRpZgoKI2lmIGRlZmlu
ZWQoVVNFX0lWU0hNRU1fTkVUKQoJICAgICAgIAkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVn
aW9ucyAobmV0d29ya2luZykgKi8KCQlKQUlMSE9VU0VfU0hNRU1fTkVUX1JFR0lPTlMoMHgyMjEw
MDAwMCwgMCksCiNlbmRpZgoKCQkvKiBNZW1SZWdpb246IDAwMDAwMDAwLTAwMDlmYmZmIDogU3lz
dGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgw
LAoJCQkuc2l6ZSA9IDB4YTAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNF
X01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDAwMGEwMDAwLTAwMGJmZmZmIDogUENJIEJ1
cyAwMDAwOjAwICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4YTAwMDAsCgkJCS52aXJ0X3N0YXJ0
ID0gMHhhMDAwMCwKCQkJLnNpemUgPSAweDIwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVN
X1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiAwMDBmMDAw
MC0wMDBmZmZmZiA6IFN5c3RlbSBST00gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmMDAwMCwK
CQkJLnZpcnRfc3RhcnQgPSAweGYwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1S
ZWdpb246IDAwMTAwMDAwLTIxZmZmZmZmIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweDEwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDEwMDAwMCwKCQkJLnNpemUgPSAweDIx
ZjAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dS
SVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BLAoJCX0s
CgkJLyogTWVtUmVnaW9uOiAyNzIwMDAwMC0zZmZkN2ZmZiA6IFN5c3RlbSBSQU0gKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHgyNzIwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDI3MjAwMDAwLAoJ
CQkuc2l6ZSA9IDB4MThkZDgwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNF
X01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlMDAwMDAwLWZlN2ZmZmZmIDogMDAwMDow
MDowMS4wICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmUwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0
ID0gMHhmZTAwMDAwMCwKCQkJLnNpemUgPSAweDgwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNF
X01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZmU4
MDAwMDAtZmU4MDNmZmYgOiB2aXJ0aW8tcGNpLW1vZGVybiAqLwoJCXsKCQkJLnBoeXNfc3RhcnQg
PSAweGZlODAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmU4MDAwMDAsCgkJCS5zaXplID0gMHg0
MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
LAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZTgwNDAwMC1mZTgwN2ZmZiA6IHZpcnRpby1wY2ktbW9k
ZXJuICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmU4MDQwMDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHhmZTgwNDAwMCwKCQkJLnNpemUgPSAweDQwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlODA4MDAw
LWZlODBiZmZmIDogdmlydGlvLXBjaS1tb2Rlcm4gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhm
ZTgwODAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlODA4MDAwLAoJCQkuc2l6ZSA9IDB4NDAwMCwK
CQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9
LAoJCS8qIE1lbVJlZ2lvbjogZmU4MGMwMDAtZmU4MGZmZmYgOiB2aXJ0aW8tcGNpLW1vZGVybiAq
LwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlODBjMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmU4
MGMwMDAsCgkJCS5zaXplID0gMHg0MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQg
fCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWI4MDAwMC1mZWJi
ZmZmZiA6IDAwMDA6MDA6MDIuMCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlYjgwMDAwLAoJ
CQkudmlydF9zdGFydCA9IDB4ZmViODAwMDAsCgkJCS5zaXplID0gMHg0MDAwMCwKCQkJLmZsYWdz
ID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1l
bVJlZ2lvbjogZmViZDAwMDAtZmViZDNmZmYgOiAwMDAwOjAwOjFiLjAgKi8KCQl7CgkJCS5waHlz
X3N0YXJ0ID0gMHhmZWJkMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlYmQwMDAwLAoJCQkuc2l6
ZSA9IDB4NDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01F
TV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZmViZDcwMDAtZmViZDdmZmYgOiBlaGNpX2hj
ZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlYmQ3MDAwLAoJCQkudmlydF9zdGFydCA9IDB4
ZmViZDcwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWJkODAwMC1m
ZWJkOGZmZiA6IGFoY2kgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhmZWJkODAwMCwKCQkJLnZp
cnRfc3RhcnQgPSAweGZlYmQ4MDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lv
bjogZmVkMDAwMDAtZmVkMDAzZmYgOiBQTlAwMTAzOjAwICovCgkJewoJCQkucGh5c19zdGFydCA9
IDB4ZmVkMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZWQwMDAwMCwKCQkJLnNpemUgPSAweDEw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IDAwMGMwMDAwLTAwMGRmZmZmIDogUk9NcyAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweGMwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YzAwMDAsCgkJCS5zaXpl
ID0gMHgyMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01F
TV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMjI2MDAwMDAtMjcxZmZmZmYgOiBKQUlMSE9V
U0UgSW5tYXRlIE1lbW9yeSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDIyNjAwMDAwLAoJCQku
dmlydF9zdGFydCA9IDB4MjI2MDAwMDAsCgkJCS5zaXplID0gMHg0YzAwMDAwLAoJCQkuZmxhZ3Mg
PSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgl9LAoKCS5p
cnFjaGlwcyA9IHsKCQkvKiBJT0FQSUMgMCwgR1NJIGJhc2UgMCAqLwoJCXsKCQkJLmFkZHJlc3Mg
PSAweGZlYzAwMDAwLAoJCQkuaWQgPSAweGZmMDAsCgkJCS5waW5fYml0bWFwID0gewoJCQkJMHhm
ZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZgoJCQl9LAoJCX0sCgl9
LAoKCS5waW9fcmVnaW9ucyA9IHsKCQkvKiBQb3J0IEkvTzogMDAwMC0wMDFmIDogZG1hMSAqLwoJ
CS8qIFBJT19SQU5HRSgweDAsIDB4MjApLCAqLwoJCS8qIFBvcnQgSS9POiAwMDIwLTAwMjEgOiBw
aWMxICovCgkJLyogUElPX1JBTkdFKDB4MjAsIDB4MiksICovCgkJLyogUG9ydCBJL086IDAwNDAt
MDA0MyA6IHRpbWVyMCAqLwoJCVBJT19SQU5HRSgweDQwLCAweDQpLAoJCS8qIFBvcnQgSS9POiAw
MDUwLTAwNTMgOiB0aW1lcjEgKi8KCQkvKiBQSU9fUkFOR0UoMHg1MCwgMHg0KSwgKi8KCQkvKiBQ
b3J0IEkvTzogMDA2MC0wMDYwIDoga2V5Ym9hcmQgKi8KCQlQSU9fUkFOR0UoMHg2MCwgMHgxKSwK
CQkvKiBQb3J0IEkvTzogMDA2NC0wMDY0IDoga2V5Ym9hcmQgKi8KCQlQSU9fUkFOR0UoMHg2NCwg
MHgxKSwKCQkvKiBQb3J0IEkvTzogMDA3MC0wMDcxIDogcnRjMCAqLwoJCVBJT19SQU5HRSgweDcw
LCAweDIpLAoJCS8qIFBvcnQgSS9POiAwMDgwLTAwOGYgOiBkbWEgcGFnZSByZWcgKi8KCQkvKiBQ
SU9fUkFOR0UoMHg4MCwgMHgxMCksICovCgkJLyogUG9ydCBJL086IDAwYTAtMDBhMSA6IHBpYzIg
Ki8KCQkvKiBQSU9fUkFOR0UoMHhhMCwgMHgyKSwgKi8KCQkvKiBQb3J0IEkvTzogMDBjMC0wMGRm
IDogZG1hMiAqLwoJCS8qIFBJT19SQU5HRSgweGMwLCAweDIwKSwgKi8KCQkvKiBQb3J0IEkvTzog
MDBmMC0wMGZmIDogZnB1ICovCgkJLyogUElPX1JBTkdFKDB4ZjAsIDB4MTApLCAqLwoJCS8qIFBv
cnQgSS9POiAwMmY4LTAyZmYgOiBzZXJpYWwgKi8KCQlQSU9fUkFOR0UoMHgyZjgsIDB4OCksCgkJ
LyogUG9ydCBJL086IDAzYzAtMDNkZiA6IHZnYSsgKi8KCQlQSU9fUkFOR0UoMHgzYzAsIDB4MjAp
LAoJCS8qIFBvcnQgSS9POiAwM2Y4LTAzZmYgOiBzZXJpYWwgKi8KCQlQSU9fUkFOR0UoMHgzZjgs
IDB4OCksCgkJUElPX1JBTkdFKDB4M2U4LCAweDgpLAoJCS8qIFBvcnQgSS9POiAwNTEwLTA1MWIg
OiBRRU1VMDAwMjowMCAqLwoJCS8qIFBJT19SQU5HRSgweDUxMCwgMHhjKSwgKi8KCQkvKiBQb3J0
IEkvTzogMDYwMC0wNjAzIDogQUNQSSBQTTFhX0VWVF9CTEsgKi8KCQkvKiBQSU9fUkFOR0UoMHg2
MDAsIDB4NCksICovCgkJLyogUG9ydCBJL086IDA2MDQtMDYwNSA6IEFDUEkgUE0xYV9DTlRfQkxL
ICovCgkJLyogUElPX1JBTkdFKDB4NjA0LCAweDIpLCAqLwoJCS8qIFBvcnQgSS9POiAwNjA4LTA2
MGIgOiBBQ1BJIFBNX1RNUiAqLwoJCS8qIFBJT19SQU5HRSgweDYwOCwgMHg0KSwgKi8KCQkvKiBQ
b3J0IEkvTzogMDYyMC0wNjJmIDogQUNQSSBHUEUwX0JMSyAqLwoJCS8qIFBJT19SQU5HRSgweDYy
MCwgMHgxMCksICovCgkJLyogUG9ydCBJL086IDA3MDAtMDczZiA6IGk4MDFfc21idXMgKi8KCQkv
KiBQSU9fUkFOR0UoMHg3MDAsIDB4NDApLCAqLwoJCS8qIFBvcnQgSS9POiBjMDAwLWMwN2YgOiAw
MDAwOjAwOjA0LjAgKi8KCQlQSU9fUkFOR0UoMHhjMDAwLCAweDgwKSwKCQkvKiBQb3J0IEkvTzog
YzBjMC1jMGRmIDogMDAwMDowMDowMi4wICovCgkJUElPX1JBTkdFKDB4YzBjMCwgMHgyMCksCgkJ
LyogUG9ydCBJL086IGMwZTAtYzBmZiA6IDAwMDA6MDA6MDMuMCAqLwoJCVBJT19SQU5HRSgweGMw
ZTAsIDB4MjApLAoJCS8qIFBvcnQgSS9POiBjMTAwLWMxMWYgOiAwMDAwOjAwOjFkLjAgKi8KCQlQ
SU9fUkFOR0UoMHhjMTAwLCAweDIwKSwKCQkvKiBQb3J0IEkvTzogYzEyMC1jMTNmIDogMDAwMDow
MDoxZC4xICovCgkJUElPX1JBTkdFKDB4YzEyMCwgMHgyMCksCgkJLyogUG9ydCBJL086IGMxNDAt
YzE1ZiA6IDAwMDA6MDA6MWQuMiAqLwoJCVBJT19SQU5HRSgweGMxNDAsIDB4MjApLAoJCS8qIFBv
cnQgSS9POiBjMTYwLWMxN2YgOiAwMDAwOjAwOjFmLjIgKi8KCQlQSU9fUkFOR0UoMHhjMTYwLCAw
eDIwKSwKCX0sCgoJLnBjaV9kZXZpY2VzID0gewoJCS8qIFBDSURldmljZTogMDA6MDAuMCAqLwoJ
CXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJ
CQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAw
LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21h
c2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6
ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MDEuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9t
bXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHg4LAoJCQkuYmFyX21hc2sgPSB7
CgkJCQkweGZmODAwMDAwLCAweDAwMDAwMDAwLCAweGZmZmZjMDAwLAoJCQkJMHhmZmZmZmZmZiwg
MHhmZmZmZjAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVt
X2NhcHMgPSA2LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAzLAoJCQkubXNpeF9y
ZWdpb25fc2l6ZSA9IDB4MTAwMCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4ZmViZDQwMDAsCgkJfSwK
CQkvKiBQQ0lEZXZpY2U6IDAwOjAyLjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9U
WVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMCwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4
MTAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmZmZTAsIDB4ZmZmZmYwMDAsIDB4MDAwMDAw
MDAsCgkJCQkweDAwMDAwMDAwLCAweGZmZmZjMDAwLCAweGZmZmZmZmZmLAoJCQl9LAoJCQkuY2Fw
c19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDYsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJ
CQkubXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVj
dG9ycyA9IDMsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHhmZWJkNTAwMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MDMuMCAqLwoJCXsKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWlu
ID0gMHgwLAoJCQkuYmRmID0gMHgxOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZmZmZlMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4ZmZmZmMwMDAsIDB4ZmZm
ZmZmZmYsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gNiwKCQkJLm51bV9jYXBzID0gNSwKCQkJLm51
bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9
IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAs
CgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjA0LjAgKi8K
CQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMCwK
CQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MjAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
ZmZmZmZmODAsIDB4ZmZmZmYwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweGZmZmZj
MDAwLCAweGZmZmZmZmZmLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9
IDYsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lf
bWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDIsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0gMHhmZWJkNjAwMCwKCQl9LAoJCS8qIFBD
SURldmljZTogMDA6MWIuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVW
SUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhkOCwKCQkJ
LmJhcl9tYXNrID0gewoJCQkJMHhmZmZmYzAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0
ID0gMTEsCgkJCS5udW1fY2FwcyA9IDEsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQkubXNp
XzY0Yml0cyA9IDEsCgkJCS5tc2lfbWFza2FibGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9
IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiAwMDoxZC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDAsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweGU4LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHhmZmZmZmZlMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJ
LmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0g
MCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4
X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVz
cyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWQuMSAqLwoJCXsKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgw
LAoJCQkuYmRmID0gMHhlOSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4ZmZmZmZmZTAsIDB4MDAwMDAwMDAs
CgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lf
dmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJ
CS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5t
c2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFkLjIgKi8KCQl7CgkJ
CS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMCwKCQkJLmRv
bWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZWEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweGZmZmZmZmUwLCAw
eDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJ
CS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5tc2lfbWFza2Fi
bGUgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0g
MHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxZC43
ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9
IDAsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGVmLAoJCQkuYmFyX21hc2sgPSB7CgkJ
CQkweGZmZmZmMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2Nh
cHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQku
bXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdp
b25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmlj
ZTogMDA6MWYuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJ
CQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhmOCwKCQkJLmJhcl9t
YXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwK
CQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRz
ID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJ
Lm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkv
KiBQQ0lEZXZpY2U6IDAwOjFmLjIgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBF
X0RFVklDRSwKCQkJLmlvbW11ID0gMCwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZmEs
CgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCQkweDAwMDAwMDAwLCAweGZmZmZmZmUwLCAweGZmZmZmMDAwLAoJCQl9LAoJCQkuY2Fwc19z
dGFydCA9IDEyLAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJ
Lm1zaV82NGJpdHMgPSAxLAoJCQkubXNpX21hc2thYmxlID0gMCwKCQkJLm51bV9tc2l4X3ZlY3Rv
cnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4
MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWYuMyAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9V
U0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQku
YmRmID0gMHhmYiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4ZmZmZmZmYzAsIDB4MDAwMDAwMDAsCgkJCX0s
CgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9y
cyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm1zaV9tYXNrYWJsZSA9IDAsCgkJCS5udW1f
bXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2Fk
ZHJlc3MgPSAweDAsCgkJfSwKI2lmIGRlZmluZWQgVVNFX1ZJUlRJT19CTEsKICAgICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVf
SVZTSE1FTSwKICAgICAgICAgICAgICAgICAgICAgICAgLmlvbW11ID0gMSwKICAgICAgICAgICAg
ICAgICAgICAgICAgLmRvbWFpbiA9IDB4MCwKICAgICAgICAgICAgICAgICAgICAgICAgLmJkZiA9
IDB4MGMgPDwgMywKICAgICAgICAgICAgICAgICAgICAgICAgLmJhcl9tYXNrID0gSkFJTEhPVVNF
X0lWU0hNRU1fQkFSX01BU0tfTVNJWCwKICAgICAgICAgICAgICAgICAgICAgICAgLm51bV9tc2l4
X3ZlY3RvcnMgPSAyLAogICAgICAgICAgICAgICAgICAgICAgICAuc2htZW1fcmVnaW9uc19zdGFy
dCA9IDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaG1lbV9kZXZfaWQgPSAwLAogICAgICAg
ICAgICAgICAgICAgICAgICAuc2htZW1fcGVlcnMgPSAyLAogICAgICAgICAgICAgICAgICAgICAg
ICAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVklSVElPX0ZST05UICsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWSVJUSU9fREVWX0JMT0NLLAogICAgICAg
ICAgICAgICAgfSwKI2VuZGlmCgojaWYgZGVmaW5lZCBVU0VfVklSVElPX0NPTgogICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQ
RV9JVlNITUVNLAogICAgICAgICAgICAgICAgICAgICAgICAuaW9tbXUgPSAxLAogICAgICAgICAg
ICAgICAgICAgICAgICAuZG9tYWluID0gMHgwLAogICAgICAgICAgICAgICAgICAgICAgICAuYmRm
ID0gMHgwZCA8PCAzLAogICAgICAgICAgICAgICAgICAgICAgICAuYmFyX21hc2sgPSBKQUlMSE9V
U0VfSVZTSE1FTV9CQVJfTUFTS19NU0lYLAogICAgICAgICAgICAgICAgICAgICAgICAubnVtX21z
aXhfdmVjdG9ycyA9IDMsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaG1lbV9yZWdpb25zX3N0
YXJ0ID0gQkxLX01FTSwgLyogMCArIEJMS19NRU0gKi8KICAgICAgICAgICAgICAgICAgICAgICAg
LnNobWVtX2Rldl9pZCA9IDAsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaG1lbV9wZWVycyA9
IDIsCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9T
SE1FTV9QUk9UT19WSVJUSU9fRlJPTlQgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFZJUlRJT19ERVZfQ09OU09MRSwKICAgICAgICAgICAgICAgIH0sCiNlbmRpZgoKI2lmIGRlZmlu
ZWQgVVNFX0lWU0hNRU1fREVNTwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
ICAgICAudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9JVlNITUVNLAoJCQkuaW9tbXUgPSAxLAog
ICAgICAgICAgICAgICAgICAgICAgICAuZG9tYWluID0gMHgwLAogICAgICAgICAgICAgICAgICAg
ICAgICAuYmRmID0gMHgwZSA8PCAzLAogICAgICAgICAgICAgICAgICAgICAgICAuYmFyX21hc2sg
PSBKQUlMSE9VU0VfSVZTSE1FTV9CQVJfTUFTS19NU0lYLAogICAgICAgICAgICAgICAgICAgICAg
ICAubnVtX21zaXhfdmVjdG9ycyA9IDE2LAogICAgICAgICAgICAgICAgICAgICAgICAuc2htZW1f
cmVnaW9uc19zdGFydCA9IEJMS19NRU0gKyBDT05fTUVNLAogICAgICAgICAgICAgICAgICAgICAg
ICAuc2htZW1fZGV2X2lkID0gMCwKICAgICAgICAgICAgICAgICAgICAgICAgLnNobWVtX3BlZXJz
ID0gMywKICAgICAgICAgICAgICAgICAgICAgICAgLnNobWVtX3Byb3RvY29sID0gSkFJTEhPVVNF
X1NITUVNX1BST1RPX1VOREVGSU5FRCwKICAgICAgICAgICAgICAgIH0sCiNlbmRpZgoKI2lmIGRl
ZmluZWQgVVNFX1ZJUlRJT19ORVQKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSwKICAgICAgICAgICAgICAg
ICAgICAgICAgLmlvbW11ID0gMSwKICAgICAgICAgICAgICAgICAgICAgICAgLmRvbWFpbiA9IDB4
MCwKICAgICAgICAgICAgICAgICAgICAgICAgLmJkZiA9IDB4MGYgPDwgMywKICAgICAgICAgICAg
ICAgICAgICAgICAgLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfTVNJWCwK
ICAgICAgICAgICAgICAgICAgICAgICAgLm51bV9tc2l4X3ZlY3RvcnMgPSAyLAogICAgICAgICAg
ICAgICAgICAgICAgICAuc2htZW1fcmVnaW9uc19zdGFydCA9IEJMS19NRU0gKyBDT05fTUVNICsg
REVNT19NRU0sCiAgICAgICAgICAgICAgICAgICAgICAgIC5zaG1lbV9kZXZfaWQgPSAwLAogICAg
ICAgICAgICAgICAgICAgICAgICAuc2htZW1fcGVlcnMgPSAyLAogICAgICAgICAgICAgICAgICAg
ICAgICAuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVkVUSCwKICAgICAg
ICAgICAgICAgIH0sCiNlbmRpZgoJfSwKCgkucGNpX2NhcHMgPSB7CgkJLyogUENJRGV2aWNlOiAw
MDowMS4wICovCgkJLyogUENJRGV2aWNlOiAwMDowMi4wICovCgkJLyogUENJRGV2aWNlOiAwMDow
NC4wICovCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSVgsCgkJCS5zdGFydCA9IDB4OTgsCgkJ
CS5sZW4gPSAweGMsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJ
ewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1ZORFIsCgkJCS5zdGFydCA9IDB4ODQsCgkJCS5sZW4gPSAw
eDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfVk5EUiwKCQkJ
LnN0YXJ0ID0gMHg3MCwKCQkJLmxlbiA9IDB4MiwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJ
LmlkID0gUENJX0NBUF9JRF9WTkRSLAoJCQkuc3RhcnQgPSAweDYwLAoJCQkubGVuID0gMHgyLAoJ
CQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1ZORFIsCgkJCS5zdGFy
dCA9IDB4NTAsCgkJCS5sZW4gPSAweDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9
IFBDSV9DQVBfSURfVk5EUiwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDB4MiwKCQkJLmZs
YWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MDMuMCAqLwoJCXsKCQkJLmlkID0gUENJ
X0NBUF9JRF9WTkRSLAoJCQkuc3RhcnQgPSAweDg0LAoJCQkubGVuID0gMHgyLAoJCQkuZmxhZ3Mg
PSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1ZORFIsCgkJCS5zdGFydCA9IDB4NzAs
CgkJCS5sZW4gPSAweDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBf
SURfVk5EUiwKCQkJLnN0YXJ0ID0gMHg2MCwKCQkJLmxlbiA9IDB4MiwKCQkJLmZsYWdzID0gMCwK
CQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9WTkRSLAoJCQkuc3RhcnQgPSAweDUwLAoJCQku
bGVuID0gMHgyLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX1ZO
RFIsCgkJCS5zdGFydCA9IDB4NDAsCgkJCS5sZW4gPSAweDIsCgkJCS5mbGFncyA9IDAsCgkJfSwK
CQkvKiBQQ0lEZXZpY2U6IDAwOjFiLjAgKi8KCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfTVNJLAoJ
CQkuc3RhcnQgPSAweDYwLAoJCQkubGVuID0gMHhlLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJ
Q0FQU19XUklURSwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWYuMiAqLwoJCXsKCQkJLmlkID0g
UENJX0NBUF9JRF9NU0ksCgkJCS5zdGFydCA9IDB4ODAsCgkJCS5sZW4gPSAweGUsCgkJCS5mbGFn
cyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lfQ0FQX0lE
X1NBVEEsCgkJCS5zdGFydCA9IDB4YTgsCgkJCS5sZW4gPSAweDIsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCX0sCn07CiAK
--0000000000009815e605c9fc7245
Content-Type: text/x-csrc; charset="US-ASCII"; name="agl-linux-non-root-cell.c"
Content-Disposition: attachment; filename="agl-linux-non-root-cell.c"
Content-Transfer-Encoding: base64
Content-ID: <f_kskauqlq1>
X-Attachment-Id: f_kskauqlq1

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvbmZpZ3VyYXRpb24gZm9yIExpbnV4IGlubWF0ZSwgMSBDUFUsIDc0IE1CIFJBTSwgfjFN
QiBzaG1lbSwgc2VyaWFsIHBvcnRzCiAqCiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAx
My0yMDE1CiAqCiAqIEF1dGhvcnM6CiAqICBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMu
Y29tPgogKgogKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR1BMLCB2ZXJzaW9uIDIuICBTZWUKICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxl
dmVsIGRpcmVjdG9yeS4KICovCgovLyBGb3IgZXh0ZW5kaW5nIHRoZSB2aXJ0aW8tYmxrIG92ZXIg
SVZTSE1FTS4KI2RlZmluZSBVU0VfVklSVElPX0JMSwovLyNkZWZpbmUgVVNFX1ZJUlRJT19ORVQK
Ly8jZGVmaW5lIFVTRV9WSVJUSU9fQ09OCi8vI2RlZmluZSBVU0VfVklSVElPX0RFTU8KCiNpZmRl
ZiBVU0VfVklSVElPX0JMSwojIGRlZmluZSBCTEtfTUVNIDQKIyBkZWZpbmUgQkxLX1BDSSAxCiNl
bHNlCiMgZGVmaW5lIEJMS19NRU0gMAojIGRlZmluZSBCTEtfUENJIDAKI2VuZGlmCgojaWZkZWYg
VVNFX0lWU0hNRU1fREVNTwojIGRlZmluZSBERU1PX01FTSA1CiMgZGVmaW5lIERFTU9fUENJIDEK
I2Vsc2UKIyBkZWZpbmUgREVNT19NRU0gMAojIGRlZmluZSBERU1PX1BDSSAwCiNlbmRpZgoKI2lm
ZGVmIFVTRV9JVlNITUVNX05FVAojIGRlZmluZSBORVRfTUVNIDQKIyBkZWZpbmUgTkVUX1BDSSAx
CiNlbHNlCiMgZGVmaW5lIE5FVF9NRU0gMAojIGRlZmluZSBORVRfUENJIDAKI2VuZGlmCgojaWZk
ZWYgVVNFX1ZJUlRJT19DT04KIyBkZWZpbmUgQ09OX01FTSA0CiMgZGVmaW5lIENPTl9QQ0kgMQoj
ZWxzZQojIGRlZmluZSBDT05fTUVNIDAKIyBkZWZpbmUgQ09OX1BDSSAwCiNlbmRpZgoKI2RlZmlu
ZSBDT01NX01FTV9SRUdJT05TIChCTEtfTUVNICsgQ09OX01FTSArIE5FVF9NRU0gKyBERU1PX01F
TSkKI2RlZmluZSBDT01NX1BDSV9SRUdJT05TIChCTEtfUENJICsgQ09OX1BDSSArIE5FVF9QQ0kg
KyBERU1PX1BDSSkKCiNpbmNsdWRlIDxqYWlsaG91c2UvdHlwZXMuaD4KI2luY2x1ZGUgPGphaWxo
b3VzZS9jZWxsLWNvbmZpZy5oPgoKc3RydWN0IHsKCXN0cnVjdCBqYWlsaG91c2VfY2VsbF9kZXNj
IGNlbGw7CglfX3U2NCBjcHVzWzFdOwojaWZkZWYgQ09ORklHX1FFTVVfRTEwMDBFX0FTU0lHTk1F
TlQKCXN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzcgKyBDT01NX01FTV9SRUdJ
T05TXTsKI2Vsc2UKCXN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25zWzMgKyBDT01N
X01FTV9SRUdJT05TXTsKI2VuZGlmCglzdHJ1Y3QgamFpbGhvdXNlX2NhY2hlIGNhY2hlX3JlZ2lv
bnNbMV07CglzdHJ1Y3QgamFpbGhvdXNlX2lycWNoaXAgaXJxY2hpcHNbMV07CglzdHJ1Y3QgamFp
bGhvdXNlX3BpbyBwaW9fcmVnaW9uc1syXTsKI2lmZGVmIENPTkZJR19RRU1VX0UxMDAwRV9BU1NJ
R05NRU5UCglzdHJ1Y3QgamFpbGhvdXNlX3BjaV9kZXZpY2UgcGNpX2RldmljZXNbMSArIENPTU1f
UENJX1JFR0lPTlNdOwojZWxzZQoJc3RydWN0IGphaWxob3VzZV9wY2lfZGV2aWNlIHBjaV9kZXZp
Y2VzW0NPTU1fUENJX1JFR0lPTlNdOwojZW5kaWYKCXN0cnVjdCBqYWlsaG91c2VfcGNpX2NhcGFi
aWxpdHkgcGNpX2NhcHNbNl07Cn0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgY29uZmlnID0gewoJ
LmNlbGwgPSB7CgkJLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9DRUxMX0RFU0NfU0lHTkFUVVJFLAoJ
CS5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04sCgkJLm5hbWUgPSAiYWdsLWxp
bnV4LXg4Ni1kZW1vIiwKCQkuZmxhZ3MgPSBKQUlMSE9VU0VfQ0VMTF9QQVNTSVZFX0NPTU1SRUcg
fAoJCQkgSkFJTEhPVVNFX0NFTExfVklSVFVBTF9DT05TT0xFX1BFUk1JVFRFRCwKCgkJLmNwdV9z
ZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJLm51bV9tZW1vcnlfcmVnaW9ucyA9IEFS
UkFZX1NJWkUoY29uZmlnLm1lbV9yZWdpb25zKSwKCQkubnVtX2NhY2hlX3JlZ2lvbnMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5jYWNoZV9yZWdpb25zKSwKCQkubnVtX2lycWNoaXBzID0gQVJSQVlfU0la
RShjb25maWcuaXJxY2hpcHMpLAoJCS5udW1fcGlvX3JlZ2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZp
Zy5waW9fcmVnaW9ucyksCgkJLm51bV9wY2lfZGV2aWNlcyA9IEFSUkFZX1NJWkUoY29uZmlnLnBj
aV9kZXZpY2VzKSwKCQkubnVtX3BjaV9jYXBzID0gQVJSQVlfU0laRShjb25maWcucGNpX2NhcHMp
LAoJfSwKCgkuY3B1cyA9IHsKCQkwYjExMDAsCgl9LAoKCS5tZW1fcmVnaW9ucyA9IHsKI2lmIGRl
ZmluZWQgVVNFX1ZJUlRJT19CTEsKCQkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9uICh2
aXJ0aW8tYmxrIGZyb250KSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDI2ZTAwMDAwLAoJCQku
dmlydF9zdGFydCA9IDB4MjZlMDAwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1JPT1RTSEFSRUQsCgkJfSwKCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHgyNmUwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDI2ZTAwMDAwLAoJ
CQkuc2l6ZSA9IDB4ZGYwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUgfCAKCQkJCUpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwKCQl9LAoJCXsg
MCB9LAoJCXsgMCB9LAojZW5kaWYKI2lmIGRlZmluZWQgVVNFX0lWU0hNRU1fQ09OCgkJLyogSVZT
SE1FTSBzaGFyZWQgbWVtb3J5IHJlZ2lvbiAodmlydGlvLWNvbiBmcm9udCkgKi8KCQl7CgkJCS5w
aHlzX3N0YXJ0ID0gMHgyMjBlMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDIyMGUwMDAwLAoJCQku
c2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNF
X01FTV9ST09UU0hBUkVELAoJCX0sCgkJewoJCQkucGh5c19zdGFydCA9IDB4MjIwZTEwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHgyMjBlMTAwMCwKCQkJLnNpemUgPSAweGYwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNF
X01FTV9ST09UU0hBUkVELAoJCX0sCgkJeyAwIH0sCgkJeyAwIH0sCiNlbmRpZgojaWYgZGVmaW5l
ZCBVU0VfSVZTSE1FTV9ERU1PCgkJLyogSVZTSE1FTSBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMgKGRl
bW8pICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4MjIwZjAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHgyMjBmMDAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwKCQl9LAoJCXsKCQkJLnBoeXNfc3RhcnQg
PSAweDIyMGYxMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MjIwZjEwMDAsCgkJCS5zaXplID0gMHg5
MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
IHwKCQkJCUpBSUxIT1VTRV9NRU1fUk9PVFNIQVJFRCwKCQl9LAoJCXsKCQkJLnBoeXNfc3RhcnQg
PSAweDIyMGZhMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MjIwZmEwMDAsCgkJCS5zaXplID0gMHgy
MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1JPT1RT
SEFSRUQsCgkJfSwKCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgyMjBmYzAwMCwKCQkJLnZpcnRfc3Rh
cnQgPSAweDIyMGZjMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNF
X01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCgkJewoJCQkucGh5c19z
dGFydCA9IDB4MjIwZmUwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgyMjBmZTAwMCwKCQkJLnNpemUg
PSAweDIwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9ST09UU0hBUkVELAoJCX0sCiNlbmRpZgojaWYgZGVm
aW5lZCBVU0VfSVZTSE1FTV9ORVQKCQkvKiBJVlNITUVNIHNoYXJlZCBtZW1vcnkgcmVnaW9ucyAo
bmV0d29ya2luZykgKi8KCQlKQUlMSE9VU0VfU0hNRU1fTkVUX1JFR0lPTlMoMHgyMjEwMDAwMCwg
MSksCiNlbmRpZgoJCS8qIGxvdyBSQU0gKi8gewoJCQkucGh5c19zdGFydCA9IDB4MjI2MDAwMDAs
CgkJCS52aXJ0X3N0YXJ0ID0gMCwKCQkJLnNpemUgPSAweDAwMTAwMDAwLAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9N
RU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BIHwKCQkJCUpBSUxIT1VTRV9NRU1fTE9BREFC
TEUsCgkJfSwKCQkvKiBjb21tdW5pY2F0aW9uIHJlZ2lvbiAqLyB7CgkJCS52aXJ0X3N0YXJ0ID0g
MHgwMDEwMDAwMCwKCQkJLnNpemUgPSAweDAwMDAxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fQ09NTV9S
RUdJT04sCgkJfSwKCQkvKiBoaWdoIFJBTSAqLyB7CgkJCS5waHlzX3N0YXJ0ID0gMHgyMjcwMDAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweDAwMjAwMDAwLAoJCQkuc2l6ZSA9IDB4NDcwMDAwMCwKCQkJ
LmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlK
QUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSB8CgkJCQlKQUlMSE9VU0Vf
TUVNX0xPQURBQkxFLAoJCX0sCiNpZmRlZiBDT05GSUdfUUVNVV9FMTAwMEVfQVNTSUdOTUVOVAoJ
CS8qIE1lbVJlZ2lvbjogZmViNDAwMDAtZmViN2ZmZmYgOiAwMDAwOjAwOjAyLjAgKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHhmZWI0MDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlYjQwMDAwLAoJ
CQkuc2l6ZSA9IDB4NDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGZlYjgwMDAwLWZlYjlmZmZmIDog
ZTEwMDBlICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmViODAwMDAsCgkJCS52aXJ0X3N0YXJ0
ID0gMHhmZWI4MDAwMCwKCQkJLnNpemUgPSAweDIwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWJh
MDAwMC1mZWJiZmZmZiA6IGUxMDAwZSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlYmEwMDAw
LAoJCQkudmlydF9zdGFydCA9IDB4ZmViYTAwMDAsCgkJCS5zaXplID0gMHgyMDAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8q
IE1lbVJlZ2lvbjogZmViZDEwMDAtZmViZDNmZmYgOiBlMTAwMGUgKi8KCQl7CgkJCS5waHlzX3N0
YXJ0ID0gMHhmZWJkMTAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZlYmQxMDAwLAoJCQkuc2l6ZSA9
IDB4MzAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSwKCQl9LAojZW5kaWYKCX0sCgoJLmNhY2hlX3JlZ2lvbnMgPSB7CgkJewoJCQkuc3RhcnQg
PSAwLAoJCQkuc2l6ZSA9IDIsCgkJCS50eXBlID0gSkFJTEhPVVNFX0NBQ0hFX0wzLAoJCX0sCgl9
LAoKCS5pcnFjaGlwcyA9IHsKCQkvKiBJT0FQSUMgKi8gewoJCQkuYWRkcmVzcyA9IDB4ZmVjMDAw
MDAsCgkJCS5pZCA9IDB4ZmYwMCwKCQkJLnBpbl9iaXRtYXAgPSB7CgkJCQkoMSA8PCAzKSB8ICgx
IDw8IDQpLAoJCQl9LAoJCX0sCgl9LAoKCS5waW9fcmVnaW9ucyA9IHsKCQlQSU9fUkFOR0UoMHgy
ZTgsIDgpLCAvKiBzZXJpYWwgMjogdHR5UzMoMHgyZTgpICovCgkJUElPX1JBTkdFKDB4M2U4LCA4
KSwgLyogc2VyaWFsIDE6IHR0eVMyKDB4M2U4KSAqLwovLwkJUElPX1JBTkdFKDB4ZTAxMCwgOCks
IC8qIE9YUENJZTk1MiBzZXJpYWwxICovCgl9LAoKCS5wY2lfZGV2aWNlcyA9IHsKI2lmIGRlZmlu
ZWQgVVNFX1ZJUlRJT19CTEsKCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0lWU0hN
RU0sCgkJCS8vLmlvbW11ID0gMSwKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MGMgPDwg
MywKCQkJLmJhcl9tYXNrID0gSkFJTEhPVVNFX0lWU0hNRU1fQkFSX01BU0tfTVNJWCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAyLAoJCQkuc2htZW1fcmVnaW9uc19zdGFydCA9IDAsCgkJCS5zaG1l
bV9kZXZfaWQgPSAxLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJvdG9jb2wgPSBK
QUlMSE9VU0VfU0hNRU1fUFJPVE9fVklSVElPX0ZST05UICsKCQkJCVZJUlRJT19ERVZfQkxPQ0ss
CgkJfSwKI2VuZGlmCiNpZiBkZWZpbmVkIFVTRV9JVlNITUVNX0NPTgoJCXsKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfSVZTSE1FTSwKCQkJLy8uaW9tbXUgPSAxLAoJCQkuZG9tYWluID0g
MHgwLAoJCQkuYmRmID0gMHgwZCA8PCAzLAoJCQkuYmFyX21hc2sgPSBKQUlMSE9VU0VfSVZTSE1F
TV9CQVJfTUFTS19NU0lYLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDMsCgkJCS5zaG1lbV9yZWdp
b25zX3N0YXJ0ID0gQkxLX01FTSwgLyogMCArIEJMS19NRU0gKi8KCQkJLnNobWVtX2Rldl9pZCA9
IDEsCgkJCS5zaG1lbV9wZWVycyA9IDIsCgkJCS5zaG1lbV9wcm90b2NvbCA9IEpBSUxIT1VTRV9T
SE1FTV9QUk9UT19WSVJUSU9fRlJPTlQgKwoJCQkJVklSVElPX0RFVl9DT05TT0xFLAoJCX0sCiNl
bmRpZgojaWYgZGVmaW5lZCBVU0VfSVZTSE1FTV9ERU1PCgkJewoJCQkudHlwZSA9IEpBSUxIT1VT
RV9QQ0lfVFlQRV9JVlNITUVNLAoJCQkvLy5pb21tdSA9IDEsCgkJCS5kb21haW4gPSAweDAsCgkJ
CS5iZGYgPSAweDBlIDw8IDMsCgkJCS5iYXJfbWFzayA9IEpBSUxIT1VTRV9JVlNITUVNX0JBUl9N
QVNLX01TSVgsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMTYsCgkJCS5zaG1lbV9yZWdpb25zX3N0
YXJ0ID0gQkxLX01FTSArIENPTl9NRU0sCgkJCS5zaG1lbV9kZXZfaWQgPSAyLAoJCQkuc2htZW1f
cGVlcnMgPSAzLAoJCQkuc2htZW1fcHJvdG9jb2wgPSBKQUlMSE9VU0VfU0hNRU1fUFJPVE9fVU5E
RUZJTkVELAoJCX0sCiNlbmRpZgojaWYgZGVmaW5lZCBVU0VfSVZTSE1FTV9ORVQKCQl7CgkJCS50
eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0lWU0hNRU0sCgkJCS8vLmlvbW11ID0gMSwKCQkJLmRv
bWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MGYgPDwgMywKCQkJLmJhcl9tYXNrID0gSkFJTEhPVVNF
X0lWU0hNRU1fQkFSX01BU0tfTVNJWCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAyLAoJCQkuc2ht
ZW1fcmVnaW9uc19zdGFydCA9IEJMS19NRU0gKyBDT05fTUVNICsgREVNT19NRU0sCgkJCS5zaG1l
bV9kZXZfaWQgPSAxLAoJCQkuc2htZW1fcGVlcnMgPSAyLAoJCQkuc2htZW1fcHJvdG9jb2wgPSBK
QUlMSE9VU0VfU0hNRU1fUFJPVE9fVkVUSCwKCQl9LAojZW5kaWYKI2lmZGVmIENPTkZJR19RRU1V
X0UxMDAwRV9BU1NJR05NRU5UCgkJeyAvKiBlMTAwMGUgKi8KCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuZG9tYWluID0gMHgwMDAwLAoJCQkuYmRmID0gMHgwMDEwLAoJ
CQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAwLCAweGZmZmUwMDAwLCAweGZmZmZmZmUwLAoJ
CQkJMHhmZmZmYzAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3Rh
cnQgPSAwLAoJCQkubnVtX2NhcHMgPSA2LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1z
aV82NGJpdHMgPSAxLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDUsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0gMHhmZWJkMDAwMCwKCQl9LAojZW5kaWYK
CX0sCgoJLnBjaV9jYXBzID0gewoJCXsgLyogZTEwMDBlICovCgkJCS5pZCA9IFBDSV9DQVBfSURf
UE0sCgkJCS5zdGFydCA9IDB4YzgsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
UENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gUENJX0NBUF9JRF9NU0ksCgkJCS5zdGFy
dCA9IDB4ZDAsCgkJCS5sZW4gPSAxNCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJ
VEUsCgkJfSwKCQl7CgkJCS5pZCA9IFBDSV9DQVBfSURfRVhQLAoJCQkuc3RhcnQgPSAweGUwLAoJ
CQkubGVuID0gMjAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJ
ewoJCQkuaWQgPSBQQ0lfQ0FQX0lEX01TSVgsCgkJCS5zdGFydCA9IDB4YTAsCgkJCS5sZW4gPSAx
MiwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9
IFBDSV9FWFRfQ0FQX0lEX0VSUiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0g
MHgxMDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSBQQ0lf
RVhUX0NBUF9JRF9EU04gfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTQw
LAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJfQp9Owo=
--0000000000009815e605c9fc7245--
