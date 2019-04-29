Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYU2TPTAKGQEV7TDIUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F06E042
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 12:09:38 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id b22sf3553288edw.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 03:09:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556532578; cv=pass;
        d=google.com; s=arc-20160816;
        b=eXfCTKEDkCFUZga760R7FHY527E32GQ5Jnv8MII1xbov9IdOPdsNWHylMB6IBNrsLi
         qE93ylKYc8vt57dUdtnSOrZWjbc37hkbjhurNR9T5pMAm9vA4EYwZeL1QVJvMZJBV2Rd
         KUj01B3nsNlaQeDFqevHPcAnN3Kd1MSduKdU1Vat5xF7AO18Tm9+7+nK0d0oOi21jQnh
         buIbGye46oatvna3QqRX0CcOH1hkg0lydsGvVW4tbzlC2VGr3WR2dmxbiu6A0DmLWsEH
         qsHuKLwmHcYq/qW2gTzEjo+aw+iALsoPmmRv+jmgUsa+jXoIzEkjqi93bCjQfkE1juB+
         uwDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=9vFDyH37gefHEJa+hyE4fuLrhjMg7Wa6lTINnFIywFU=;
        b=doY/q5RaOdus0XVr0squOKiUxlH+9MfnJc07KDSJoEO+Bhl2CW4ldc2CjX8PqF68RG
         fgtnFu8FHHDmlIlecWPtFSffQlxQ1DtgnlPR8HLuHZFB5DvuGUOtHbYAUhsw+bgsygP3
         b225jh02fK++JxzVJO3aghx0VPMQ0Iy6Wv/pP/hfmao73BYBhf4+y9n8wiF6uZTgLwD4
         VDaeH63BiiIcV5quGm9/U8lQGLT6EDFtDDWFwV+iuGOSzTec51Anncc2sDbE6GfMiy5o
         zwpOD7TbHxTcImRFwKI0R600UPFG9eWwwHJ7r5+8hZB7j+az3gDPks+o0EgTKzwtPJGv
         nP/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9vFDyH37gefHEJa+hyE4fuLrhjMg7Wa6lTINnFIywFU=;
        b=Oh3HjWbdcyUl1zM3KunYc1l6jz6GdQkEwmuGQhsduOv381Q0hjjSRifM38dNDTCU2c
         w4JwAoN6b8jH3lZhj959k0lteXfw9pILhc/YbXbkWARMBJHDKbHf4MGcrA6JGR0PN3ED
         /6WpW3oNgA8hV+4FXELY1f5KVrfTuiC5LQ/1k2j+b/J81uDo6rq3E7b+jOq+vaVTuPwz
         wwqHym/mB4PWL4jPza6JnIC4cbnJ4B20ramuQfK3rQWgdyEehQJjlBhWkEB3ytLNcuGB
         VlGnWcVThdlKbk1+uklcANE0aa/PmqRSS93HwO4xI5huDtZw/OOEIQ3QY8zrEON2kb//
         uStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9vFDyH37gefHEJa+hyE4fuLrhjMg7Wa6lTINnFIywFU=;
        b=hEHdllVfOXC/c6JJMGQwShayd64hbAgUoqkznIwUaVPiZG7vGeHyS5nYzCPmHRDrKl
         xCBoUZgJ3RHoNCyb/FhB6S/6XeVE/KArymnQt6iCBsvDSeFiBDNxmcFy40fCapOP4oDk
         o72Iek3r3804lNIMA6oT5Je5oUn9eXcCFlkVZ7l9pN7Yfk2i2PivBnxZY0ac2vtTSMba
         1RPxl3fO3PSHiQC1kmTkjpJudOiY0zgXooSmcw4NP2nXA6hKJepKx1Fa2BzxfdDtItje
         hhy9giOG/AAiNvunpPNWq9ZvuPEsf8vr/7EGfnWNfHyxbc5dhKsGKHpsVLTWkbYkS5fI
         5iSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUfoPFhDR0qIAicNGUuY/0BVJ460vYpVWa7ed/ab7/OMEpG9FNT
	rW37FaquXS6KRwZGNeYqYQM=
X-Google-Smtp-Source: APXvYqzzHIxDLwLKTC89ebyKsyEtYMKX9tz58VCMhbKrw6/GcTKY9qQXd5FTMCa8jcDY5bpNPPatvQ==
X-Received: by 2002:a17:906:f148:: with SMTP id gw8mr1283433ejb.137.1556532578236;
        Mon, 29 Apr 2019 03:09:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4009:: with SMTP id v9ls65832ejj.9.gmail; Mon, 29
 Apr 2019 03:09:37 -0700 (PDT)
