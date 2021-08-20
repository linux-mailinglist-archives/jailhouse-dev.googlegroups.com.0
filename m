Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBRXH72EAMGQE2IXWKKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A9D3F2D6F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 15:53:16 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id o5-20020a2ebd850000b02901b783135369sf3200921ljq.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 06:53:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629467590; cv=pass;
        d=google.com; s=arc-20160816;
        b=jVs6QZNBXmHI68Siy6c857OYV5A/M0sX7kWI3J9rQpMhcT0H+k5i/INTozWn5e4127
         4vcS2j5GiFs8MTxGp7jQjeS0sJ8CiMQg4G7i9VNtmM1GQZ3w7fq4ZcKDYmOkF5ykFKWx
         vJe3yr1XeLYfHreyaGLKUj8IiFhYCKyTbAmZyqoQdVEhvAPM0zYee5Yv3dKhC/7rtzUK
         1KERA/byZXBDkeuOauYmqRDwu6/Tj7dR4fzuNHh2/8L0RQ1BN/O7fP+gfVM0bwo3vwJr
         4ef+ND+s9cVX/qpF/RnLTuEjRdafj4Q904raxY/Xx+s7Jv/ISMmeLvXTJVgc6aLCCNKI
         DaAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=yEDi7hYX8gmimEeSwCSGVaifP+mTOsonPFMtvMhMcFc=;
        b=UR1aK3Y2s+/R8z6f+pJ7vMeKKBa0ldiDiGSQ8fiST2MfQza/dUPSezvmhH48MT6f4R
         WmsYoBDry429bvjI4KaC/C08mYqOJUyiUyP0IEYpwA1hkCXFZrFaq4u3k7q6li5tfAXJ
         ihqizIULwv4ulsDDinlL5Kd2Yv/3VkhmrZW1D7fB91rm5ACsLyNJz8x9sUxBsRSS+mcp
         PzeNI/aEJtBZq07fUSWf9fp8pIYQ0UR7RCLRqICWuwla+BARApucCSKg68TaJqbNoLTn
         H6gfysC1hE63XhGvVJblcAU4GJ3M+P3FxPOw3giFTLUUOp/8WedeKbleS3RC5dSa5BpZ
         6aiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bGLfus6t;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yEDi7hYX8gmimEeSwCSGVaifP+mTOsonPFMtvMhMcFc=;
        b=a2UqU7hOIGbW3Oad+iY5QRTOrkRNqnlnqVrUMItU++Axb2nkswVI0976wX8FRUuCYU
         sH7N45yGrb0X9hB0a9cAu/dtFcJ/ThZ4BwtvK/MHLL2EQ+E+WO0jJsgzRUZ4ndxEJk72
         yCYmHvBJw2cKmX+WGKuQX9R/k0AHh/sfh200YzhaU/GvR51SkvmYptmHy23D2sD/fnjK
         ppDU5rmZWgk82YPChyVhOzVAuqdVAGaQdPdkttPuRN6A5tMWeXYv1lZSi3yQxZIPRhYJ
         YQAl2DQUw6x4sjrWMkpZ6hyZjUR27YM2O4fFNG94iONrmE4M7UAcaF7lhf0100tNXaCu
         WOYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yEDi7hYX8gmimEeSwCSGVaifP+mTOsonPFMtvMhMcFc=;
        b=KzEfdRQpF6nHTBluXjEbynw5iOyEpL23/DGItJdbWVGdDUySYUMOJ3N14hmzIBMGgK
         PdSLMfvip5L55UXyXjkVa94sPDbkaQu6Hyu7U7FlBfhUv/GQtsKNJ7SGjrAXbTCQzXpN
         WQaIY9W6Uch6bcxKuhubBBxUBJQELVNYlizYJWu+yg1A9GsPlQsZTbMLrq3CHqcRdC8o
         bdO2OMvuCdA1Tqlm+xiT0DY5n0yUECU4PNTfWcr84/Ru0a6kZodwZPR8eTBPAdNn7tbo
         w541q6cbSvSQhd9h0mu/Dn7Lf9C5kZdYyfGa4DKon4pNrtzFCDD1OE/bxR0+jN9AW9wZ
         TKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yEDi7hYX8gmimEeSwCSGVaifP+mTOsonPFMtvMhMcFc=;
        b=WAijYqiRSU6x8WZcPcYwmNG+zv7oEfCg43l+EDeST/CQWZON6HbKCyxPCPhJ2pWhuD
         niKIxqIvmTGsgwirFSUa3uUHfKJ767964hTwOVI+DwtcIBIkx2ErqINp8J/QdrbGTZVm
         i4WVOoxU71/OaKRUZuXQFIXa0m8Hu6gasBeSHbfBtVDyTgM4BAEPQpUaZ0f96TDjLVrX
         2LvnVqUXhPpIxnDL+lGXg2XpeBNXu+oHJjTUb8UC9rmYYIywPO9jsQtjYJlPImDmk9wX
         8pC1uQdHt8r1Pr5RIl2s7NO1dSoFMevyDZO9YPTFQ8fNO0d2Opfs3rqYe/0qkCW943/W
         FsNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TnVHhezZjMgQWBqMo0qZG6x5XqJnh5HdnnZoQGnfu6GNfkxIN
	Tufj9Kz0mEEbYB9GB+LT9DU=
