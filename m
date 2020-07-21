Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7UP3L4AKGQEFFHDN7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6F2278B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:15:26 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id n24sf4866986lji.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595312126; cv=pass;
        d=google.com; s=arc-20160816;
        b=hU13GxoFbBOFzK2aApOqjLyZed4o89PYcD495ozUh+Cky59Xps1Eaa/2abAtlLdO+L
         Cv8uFwgWtA5DnXCmoonvtpP+YW3+QtiYXDvDvP30Quxojj+dIQStJigPJbnl+7hlkdow
         9xMb5BDB/DK8Wl61hEjKxKDzE36YnKH+ZaQdiWn9umOgIfVf937pzKk8u4eL7JyXdB6M
         vgYkoo8NwGyRgY66wgZZYmPy5C/Ty7sVfP1hGWCoiTc+Uw5o5MquVidPlFicLJ/qvCgb
         +v+j3m6vqAH01yFNfwRiWEpB1akpdtcbM2vEszqkVi7MfUcv2nlpf5XNQJzUOXafJLKo
         Ax6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=Qwltx5Z3b0U/M98W0vF7GclAsLPirx9WbNy3+Nh96oI=;
        b=n0k5znWfP8Syft6+5jM5mWIvjvs7IpkZDYH6McVE3pebPtfhwMe6xufrXwgQq/sqqx
         KInK4cpT+z28/V85QZvdTPiMisX6k1pfFa9LREOY+wbke89v+P8EKzMCE2wdyNAlcDKS
         DXHR+fpkyVBJsNzxDH9UP1PDRqUti0XXRQdl1t91CxA6A6GPAFtKZujQ4QZV5CwRbzBZ
         ucn8vjgNUxkd7agVHoK7Gn+VsdWw515zvN6GuameFHgtNXFT8c3WNEOcQ7X/9ios9OwY
         OuLD9YdAmWnJYdT5L7sVXBnM40JtXh4kngjL61X0bqtGkQZdj2Ox7pp0F/xKgmanT1Fl
         /Leg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Qwltx5Z3b0U/M98W0vF7GclAsLPirx9WbNy3+Nh96oI=;
        b=WXXBERvB67v2qfxat+3uE5xE4jDByVl/IOUmVD7f7VeA7vJ+6V88W4xoJyF4lXNaKr
         ke1d4OU99LSOYpeU2Uhlkqy7AsGSNlWDLc2zxmK8TfH5EMw5ypIwi9boC2h+8EtcS9Y8
         nOsFt1I0MyO4e/C4K83FSr+6YfDuTvK6Im71b8sT6Ru+HCI4sasl2O0jOak3kEsYLvEh
         uErWuJM4EyxhQgR4K4dGoTNhWYNI5uyHcNtez1In7xFwzBx9eJZV7QGVWgKganY200HO
         Y0zxkRXJ9cL4NcYS7vrbHeNvp5C/DOBmDyKKCQKiJLjHn81ELF2opRSDO6v4qwMskUly
         886Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qwltx5Z3b0U/M98W0vF7GclAsLPirx9WbNy3+Nh96oI=;
        b=r27uGWBa6fzi2az1MuzdTPgv6bhYIMEri3SuDx+vLASjNWpqBXWZSjAw8DXtCBZ2z4
         qX3kjQXdsV0mXBCboqv7hnFB60NenOSUSU4OyN0HtAAgMU42AvwfDfAEukj0wON8PLf5
         UAdJd/ARLYJqwI0BKVivGJ+oeBTgA82Kxw+lMuLoEsYYwP0IDYH/nz27iFnk+/Yc6+c/
         W1rAF9EhqC8KyTBYnQV/q6Fx8PlDrHVX/K0Jl6/nD7B2jR9hsJOdQmCLu6BfpiZsjX7K
         Zsb+9SoCm+Ma/yWCCtOi5pDcF32icg1dp8/wUw+O1xLytAobRjF+BehcdruXjSqWWSjI
         zJcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530aOKirUSpp3xNAGM4M7qkUjQ/h8MtE717T7Dddmmq4qf5GpxJo
	LnZq5WJF07T9UOqV4mdZsOo=