X-Received: by 2002:a17:906:6408:: with SMTP id d8mr31061784ejm.185.1556532577572;
        Mon, 29 Apr 2019 03:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556532577; cv=none;
        d=google.com; s=arc-20160816;
        b=JmVVJkjMpeREBHWUS2KTVIjx8/ZAhXmTbTokAqSqK8CpMSH42C4B/E3ny/Pz2RDOlI
         oZSidO3Ug5qsi0O9GrfUqe1S6umB+NP8o5hH3goubzSW5mQBgM/azaFDTdS6wpk+ua2m
         3IopiZZ6BIrLC7QAk0w6Fnu7h6bEJG6+779mQRusNdhu4KKahARb3Lc3q6Zggxes7NNd
         3Pk79eeDAkcEa127y/n4hodQIv5qgbh/jcpBeDXubnNlKvYDzwVsmniErD9dypxDggjj
         le9BIhCXITv/49SPhWrjxXmMpjQnSwFjaiOi9XHdih+oR54i0OaSwyW2xYVb9RZ20ebp
         87QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ya68kZf1gtTaW/Xj0rg4yW0g6qrYuiQhtAPcB5HFWOA=;
        b=f5wI2PIgUd9i9BJkoH2REYZ4kpNnucJGjvT/HvpFZ74ESx7u8tY9lOcY5WCpMGIPyR
         /03z1GpBd4DXMZqXASb0Bl4PVakPJloVo6sZpl35XmQtMFbWHhRcevoxhGyvB+h7joAf
         zOm5ZHtsGGwM8NuIVGV8Lpp2Ei6byWUNwig2C4v8ESV01yGSEyOYHvKYHXgf7+y/puPj
         6dI/Cm1j6ZxuuNrpVZ4dvmKgmNyvRAUwwLnmSnrL7//6jlwWkbAzAEFnMd/SDNvJqrHT
         eEMuz8kYdHyhdH9Az/jSuj5+64AAJ1hEkvI9aIFaTT41AVfawyzy3+gfIBfqOKyCnup3
         h67A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t17si767309ejq.0.2019.04.29.03.09.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 03:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x3TA9abI008142
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2019 12:09:36 +0200
Received: from [139.22.43.249] ([139.22.43.249])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x3TA9Zgp000474;
	Mon, 29 Apr 2019 12:09:36 +0200
Subject: Re: ARMv7: using uio_ivshmem to send interrupts between cells
To: Nir Geller <nirgeller18@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAKBX2Q+8hYErhgVa1adF0agVFpYm5Di2HwGsUjH+3YJJQmda1w@mail.gmail.com>
 <6c2887b6-824c-4380-a0a0-d2151a0cfef4@googlegroups.com>
 <ed0d811d-db17-499c-880b-0d235db68c92@googlegroups.com>
 <55645a57-8bee-4563-96c7-f6f0cf70ad63@googlegroups.com>
 <12d43104-c726-44a0-8724-d99bae074f64@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c834189e-1903-df64-9680-ea9ec5fe21ce@siemens.com>
Date: Mon, 29 Apr 2019 12:09:35 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <12d43104-c726-44a0-8724-d99bae074f64@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 29.04.19 11:35, Nir Geller wrote:
> Hi,
> 
> I figure there's missing code related to uio_ivshmem in Jailhouse v0.7.
> 
> I migrated to the latest jailhouse version, branch master.
> I'm using RT_PREEMPT kernel 4.14.79
> 
> When I enable the root cell it seems like the hypervisor is not initialized.
> The only prints I get:
> 
> 
> [   35.272718] OF: PCI: host bridge /pci@0 ranges:
> [   35.306648] OF: PCI:   MEM 0x30100000..0x30101fff -> 0x30100000
> [   35.319993] pci-host-generic 30000000.pci: ECAM at [mem 0x30000000-0x300fffff] for [bus 00]
> [   35.330762] pci-host-generic 30000000.pci: PCI host bridge to bus 0001:00
> [   35.337600] pci_bus 0001:00: root bus resource [bus 00]
> [   35.347049] pci_bus 0001:00: root bus resource [mem 0x30100000-0x30101fff]
> [   35.355943] pci 0001:00:00.0: [1af4:1110] type 00 class 0xff0000
> [   35.355981] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit]
> [   35.356355] PCI: bus0: Fast back to back transfers disabled
> [   35.367812] pci 0001:00:00.0: BAR 0: assigned [mem 0x30100000-0x301000ff 64bit]
> [   35.376191] virtio-pci 0001:00:00.0: enabling device (0000 -> 0002)
> [   35.382777] uio_ivshmem 0001:00:00.0: using jailhouse mode
> [   35.389246] The Jailhouse is opening.
> [   36.001021] Created Jailhouse cell "AM5728-IDK-RTOS"
> 
> 
> When enabling jailhouse v0.7 I get prints that prove entry() was indeed invoked and the hypervisor is initialized:
> 
> Initializing Jailhouse hypervisor v0.7 (222-g5e1b3ea-dirty) on CPU 0
> entry(): started
> Code location: 0xf0000040
> Page pool usage after early setup: mem 30/4072, remap 32/131072
> Initializing processors:
>   CPU 0... OK
>   CPU 1... OK
> Adding virtual PCI device 00:00.0 to cell "AM5728-IDK-LINUX"
> Page pool usage after late setup: mem 44/4072, remap 38/131072
> Activating hypervisor
> [   54.734879] OF: PCI: host bridge /vpci@0 ranges:
> [   54.768094] OF: PCI:   MEM 0x30100000..0x30101fff -> 0x30100000
> [   54.774264] pci-host-generic 30000000.vpci: ECAM at [mem 0x30000000-0x300fffff] for [bus 00]
> [   54.783014] pci-host-generic 30000000.vpci: PCI host bridge to bus 0001:00
> [   54.790008] pci_bus 0001:00: root bus resource [bus 00]
> [   54.795264] pci_bus 0001:00: root bus resource [mem 0x30100000-0x30101fff]
> [   54.802663] PCI: bus0: Fast back to back transfers disabled
> [   54.808283] pci 0001:00:00.0: BAR 0: assigned [mem 0x30100000-0x301000ff 64bit]
> [   54.815988] virtio-pci 0001:00:00.0: enabling device (0000 -> 0002)
> [   54.829614] uio_ivshmem 0001:00:00.0: using jailhouse mode
> [   54.853170] The Jailhouse is opening.
> 
> 
> Can I apply some fix to make the hypervisor initialize?
> 

Upstream does not support the AM5xxx. You will need additional patches and 
configurations that were never cleaned up and proposed for upstream. You will 
find them when diffing the TI Jailhouse version against v0.7. Note that quite a 
bit changed and at least the configs will need tuning, possibly also the CPU 
control patch (smc traps).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
