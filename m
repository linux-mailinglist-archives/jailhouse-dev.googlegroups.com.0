Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBIGI72EAMGQEGHXKVTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757A3F2C6A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 14:46:25 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id r25-20020a2e7619000000b001b9769d3d54sf3156578ljc.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 05:46:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629463585; cv=pass;
        d=google.com; s=arc-20160816;
        b=QmonCk84OmbeW1sAwIIfwxN1Dxh7+sqnWmsO0snFY3AuuGLbsf/S9xBfgwHePTQF0v
         wUEIOkj4a1vjpVIZpV7oy/OPNYK1fnk8V5LK0lilKxKaY6VQZd96vyltB159eTVGD1ch
         qtqjAfmhI+0XMKN8o2xY4gYVYpGIMsNWVN1UJnyVZQndYfY3eOqlknmMsOL3IcZMe5cx
         WfkjMOtXHy+qfoAser9virVAXb3Se0UYDL1GTzNigEwEJfBETx1jcWir5RrKK4ZfXhPh
         3qAU3AUdDuOopq8/aQOwZsLIQxTrz3EO7WkV2hRiV/URCZPYbqIcFpAN6Td1KF1UBIU9
         vUeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=WDGQ8/pGVPA8Gg+fdtiUe7UeGtSfbX+i5CghMM69xuQ=;
        b=fzRDHIlcyZm9SYyn3iIBsBTTLa9aKztcUvRditv9wRhMTO/lvPl0RPT9k3fnBPqDC8
         lH81ZDcKxgZ2S3qX/1Yei1tSwsmsta4LR6pcbDiufkoL+NtN2DFSw0SDEkXNQ4BCQv2C
         ukMee7M37d2Nx1eIx6/qY7TT4kJRIc8kbekS8hv/A07ghKeVc7FgvhrrFJlMaWfdOXKy
         fVgyHap+Yd4U1oYIsIC7P4+23C58BWvaKPsNngxTnZBBRJLDj8Pzec9PGsMedYLfnatG
         LUTcfB6D1hl0+Weg0s7O6OlPVAtcwSr+hzc3qijAl87CMPowJU87zv7IGBF2uW/TGlNX
         43Dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9nutuSs;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WDGQ8/pGVPA8Gg+fdtiUe7UeGtSfbX+i5CghMM69xuQ=;
        b=Whc5SDlaYEAxMxJWUIeoz3XixDA6ADL9Lv2WP3ywhDIWax8m3MY/8TBHXAtyoxcnZh
         6HoplRMLAZgU8X1PdoOl/OuyfPktB1JLwvsC+3zUtcQTP4ujYrmuUetpHpCWW/JsPMbt
         iuJpE9lRBl/CoqYQXvz6Dj+r80STG4tclSprN5rwKtXQd9FVr9s+/RenNFEuGZRCM82/
         HzPRzP1nffCHSvMtTblCkWoeqYl5SdKp+fiIcPq0Qai6hc9uQYSnraAKIS3K3Wt4Jjhy
         6YYo+D3u39bMKYxCUv8kdgZtQqkbpXABJp4bp+BixbsidWJ9VTQ9pqGHjt5GFmTiR0Ey
         tvuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WDGQ8/pGVPA8Gg+fdtiUe7UeGtSfbX+i5CghMM69xuQ=;
        b=os4Lz9lhhSw5MoHjeDPVZ8ECaSfcYKADveTQ+rUpjn+6j5esK+rOBynxACw+jLOBsi
         bvwIlGGxSNkU8d6FdQnPCMD6JojnqwchlrmSFi+P60n4RI8k0iLRltm9fsmbgcZIIpe0
         5yEerJ6bcIvB+CVcJoLU3qUOQX66AZMMLlB6huQr+wTGHo3tc5xXt+PDKUU87jZlSGVT
         Q3DF61mC2Sxyhps26dIS5WkBFxl8CoR3baCrN30F3W/E+J9M82CcO6rIPcNyjF36D0Zw
         WJjzE/JLnRIlM8faMLLS9069wn/Wshr/t1a1SWS4hooef06gVk1BUKe1SkyYHMnIwy0O
         ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WDGQ8/pGVPA8Gg+fdtiUe7UeGtSfbX+i5CghMM69xuQ=;
        b=A3EH0fCfywaiPn2qepTXcni0Wov55eAPIcVvZn1VDu4k0Skca0Su7xOXiYLiMlHgva
         r74N1Sawuei81/rST+jn8/C6G+ZrOAVsZyqFbQ+fImEljbc3fSTqDV08fPAZtUtDbnc4
         IBZTYAypBdED6ZLd9230Yg5iY7rnwvWbccKQog9U6TcKJMQ5QsXOJpQWibwI+/pru4QV
         b8h4wAqIANo6H70qemWWPO52yrX1kHhZGldwZ7OPVnlntX8Lt/b/J9djZcPbwsczAal8
         I93GGdwTP5EouSP74GvFxYK7deRnwNNGROzmydEfAwHIxZdIcvLIw2VBzAnAdQdvsQ7f
         BUuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530J+lo6PrRV0bMj6qila2dOuiMVh2LO/rJycCAR3aMbVYuXNEwj
	a8w2dw6LAxGfMA1cmOtYMIk=
