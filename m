Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB6WX72EAMGQENDH4W3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D3F3F2D06
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 15:19:54 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id 204-20020a1c04d5000000b002e70859ef00sf2657294wme.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 06:19:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629465594; cv=pass;
        d=google.com; s=arc-20160816;
        b=zLPI85sQ/TDm7uRRdUNxPiPPmW3wcjrMshp2iRjECDOOVvlo3jY8V11w/splC2Sk1o
         YLkTqUUb1pJ4ZYhrXM5ZfPblRuUub6eFsuZwm2o7elttHubjTDqiSsdWeWj4UINbAOhZ
         Yof0f0aZe0T5Mo0cqXgZeYh6ThjZyuO4CoCFSdwFDcrkRDOaB7+ANKJfm+qsj7DWKDFf
         H1RoQct1uwI9tD61uIO4/dbFgc2kmLN6Igd1ReYZg8GhfA9X/QF99VERQejqGvyniHyR
         oK7mZtZZMTW+EIURfNO3/Gu7SgU8IVrv5UroVh3BpNpaACdj7TMf79e9xG1xXIG7ijW8
         KhFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=p8RjJgBqnjNs8+740flcHu6lAzvAc8nH2wisFXhayVE=;
        b=Lb0tpxIqcSCQwq4Q77BrjCc+7qHn9UWLIWCHqXY8iWh0xg3TazwxHgwbETTOUzlCeR
         Pe591tMV0YugKV+rkPE4qouO8vCdX/Wd3oiSpx0jxYApf2IyONELE/dLDct08nucAG6h
         Lo6n96O8Qi3VTIgj/GeesvehEGwOpPsiaQbfHpJ+kXHO6IQN8TLM18Igi6PfB0LieaEr
         Cm3W7vJlbDmsETihU0emk6IW8LvZtMmz7AhPp/8ZUY+Qsz5tdDZCPngcvB6DkTzwcn+0
         Vh5c8V6v9ir0OaD4EqeKTFnoinSynU+k4UeVMvwG5aIXYFVOjX07fKfCqrHbNOSNTqB7
         6Hsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kd1xUmBe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p8RjJgBqnjNs8+740flcHu6lAzvAc8nH2wisFXhayVE=;
        b=GSbnG2IctLNow/zHDpyBfSYfSlubzjIk66kJfKSiBG2awxDIzqckpLQoCny+THeAOM
         a6xfX51VDzs/eIoS89vcdcQ/HEH7tXWKdV7aap/2nB8RzOoF1Hq1on0uS8rA22xGKVH7
         41AN7D0LyaC4/f4+QtbjBVc+OhYNWdenEYF9Usg236OhyuMInN3Ig/e9FnIJGxmtAALf
         vwBp7ibyShl5jNjIVCjsN4mxJBfzKAFUdaqffpIX3s6mDevEd3UjpNjKk/D75BjrJCsM
         VaVMCAb96QhBmHEg/qYsVifkOjR39cHkhn19tpEO9f+ILRE3JOCxdvpcaM2NrdPE1z5F
         tn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p8RjJgBqnjNs8+740flcHu6lAzvAc8nH2wisFXhayVE=;
        b=G5ciIx9f6j2975ttN3LQKUjDUA7EvPiQlxz5C5CxMIylSUeKukvIE7a9/by8c3NhPv
         38elyty9MV+Fr3znIwb/5tddx0rXknvWS+HRAhLMRoGboYwnPfQUGkSJFHRZRai3K31V
         AtEdsFpPK0gjaCiUNpRypFPAMsmXrSwxhWuvVU+vZeEyTZubyEuuaNQo3rcO/FDi7EsI
         P5wkI+lC7RpYM0Dxza7C7uyrOvOa/ZVxUfH4uJryMTF0MpqYUMpCt1vLMitjZ66Bk9tM
         XpbxuMT6EETpShLHc39sGxeaL4BF+58QW0CQpd/iu0CoPlnpHqhNIeZlFT4s+KaNsQeU
         BU1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321+Y4h7m4D2NzFPo8Ir/qAdueC5oRN2eO2FrejDvxeDytCtvoV
	7J2RpNINsAe6UyLb7IZziB8=
