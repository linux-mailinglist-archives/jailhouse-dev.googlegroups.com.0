Return-Path: <jailhouse-dev+bncBAABB2W62TZAKGQEBIRCJJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02716C3E5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 15:30:03 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id b3sf2347021ljo.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Feb 2020 06:30:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582641002; cv=pass;
        d=google.com; s=arc-20160816;
        b=jScx1uZxeh0+EnO9QRH2chshEFeGZefTz5L9SBPdiU0sb2hVL11vVjv6B7Eo48N/B/
         nsQzNWj+6ahStqXMM5tuuVK8ZKKXaWjhxXt2LkMqU1FxNaUA/kgUbii8BU3btKQW4zzQ
         utEuWGkjq8iUiY3C+wUTjRL0HGuxJY7BP4VUn33h3vdhKjmA4e9MGzVhN0iw92LUoVQV
         QCW7RWZZeFPPMYE28zyA0PyQ8ZgXk3z1sP6HdUip1YWZ1BdmZdE36M6BFOdzAuDnPfNB
         UNV4z7iYY1CvE8lhLHlHIdyZwMllwJs4bj+s7Wlx2AxqtVY2DsuSJZryR7cwzliQsrKg
         RKrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=QO6YviCiEsseRzZtIrPYqvaiWoL1k0yPeqerONaQMzU=;
        b=OkS3FY5kWB2fZYhDRZqdMo7WrUtYI1iorbVUo1OPxfb3yxBJOH8BiYKfO95veIoHGD
         AdLAcWT83VBQAzx489UevKUbmIfE2QfJ8JN6GLwH+bFqO7D7EIQj/OpR93U96qV6yUL7
         CPcko7U3m3hOpLthx8ltdnMfynHNz6DoLBCL+GzphascFA/zrTrshR3JxBc5NmH0ZGCP
         49NCHRJb15cuH0Is+xGxmJPm1Hz9/3kxXH3hqlowwuWjACBBpScLjZcPGMS4Rda6QPSS
         rWVYcyyDjr99CbGSdbEBr0OWoQw5siSmBQWtYlhuz674paC32uCpK8xQawZSQWOFQmox
         A/5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QO6YviCiEsseRzZtIrPYqvaiWoL1k0yPeqerONaQMzU=;
        b=lmF8wCEbj3PJW6igzUkXwwg30vfnOt5CRi0HQJTBdT8usKgGwvaA+g7Qt3T+sJHVJy
         q98hUU8mt3HtbdqSNUIMCkjgdqKBU5Q+aYiArO13X/fEGLeu/z/5p9bsKYeytSskf8uF
         khtayCQiZYB1e+bbLAiUry5FcUvDAYlEqb7sv8fiN3kWSHa90goyLxwIC1rBuB0XtE22
         gMRdugOB6TPD5xtwj6hT0gWvYblEZgFMOxH6wXK5wLWjqsNoKjzf3ebh5wzswa/ne2B5
         x6WLKXlenhmktL3Mx4nmRaWfRdjW11zXW9XBDkfHjphc57TQPgYAb5GXc2lnUfMO71L+
         S+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QO6YviCiEsseRzZtIrPYqvaiWoL1k0yPeqerONaQMzU=;
        b=KHIMQ8fi66TQN05r8hXw0F3jgAj555ODScPDCxM1JvMMvhHpjmT3K6S7eJUEXUbq5T
         JOdYuQQPKXbgkEV+HOx5TiTjCw4UqAg/baI2t4HwDFdRY/Ryx41gapTp2qX3ZDYmJbyl
         DYy1BPzjyB5Go3UctNXSznwVILUM2gBEWTZ4tUBLhxtegjqkRKPodi8BRc3tu0WiHQtj
         P5nay8/WnIsU98ej27dIiJdq0wVpUcQWRkR/2Pp9IkrXgPBaf1Z+gpi/2rdYW/u2uCV0
         fjRN4YOodT09IGZzB5cnR1XIWkiayAMxLSmibA9mJ02YjGuQeMH9MsGMxcJMu/jakL1l
         u7Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/gvUlLctkNiRpJEGV3heRbqml6QjfhBMo7slesbMRznHLvUbe
	XNOQg7FmSxHUMXM68S1vPgc=
X-Google-Smtp-Source: APXvYqzdANfoLE1SvIMxBJYpflA0s6G6zcm1mkkxEXECYYVkgi3p1WeiBcv/xSCPkGxL5d7TdMcRgA==
X-Received: by 2002:a05:6512:44a:: with SMTP id y10mr9898084lfk.85.1582641002534;
        Tue, 25 Feb 2020 06:30:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4182:: with SMTP id z2ls1532295lfh.4.gmail; Tue, 25 Feb
 2020 06:30:01 -0800 (PST)
