Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBSEKTPTAKGQEAG4RY5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9FEDF84
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 11:35:06 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id f11sf5602936otl.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k72Bos93rDgevj/R+mKJPhWmLpGmaAd4VdvNt2yG1+Q=;
        b=Evs+FMS43nwYqhHMoMEm7sB+X58rhR1RtZwKMYBeA6q8P0tfSyeDcpTgHVuX2VzLnO
         Y1l0ozHpzn2z57kDT7VH2hEhbEPM/AmxUx7N5MEBv0QXrzULrDg7KkndnplJDSgvYOq+
         FrXYNHD6iHTEyp0SCIjpom2D803W2MxILffDJ+DAgG8HTpa91OqbcIRIVuAyO83o/IP6
         82lwPN68zlHTanFnaEhfUrz8kDzbBnX0M/4+CPLKyYk56nMeolFHbgvObJzxa2X8iZ8m
         A+iZYlaJOL25gWTczyYytYLCaqLvxuX086aEeOn25/Iztxb/1bBzwr/oqpA7CaPMsZ3l
         4Iyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k72Bos93rDgevj/R+mKJPhWmLpGmaAd4VdvNt2yG1+Q=;
        b=lYX/i4UR7hIOygL98bccs1F75tpH31lgsIKW2eKmvRz6x7aDRAp6qvZPECY3bGvVEW
         yExkjoSgTRfk7YgGJ6UvsfixD78640+EuTqvMTX2W57BB4q01I7ma48rEmuShXbij9Ki
         pNKZWTmSJXPDXMPQVvbSKlS3aVhcdNe53qfkqiWKF7AoBJvJhaqaNj3+YQt6noKEvo1w
         YiKLHtiG8P13TK+N66F8tsAK06N0SFbfMsU0GWdRB8ICWwgMJBuMbYxyci37C3hT+yVV
         Tydpclg22msrLGUk1s88dFdV/SZ5OfgaIu9ZbXwPJo6/aHu+bIXoQZi0G0gbbiu0ZNbC
         XJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=k72Bos93rDgevj/R+mKJPhWmLpGmaAd4VdvNt2yG1+Q=;
        b=GE5ibMesCQXhjUc6IUAXl8eHLbIqSo43/JwT9Vu1Fb4QP15lak3cYPsZc7W1vMvtMT
         obsuhS7AkhIERDRN9YDIk5CeXa0RxOJ7c7MEWuIQCZPZhjOEyTof807bSV+2jp/6r5Dk
         ZU3K6N+NPyW5I5UxanUeUrkbD+sm1WYg82eejycTOmBSlPxEEQzsudfrwpx7d3BZWQMI
         GxU5GuPCsP4/xDe7gWFQ2zth6tufMB8HjFGgRsGo+knffrug8WzwNoNkk1oUQ8JgzP2V
         AKMbUxW24Kplc5sZHmEm1lXwyZcTKoJDTTGVS45LdWfDlhCcJhMyW9kjGQSYYpzdvFJN
         k2fw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYw2wIvyV1NDsVEAPLj7YJYjiAIlyTs9ozhbH9pH3Wajd6O1n5
	3gaaX7ioTyjGqMJc/kQL1FM=
X-Google-Smtp-Source: APXvYqxa8WJxx0Gr62iXKfxAXge8uejioVxasle63OIuSi5tJqT0kv200kR3ThYc4eGcDh8vSAvXhg==
X-Received: by 2002:a9d:5e96:: with SMTP id f22mr8382957otl.53.1556530505025;
        Mon, 29 Apr 2019 02:35:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:2b05:: with SMTP id i5ls640639oik.2.gmail; Mon, 29 Apr
 2019 02:35:04 -0700 (PDT)
X-Received: by 2002:aca:b288:: with SMTP id b130mr14417251oif.154.1556530504197;
        Mon, 29 Apr 2019 02:35:04 -0700 (PDT)
