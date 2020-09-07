Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUMS3D5AKGQEGFW2VZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE025F7BD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:01 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id m25sf3837069wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474001; cv=pass;
        d=google.com; s=arc-20160816;
        b=wjWsV8+0zISavahZrr+FkUhKazQ0GF9CYbeWD2r4EnGRN0QgBlxituupg54umWuXuP
         VBeVoijb5z5d8HSjBCNVl3sjZWoRr58KMJLVby9XL/aQoF1LnNWA6/j4zF/KVcPFJ/e9
         W4PjkSq7vH/H64LFcLtXrmDsD3JuzscCO9FV9C/JhECOLp+4oJxOeTmAZ39QWeBjBPlm
         8Nyzzv0ASnXEnnSKGqVCigaBrKyGCNsVYFho6MxGkLKyRR2oPxnhSwx0PFzYEGIKdAmJ
         4hunp7WTwQJL2Jz19zQcd/9A6eWniXyKnih0PakmM6ylnjB4iZRlVURi1WTjWUPnxeqe
         Jxcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=IknYe0LdXE8ec3tOZyqbbiGAD/QMTUDgPRzIu2PLDjk=;
        b=RpeFOGlzGx6zszITv15bgX77RedyltCJaTBrdjpNTSluYvt0BW7yp0MlRRm2kXXm3s
         FQQqY+i6O1tFJZK9fk+S1Nfr8/Zzgu/ejMAEQfNe6pgoYkxJnV6bCX6WbI9OEFwIilGe
         bIGYsrfr/fVzlil3EO18t5TRoAskDU7wdw1Vs/dim7Cemg+ZsBoLUZ+pGVRA9Kw+0P2t
         aTRglHLstk5UiMFZUmexHK0O/hBLZUvE6ryDJH7k3hat+WqXQqCihXLUMsG2rjFqcOti
         nSUqM/N9LZXg3G3oaORd/qlpbjMPEkGglTN0KQDViUNus7tE6k8R9MYrKsDn/eyFMZ4N
         eEBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IknYe0LdXE8ec3tOZyqbbiGAD/QMTUDgPRzIu2PLDjk=;
        b=rI9wrblZ6cCuQ1yEV6d9H7eDrdLlYG5yYJ/VeFUaEhAmnwbSEodJy/pLaTP5ratCxM
         TvYTYGaSrJ9QsQbWvKDbT3AlsVkzRe2Pnln3kxZpE6mS+BITrO7Rk4rcgY9mBp/zleu1
         5BK/QIPNdOX7kxyXBFfmOaE3ljHM4andDAwYO7HvehkfAZMGHgjNpXPk/sLuGboGvSH3
         fiZ9fsaWikBn2VNlVs0v09Whf2zHl4vTwDoedm8wU2gtCaLzyzxI5gv6sl5E+aUttYeh
         j8t+r2kRYmNnZdq2g1p0MgQ5kBFOzlEQ9OTBg85PSDcBszuHo9KK1RT6sgGbLmjOooOK
         D9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IknYe0LdXE8ec3tOZyqbbiGAD/QMTUDgPRzIu2PLDjk=;
        b=fYQ+1iySd3iBF3MtfcjDdRYF/8dL8rhsnicGukQChL+9SDau5YnIaZ0FWCHFj+eLri
         GMDo9esyKmK4MirvqZiv3Ew/+QhKl6lPXc6c3bYxO5auRnhJgtLWPWtViP/NFdg5F5mX
         PSsB++uuzFrjbSYNKUjlrOQqQbjzXNbOkAtGUV+5MvA4Aco3ihWArQh15HgwEhI+T8p5
         1DkoZz1LoWxHZdoGmrK162T7mP/WF2XIFTW2WIIpCST6eKWlSxlclpst/8/bHAJAWmej
         KnBTROTsrbqja7oOvRREEdZcnXKR3wuGnDgoF9EMIp00WMJ3QPNUGyURzocpQgMSyAVO
         5XtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533BTuXVTwlFZH3djJNAMA/8AFBJ3eNXO8ggYqG1Uuh8xRtzm9Dl
	LPcpkFhzAbfUN24RrZn6B0o=
