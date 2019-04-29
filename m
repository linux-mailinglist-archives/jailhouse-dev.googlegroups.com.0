Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHXTLTAKGQEJTUCH7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B35DE73
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:53 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id s21sf4502201edd.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528092; cv=pass;
        d=google.com; s=arc-20160816;
        b=pd8DVEwEDdZsXjIj1Zs1zc70MtaGFaCWmU0HHhDNmPIDiynFz5/45mpaXrTV68OlO0
         Q3sFKA2MWRzlDjl4td34uPdrH4jBuH8ZwcDXOBinvbbVou8NB9ZwN+X9Yg5CRvUtNuNt
         IoobhEqXdYyQgTjYNX5690RG6THBAeRkNsqEHUmKIWRR3SKtVE7e9WiTesFwFhUt//eU
         tI6oBuifEm4B+MkHu8rQGBTpANEmy/9nfmvX3pVmHyCO2rLXjtZJcOw8ynCPYE9YxMiG
         AYfQo9AgEeKGgwHFAE02WU8KyHV2vtMXvWD1NhelVxgwo2aewX7Z86nE6cERUawvHKUL
         yZYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=oNjjgsZpaxwGsnlFcgTTlFgdYVVa8Li50lFziMGhnTw=;
        b=upiCl5UGhLZzZTBbrIIiEMRGwOl/antrx8jVaNuCrZguK2+kCchZonq5/fsy97bTZI
         +iefiSpbY494g5fKpb96QBbc5aHY0WPgAk6XQkikxYfOQOSIZsMdOak4AwBJv+LhB2xm
         0PaTfKuoVABgmWzf89bxRU+ZmPjRBmF2HY67PzLjJuQ7Py7JyIUtNi76D/icabgc7yOK
         J2sBOjKwnSYz0ET/gE4o0/LvRevwLYYtEEnV5gkV5uc1cBp2PsqoQRLkd1Yy3fL+sObH
         4KdesUWgQV0p7yf6HK0SWg/MRhY9gR5wUwJDUW+WDUVZ4kKMh0tS3NHGVq63DiKkioz8
         I7ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oNjjgsZpaxwGsnlFcgTTlFgdYVVa8Li50lFziMGhnTw=;
        b=iyjEijDiCMscVom33iY8/fFO/MdUVCo+7NMK+ZtKIqSz+nc88R+ELrPiSiKxDKqk0x
         sMRKjm8jC7rwEoW4VKd9oFDPNpbNm6evokgN/82EWvru37+OfLWBEK19qB+6RBIZLQXL
         QoAhfyCZUlmYRIhcVWLkntNR1+mZ/1wy2mvQwjBeUqbgSQW1uE+7q254JyyGWi7Oe3Dy
         zboYB1WMaeLq5uc+vkS1GmMGVqqY7WTjejq+eorC3EJ8wCWekx3dbdR1M67PGypOiPWV
         98gsYcThOoO/Pc6MAAMWtC3T4X6uA77JePGYSb42oAPwqKIaeItqF85V9ShXrbU9Mjae
         R5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oNjjgsZpaxwGsnlFcgTTlFgdYVVa8Li50lFziMGhnTw=;
        b=EyFhS1t3UcwKzOQqxq+54X6Uzk20CKJ/QQmRBnjcxwJXc7OYSRkEYEzjOLO/ZWToXX
         r8VJJrU/zuMSf0WeDoKoceNTjBJ1eUnaSosQNO8v/8PFu9kupS6E7eD8UOMPgxrLYQGX
         d4jYuHIGEfOYfAYY2qnmxnZUCPMPCnOStMCtzR7bnqLeRlrMQ14kJQvSWLIKX7mfVlf0
         UeQttnqiMlVNZd/pCsMnfuKLqjMYdp980h/qqM5iDK2Ss88UOunx6Let+3+nNuUApH4l
         AC7YC7N6R2Kbghoo1G8wkUUN8mwKqGm4svqaw3EagTI56eV4na70lihoWUtXy2yRuO0w
         Fq6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWE5k1HWb4Hz8FABlzbX8AQcs0AjeWdu1rEAf2+jvFuYnS/PQGW
	F0Z5G7wi8CFJgrq5JpDUtgk=