X-Google-Smtp-Source: ABdhPJz67wGVhMvoGNEF57d0kZf6auybyR2vGWANovj7T3dZ5rMwY/D+ZvcwACi55qDD7BEvmDUSAQ==
X-Received: by 2002:a05:6512:118c:: with SMTP id g12mr15178406lfr.143.1629467590669;
        Fri, 20 Aug 2021 06:53:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f02:: with SMTP id y2ls334434lfa.3.gmail; Fri, 20
 Aug 2021 06:53:09 -0700 (PDT)
X-Received: by 2002:a19:c207:: with SMTP id l7mr1373764lfc.604.1629467589226;
        Fri, 20 Aug 2021 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629467589; cv=none;
        d=google.com; s=arc-20160816;
        b=DvI2F6IiZbVj35N8HG5g5223Hs/VXTmjhf1B56pKHMHNVKWZjbwX0/zZeCTdI3xLuR
         z8B997sp7lKoouA1wNh3xm3PZlyG2zj5rPnxo5WhJKSPgHwF6y8pTNmB5/ws3peeA38v
         psfco3UKo/XofdI2eVlvLYa0xt2UmaHeu2TD8/jMA8fwQXETr4C2h71T5g4CQ6fh+zhn
         ZRws4yd674DdB8/sncuq1TeiiSVzMH0r8bdM/wW2waZcD7cuszyTm5dqaypEggmtUt6x
         9e/tcjDbx/JPk6mSH/f6O1Q+Oz+obP87LMNEjteGlsof+QoJgZL0y2GPsTZwHXT1lO57
         fMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=irujRI0LOE21eeQGI/RqSAzG8vkLj3TJZsvpY3L5YwY=;
        b=kkeeno7PaXcvv4AuFPz0qZ9XpdAbf+rAmLu2cXgip1qk7+IJHgrlhokpgp5zhtQmgM
         CUhSfnCGdFPs1+j35Cjk3xgWC+GTDU2ZXEVmA9/n4Z3jlj1Xi2MAAFm3vbXDl37LYSCg
         PEhUpJGHhM98JshjWuqqhYnIKHUdCrVafmv/Y3FWsHO8T1qb4nEAgEi+pyt4yNvahkDP
         KEgpoQH7BMP6I+ChHg4YqV26Cwx0tJ7WHGUPtQwglNPaW9b6R1a2WcSgfy5wVwbCrZ9T
         Vd3/IQF4uW2+R7+m6uSOl3TV/Z2hYvIPpjQxswa+VRLEyZ6OjehZuoJcAaOohUR5wiqk
         qiaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bGLfus6t;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com. [2a00:1450:4864:20::12f])
        by gmr-mx.google.com with ESMTPS id j7si555573ljc.1.2021.08.20.06.53.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::12f as permitted sender) client-ip=2a00:1450:4864:20::12f;
Received: by mail-lf1-x12f.google.com with SMTP id o10so20751877lfr.11
        for <jailhouse-dev@googlegroups.com>; Fri, 20 Aug 2021 06:53:09 -0700 (PDT)
X-Received: by 2002:a05:6512:104b:: with SMTP id c11mr11362910lfb.201.1629467588985;
 Fri, 20 Aug 2021 06:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com> <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com> <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
 <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de> <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
 <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de> <CAC+yH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA@mail.gmail.com>
 <457f3a55-732d-15a6-8e4b-d4a86202e302@web.de>