X-Google-Smtp-Source: ABdhPJzslTfur3H+Cu3GNr7Dt3aYRdKrS6oVSbERdhDSPa39RjaW0+X9paslopDJUWENr0aAG76oYA==
X-Received: by 2002:a2e:bf0e:: with SMTP id c14mr9590220ljr.137.1629463584991;
        Fri, 20 Aug 2021 05:46:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf26:: with SMTP id c38ls1618066ljr.5.gmail; Fri, 20 Aug
 2021 05:46:23 -0700 (PDT)
X-Received: by 2002:a2e:8e65:: with SMTP id t5mr1967302ljk.503.1629463583754;
        Fri, 20 Aug 2021 05:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629463583; cv=none;
        d=google.com; s=arc-20160816;
        b=MqUv56yHk719ZMXdal8Iv8Yu34t1udxE6qxXmmbb13DqcisXZgbBlWaQQSJKjnf5U9
         S+fk+22SlCllSL2Lxbnlleu6oCq8Q2N0f3AVBCi4Ys+16k5JJu1sraApaKBiYx47d1a0
         N0Sm2Sq7a8I/zHj+f/I0WplAsICVRHD7TVsPGV9TVYEpRwmpjq7d6bMZ8qNIrvbGBo0y
         THTrkfpqlw3AuLA1TIxd/kAi/ggRnK+Z5G/fRdukXYS0TzVEMJCAwQMzOLe/Ce74bQ19
         QXyW3zq2f+fLjwIgpRYeK2tiVYLW9k1xKl9f6Fq0St1N9cC52GxWjoIUV55vmzJBfx3u
         sJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e6+JQ7hWOXpBfQ6z2qvrezmXcjrg+X6IzgrCGa3JU0k=;
        b=GoF7DxF4ogBhzfTEcTXWrYsMxSbzDfdS75MLxFIG7sRzqloLUTGJBxkGf7V+Bvlbbv
         wnCch0ukZ6PXciFWkLGAJbCc70azwikjvk/x0tU8KuMNLDPVwzrJYgcEOVJrjGYxa3b6
         qHyvcFwMLR3aN75IHDqdSbRYnHtriHU/KK0VewXkxpwrkpJiRn/xDjUQAB3kzwpVx+vg
         QHmj1lA5ZkA2kM0r2M1+eeKSYQWwfz7M8c3BFa66jeUVNIfqEU9udGDOranZdaWYhZUa
         mmUyJyfFyOBxjPqWs/yU4PIA2hPvki+f+CtriGZo8GYm+NMwFcX91XmDE+u1v0Cx7asJ
         xJKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9nutuSs;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com. [2a00:1450:4864:20::130])
        by gmr-mx.google.com with ESMTPS id f16si494765ljj.3.2021.08.20.05.46.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 05:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) client-ip=2a00:1450:4864:20::130;
Received: by mail-lf1-x130.google.com with SMTP id y34so20352073lfa.8
        for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 05:46:23 -0700 (PDT)
X-Received: by 2002:ac2:5326:: with SMTP id f6mr14374924lfh.131.1629463583512;
 Fri, 20 Aug 2021 05:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com> <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com> <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
 <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de> <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
 <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de>
