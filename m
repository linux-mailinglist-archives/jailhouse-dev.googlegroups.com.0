Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5HW37XAKGQESWVIQYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 389AB1074A7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Nov 2019 16:15:01 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id u17sf1804501lfl.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Nov 2019 07:15:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574435700; cv=pass;
        d=google.com; s=arc-20160816;
        b=lLmFkp7vpPLHabF7kmRqWV7CRYOjc0WNp3iucQ+QX2rlo413tZW6EN3/vsqKlfjYa2
         Cy5ZPSw3HVa0dJSiNlowElOjq4Ehk3U+/K7a+JBtiqEvsiavJSr+q0h37G5sS48D3O3M
         9CkK+0R7Jx5N147sKqKlyY1UVDkYAiCFZ6QIn22rBuW40dovBZB03sR3Cq5EmayxM/lD
         Bl23IMkuD2gSB75CEV+NCGJbAlNH0zkhSzsaMYd5Y80bY3sXdnksSAKoObt+xNtYa5Y7
         2fMwkjg6uDfuWVrEPOeskSbTEgBflwZaXI5xmuBGd4ZOKkFCZ9gdjp+BQM//gXNXKgNQ
         oINA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=H1KFpUyfzn8hPh/ION9khliveTbAtb2ThmEuqWm9OIE=;
        b=hoKOEgnwneh+I+uwXIhw+QRPJSbJjmzbw69e11/PMZfOibCBFFMFCPN9IKEkm+L4jc
         /2SzvMRXBEbVOKgmCd3v1Aznuo0sWdZoabbhgs3WFvIfW7rVS0oW4dKgjBqfx+9NjGFY
         2f8Sxevvufq/fmryllsk6ixH1SFhdBVFEh57YVYuEX7kayebsdC0m3fOabYP3kkznaaZ
         pjo7ybyAEZSotqrBYOydnB2QyqV1HrBoie51Ek1R2EEixxMDdoNkb/Ry1NRipoep+rzw
         nmjwKLmJxneD8/qljuLMWRzEPaLKeuAdORTvM9b4waDRMgSrBJUaiyG1q0DlR2Ac71OJ
         BjIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H1KFpUyfzn8hPh/ION9khliveTbAtb2ThmEuqWm9OIE=;
        b=Qx2eNnF/yMh/YH4ljOC0/aakAr8gqmy/trcbTiZL5Q72YhekQzk/XqL6+wCmAoq+hB
         NcWm3XHtY8ylMk13y8/EVw1jPr/IfbCv4uTsWYsX8aNPbqgdx16hgqdeEVEo95Wnu/Nu
         f2PROjGDWUke88VkARnv2YyA+UbGccixfssEfS79sNSw+ZUXfpyuBc4TYzGBYji7Lt9G
         T1nBIiI9G7DPmTzAWNRY+TA1ZMv7cOtmC+Q9CeFENbGdqGsx1RzzMl7Y7yD2jwpme0+A
         kxhXDMN7MhjBYfevAEep4nLMtXQlfm3g0ASvk1E40JV4iLM6EVmLGKxbC6Ia6aWZtxVe
         xPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H1KFpUyfzn8hPh/ION9khliveTbAtb2ThmEuqWm9OIE=;
        b=WLHfYlQWEOVb5frYWQhe6CjJGFo+JPVXwXwnHZtYv/IiUal2xCAWm0cFm8/wRJHpsn
         M7m0eE0FsPrzxqGg15E7F3GVEc2xZyEbHbj7JLz6FS22ulUG1Ku6wWjprXRd1NMkPfdZ
         sBtuOuBUNSJFyOrBLbYcTVBMB2ajKlypudyiHazN80Tt/ghS6ne6uJeCzuos3LL5JrWM
         Yb0MPMQNloQGkhwISgsL2DiyU0Ok+VvwA4UeudM6A9dkKIze7MJt9+x9gPDJkMAFOWHu
         zPfuJ2RphmHlnsYDxKd7bZCm9RmukvxqXK4vIjnV6lb9Va+pouSn9ncycjmeKuD8xHkF
         jQNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV777oeotF3lLXbuyZe+lo/xyP6zC9Vedf+kHNhA+lYNDjh4qwN
	kxc86H7/b1QvS8DzNzzIhEM=
