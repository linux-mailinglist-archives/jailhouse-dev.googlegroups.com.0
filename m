Return-Path: <jailhouse-dev+bncBAABBWG22TZAKGQEWRPFI3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25216C3B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 15:21:13 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id d15sf2639881lfn.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 06:21:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582640473; cv=pass;
        d=google.com; s=arc-20160816;
        b=EwrEcTOeEI5EFaqDmN0xTgjIVpi3gHJtwKXunkrzq0HbPQxNljg/IzMX5iT0x2rQWc
         Vls4cXryBj7bS9gmHjVJ9wTQ4Pw3JzeV0S7cUhwJDl0oM92DBrbkA5VsLn5DDkekkfDk
         SBo6h3kAwJHbjr2Dmu7h39B4VOv4+fWz4gL+7Lp0ibL4b4KmB99vLVssx2FPMDQFXumM
         n/ZtsqlFgHM3TjZQoAVj1zAcvs1FfnD+mqZSg4oIQGjmGuSzo83r2psPfaje7zw0wqif
         QwYe3VRB4whPv9gbV9Z7A0VEvNwFhM+Wyz9zjriDypE/W5wvFvuy7cw9F0I/6iz9co6i
         4avA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject
         :resent-message-id:resent-date:resent-to:resent-from:sender
         :dkim-signature;
        bh=qL+nEESNvmftxf8jBtd8axrOvKzbXZrFVMgMssPvJU0=;
        b=ZdKKK73LBuk/27mjz+z4dDyrO6Yxqz2qyOEU8FqAEF1hKM+4H5p4SaAqYrBHwETThN
         QuPqTT1rVmmEbAZ9bPKyUX6wQCOXD0w0Ekbsj4qhynve0EU2zvF8dxHUHYcx0/9jpURJ
         EyeDMfb3LHsvFgKrXtbKnBx9qpWg4JpkVDDz2CIZIOlRbFZ7e8E50hox/tA+LTw/x3UZ
         W0tQl1/TcXkeiO8FEzI9sh6Kvd/AqxShqstQ2yUAPAIyBLoK2Qbes05IzzUPpddDtpXG
         si1KPCSmxwIXqtSa3BXU4pfCJ8bzjk+JHDNhuUyPn0kTzcS9EIXYbWIq5n9qGGE6fgT2
         ZC6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:resent-from:resent-to:resent-date:resent-message-id:subject
         :to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qL+nEESNvmftxf8jBtd8axrOvKzbXZrFVMgMssPvJU0=;
        b=hk8dsI5z/B5Ino59WotPMfWtPl2XBxRCc3qTNEklEhfln3Eu2WZ/o+VkDWWuFnQvil
         kuLJ4DAJ9nMB/6lgwUcTP87nBUZMCng64A1hWfU4NYEvnCNCQXLCS1yYu97YvtEDPSsB
         y2wyQ9108xVaoCqFIoIZS9RrFXscj65Y0LvTJHEy4OI2hLlbHLm8JfhPuckwLukB5Crt
         8owm/E8Uj3gxiAfsUzKjPiiVzuiWXR305FGBkxXyKh/4kw6iz3CM1cz98ilgKHS6qhBS
         aws1RHrgKeOoZ9GpiHC8e2/FH07d2m58q3p7nsDK/cmjOsd+8eRa7tr8icpJ6q0sQ8yk
         wUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:subject:to:references:from:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qL+nEESNvmftxf8jBtd8axrOvKzbXZrFVMgMssPvJU0=;
        b=h76YK62HeAZ0wa+TJV6Ujuinm0k3M0Y/VcW6tT1jA9/LJan6kpMFCQeac0CpDKebV2
         +CZ5raaoLke3XdhyOqKdaX0dUzFvOKmSspw7h/gEsLDn9htSqKpRz8XNejay0Tq9LrMw
         N1tSsfMaSw7SOaomhSnPsaTwgZhBmMa4LI22sUYHwIuDlqfNwTUWGjP5/9P4MEjW+Def
         Om+SXsaw2zpJXthLLey0Kk8VVzLUYyiPCjqcps/Q61YbPz1AjCgj6R3l5xt7lv/q/0Dd
         QKfZog/zNXe0tyjBwBBTRDDy2w2sFqLfq7BChmVxbJnDTnCfro9bubsu5vhWccBi97jE
         wdgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVEetnpsvF6d/DqSejmlXxKR6iAoK5NfQHFt6QQLZ5oT+3V9+Jn
	Hjrnr6fXGDdvPubop6ZddWY=
X-Google-Smtp-Source: APXvYqw0xD5voWI/LLa84jHpF8s0aLI9N3y6qSvBjf+ZkhU7HBeRJ3/xdGDWmnoxLFNmdBHNmlkoYA==
X-Received: by 2002:a2e:84d0:: with SMTP id q16mr34300781ljh.138.1582640473367;
        Tue, 25 Feb 2020 06:21:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a07:: with SMTP id h7ls2180335lja.3.gmail; Tue, 25 Feb
 2020 06:21:12 -0800 (PST)