In-Reply-To: <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de>
From: Anmol <anmol.karan123@gmail.com>
Date: Fri, 20 Aug 2021 18:16:12 +0530
Message-ID: <CAC+yH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA@mail.gmail.com>
Subject: Re: Help needed regarding AGL with Jailhouse
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: anmol.karan123@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=J9nutuSs;       spf=pass
 (google.com: domain of anmol.karan123@gmail.com designates
 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
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

On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 20.08.21 14:02, Anmol wrote:
> > Hello,
> >
> > On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> On 19.08.21 15:42, Anmol wrote:
> >>> Hello,
> >>>
> >>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>>>
> >>>> On 11.08.21 20:36, Anmol wrote:
> >>>>
> >>>> The echo should not show any response, but when you do an lspci -k, =
you
> >>>> should see that the targeting devices are now driven by uio_ivshmem.=
 If
> >>>> not, the IDs might not be correct yet, or the devices are missing.
> >>>>
> >>>> Also check the kernel console of the cell where you issued this echo=
.
> >>>>
> >>>
> >>> I have added the PCI devices to both the cells and set the
> >>> `.shmem_dev_id` accordingly, please have a look at the cell config.
> >>> files I have sent.
> >>>
> >>> here's the `lspci -k` output:
> >>> qemux86-64:~# lspci -k
> >>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM=
 Controller
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
> >>> Subsystem: Red Hat, Inc. Virtio GPU
> >>> Kernel driver in use: virtio-pci
> >>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
> >>> Subsystem: Red Hat, Inc. Virtio network device
> >>> Kernel driver in use: virtio-pci
> >>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
> >>> Subsystem: Red Hat, Inc. Virtio RNG
> >>> Kernel driver in use: virtio-pci
> >>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
> >>> Subsystem: Red Hat, Inc. Virtio block device
> >>> Kernel driver in use: virtio-pci
> >>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
> >>> Family) High Definition Audio Controller (rev 01)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: snd_hda_intel
> >>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>> UHCI Controller #1 (rev 03)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: uhci_hcd
> >>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>> UHCI Controller #2 (rev 03)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: uhci_hcd
> >>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>> UHCI Controller #3 (rev 03)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: uhci_hcd
> >>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
> >>> EHCI Controller #1 (rev 03)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: ehci-pci
> >>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
> >>> Controller (rev 02)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH=
)
> >>> 6 port SATA Controller [AHCI mode] (rev 02)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: ahci
> >>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controlle=
r (rev 02)
> >>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>> Kernel driver in use: i801_smbus
> >>>
> >>
> >> Is this taken while Jailhouse was enabled? It's missing your ivshmem
> >> devices (00:0c.0 - 00:0f.0).
> >>
> >
> > I did some changes to the root-cell config files, and now it=E2=80=99s =
showing
> > the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
> > only):
> >
> > qemux86-64:~# lspci -k
> > .
> > .
> > .
> > 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
> > Subsystem: Siemens AG Device 4106
> > .
> > .
> > .
> >
> > But it=E2=80=99s not showing any association with the `uio_ivshmem`, an=
d also
> > I am still not able to find the `/dev/uio0`.
> >
>
> And now
>
> echo "110a 4106 110a 4106 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshm=
em/new_id
>
> again.
>

Here's the full log:

qemux86-64:~# jailhouse enable /usr/share/jailhouse/cells/qemu-agl.cell
qemux86-64:~# modprobe uio_ivshmem
qemux86-64:~# lsmod
Module                  Size  Used by
virtio_gpu             65536  0
virtio_dma_buf         16384  1 virtio_gpu
virtio_net             53248  0
net_failover           16384  1 virtio_net
failover               16384  1 net_failover
jailhouse              36864  1
qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" >
/sys/bus/pci/drivers/uio_ivshmem/new_id
qemux86-64:~# lspci -k
.
.
.
00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
Subsystem: Siemens AG Device 4106
.
.
.
qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
./virtio-ivshmem-block: cannot open /dev/uio0: No such file or directory
qemux86-64:~# find /dev/ -name "uio*"



And Console Logs:

$ nc localhost 4321
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
Initializing Jailhouse hypervisor v0.12 (279-g63000120) on CPU 2
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 49/975, remap 1/131072
Initializing processors:
 CPU 2... (APIC ID 2) OK
 CPU 0... (APIC ID 0) OK
 CPU 3... (APIC ID 3) OK
 CPU 1... (APIC ID 1) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
Reserving 24 interrupt(s) for device ff:00.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:01.0 to cell "AGL-Jailhouse-RootCell"
Reserving 3 interrupt(s) for device 00:01.0 at index 24
Adding PCI device 00:02.0 to cell "AGL-Jailhouse-RootCell"
Reserving 3 interrupt(s) for device 00:02.0 at index 27
Adding PCI device 00:03.0 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:04.0 to cell "AGL-Jailhouse-RootCell"
Reserving 2 interrupt(s) for device 00:04.0 at index 30
Adding PCI device 00:1b.0 to cell "AGL-Jailhouse-RootCell"
Reserving 1 interrupt(s) for device 00:1b.0 at index 32
Adding PCI device 00:1d.0 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:1d.1 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:1d.2 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:1d.7 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:1f.0 to cell "AGL-Jailhouse-RootCell"
Adding PCI device 00:1f.2 to cell "AGL-Jailhouse-RootCell"
Reserving 1 interrupt(s) for device 00:1f.2 at index 33
Adding PCI device 00:1f.3 to cell "AGL-Jailhouse-RootCell"
Adding virtual PCI device 00:0c.0 to cell "AGL-Jailhouse-RootCell"
Page pool usage after late setup: mem 205/975, remap 65545/131072
Activating hypervisor


Also I can not see `uio_ivshmem` in the `lsmod`.


Thanks and Regards,
Anmol

> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAC%2ByH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA%40mail.=
gmail.com.