X-Received: by 2002:a19:2396:: with SMTP id j144mr16647289lfj.113.1582641001900;
        Tue, 25 Feb 2020 06:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582641001; cv=none;
        d=google.com; s=arc-20160816;
        b=t+Csh24DTb/hxB2jqqr23vANQWeWkblQkVbpNBW6YmlEl8iZQbpx0BBR7RxqYYiLZc
         aO9a32Fk8uDP4TcVo+C3Gg7xOMn+rshSEuWgiYMzBbq2pAGh4X7JQf6OmRdfBhEd5PGb
         bxCo2fTcAilj5NYJL+vjDIp3962O91WM7Ak+YCNCneh8lztOiAFAig7x0OfaEqRJu7z1
         +6jkCLAulIxzT1tzDW/rSaYjG2Z3g/P9L8gYVExPE8BXyATeBGaUdWC4s/ms1umBt/aT
         5eMGK8Xaq6JE1PmFUf3nry+GN1Isw2Q1jA9oPyq6PtpKplLidP8oU/N3lKS5Klr4dr6H
         MHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:from:references
         :to:subject;
        bh=ZWBd/e8yBtMc9duxA0MrTARUeNmbXzTeez+pWtmt4WU=;
        b=z2mTRU8cZ3Nli/cGmwdACz/PWgoNRRea+FY+2BWetbn+04i0FuIMTc+7DZqlHL6aRt
         o2hQbderC+86YVHDg4fCIPUmiNr1x9/OPNYn8pdcah9v/tzT5bE1d/PTzBWfHoAGXU/s
         zfIa9CVGJHA5+kMd3PGIzMX08V7aD0AlXNwSUPJ8Gim7lrBf2LZ1hXqI7WB0rZe9GSVf
         DXSUWntqvyMytgxSKOk/IfEz9uqjtRhfmY2QhFpYo58H35XO7Z6ab3YFhlmYtqNHCCTO
         0+VF/In4HNItrmEOfr3bZ6NAdQV3cMLsOqH52EZ/iz7m9PWjBmL7fJBjKLXlzjfEFZMa
         f1Xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id x5si1369245ljh.5.2020.02.25.06.30.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Feb 2020 06:30:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1j6bDk-0005OM-GC; Tue, 25 Feb 2020 15:30:00 +0100
Subject: Re: Linux non-rootcell with IVSHMEM
To: Jan Kiszka <jan.kiszka@siemens.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
 <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
 <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
 <7557bc16-d8c7-7b60-7aaa-6914d9effc51@siemens.com>
 <af52b1de-e2d9-99c1-7f97-0c927d0076f0@linutronix.de>
 <1bea34d1-7171-0043-0b27-bcb4b23a30d7@siemens.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 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
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <5fefafd6-ecb7-647e-1d0f-ab22487e32ec@linutronix.de>
Date: Tue, 25 Feb 2020 15:29:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1bea34d1-7171-0043-0b27-bcb4b23a30d7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
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



On 25.02.20 15:23, Jan Kiszka wrote:
> On 25.02.20 15:16, Philipp Rosenberger wrote:
>> On 24.02.20 11:07, Jan Kiszka wrote:
>>> On 24.02.20 09:46, Philipp Rosenberger wrote:
>>>> Hi Jan,
>>>>
>>>> thanks for the fast reply.
>>>>
>>>> On 21.02.20 09:31, Jan Kiszka wrote:
>>>>>> I start the non-rootcell with the following command:
>>>>>> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
>>>>>> "console=3DttyS0,115200 8250_core.skip_old_serial_uarts=3D0xE
>>>>>> earlyprintk=3DttyS0,115200 ip=3Ddhcp root=3D/dev/nfs rw
>>>>>> nfsroot=3D10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
>>>>>>
>>>>>> Here is the log from the hypervisor:
>>>>>>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>>>>>>> Shared memory connection established, peer cells:
>>>>>>> =C2=A0=C2=A0=C2=A0 "RootCell"
>>>>>>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>>>>>>> Shared memory connection established, peer cells:
>>>>>>> =C2=A0=C2=A0=C2=A0 "RootCell"
>>>>>>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>>>>>>> Shared memory connection established, peer cells:
>>>>>>> =C2=A0=C2=A0=C2=A0 "RootCell"
>>>>>>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>>>>>>> Shared memory connection established, peer cells:
>>>>>>> =C2=A0=C2=A0=C2=A0 "RootCell"
>>>>>>> Adding PCI device 02:00.0 to cell "my-inmate"
>>>>>>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>>>>>>> Removing PCI device 00:00.0 from cell "RootCell"
>>>>>>> Adding PCI device 00:00.0 to cell "my-inmate"
>>>>>>> Created cell "my-inmate"
>>>>>>> Page pool usage after cell creation: mem 377/975, remap 65546/13107=
2
>>>>>>> Cell "my-inmate" can be loaded
>>>>>>> CPU 3 received SIPI, vector 100
>>>>>>> Started cell "my-inmate"
>>>>>>
>>>>>> I get no errors or anything. The cell starts without problems when I
>>>>>> remove the IVSHMEM parts from the config.
>>>>>>
>>>>>> I use the following kernel:
>>>>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/que=
ues/jailhouse
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> And the jailhouse from the current master branch
>>>>>> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)
>>>>>
>>>>> That kernel contains support for virtio over ivshmem, and you are
>>>>> exposing two frontend devices, likely without having the backends
>>>>> running. Start with removing those frontends again if you are only
>>>>> interested in ivshmem-net or custom ivshmem (via uio etc.). If you
>>>>> want
>>>>> to try virtio, make sure the root cell has the backend demos running
>>>>> (tools/virtio/ivshmem-*). See also
>>>>> https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.=
jan.kiszka%40siemens.com.
>>>>>
>>>>>
>>>>>
>>>>
>>>> In the end I want to run the whole ivshmem stuff including the
>>>> virtio-*.
>>>> =C2=A0=C2=A0 For now I removed everything except the SHMEM net stuff.
>>>>
>>>> The rootcell looks ok:
>>>>> [=C2=A0=C2=A0 27.704596] jailhouse: loading out-of-tree module taints=
 kernel.