X-Google-Smtp-Source: ABdhPJxUA3Z0ekmbtmPN4+tpAU0CpwWhFN8WcvQxn3raky+qd4E4ZzSXWqCfoIRsjvQzN+EFTo5vXw==
X-Received: by 2002:ac2:4183:: with SMTP id z3mr9641127lfh.3.1595312126192;
        Mon, 20 Jul 2020 23:15:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4845:: with SMTP id 5ls2710041lfy.2.gmail; Mon, 20 Jul
 2020 23:15:25 -0700 (PDT)
X-Received: by 2002:a05:6512:6d6:: with SMTP id u22mr513530lff.13.1595312125328;
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595312125; cv=none;
        d=google.com; s=arc-20160816;
        b=vsACbs06g+HbSvcClxgrtjCUvBaCT8Cntja3C/lT7MDZgS+vXL3u4iYaE+Cjcq00de
         dezpjEG8INgy01E5SwJ63ZmIqSBZ/jSLBTq/94J6fG0D3VmWAW3z9HhUqs/BAxBMk77y
         JoJWJLySHCMHtj7JAW1MmOEah+D7AsDWT7auPIofvYxLCpXLwzk2scuZT4xezKTPhBIJ
         0iM3iknzFOYDGqVf2GufCKMQgNNbE8I9GHJv9opC+3AMf7sMxMR6buHaQJjpkWvO/ufP
         ncyp74QQC/TYektjemJI2wJtjBJrR2qOPMlBgSDWKRbCNIOWEEkBa5nMe8YaJN8LO6Do
         BRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=z7qY7phCJs7BGEHSSmoDIt7X1wqf9yYyA/5DfjiJOgM=;
        b=1GMhkrlMM9J4aLi4JfISnUwcWVNbruYlMBabo3OjYOuweEoS9HH0fiJrCOFRi9x+3s
         dA4VOWGTDHfUiG8Q7Pa4ITlKfFLjrphTX1sgNURU9ARHUhxqrguBoHBX1Q5zmu4R3dZb
         3HUuaSzC676VQlqtGbcL1hk6ZfPi7GcYRZkUbodvX5HN0bNkJrOPTmx/b07Hx9GTs6KO
         4M32wb31KfL6YHffhi8/BIr161n+7KVbHfeca+jJoU8NNJD4E6vcwN3jYH5J9T/m4D23
         DXVHEJz0VZSM5wbW3NlidLPBu97OARFTzPtD8SrEYby7FsZp0zA+5iKE53GLBsRqKpiu
         fJxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b13si786051lfc.1.2020.07.20.23.15.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06L6FO6O028189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:24 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06L6FNaI018114
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 08:15:24 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/3] Smaller cleanups for ARM/ARM64
Date: Tue, 21 Jul 2020 08:15:20 +0200
Message-Id: <cover.1595312122.git.jan.kiszka@siemens.com>
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

Originating from the zero-vmexits work. See patches for details.

Jan

PS: Accidentally pushed them to master first, now only in next again, as
it should be.

Jan Kiszka (3):
  configs: qemu-arm64: Move virtual PCI host out of flash region
  arm-common: Write VTCR only during arm_cpu_init
  arm-common: Refactor irqchip_send_sgi interface

 configs/arm64/dts/inmate-qemu-arm64.dts       |  2 +-
 configs/arm64/qemu-arm64.c                    |  2 +-
 hypervisor/arch/arm-common/control.c          |  9 +------
 .../arch/arm-common/include/asm/irqchip.h     |  2 +-
 hypervisor/arch/arm-common/irqchip.c          | 24 +++++++++----------
 hypervisor/arch/arm-common/mmu_cell.c         |  1 -
 hypervisor/arch/arm-common/setup.c            |  1 +
 7 files changed, 16 insertions(+), 25 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1595312122.git.jan.kiszka%40siemens.com.