X-Google-Smtp-Source: APXvYqx0gpraMLGbXbNUF9rh2z0IS/CeSthLNFuE3xROmOoN4uOKf8beWJsQf99cifwauwS68xFK1A==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr12748961ljc.208.1574435700716;
        Fri, 22 Nov 2019 07:15:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:864f:: with SMTP id i15ls1539176ljj.11.gmail; Fri, 22
 Nov 2019 07:14:59 -0800 (PST)
X-Received: by 2002:a2e:94d6:: with SMTP id r22mr12567071ljh.7.1574435699835;
        Fri, 22 Nov 2019 07:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574435699; cv=none;
        d=google.com; s=arc-20160816;
        b=mEwjycUUIprTSq42BSoksAiAMfNjuoI6K82JxH08PLyjeZPgLoqydvh4ivVbjoQ/i7
         bL7WCYqrPniH0rvrmMUj7tC0EZCt2W/Ji2+ymNrQkHmfFHr6YzWUnqHXS5kxWdSkInwH
         wwkMCiPhHR5UPKwx6MJZoXFN+y8N+1PF1gtpBP843ocwrV6t0h6lVu9gStGQtGtDpJpH
         KfmuEFO4ruMrQdLHU2NE6lexFSdKiau5qz+vPQzRTKms+ICfL07RBvZX0KnqGrMYSMX7
         urF+lCsEfMyp7ZxCR9zB/avDODuyqowIaTmugAEmPOGhpYAyjhKClTUdr57krB8QUDWc
         EPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TydCqWMz2pnwX/YEYjsRmLdYj3O1XU9P5R+JPM9hz/I=;
        b=zMobDN340qhbSHrP4kaIcAwMIzLXIcNuusBdc06G/QjYNqrvvLRn+oFdwAs+keEo2i
         8ZE9gCNFPex7kkQkz034ZxB3GAwccSNmlv9vEe/nThx5CuhcRg9BoWT2Po9H8EukWLmY
         p6XQCUuvwglAL+Dg0jpfFBxxAvvaPdAiqcZA9CB34hI9G5oqKJagBZdJOKbf2RuHKMNf
         lX2eGBrA3PlDRyKGo8EVfhgtem7/17mAMPQ0+DMiWjgtD62EBWANV7zMgQ/Ye04XfbC2
         l6GWqQGNe4wWSeEbvCZ4pCBCNVbSjMeiu76DYHPnC872YdfSyUgKeDc9sEh+sXRih2JU
         bHIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b13si402015ljk.4.2019.11.22.07.14.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 07:14:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xAMFExdU002847
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Nov 2019 16:14:59 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xAMFEwSw026176;
	Fri, 22 Nov 2019 16:14:59 +0100