X-Google-Smtp-Source: ABdhPJwF0xXHZ/z1CS6kcD594N/BrGxKOqKgYDoT1YHEirM0cZhZr8Fz9LYKOkM7gQy/t+EndbeRlw==
X-Received: by 2002:adf:e610:: with SMTP id p16mr22438921wrm.71.1599474001450;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls9257793wrm.1.gmail; Mon, 07 Sep
 2020 03:20:00 -0700 (PDT)
X-Received: by 2002:a5d:5146:: with SMTP id u6mr21911364wrt.255.1599474000593;
        Mon, 07 Sep 2020 03:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474000; cv=none;
        d=google.com; s=arc-20160816;
        b=dwfzLZS9pza5+Jb+Bv/4VhYn3kzccBm73mH63eBZgon7YyBAR1vpXarus3nUzHxhYt
         eZcywyLaEEfSwzGe2Iphpj3Y87qZ7WVxFuSls/qQhQmiMLVjs2Hf7Kaj/BJLURfhFK7Q
         OeNeoeJiYTLV8akce5uHQCaFYtQIFW6Lsvtt0u7fRtxARK40gu40tmlIBbFjNXlwhDvc
         yBbYU+JAk+arbDYu+hJr9WyCi5HzO2T+7tujXv+lBYgpYJDdgnRR4Y8NpCNjQpmF80NS
         1+3meS0YAHPN2r75FRJYWhbryovPEL3seGnD5xIMRdejx3LUUMjox7dSEkF5u2JLfSXK
         u40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=2MGm+G/sB/67WOQrr8eaccGzX3odIC2TS1MrfX/7rKg=;
        b=H/kgpXOvqVpGqaWykzxCkXkD+coJxnG0Ff+qkyJQnc+9wWoIMDis3G77WVfUWERV7B
         eAPij/GfhJh2RGR3k/C4NkfLxCeYGKeJAyKdEJ8w5Zujm9JFTi5vB+vgHLxhLv+D81zv
         CHoqcnXh8bfn7Yh+We5x8gefzO2DpbuxT/OqM8tBqDHQyn0pMLmdTqLLRzLUC37xr3p0
         otTBtC9P+P3fLrkXTf2B0cRDuzQci2tbG+WPxnBum5NnJJ9Ks793DxKlFgfkArqh8CXH
         xH3cDwjwWMOunanXq7sZrc20Ouu+VU775BgHqVRvBILEcoxM6DJhBTgKeEHNmYvVLpE2
         nDoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y206si263745wmd.2.2020.09.07.03.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 087AK0YM008198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2B024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/8] Adjustments for 5.8/5.9, improvements of sysfs parser
Date: Mon,  7 Sep 2020 12:19:51 +0200
Message-Id: <cover.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The sysfs parser changes were driven by generating a config on an AMD
R1505G board. They still need validation on some Intel boards.

See patches for further details.

Jan

Jan Kiszka (8):
  kbuild: Avoid deprecated 'always'
  driver: Adjust to kernel 5.8 and 5.9
  pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment
  pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions
  pyjailhouse: sysfs_parser: Return true size from IORegion
  pyjailhouse: sysfs_parser: Always walk reserved regions with children
  pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram
  pyjailhouse: sysfs_parser: Merge adjacent RAM regions

 Kbuild                              |  3 ++
 configs/Makefile                    |  6 ++--
 driver/main.c                       | 23 +++++++++++--
 hypervisor/Makefile                 |  6 ++--
 hypervisor/arch/arm-common/Kbuild   |  2 ++
 hypervisor/arch/arm/Kbuild          |  2 +-
 hypervisor/arch/arm64/Kbuild        |  2 +-
 hypervisor/arch/x86/Kbuild          |  4 ++-
 inmates/lib/arm-common/Makefile.lib |  2 ++
 inmates/lib/arm/Makefile            |  2 +-
 inmates/lib/arm/Makefile.lib        |  2 +-
 inmates/lib/arm64/Makefile          |  2 +-
 inmates/lib/arm64/Makefile.lib      |  2 +-
 inmates/lib/x86/Makefile            |  2 +-
 inmates/lib/x86/Makefile.lib        |  4 ++-
 pyjailhouse/sysfs_parser.py         | 50 ++++++++++++++++-------------
 scripts/always-compat.mk            | 16 +++++++++
 tools/Makefile                      |  8 ++---
 18 files changed, 97 insertions(+), 41 deletions(-)
 create mode 100644 scripts/always-compat.mk

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1599473999.git.jan.kiszka%40siemens.com.