In-Reply-To: <457f3a55-732d-15a6-8e4b-d4a86202e302@web.de>
From: Anmol <anmol.karan123@gmail.com>
Date: Fri, 20 Aug 2021 19:22:56 +0530
Message-ID: <CAC+yH-beQxOE-Wdwe+ESFjM3Mw5KeS=kKpda1RZ6rrZ5bQLxuw@mail.gmail.com>
Subject: Re: Help needed regarding AGL with Jailhouse
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: anmol.karan123@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=bGLfus6t;       spf=pass
 (google.com: domain of anmol.karan123@gmail.com designates
 2a00:1450:4864:20::12f as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
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

It's working :)

qemux86-64:~# ./virtio-ivshmem-block /dev/uio0 disk.img
Waiting for peer to be ready...

Thanks and Regards,
Anmol

On Fri, Aug 20, 2021 at 6:49 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 20.08.21 14:46, Anmol wrote:
> > On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> On 20.08.21 14:02, Anmol wrote:
> >>> Hello,
> >>>
> >>> On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>>>
> >>>> On 19.08.21 15:42, Anmol wrote:
> >>>>> Hello,
> >>>>>
> >>>>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrot=
e:
> >>>>>>
> >>>>>> On 11.08.21 20:36, Anmol wrote:
> >>>>>>
> >>>>>> The echo should not show any response, but when you do an lspci -k=
, you
> >>>>>> should see that the targeting devices are now driven by uio_ivshme=
m. If
> >>>>>> not, the IDs might not be correct yet, or the devices are missing.
> >>>>>>
> >>>>>> Also check the kernel console of the cell where you issued this ec=
ho.
> >>>>>>
> >>>>>
> >>>>> I have added the PCI devices to both the cells and set the
> >>>>> `.shmem_dev_id` accordingly, please have a look at the cell config.
> >>>>> files I have sent.
> >>>>>
> >>>>> here's the `lspci -k` output:
> >>>>> qemux86-64:~# lspci -k
> >>>>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DR=
AM Controller
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01=
)
> >>>>> Subsystem: Red Hat, Inc. Virtio GPU
> >>>>> Kernel driver in use: virtio-pci
> >>>>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
> >>>>> Subsystem: Red Hat, Inc. Virtio network device
> >>>>> Kernel driver in use: virtio-pci
> >>>>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
> >>>>> Subsystem: Red Hat, Inc. Virtio RNG
> >>>>> Kernel driver in use: virtio-pci
> >>>>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
> >>>>> Subsystem: Red Hat, Inc. Virtio block device
> >>>>> Kernel driver in use: virtio-pci
> >>>>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
> >>>>> Family) High Definition Audio Controller (rev 01)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: snd_hda_intel
> >>>>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>>>> UHCI Controller #1 (rev 03)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: uhci_hcd
> >>>>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>>>> UHCI Controller #2 (rev 03)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: uhci_hcd
> >>>>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
> >>>>> UHCI Controller #3 (rev 03)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: uhci_hcd
> >>>>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
> >>>>> EHCI Controller #1 (rev 03)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: ehci-pci
> >>>>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
> >>>>> Controller (rev 02)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/=
DH)
> >>>>> 6 port SATA Controller [AHCI mode] (rev 02)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: ahci
> >>>>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Control=
ler (rev 02)
> >>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
> >>>>> Kernel driver in use: i801_smbus
> >>>>>
> >>>>
> >>>> Is this taken while Jailhouse was enabled? It's missing your ivshmem
> >>>> devices (00:0c.0 - 00:0f.0).
> >>>>
> >>>
> >>> I did some changes to the root-cell config files, and now it=E2=80=99=
s showing
> >>> the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
> >>> only):
> >>>
> >>> qemux86-64:~# lspci -k
> >>> .
> >>> .
> >>> .
> >>> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
> >>> Subsystem: Siemens AG Device 4106
> >>> .
> >>> .
> >>> .
> >>>
> >>> But it=E2=80=99s not showing any association with the `uio_ivshmem`, =
and also
> >>> I am still not able to find the `/dev/uio0`.
> >>>
> >>
> >> And now
> >>
> >> echo "110a 4106 110a 4106 ffc002 ffffff" > /sys/bus/pci/drivers/uio_iv=
shmem/new_id
> >>
> >> again.
> >>
> >
> > Here's the full log:
> >
> > qemux86-64:~# jailhouse enable /usr/share/jailhouse/cells/qemu-agl.cell
> > qemux86-64:~# modprobe uio_ivshmem
> > qemux86-64:~# lsmod
> > Module                  Size  Used by
> > virtio_gpu             65536  0
> > virtio_dma_buf         16384  1 virtio_gpu
> > virtio_net             53248  0
> > net_failover           16384  1 virtio_net
> > failover               16384  1 net_failover
> > jailhouse              36864  1
> > qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" >
> > /sys/bus/pci/drivers/uio_ivshmem/new_id
>
> ffc0... -> back-end device
>
> > qemux86-64:~# lspci -k
> > .
> > .
> > .
> > 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
>
> ff80 -> you have a front-end device here
>
> You are either running that in the non-root cell or you misconfigured
> the root cell (JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK is needed).
>
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAC%2ByH-beQxOE-Wdwe%2BESFjM3Mw5KeS%3DkKpda1RZ6rrZ5bQLxuw%40m=
ail.gmail.com.