Subject: Re: jailhouse stops on cpu_down on dual socket setup
To: Martijn Pieterse <martijn.pieterse@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <b326bfd4d6954f39989b5459b15c8b09@prodrive-technologies.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1a1e610d-bb95-053e-8bc5-00cd0130b154@siemens.com>
Date: Fri, 22 Nov 2019 16:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b326bfd4d6954f39989b5459b15c8b09@prodrive-technologies.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 22.11.19 11:24, Martijn Pieterse wrote:
> Hi,
>=20
> After successfully installing and running jailhouse on several systems=20
> I=E2=80=99m now trying to get jailhouse to run on a dual socket setup, wh=
ich is=20
> giving me some problems.
>=20
> I=E2=80=99m running Ubuntu 18.04, kernel version 4.15.0. Enabling jailhou=
se=20
> works fine, it breaks when creating a cell (at the cpu_down()) call, or=
=20
> when disabling a cpu with a shell command:
>=20
> =E2=80=9Cecho 0 > /sys/devices/system/cpu/cpu2/online=E2=80=9D
>=20
> The last vmexit seems to be an NMI, after that is handled the system=20
> stops being responsive. I=E2=80=99ve added some printk=E2=80=99s in the h=
andle_vmexit=20
> code, but this did not help me.
>=20
> Because I never had problems with getting jailhouse up and running on a=
=20
> single socket system, I=E2=80=99m assuming it has to do with the dual soc=
ket=20
> setup, but I=E2=80=99m out of ideas of how to diagnose this properly. The=
=20
> processors are the 4109T, but I don=E2=80=99t think this matters.
>=20
> The output on the serial port:
>=20
> Initializing Jailhouse hypervisor v0.11 (36-gedfe64fd-dirty) on CPU 11
>=20
> Code location: 0xfffffffff0000050
>=20
> Using x2APIC
>=20
> Page pool usage after early setup: mem 151/15823, remap 0/131072
>=20
> Initializing processors:
>=20
> CPU 11... (APIC ID 22) OK
>=20
> CPU 6... (APIC ID 12) OK
>=20
> CPU 3... (APIC ID 6) OK
>=20
> CPU 1... (APIC ID 2) OK
>=20
> CPU 12... (APIC ID 24) OK
>=20
> CPU 13... (APIC ID 26) OK
>=20
> CPU 9... (APIC ID 18) OK
>=20
> CPU 0... (APIC ID 0) OK
>=20
> CPU 5... (APIC ID 10) OK
>=20
> CPU 7... (APIC ID 14) OK
>=20
> CPU 4... (APIC ID 8) OK
>=20
> CPU 14... (APIC ID 28) OK
>=20
> CPU 2... (APIC ID 4) OK
>=20
> CPU 10... (APIC ID 20) OK
>=20
> CPU 8... (APIC ID 16) OK
>=20
> CPU 15... (APIC ID 30) OK
>=20
> Initializing unit: VT-d
>=20
> DMAR unit @0xd37fc000/0x1000
>=20
> DMAR unit @0xe0ffc000/0x1000
>=20
> DMAR unit @0xee7fc000/0x1000
>=20
> DMAR unit @0xfbffc000/0x1000
>=20
> DMAR unit @0xaaffc000/0x1000
>=20
> DMAR unit @0xb87fc000/0x1000
>=20
> DMAR unit @0xc5ffc000/0x1000
>=20
> DMAR unit @0x9d7fc000/0x1000
>=20
> <<< Remove lots of PCI init >>>>
>=20
> Adding PCI device d7:16.0 to cell "RootCell"
>=20
> Adding PCI device d7:16.4 to cell "RootCell"
>=20
> Page pool usage after late setup: mem 893/15823, remap 65598/131072
>=20
> Activating hypervisor
>=20

I suppose from here onward is due to your own instrumentation of the=20
code, right?

> NMI: cpu: 0
>=20
> RIP: 0xffffffff8b33a2b3 RSP: 0xffffad66800ebe60 FLAGS: 2
>=20
> RAX: 0xffffffff8c014460 RBX: 0x0000000000000003 RCX: 0xffff96745f61d150
>=20
> RDX: 0x0000000000000003 RSI: 0x0000000000000286 RDI: 0xffffad6686ee7c90
>=20
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>=20
> CR0: 0x0000000080050033 CR3: 0x0000000c9ce0a002 CR4: 0x00000000007626f0
>=20
> EFER: 0x0000000000000d01
>=20
> VM_EXIT_INTR_INFO: 80000202

There might be some to-be-understood reason for Linux to use NMIs while=20
offlining CPUs. When you do that before Jailhouse is enabled, does the=20
related counter in /proc/interrupts increment?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1a1e610d-bb95-053e-8bc5-00cd0130b154%40siemens.com.
