Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOUEZXYAKGQEN7GSJ3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id D069B131381
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id i9sf10845095wru.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320442; cv=pass;
        d=google.com; s=arc-20160816;
        b=tOBy8IqDPpURu/npqw3H+HqT7dqNWVGwN0wUZ9bZHyH9891SejWgagmLSAAcHfbN74
         0XnNuanaqkPUpQfuAxfEkugs2fM01SgZAevThMQJ73BjAxeIRc7dqvA8p71ZwPPQOD91
         TA419ICG6L1Unpcmmo0J8h5iPpkdwo/PLO8jKHAop26tfQqIfhNdiwH/OIDx2mD/B89V
         rsytjX3yV5IOcmFZXYIx5+gyIVKgO/EZSYg+qIkGJN2DK1uOggbNEbmANMv4yqniIKxo
         0ZdE4AjlpQ2RBO+abF7gUqDtzs9tBBjzAUqFxqDjWu7x7CyxetEmsCxdnP+oLCQVgbic
         xB3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=Yz8hDIh1llzXfWDbQnn4zuWjbbtAzVvs7FYu+5Kc148=;
        b=hHjySoTQPn8mGyrHRZkshQ5XvNjJx3Av4ifNG7O66hdIHiV8gau1BZqf812hkLcTqW
         sBBfgR6X8IHjfjARfTfkAht0uvhZWa/DtrHrNIeTCzHJo1zuh7SYIbgzqSwyDwIhCoPf
         UvCwTnSHkKD+gYXrxxhqRblGHq5nz8ClriXB/4sFZZ8qBUdNCaiVJzRhDkTZpV2Gnu+H
         0OkGBNWzc/EagGkuOydywzfQK1MnvrsQ+4sdHdTyF+qI9fwPfaM28tYM5epOizAhVlvK
         BAWS2L2kYYGyRcBWJHJ0bq5tHvYNwJ0JkB9d71TtkKaToZ4VUM19SuxeaeaJ3jl4Zvmo
         Of7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Yz8hDIh1llzXfWDbQnn4zuWjbbtAzVvs7FYu+5Kc148=;
        b=AuTZLAtLr3n8tzIvFQWQwIc+YEfDXDqnpzcaHR8E/GvEVgmBabOgSTpEHwO4G4yE52
         2grAom0PZWFq5xWx9EkTa/j70q9dH3xB6Brc9gK6RYjlruEsJpjtoQVarR+n65iqT7CQ
         3fEzdvhfL58dyy+BP3TECK/Evh1vF/84nFRR+BtwKhYPtSPs8oQcNSlxkKDsTfyaziqy
         pQgOO1Tql/N5hqNQmjqioKI8pwrfLFcsq7UmtnuZCpnOCD0CWyM3tMMxpN02NTq1K6h7
         xH0J8+EPhHzWRAHVROWyhOgoQuBSHNzKDpTMVtklxSFsIC+jIeRz/E1LbFlec3qXzhmr
         xAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Yz8hDIh1llzXfWDbQnn4zuWjbbtAzVvs7FYu+5Kc148=;
        b=RigS1SEIKPpG84GJEHt5wwjl9cl82AKjRjnnPZilQPh/vtt96TCVi29dzO303p+t4V
         bVqJ5NwR/CK61GKaNGkuz1R4nKxqe9R+wRMPRlKE0xOeECWQ+eTK1npfIEUjtWIFkFkD
         ZzSOFMyVMYLPOxRd646nvOcVMtbeIP9i7s7ytaG01aXCvywq+kCQxKhIQE75V1/njXoI
         XnWUFbM0Wa317h01l3ts/SLK9x4wuDiOKmnjlRPO8G4pNskM8ZnsgSxXLe1p09IsVh4d
         0InJNf2v8dyQIjrKOibnj5qhyuCUAYKH6WOLmO3tr8JhkAuNEygSGfVFZlmEViqB6gpk
         UIsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxDdPoGHldUYtId+Pu9zJayeO6uDSLX1q8+bJK2LtLcHYXjErF
	NDUUPJ9hqGaeNyNflJ2hgXQ=
X-Google-Smtp-Source: APXvYqzvoMfrpoVIzZyvzbmUFSbQk1g9UmFlhzHApCxnnuKgBECmpwJPo1PQmJop6KXCrqsUqT3I/Q==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr35192323wme.108.1578320442520;
        Mon, 06 Jan 2020 06:20:42 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:65d0:: with SMTP id e16ls12988243wrw.1.gmail; Mon, 06
 Jan 2020 06:20:41 -0800 (PST)