X-Received: by 2002:a2e:8702:: with SMTP id m2mr34590825lji.278.1582640471983;
        Tue, 25 Feb 2020 06:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582640471; cv=none;
        d=google.com; s=arc-20160816;
        b=aJnKG7aMSL8NYw1fBis5ToPOr1f0ncfXMUauuT1blCc1j9geQ444YJ9gD3Im2yG0Ms
         fM3o8tqg8QbVW5gMfzp79NbhtaQBQxzmmfNbkivyIwu/OFRP58DQMNTPWq78XxQf1H8D
         dmCWaQFZ2qZq4cxrEv+OjsNK/1Wscx4O7RMFAkfyrJWCkK0OB20f0DG8Fse/DgGB/Ne7
         zANyS3x38FusG4Q1YRbi50LRqw3ZI89OE07s7dMSXV3jiMyLtc5Oc5EAFxZojOS2/kNd
         xifKlhj0fAGo3ijkT/8vBZxDS3kbLhK72tjGfBywGRsPY7S1K6aGAEYuD1XiCHZKW/Y/
         w0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:from:references
         :to:subject:resent-message-id:resent-date:resent-to:resent-from;
        bh=ruE/Bnj7ROMNAQS6p60B4pgUkQIsgv0AyAhQL6lmc6A=;
        b=dpqkLEK7j+WSGCVjVd2d+tapTw6A4+9/PgGVOW++Cn8qSmbJ7zfO8XzuBZ0MDWxQ8z
         knuirdB+7T5HrpiGpkc2wKKntSF4EKpdi1XQo12XkfyITvFG7XhtJr8/0D8xo+lelQCG
         0Dh9VyJJhGstqaNRSVfGg+y1jyINkwnUs5gofkBGvzbmxsj5gHUVo04Z3Je7CM1O0e19
         N2TGErBeFkVKsqtGfcslBGGWugPrm4Df+F57+EB5n9V9VQnlMIdzD5E4tJe03BgUZfxb
         Sggos6daY/hAOch9ozb3GdVfrUOhgJkKqpWtUi9hCwVQaT5lUSz3rzBrW3LPRrbX26tV
         B8yQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id p12si857797lji.1.2020.02.25.06.21.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Feb 2020 06:21:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1j6b5C-0005CT-JB
	for jailhouse-dev@googlegroups.com; Tue, 25 Feb 2020 15:21:10 +0100
Resent-From: Philipp Rosenberger
 <p.rosenberger@linutronix.de>
Resent-To: jailhouse-dev
 <jailhouse-dev@googlegroups.com>
Resent-Date: Tue, 25 Feb 2020 15:21:05 +0100
Resent-Message-ID: <fa7b761b-9ff8-a703-1c21-658b73f508f1@linutronix.de>
Subject: Re: Linux non-rootcell with IVSHMEM
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
 <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
 <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
 <7557bc16-d8c7-7b60-7aaa-6914d9effc51@siemens.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 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
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <af52b1de-e2d9-99c1-7f97-0c927d0076f0@linutronix.de>
Date: Tue, 25 Feb 2020 15:16:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7557bc16-d8c7-7b60-7aaa-6914d9effc51@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: p.rosenberger@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of p.rosenberger@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
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