>>>>> [=C2=A0=C2=A0 30.266681] hpet: Lost 1859 RTC interrupts
>>>>> [=C2=A0=C2=A0 30.266938] pci 0000:00:0f.0: [110a:4106] type 00 class =
0xff0001
>>>>> [=C2=A0=C2=A0 30.266961] pci 0000:00:0f.0: reg 0x10: [mem 0x00000000-=
0x00000fff]
>>>>> [=C2=A0=C2=A0 30.266969] pci 0000:00:0f.0: reg 0x14: [mem 0x00000000-=
0x000001ff]
>>>>> [=C2=A0=C2=A0 30.267208] pci 0000:00:0f.0: BAR 0: assigned [mem
>>>>> 0x90400000-0x90400fff]
>>>>> [=C2=A0=C2=A0 30.267214] pci 0000:00:0f.0: BAR 1: assigned [mem
>>>>> 0x90401000-0x904011ff]
>>>>> [=C2=A0=C2=A0 30.267295] ivshmem-net 0000:00:0f.0: enabling device (0=
000 ->
>>>>> 0002)
>>>>> [=C2=A0=C2=A0 30.267339] ivshmem-net 0000:00:0f.0: TX memory at
>>>>> 0x0000000100701000, size 0x000000000007f000
>>>>> [=C2=A0=C2=A0 30.267342] ivshmem-net 0000:00:0f.0: RX memory at
>>>>> 0x0000000100780000, size 0x000000000007f000
>>>>> [=C2=A0=C2=A0 30.267809] The Jailhouse is opening.
>>>>> [=C2=A0=C2=A0 30.273553] ivshmem-net 0000:00:0f.0 enp0s15: renamed fr=
om eth0
>>>>
>>>> But when I start my non-rootcell it just hangs like before.
>>>>
>>>> my non-rootcell:
>>>>> #include <jailhouse/types.h>
>>>>> #include <jailhouse/cell-config.h>
>>>>>
>>>>> struct {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cell_desc cell;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__u64 cpus[1];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_memory mem_regions[9];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_cache cache_regions[1]=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_irqchip irqchips[1];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pio pio_regions[5];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_device pci_devices=
[3];
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct jailhouse_pci_capability pci_cap=
s[13];
>>>>>
>>>>> } __attribute__((packed)) config =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.cell =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D JAILH=
OUSE_CELL_DESC_SIGNATURE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .revision =3D JAILHO=
USE_CONFIG_REVISION,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "my-inmate=
",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE=
_CELL_PASSIVE_COMMREG |
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpu_set_size =3D si=
zeof(config.cpus),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_memory_regions =
=3D ARRAY_SIZE(config.mem_regions),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_cache_regions =
=3D ARRAY_SIZE(config.cache_regions),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D AR=
RAY_SIZE(config.irqchips),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pio_regions =3D=
 ARRAY_SIZE(config.pio_regions),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D=
 ARRAY_SIZE(config.pci_devices),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_caps =3D AR=
RAY_SIZE(config.pci_caps),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* CPU 3 */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.cpus =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.mem_regions =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared me=
mory regions (networking) */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_SHMEM_NET_=
REGIONS(0x100700000, 1),
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* low RAM: 1 MiB */=
 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .phys_start =3D 0x100700000,
>>>
>>> You have low RAM and ivshmem at the same location.
>>
>> Thanks for the hint. I fixed the location. Now everything starts fine. I
>> can bring up the interface in booth cells. I get no errors, but I can't
>> ping the in any direction. Can I enable some debug messages or where
>> would I need to add something to debug these kind of issues?
>=20
> [re-adding the list]

Sorry for dropping the list.

> If you don't get interrupts into the root cell (but the non-root does
> get some), you likely need to tune the iommu index of the ivshmem device
> in the root cell config. If you have two units, pick .iommu =3D 1.

This did the trick, thank you!

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
jailhouse-dev/5fefafd6-ecb7-647e-1d0f-ab22487e32ec%40linutronix.de.
