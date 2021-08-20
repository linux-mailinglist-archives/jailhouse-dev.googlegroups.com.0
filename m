Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBL5572EAMGQEVS7JPIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECB3F2BFD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 14:23:12 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id b16-20020a0564022790b02903be6352006csf4441638ede.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 05:23:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629462192; cv=pass;
        d=google.com; s=arc-20160816;
        b=PBPIYN4ZzhKmofExjSzAmI/IQFB6Z1cfiRHSOXEyJnrXJOMwHYytGVenWik+fGLGwG
         QOsVJtpbkFthaA8ThVKIrDsvUmHXNQkayetDVyalbxCDzvU29DO8/V7l4Wn0QtLb/FL7
         E5h+g8taHCEBbrdgyv5ub8BmzqhG3XoOiKN1YWS7hRRA1wRJdY06DORYHPFSX/oe56cj
         adtuRuxYtMG+rUDVLGEfTwbwe4T1mJ4TezePN8ZizUtK7hp0RyeOrTJEvi5OFOC9LP/6
         NKW8V919C0isOGNM4w8Dj+moel6WDsQSQYBVAObgZRLjJIp+JPDp1c6QC+Ag7FQLd3ym
         a12g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=r8HyLJnw12OGUhbLGoKtKE9O9NLTnjgITgFT1yg79FA=;
        b=YzX5xyKI1sXD9GP6NbSUk8nlU37VFclmGqxmkxpB9xxjyv1Rn3KpHAyhyW0Qzd6ELr
         oFDstQ7ylTYth4vNp7iTIMxmD64+zARXx5tCNjVFTVp60InNDjQPBVH1W1BavKCF3DAh
         NdiNfkk3nCR28zplVACw/lp52UUFWnddq1YNMnQ2hpCPQEBQk3Lv+WJHTAtathu/YB+d
         UjBt8gX98Wd41QPX2+7QEVsbP8Ec96TSLO+D+69ZhzFA2Wvu8Lrh4XbqQPayxpejAl7y
         SrLLA1Ba8L8cFY8eQLvRkHG2eHHCkCCV2TYVPbxXI9gVMXYkbb6NvlUSp/97B/YDHZs5
         qJDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=NHlL+DUY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8HyLJnw12OGUhbLGoKtKE9O9NLTnjgITgFT1yg79FA=;
        b=hjJPbgfNgL4ssDQAAEhYvsa1gAZD6FILzfScyDZJpQgthmOJSe0XUQTSxN7PKxupXn
         EzfUJX+vHm2+1V8vXxVUZiU8NesBLp64NjLY9igjRtFP4LLTr0iadsAjijPgsduYwWz6
         MtBhLuLBuP1AgQaImxPYo7f327I+s8wHEvgAySk6IbMcOR9+gv3sjXBdCWMXxLlQIjYB
         9CJHudCzFWc3vYf/pp65irk20CauFoqs8Rkn0bosLmxLDfskLRxJU7yRShNp4qPlz/yX
         c+AVsiWG0ryBMWyUxGhaxa/BbrkL6K1rGASJmMAP/jZtE8Ue6Mp0JdlYGUZlCpvfubU+
         qE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8HyLJnw12OGUhbLGoKtKE9O9NLTnjgITgFT1yg79FA=;
        b=mMT0HOBggY9sJS5rmi2C4hZCvxmGbC6wnJViqkslUbD7/XGcfYKdeH+QsFRCvFpENW
         O/B+/QC0C6kZKQQnaJza5FPz4CjYGJ0UKocH1woqOm8AFJ33nXpfiPT0OFuRODCFx+pF
         1h9FoIy9BWAVAaVv4yCJycuSiGCthXLEe/TY1rmTAKeTpXvydi3v4FMpWAZA8hezcPp3
         hsRYaiw1KDqlDh1eiZV2V03vNJV/DuWoUi9riunjULrLCIBBjqUlC+CjwabABy20Q1VU
         cXLGIiePDxB6u++1CTSK27TVtvDTtZPa5waMmllTrg3GvFl5Qjrdy37b8GHmNi6tDO++
         zqPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315q4DTScSM56iLTSqgYzdZR9dv+gg9ijF50DhykrRG4Gte9fPa
	naupQXrKbcjeZZdD3sfl1JY=
X-Google-Smtp-Source: ABdhPJxZpbqQNIrs43GQ2CtujJZJ+8Qx8b2yMMXMCcajEq8wLA0Cta7IhczVW96mL6WJhJcsx3m4gg==
X-Received: by 2002:a05:6402:440e:: with SMTP id y14mr22577278eda.238.1629462192125;
        Fri, 20 Aug 2021 05:23:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d1d6:: with SMTP id bs22ls4390430ejb.3.gmail; Fri,
 20 Aug 2021 05:23:11 -0700 (PDT)