X-Google-Smtp-Source: APXvYqwOIgMXURSR8mKckD3AL4gEHn2DNJG39Dv9D9JpsACOYJRJdi8GPd5fgC2g3AKwYkCufQ3Kjw==
X-Received: by 2002:a17:906:524c:: with SMTP id y12mr22244929ejm.118.1556528092839;
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5489:: with SMTP id r9ls140480ejo.2.gmail; Mon, 29
 Apr 2019 01:54:52 -0700 (PDT)
X-Received: by 2002:a17:906:1491:: with SMTP id x17mr2004404ejc.237.1556528092235;
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528092; cv=none;
        d=google.com; s=arc-20160816;
        b=is6YCkUbQFI7HFltF0XlqS0QSsNv/83/SoXG/Hbo4Jg/pwQL3LSJ+fYFLteGJjZl6h
         IaWBWYQ2c/nfxSpMHWkr9VrPJ1qhH7M/M25wFdpXyOrrt6ELkjKkCc9n0qnBtPMHREqc
         08bpr4biNLaj9rvdgWXUD2IB8q02WQ9aIRq7fOyui47VHmtoelyRIU0hlWpiCheQ5wDn
         N/UtAcyuYvQyFLF27AfgBxujoEBPWvsJozw+mzukhKk3GvdNBzoxfXOGPha00ZpwaWD4
         TmjTnrSzepprVqNVmyR0ewB4LFIkHDzEAPReIHRa3kB7AwKcsGV6ExLWWQmgbki2C1Ux
         sONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=EjEP4nbXJZ+guCa8q6jUJLt72vjxBhQuBakIJNGlBU4=;
        b=SqwtevGrsi3KVPKqOI/gQY1V44CAxc4fhZV+5AiwFnuLCtrfvfPbUvBJ7dDyPKCjcf
         FOulhihSHWAJ78sP+kAJbuHz9ZwBSIu3Jsqf2BZmtuVhE5FDdNrRzT5qPnU5Lj14/0/W
         oApUJAeML27q/Ez5Pa200aY3wIdxxrieiWRSoEwdJWmbE8D6zx/E90Sd9n/pU4qorow2
         joZCe29R6hJrESDAjQSKh1APArA3bRjDgVlzwP6qJ5wWA1m1OR4cJ05YbW6j9537oMoi
         i4NiHkoYkCLJA78hZhjOxwAgFstRLYNWB6JbaljvOwJg9IGvJG5j6lmptcqDuvr97+mB
         CseQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j5si1433128ejm.1.2019.04.29.01.54.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8spEi005003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:51 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo4013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/6] Fixes for MSI and IOAPIC interrupt handover
Date: Mon, 29 Apr 2019 10:54:44 +0200
Message-Id: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Content-Type: text/plain; charset="UTF-8"
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

As we suppress Linux interrupts while configuring interrupt remapping
for Jailhouse (or for Linux again), we need to inject MSI and
edge-triggered IOAPIC interrupts because they may get lost otherwise.
Due to an ordering issue between this inject and the setup of guest
paging, required information was not available, and no interrupts were
injected in some cases. This affected x86 with interrupt remapping
enabled during Linux boot.

Fix that, and also do some small cleanups.

Jan

Jan Kiszka (6):
  pci: Refactor loops in pci_prepare_handover and pci_config_commit
  pci: Only call pci_suppress_msix() for root cell
  pci: Call arch_pci_suppress_msi also on re-enabling
  pci: Move MSI vector injection to the end of suppression
  x86: ioapic: Move edge interrupt injection at the end of suppression
  x86: ioapic: Simplify ioapic_mask_cell_pins

 hypervisor/arch/arm-common/pci.c   |  3 ++-
 hypervisor/arch/x86/ioapic.c       | 37 +++++++++++++--------------
 hypervisor/arch/x86/pci.c          | 41 +++++++++++++++++-------------
 hypervisor/include/jailhouse/pci.h |  9 +++++--
 hypervisor/pci.c                   | 52 +++++++++++++++++++++-----------------
 5 files changed, 79 insertions(+), 63 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