X-Google-Smtp-Source: ABdhPJywPS/+i54xNammjzbl5uFGUsKjtTCEqhStf9IiL9JVe89p4TTGNy0TMgojPKijn+zXr9DXLg==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr4119185wml.23.1629465594550;
        Fri, 20 Aug 2021 06:19:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb09:: with SMTP id u9ls3906393wmj.1.gmail; Fri, 20 Aug
 2021 06:19:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr4037545wms.186.1629465593619;
        Fri, 20 Aug 2021 06:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629465593; cv=none;
        d=google.com; s=arc-20160816;
        b=mI5S2ejR9UUKxlv6/bLkZaLA/MBmVMbKg/CWmPJwxiH48GzO5QQemicKNVGfK22Fyp
         H8XRetji34hBD1NVtbCUyj6Njb1ZenVcDZI70DQCthHsqBdv1sojJggcaOUXHPmmh0ph
         0a6DOawuhJfYExEa0NyueYSB6jnllofGZCETHdH2SIwXJlQ17FPt47wZOKoc52gvtuLC
         unheT2FcupoFEDVgiqL4M0iXKZLJT03ZcC1wplTgGyxkRUQRIhFad+PrjAdp+HHWmjOa
         zk4ynHCCmcDe23UH0nKQ7T2CBhNxKsZalN9QFqORYH5F4azOP6oUUkOJ2MNN/9RTjtfT
         UMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Cn6tF7GQzcqx1+udECGJcBfJWFsQWwqmayV3noxDcb8=;
        b=tWouWXtRt/rjSUUMdwO/CqeAsZ/FGMSqWkvr3Ztv618mlYge0almpBcFC1m8dPX5yK
         biqbIj1MRUqqNnnfzp+QfPzUegsYVwssTZa0qaHKDjmnERSdlBEzto6DQ6IqRaqzO2vJ
         nUxFu2Nvotg597lh4vakLjn59n30KTgFhi9qJWkmo7G1TsyyW8BQ1tHWvyar5AKquw/l
         Lc4cF4lNOB/C9QKE2LZ6x8AJPusKbGKByM5tuqaB72Dg0+DRVIZeoPNQwCiLCSecM52l
         FD2+5SbIuP4nV2UC4nU4PdcyFUDH14KDeupFFh1MY/cDue99IM2Kt9Hat7oZmuSjFotn
         JKxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kd1xUmBe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id u2si555233wro.0.2021.08.20.06.19.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 06:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.0.29] ([88.215.87.227]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LpwIR-1mjp8x2Pod-00feyp; Fri, 20
 Aug 2021 15:19:52 +0200
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
 <2d727a12-5fc2-1400-3b72-cb21366b47ba@web.de>
 <CAC+yH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <457f3a55-732d-15a6-8e4b-d4a86202e302@web.de>
Date: Fri, 20 Aug 2021 15:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAC+yH-Zj8aPePQSLa3GL2TicXWMa_nOXTEEV2Agyjx3zJbZOLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/iDQENi4PN7NQ5CpdKO7CIIEAPj7fb10KX73Get0dl/5uhSgh5f
 b9RjxazVAEKXrD36eyP3ROzieTnRLYp7CEfRgtZW71Qcg6NwIcPUl111SRa++D4GbXE8JCa
 fN8A2xcgZkSkw+dwZJNRclue46pRKmaOJZ8PF6eu5ZDcJpK1qnTMH0JE4e6LQBOpslrG3iR
 h3F2JeHEMwTNJlHwuZAHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5rN775DKYjQ=:sH9sAG4PLl2AJIG/uvqAkd
 EV23x7kv969AH4+J78o6KRDsnWjpsc7X+pD4dC2X0044WPe8KT+2negQ18YhV0aeJ81iG33i4
 Xt2o4vtqRmNFdJKN4ILOUFL9p7PHXYzOASdgHgbVvDXT921XCf6eDYWCNzmENZI6FoWYjIBCh
 MnVEP5eSAiStIVZXVMBo58fSIvYvFT3s/p2SnVw072PkDaqkqvTQDrT7N1HncM/xqTb+RvjuB
 MGB4NynOKbityKpr8FASlzeP0Bzxl0AA4yYLrV1geNGfvGyy1y8flDdTCxlCljvCtbbHC6a8H
 a0AjevPqsJeHCWGc2ougKMZybrZI+Nd7nK2URInOuBkNk7OKms2QE2FMrX9aHBvVc+avMirUk
 OjvVgH39R8wAGWoXSYZmFIiCzbQE/WnHm4xoJ5ujQLYoyX9XRd+9OJYnn7Ul398RPP4kGLn8N
 q7pMlbXMq+aYtv+ow7DmlQ2Al7cFDjNg/dq+n97L7ZmycDmuE+TGTgZ4flhy6sJV3nuS6He6X
 kwGGThP6vARN4SfSh/ExolR30nmFks0LMkAQ99jeS5Pno1ym4IIthii7dQzhjvGvgmLfh5Xe0
 yhJ6JyiQDpT/9RTGBqlVOxCWdJ79kJyZaL7WtWsgwiWr1TSVP30E6/Pqvn/TbudOpxRnbhM3L
 ERbhzl9KjOjfvMf3Ahb/1G3W9gGSq6ENU3Dhcsi67uTWxzo6iF04YD0tSrd9yx4lW1M87EvGi
 s9S3v6fklrkguBiChmyArVdc+VJcS77eGrDHwDz7EuNn+WkbI8GVvbEPHttmwzBJk1ODZC0iO
 LDR+M5TVGE8bpbAmi42tGv9JB6v0ebBqTJ8yfCo43h4eGJ9GsmEx+a0eKsvhZ/G0Oqcs8vlPj
 e09t1kKQjdfIBRWmx7Xd/EdbPYnPV9pZTSjKMfgCJUQGnp5nR7luSE8D8u8aMr+SW6kfGnOvn
 NkGmm9UYWXqqEfiYM/Z6pytfZqViUQgZ6etwh98q/WV6hMpg8O0AXag073Pz15yDrauyZUg7y
 Zb2Tc47YGx3Wz0h4I6NpXPjIr7vqzzuJPAygsM+rK7YiCeKqI6bSfl042XD6muUouv/SJfvYF
 lsgkj7q6k+F3QmoRr3Ks92GsHiIYDE9cn4nHsyxVI+geLNuxGSh1sOsvkEpEit83b1ScvpqZu
 0TWN91xzEdl2uGjepbPPtMVw3u9K6X+hbd5NI9UmwvUkZ27ejiEuHJ6sCN9jreR4zG7Uw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kd1xUmBe;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
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

On 20.08.21 14:46, Anmol wrote:
> On Fri, Aug 20, 2021 at 5:53 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>
>> On 20.08.21 14:02, Anmol wrote:
>>> Hello,
>>>
>>> On Thu, Aug 19, 2021 at 7:22 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>
>>>> On 19.08.21 15:42, Anmol wrote:
>>>>> Hello,
>>>>>
>>>>> On Sat, Aug 14, 2021 at 8:20 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>>>
>>>>>> On 11.08.21 20:36, Anmol wrote:
>>>>>>
>>>>>> The echo should not show any response, but when you do an lspci -k, =
you
>>>>>> should see that the targeting devices are now driven by uio_ivshmem.=
 If
>>>>>> not, the IDs might not be correct yet, or the devices are missing.
>>>>>>
>>>>>> Also check the kernel console of the cell where you issued this echo=
.
>>>>>>
>>>>>
>>>>> I have added the PCI devices to both the cells and set the
>>>>> `.shmem_dev_id` accordingly, please have a look at the cell config.
>>>>> files I have sent.
>>>>>
>>>>> here's the `lspci -k` output:
>>>>> qemux86-64:~# lspci -k
>>>>> 00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM=
 Controller
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> 00:01.0 VGA compatible controller: Red Hat, Inc. Virtio GPU (rev 01)
>>>>> Subsystem: Red Hat, Inc. Virtio GPU
>>>>> Kernel driver in use: virtio-pci
>>>>> 00:02.0 Ethernet controller: Red Hat, Inc. Virtio network device
>>>>> Subsystem: Red Hat, Inc. Virtio network device
>>>>> Kernel driver in use: virtio-pci
>>>>> 00:03.0 Unclassified device [00ff]: Red Hat, Inc. Virtio RNG
>>>>> Subsystem: Red Hat, Inc. Virtio RNG
>>>>> Kernel driver in use: virtio-pci
>>>>> 00:04.0 SCSI storage controller: Red Hat, Inc. Virtio block device
>>>>> Subsystem: Red Hat, Inc. Virtio block device
>>>>> Kernel driver in use: virtio-pci
>>>>> 00:1b.0 Audio device: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6
>>>>> Family) High Definition Audio Controller (rev 01)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: snd_hda_intel
>>>>> 00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>>>> UHCI Controller #1 (rev 03)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: uhci_hcd
>>>>> 00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>>>> UHCI Controller #2 (rev 03)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: uhci_hcd
>>>>> 00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB
>>>>> UHCI Controller #3 (rev 03)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: uhci_hcd
>>>>> 00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2
>>>>> EHCI Controller #1 (rev 03)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: ehci-pci
>>>>> 00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface
>>>>> Controller (rev 02)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> 00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH=
)
>>>>> 6 port SATA Controller [AHCI mode] (rev 02)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: ahci
>>>>> 00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controlle=
r (rev 02)
>>>>> Subsystem: Red Hat, Inc. QEMU Virtual Machine
>>>>> Kernel driver in use: i801_smbus
>>>>>
>>>>
>>>> Is this taken while Jailhouse was enabled? It's missing your ivshmem
>>>> devices (00:0c.0 - 00:0f.0).
>>>>
>>>
>>> I did some changes to the root-cell config files, and now it=E2=80=99s =
showing
>>> the PCI device 00:0c.0 (I have added defined macro for VIRTIO_BLK
>>> only):
>>>
>>> qemux86-64:~# lspci -k
>>> .
>>> .
>>> .
>>> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106
>>> Subsystem: Siemens AG Device 4106
>>> .
>>> .
>>> .
>>>
>>> But it=E2=80=99s not showing any association with the `uio_ivshmem`, an=
d also
>>> I am still not able to find the `/dev/uio0`.
>>>
>>
>> And now
>>
>> echo "110a 4106 110a 4106 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivsh=
mem/new_id
>>
>> again.
>>
>
> Here's the full log:
>
> qemux86-64:~# jailhouse enable /usr/share/jailhouse/cells/qemu-agl.cell
> qemux86-64:~# modprobe uio_ivshmem
> qemux86-64:~# lsmod
> Module                  Size  Used by
> virtio_gpu             65536  0
> virtio_dma_buf         16384  1 virtio_gpu
> virtio_net             53248  0
> net_failover           16384  1 virtio_net
> failover               16384  1 net_failover
> jailhouse              36864  1
> qemux86-64:~# echo "110a 4106 110a 4106 ffc002 ffffff" >
> /sys/bus/pci/drivers/uio_ivshmem/new_id

ffc0... -> back-end device

> qemux86-64:~# lspci -k
> .
> .
> .
> 00:0c.0 Unassigned class [ff80]: Siemens AG Device 4106

ff80 -> you have a front-end device here

You are either running that in the non-root cell or you misconfigured
the root cell (JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK is needed).

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/457f3a55-732d-15a6-8e4b-d4a86202e302%40web.de.