X-Received: by 2002:a17:906:f43:: with SMTP id h3mr21842781ejj.267.1629462191008;
        Fri, 20 Aug 2021 05:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629462191; cv=none;
        d=google.com; s=arc-20160816;
        b=F689teB7SRPdnCBZumg9EZFafmJA+aPR6AozuC1ssdSUgwDhpcxWq8CF+HDojFBIo1
         QQjGtMCkevhlZ877CRjLrcmUZ/SL7np5V/b6DQ/HvpZHzj9SzBksXV1oRsUiDxjGj5dD
         JKmj9gCX5/996d+DZ6u/hTwS0BwErkOJq/rRZMnzQ/RGdX2J9TkxABchtdX1yJwX4lmY
         9ceICrHepAewiOVo8JE1H/XIGE00gz4MRfZYfrVsmZaM84bp4HaP3epLT/HYaxvGsNSu
         BHOYCkqqCFXTdEAO4eVPnviTzqz61jzWFSVzNLfLgA8cUbpW1Nhgm7BFPjGAVaOCJkvV
         i0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=G0C8sRzP+MHiynbI+VtXgphc9JAX9awhMLKPIqV7tQw=;
        b=zctUxhGnuOPKvHIq2lweFJyDg613VMe3Yq986iVwvod0JIgXQGkjO2VJWo2XwV9WcD
         Y88HuSKM+uwK2yJuPG5nGu+TS4G3QILb4HAcnuCae2I+kT9mOuYChnZg1+chXYXIcjRb
         yiQPi7iU1dIVUyku45NhQURvKKuNyKX9Q5OKpzVkGSvGoLk5rLm37/iB7tIri+kCJA9r
         DyTqnS5186TxLYUN1tgKwkuw5IGvxuvClq75aSh6vsEMoElbzB3cwLhSOfoLOb3Un6ta
         F7fQB728uiIi+skN3Nt8EARZ4gCgSJcji8YJb2IsASBx2dTWXYQN0iIB1+nH1hYNYAlm
         VSuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=NHlL+DUY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id o4si477788edv.3.2021.08.20.05.23.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 05:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.0.29] ([88.215.87.227]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MZAp2-1mVPZR43US-00Kxrv; Fri, 20
 Aug 2021 14:23:10 +0200
Subject: Re: Help needed regarding AGL with Jailhouse
To: Anmol <anmol.karan123@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
 <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
 <83beed08-7e85-4607-bdf8-e4ec983912f8n@googlegroups.com>
 <d2dcdcc4-cba6-40a7-859b-25b1bfc685cbn@googlegroups.com>
 <3f00a102-357e-de0e-3ea3-f338f00ca793@web.de>
 <CAC+yH-YxAb+qaCRds7TZHazFXCgLqYwhJTx8W-0bxrmcXpUbBA@mail.gmail.com>
 <7244017d-6e9f-544e-9dfa-fefcb4827cd3@web.de>
 <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de>
Date: Fri, 20 Aug 2021 14:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAC+yH-aewTCrKXB=QOM_h=n2umO9p2nvpTmBmbwaVjmKuBQWmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qs4kq7Z2uCKXPUceOjLJt88M0euYokkJyJR9UD6ZhwwgNd24EMo
 iWZTgQ3/TeJatiJXjGXgnceDiCZF5hmUpxfu1B17bwR3uIzpw220mvnZqkHURTkQ5VA40Bv
 fJjzj9r+6fVyPCpbQxQ5DFq+M1eenmyRQP/Bn1Ze6Wy4zw/jt1a8zmpvwVqJtegc2+D8RKt
 MBwZW51onElBXW0L3hxvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GVNsYYJFc/s=:0TQ2ltD9XEJs67YPMyOCi5
 VT+Zqpl79vqg6nZgf52XxYcl3uXvpJxpUNUI46L4ccDT8Dm3Rrqpr9P0xnqrCywo5eJOPwOUa
 6NEwFwqIfOKdxdcTkzzw9GRJl8cb9N2lMNdKuBOCfLCTYyQSh+ws88OnWGgshLauy0LvNGCKV
 yk45ev9FzacWvq7u1Vpuu4Do6aa4mwl5ZxFrkEZPUOb3yi7FLSSbH1eW/e6B1oC8aUqQCGdzr
 TNramth3LqHGlF1nYO7ttISI1ql/DkAW/ydtxQet6+xZeOpHk0c8UgH5kRjhdnCIrNKvkU49T
 Hq5PpnMPBsYqPNONhPyG+G5pBJdjOuKIpSBf4OJFcudE3neCrIiG5NrqRQgf5o+pa6GRfkbBz
 pV+ob2N9o/Oz88isY5idu+Kc3g9FQLYHygAVdT3s+fbxWhs0YgW9CMbGPe/Vy/okSOdJEzfZb
 q4JOq3VFPzMx0+DUnrzIwUJfmJwJCWjPFayuhYRnugc1//raEeJ1A86ZjYwpF1ve24fPvWH2/
 UoRiqotxgv4CM7uS2+bRDI2eg6UbfTBj+hD/s+JE2uui/gKBBOPRlEeW4HuYNt3fPBtddZ0aQ
 tUSyllLN0ao6xEC0rDdyDoB2rYbJpgYaMVaMFvuRQ2FnQAaccjP+7mAOTt8y5djtYfu1mCKlG
 HGxsOf2Bui2/CkbaXl2mUEjjLk+n0N/ehs/H9J92kRv2NKhFWgEF+KZgSsZq9jkQFJ8RuZ+KE
 D5vYchrJJQepgOu9qhU4i6dDjqQVctUx4L3OWUxXJI6ygEyh94CymP9UXnzFk6FqtCTMfXB76
 DwUphJk4lM1hQi45GETMGUW34Jrslxyq9H+drZJAuNaNVdSivXevYDb/g5BUDjsnfwxCXpsip
 xDZWqhRriNiRNlvbNYJC2gGbL3WdClFCwuz7TEIWehdN4tlB6BBCaEU4A4gatee1ndYs7bRSl
 lGa7lnLqfvySBueFnkYGF6MXlhJA7TnN1d+RwsylpVles/4SsaXBkNekHFuSzeVJQQGzo8mjH
 RYZda2DFCiOoM2LhHvQ+bhP6ky7t6tvGPFjHPx9UHKRiBMRQZsCuzhy5mE6a5ZmwmF+eCIeu4
 5ocRo1nn+RpwwXo/MkssslYoHbiCSfx/CTgh0PdGH+dP/brwPDXT2WNrw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=NHlL+DUY;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 20.08.21 14:02, Anmol wrote:
> Hello,
>
> On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 19.08.21 15:42, Anmol wrote:
>>> Hello,
>>>
>>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>
>>>> On 11.08.21 20:36, Anmol wrote:
>>>>
>>>> The echo should not show any response, but when you do an lspci -k, yo=
u
>>>> should see that the targeting devices are now driven by uio_ivshmem. I=
f
>>>> not, the IDs might not be correct yet, or the devices are missing.
>>>>
>>>> Also check the kernel console of the cell where you issued this echo.
>>>>
>>>
>>> I have added the PCI devices to both the cells and set the
>>> `.shmem_dev_id` accordingly, please have a look at the cell config.
>>> files I have sent.
>>>
>>> here's the `lspci -k` output:
>>> qemux86-64:~# lspci -k
>>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM C=
ontroller
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
>>> Subsystem: Red Hat, Inc. Virtio GPU
>>> Kernel driver in use: virtio-pci
>>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
>>> Subsystem: Red Hat, Inc. Virtio network device
>>> Kernel driver in use: virtio-pci
>>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
>>> Subsystem: Red Hat, Inc. Virtio RNG
>>> Kernel driver in use: virtio-pci
>>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
>>> Subsystem: Red Hat, Inc. Virtio block device
>>> Kernel driver in use: virtio-pci
>>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
>>> Family) High Definition Audio Controller (rev 01)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: snd_hda_intel
>>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>> UHCI Controller #1 (rev 03)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: uhci_hcd
>>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>> UHCI Controller #2 (rev 03)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: uhci_hcd
>>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>> UHCI Controller #3 (rev 03)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: uhci_hcd
>>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
>>> EHCI Controller #1 (rev 03)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: ehci-pci
>>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
>>> Controller (rev 02)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH)
>>> 6 port SATA Controller [AHCI mode] (rev 02)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: ahci
>>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller =
(rev 02)
>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>> Kernel driver in use: i801_smbus
>>>
>>
>> Is this taken while Jailhouse was enabled? It's missing your ivshmem
>> devices (00:0c.0 - 00:0f.0).
>>
>
> I did some changes to the root-cell config files, and now it=E2=80=99s sh=
owing
> the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
> only):
>
> qemux86-64:~# lspci -k
> .
> .
> .
> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
> Subsystem: Siemens AG Device 4106
> .
> .
> .
>
> But it=E2=80=99s not showing any association with the `uio_ivshmem`, and =
also
> I am still not able to find the `/dev/uio0`.
>

And now

echo "110a 4106 110a 4106 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem=
/new_id

again.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2d727a12-5fc2-1400-3b72-cb21366b47ba%40web.de.