Date: Mon, 29 Apr 2019 02:35:03 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <12d43104-c726-44a0-8724-d99bae074f64@googlegroups.com>
In-Reply-To: <55645a57-8bee-4563-96c7-f6f0cf70ad63@googlegroups.com>
References: <CAKBX2Q+8hYErhgVa1adF0agVFpYm5Di2HwGsUjH+3YJJQmda1w@mail.gmail.com>
 <6c2887b6-824c-4380-a0a0-d2151a0cfef4@googlegroups.com>
 <ed0d811d-db17-499c-880b-0d235db68c92@googlegroups.com>
 <55645a57-8bee-4563-96c7-f6f0cf70ad63@googlegroups.com>
Subject: Re: ARMv7: using uio_ivshmem to send interrupts between cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1596_651941976.1556530503478"
X-Original-Sender: nirgeller18@gmail.com
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

------=_Part_1596_651941976.1556530503478
Content-Type: text/plain; charset="UTF-8"

Hi,

I figure there's missing code related to uio_ivshmem in Jailhouse v0.7.

I migrated to the latest jailhouse version, branch master.
I'm using RT_PREEMPT kernel 4.14.79

When I enable the root cell it seems like the hypervisor is not initialized.
The only prints I get:


[   35.272718] OF: PCI: host bridge /pci@0 ranges:
[   35.306648] OF: PCI:   MEM 0x30100000..0x30101fff -> 0x30100000
[   35.319993] pci-host-generic 30000000.pci: ECAM at [mem 0x30000000-0x300fffff] for [bus 00]
[   35.330762] pci-host-generic 30000000.pci: PCI host bridge to bus 0001:00
[   35.337600] pci_bus 0001:00: root bus resource [bus 00]
[   35.347049] pci_bus 0001:00: root bus resource [mem 0x30100000-0x30101fff]
[   35.355943] pci 0001:00:00.0: [1af4:1110] type 00 class 0xff0000
[   35.355981] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x000000ff 64bit]
[   35.356355] PCI: bus0: Fast back to back transfers disabled
[   35.367812] pci 0001:00:00.0: BAR 0: assigned [mem 0x30100000-0x301000ff 64bit]
[   35.376191] virtio-pci 0001:00:00.0: enabling device (0000 -> 0002)
[   35.382777] uio_ivshmem 0001:00:00.0: using jailhouse mode
[   35.389246] The Jailhouse is opening.
[   36.001021] Created Jailhouse cell "AM5728-IDK-RTOS"


When enabling jailhouse v0.7 I get prints that prove entry() was indeed invoked and the hypervisor is initialized:

Initializing Jailhouse hypervisor v0.7 (222-g5e1b3ea-dirty) on CPU 0
entry(): started
Code location: 0xf0000040
Page pool usage after early setup: mem 30/4072, remap 32/131072
Initializing processors:
 CPU 0... OK
 CPU 1... OK
Adding virtual PCI device 00:00.0 to cell "AM5728-IDK-LINUX"
Page pool usage after late setup: mem 44/4072, remap 38/131072
Activating hypervisor
[   54.734879] OF: PCI: host bridge /vpci@0 ranges:
[   54.768094] OF: PCI:   MEM 0x30100000..0x30101fff -> 0x30100000
[   54.774264] pci-host-generic 30000000.vpci: ECAM at [mem 0x30000000-0x300fffff] for [bus 00]
[   54.783014] pci-host-generic 30000000.vpci: PCI host bridge to bus 0001:00
[   54.790008] pci_bus 0001:00: root bus resource [bus 00]
[   54.795264] pci_bus 0001:00: root bus resource [mem 0x30100000-0x30101fff]
[   54.802663] PCI: bus0: Fast back to back transfers disabled
[   54.808283] pci 0001:00:00.0: BAR 0: assigned [mem 0x30100000-0x301000ff 64bit]
[   54.815988] virtio-pci 0001:00:00.0: enabling device (0000 -> 0002)
[   54.829614] uio_ivshmem 0001:00:00.0: using jailhouse mode
[   54.853170] The Jailhouse is opening.


Can I apply some fix to make the hypervisor initialize?

Thanks,

Nir.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1596_651941976.1556530503478--