On 24.02.20 11:07, Jan Kiszka wrote:
> On 24.02.20 09:46, Philipp Rosenberger wrote:
>> Hi Jan,
>>
>> thanks for the fast reply.
>>
>> On 21.02.20 09:31, Jan Kiszka wrote:
>>>> I start the non-rootcell with the following command:
>>>> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
>>>> "console=3DttyS0,115200 8250_core.skip_old_serial_uarts=3D0xE
>>>> earlyprintk=3DttyS0,115200 ip=3Ddhcp root=3D/dev/nfs rw
>>>> nfsroot=3D10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
>>>>
>>>> Here is the log from the hypervisor:
>>>>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>>>>> Shared memory connection established, peer cells:
>>>>> =C2=A0=C2=A0 "RootCell"
>>>>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>>>>> Shared memory connection established, peer cells:
>>>>> =C2=A0=C2=A0 "RootCell"
>>>>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>>>>> Shared memory connection established, peer cells:
>>>>> =C2=A0=C2=A0 "RootCell"
>>>>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>>>>> Shared memory connection established, peer cells:
>>>>> =C2=A0=C2=A0 "RootCell"
>>>>> Adding PCI device 02:00.0 to cell "my-inmate"
>>>>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>>>>> Removing PCI device 00:00.0 from cell "RootCell"
>>>>> Adding PCI device 00:00.0 to cell "my-inmate"
>>>>> Created cell "my-inmate"
>>>>> Page pool usage after cell creation: mem 377/975, remap 65546/131072
>>>>> Cell "my-inmate" can be loaded
>>>>> CPU 3 received SIPI, vector 100
>>>>> Started cell "my-inmate"
>>>>
>>>> I get no errors or anything. The cell starts without problems when I
>>>> remove the IVSHMEM parts from the config.
>>>>
>>>> I use the following kernel:
>>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queue=
s/jailhouse
>>>>
>>>>
>>>>
>>>> And the jailhouse from the current master branch
>>>> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)
>>>
>>> That kernel contains support for virtio over ivshmem, and you are
>>> exposing two frontend devices, likely without having the backends
>>> running. Start with removing those frontends again if you are only
>>> interested in ivshmem-net or custom ivshmem (via uio etc.). If you want
>>> to try virtio, make sure the root cell has the backend demos running
>>> (tools/virtio/ivshmem-*). See also
>>> https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.ja=
n.kiszka%40siemens.com.
>>>
>>>
>>
>> In the end I want to run the whole ivshmem stuff including the virtio-*.
>> =C2=A0 For now I removed everything except the SHMEM net stuff.
>>
>> The rootcell looks ok:
>>> [=C2=A0=C2=A0 27.704596] jailhouse: loading out-of-tree module taints k=
ernel.
>>> [=C2=A0=C2=A0 30.266681] hpet: Lost 1859 RTC interrupts
>>> [=C2=A0=C2=A0 30.266938] pci 0000:00:0f.0: [110a:4106] type 00 class 0x=
ff0001
>>> [=C2=A0=C2=A0 30.266961] pci 0000:00:0f.0: reg 0x10: [mem 0x00000000-0x=
00000fff]
>>> [=C2=A0=C2=A0 30.266969] pci 0000:00:0f.0: reg 0x14: [mem 0x00000000-0x=
000001ff]
>>> [=C2=A0=C2=A0 30.267208] pci 0000:00:0f.0: BAR 0: assigned [mem
>>> 0x90400000-0x90400fff]
>>> [=C2=A0=C2=A0 30.267214] pci 0000:00:0f.0: BAR 1: assigned [mem
>>> 0x90401000-0x904011ff]
>>> [=C2=A0=C2=A0 30.267295] ivshmem-net 0000:00:0f.0: enabling device (000=
0 -> 0002)
>>> [=C2=A0=C2=A0 30.267339] ivshmem-net 0000:00:0f.0: TX memory at
>>> 0x0000000100701000, size 0x000000000007f000
>>> [=C2=A0=C2=A0 30.267342] ivshmem-net 0000:00:0f.0: RX memory at
>>> 0x0000000100780000, size 0x000000000007f000
>>> [=C2=A0=C2=A0 30.267809] The Jailhouse is opening.
>>> [=C2=A0=C2=A0 30.273553] ivshmem-net 0000:00:0f.0 enp0s15: renamed from=
 eth0
>>
>> But when I start my non-rootcell it just hangs like before.
>>
>> my non-rootcell:
>>> #include <jailhouse/types.h>
>>> #include <jailhouse/cell-config.h>
>>>
>>> struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cell_desc cell;
>>> =C2=A0=C2=A0=C2=A0=C2=A0__u64 cpus[1];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_memory mem_regions[9];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cache cache_regions[1];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_irqchip irqchips[1];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pio pio_regions[5];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_device pci_devices[3];
>>> =C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_capability pci_caps[13];
>>>
>>> } __attribute__((packed)) config =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0.cell =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D JAILHOUSE_CEL=
L_DESC_SIGNATURE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .revision =3D JAILHOUSE_CONF=
IG_REVISION,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "my-inmate",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_CELL_PA=
SSIVE_COMMREG |
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpu_set_size =3D sizeof(con=
fig.cpus),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_memory_regions =3D ARRA=
Y_SIZE(config.mem_regions),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_cache_regions =3D ARRAY=
_SIZE(config.cache_regions),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D ARRAY_SIZE=
(config.irqchips),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pio_regions =3D ARRAY_S=
IZE(config.pio_regions),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D ARRAY_S=
IZE(config.pci_devices),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_caps =3D ARRAY_SIZE=
(config.pci_caps),
>>> =C2=A0=C2=A0=C2=A0=C2=A0},
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0/* CPU 3 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0.cpus =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4,
>>> =C2=A0=C2=A0=C2=A0=C2=A0},
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0.mem_regions =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared memory reg=
ions (networking) */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_SHMEM_NET_REGIONS(=
0x100700000, 1),
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* low RAM: 1 MiB */ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phy=
s_start =3D 0x100700000,
>=20
> You have low RAM and ivshmem at the same location.

Thanks for the hint. I fixed the location. Now everything starts fine. I
can bring up the interface in booth cells. I get no errors, but I can't
ping the in any direction. Can I enable some debug messages or where
would I need to add something to debug these kind of issues?

> We really need a config checker...
>=20
> Jan
>=20

Best regards,
Philipp

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/af52b1de-e2d9-99c1-7f97-0c927d0076f0%40linutronix.de.