X-Received: by 2002:adf:db84:: with SMTP id u4mr105658206wri.317.1578320441890;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320441; cv=none;
        d=google.com; s=arc-20160816;
        b=snAeASmSU0UkD1723IKl34qi2bjlYWS8pF6ksr4bwOL5khZoGh/SyrSczGLheUKqWr
         jbph2HI3pkVm+iThXfaf3Sa2WU2gSkL9C/tiOKd4wOahGPBlA1t+TU4Q/awKUs3yaD1v
         WX0QPCBi9FUqHFbcCXQ8kyHH3oJnNhk6LnV+q016cjUBoud6saFedsR7d1lmqz1ZQJC0
         uTpR6HFyHkhemu55FKSOYjm6jfD/ubaCbVfEjt5Tq2Yerwnosj0ykKjk3cs3jH6c2y4A
         hh6TvBOMjiblqiMGRXTbyZL+JoO4G70/UfmeyIJFBXrki0WEOUuzyRh4jrZ3eKfQHNZi
         BTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3vzvcqNg0qToR5ZtW2bwxhku5KOaZ+VC4QK/64GkH0A=;
        b=PU+VAeOaIIxx4xYooDujrDlnRdyrj6/9i5dl9JiOR/4/EKGEcWs5Lq9BuuTpmQevB2
         znTs4NVSfi+YDAw/h/wJUUZSganwNaJYwZHGkirSFFxXiS+2RDNtrmuuWK5JNKqplnHM
         uyRa45Wqwrzyf+PPmwlS6pkdax4DD0ZPDFRfh+u83g5lmjl4nTOeM5ocEmkDHggrk/1k
         f0iDf3P21CK2FKRStWIh9Cj5y6EnO98esV/JfyrODY1ZMklKAszQk389N4vi0N6UnRBA
         leB4KKE2J3LcFdo76x57bUYARdY/CbNDc4JV6+w2Me9S83PHXLMyGHXPqa+ChE7gMl7w
         RTiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 80si765810wme.4.2020.01.06.06.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKfBg016688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:41 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjR008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:41 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 19/19] Documentation: Describe ivshmem demos
Date: Mon,  6 Jan 2020 15:20:35 +0100
Message-Id: <6a8ab13d6f2ba9f47173bdd19bd966ef4c1aea9f.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Handles all currently available demo cases: ivshmem-net, ivshmem-demo
and virtio over ivshmem.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/inter-cell-communication.md | 54 ++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/inter-cell-communication.md b/Documentation/inter-cell-communication.md
index 02136de2..ff99a592 100644
--- a/Documentation/inter-cell-communication.md
+++ b/Documentation/inter-cell-communication.md
@@ -70,10 +70,62 @@ For an example have a look at the cell configuration files `qemu-x86.c`,
 Demo code
 ---------
 
-TODO
+The first demo case is the peer-to-peer networking device ivshmem-net. Virtual
+networking is pre-configured in most ARM and ARM64 targets as well as in the
+qemu-x86 virtual one. Also all targets supported by the demo image generator
+[3] have this feature enabled. It depends on the ivshmem-net driver that is
+available through the Linux kernel for Jailhouse, see [3] and jailhouse-enabling
+branches in [4].
+
+Some targets, e.g. qemu-x86, qemu-arm64 and orangepi0, have a raw ivshmem
+multi-peer demo preconfigured. It can be used by running the ivshmem-demo
+application under Linux and loading ivshmem-demo.bin into bare-metal cell. The
+Linux application is also a demonstrator for the uio_ivshmem driver, providing
+unprivileged access to a ivshmem device it regular processes. See the code in
+`tools/ivshmem-demo.c` for details on the usage. The bare-metal ivshmem-demo is
+loaded under x86 into the ivshmem-demo.cell while ARM and ARM64 use a
+*-inmate.demo.cell corresponding to the target.
+
+There is also work-in-progress support for transporting virtio over ivshmem.
+Note that this is still experimental and can change until it may become part of
+the official virtio specification.
+
+Two virtio-ivshmem demo cases are prepared so far for qemu-x86, one providing a
+virtio console from the root cell to the Linux non-root cell, the other a
+virtio block device. Starting the demo requires a number of manual steps at
+this point. Under the root cell, execute
+
+    echo "110a 4106 110a 4106 ffc003 ffffff" > \
+        /sys/bus/pci/drivers/uio_ivshmem/new_id
+
+to bind the UIO driver to the ivshmem device acting as virtio console backend.
+Then run
+
+    virtio-ivshmem-console /dev/uio1
+
+This tool can be built in the `tools/virtio` directory of [3]. Now you can
+start a non-root Linux cell with `console=hvc0`, interacting with it in the
+shell that runs the backend application. Make sure that the non-root Linux
+kernel has the driver `virtio_ivshmem` (`CONFIG_VIRTIO_IVSHMEM`) from [3]
+enabled.
+
+Analogously, you can create a virtio block backend by running
+
+    echo "110a 4106 110a 4106 ffc002 ffffff" > \
+        /sys/bus/pci/drivers/uio_ivshmem/new_id
+
+in the root cell. Then start the backend service like this:
+
+    virtio-ivshmem-console /dev/uio2 /path/to/disk.image
+
+The disk will show up as /dev/vda in the non-root Linux and can be accessed
+normally.
 
 
 References
 ----------
 
 [1] Documentation/ivshmem-v2-specification.md
+[2] https://github.com/siemens/jailhouse-images
+[3] http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse
+[4] https://github.com/siemens/linux
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6a8ab13d6f2ba9f47173bdd19bd966ef4c1aea9f.1578320435.git.jan.kiszka%40siemens.com.
