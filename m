Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUM4T2CQMGQECGGNTTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9538C520
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:21 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id h1-20020a2e9ec10000b02900edf305c2e1sf8668335ljk.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593681; cv=pass;
        d=google.com; s=arc-20160816;
        b=WLsslG6Gw01IVbLtz7SXwTbCLbJUZknv6F+rGgBK/agT3Gy7WJq2AW536m2yVd+wdP
         BP5AUPhRqJDdcpJG/v8lALWKLtr+pB2YHYPEqX2fG3LD/BuPqkHlCLNgF2Kn7QjeXROD
         ngD7gyQtcP9K4Np0bA+9b4ES3btebWYdMnd1IAUaLNFz5RYK23i1yFQOz/2Hdw/kAx1M
         xdl2ObyEVLc4LYGPc276tzpxaT5l2L2wUoUffzo58J4MCokLOThiDAggJz44aHuGJPc3
         nHs73FWBR6e/rH4A71tb8IEsyuOPouAjpcmH3ziycEhgHjzmFbCtYlurfllEf5Rw7wjB
         9bZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=VD0PRXYV2k/NZFm/y+HJ/cx0kadgq0u//kYlQlzmHjI=;
        b=ofoo1AEVrAAzplXWuQ+SDxKABGKDd5umk/6xAr0XTmrRjcVsHKgRocuAVQmUYp5R0o
         aWz3CScFVflvsyLb+xGaC6BtfKcY7EQDrqkDBSjmw+PxLFkYx+fePXa34BfSkpF+ZFYe
         DaVTwF7q6BIZGdmnM/EyE8uvhCciExTe4gGPzgrLQk0lsGoUiONt7K8wATmQxcByu41r
         iAfrt2ls+fxXcMsWGLGVUl+URO9/WLgbGFwfef5ksP8CHht+VudfiJByo64K0TYuZ4z3
         nmz0uzuKhiebUWiW0XwOWw0LtKF4TgeMDDQbyYm5qKa56aIDa23W8qLEAqPt14N7wjdP
         4PmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VD0PRXYV2k/NZFm/y+HJ/cx0kadgq0u//kYlQlzmHjI=;
        b=Gp6joBNVoDlrZvCinUFRXjSap53PaNl8Y/yXUdFRVOuBC9NnxeN6kJ/T4r2NmD2Rfg
         7Q8kPD5FCohXiN5mQqXKawsQdb8awFW25Wqg5D3QRW/w6bhjA8hXmWTUna9wtxmY/lhf
         3e8SY9wDIH8ARFbujpXVbKBOHekMRSxgv4qoUM2A89tzCsOGlQnDyBvDJemO3dBiozIH
         Fveh/OMlMMhgClIy+EwigRUjTtQAbMj0TaRvMV2FwwyjRoLHiBSTQ0cOIbWDQOVBTZ0N
         DsKebGnsEsPY3KJ/lkxA0gG+ISO2+t8qvAsS4yHZyNYpVmoRrOdR8TYTyQ84eJqFq7Tx
         UZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VD0PRXYV2k/NZFm/y+HJ/cx0kadgq0u//kYlQlzmHjI=;
        b=KfInwba5uDsfYSJhJ8EKCy6mTKZtS48+v8rkwQtsIvU7JpMtuDHnuy6KKdpwtqmeHf
         Ntx46gozlaqEUZaaB7T8yA9rpksB6ZzPZJyzGKE2XFGEB6TZP0nzisEqIpVcadOUibJk
         pHzWunzY1suMEpXv1DbglYldlIve4UmRshQhEF44bB5q7Du/ApF0uqPEle6UoQvf5bnP
         f6op/BMl0YVKkr0ezTU9JIuPR2vTPcbCE+rbQrwavPsjotmb7uTkGcg7/siiosAhrQNg
         wcPunpQzixZ8ERGlla63O1vHk09jcuyLbjZbPm6Vk1E3EyCFvAlmzuajVJMa34aFqgzS
         Pd7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531MY0WhJEv30J8da6wZ6RpuDzVDL/MLiUPydUKZX5wUAQXLqk9b
	HWEnP8f+PFPyX/m2+jBmMuE=
X-Google-Smtp-Source: ABdhPJzPi0lK69mJPLUc+An/QqUEfQpqUlzh3aKnLW1cm67CGzLJr5FUd6vbw9D66AoOQS3KyGYylg==
X-Received: by 2002:a19:8084:: with SMTP id b126mr1782536lfd.572.1621593681512;
        Fri, 21 May 2021 03:41:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1025:: with SMTP id w5ls1148570ljm.0.gmail; Fri, 21
 May 2021 03:41:20 -0700 (PDT)
X-Received: by 2002:a2e:908e:: with SMTP id l14mr6461606ljg.372.1621593680477;
        Fri, 21 May 2021 03:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593680; cv=none;
        d=google.com; s=arc-20160816;
        b=knMJbDiI7ZEQn9iYNo0BG5KvVRn/SVQUZBjB8GobaDF/JboyWzK5s8aH6igC5JjAPl
         TxMxiapkyJr/N4Lb1LVm0ngdfyTfDNJq8r730/VEBjbNbZRhqzQbt3xzamuv5sWxotzs
         S9z3ZOihE7yeYWQoycNwtwH3k20mk//L3u9yLJOQ+YXfFvGjDJt9adzBKj3pYLj/RDY6
         Ik/+YcskrGz58V7hHy84vZKGfVQ5d06uKSkL29QOYZhfIHEyy8TpHdZqPzxCu4d8/AF7
         OXkVoc6YzPOSn1kmz/8g4Su2bow0GZYPrq5C8q38HEbXNc131Ec/cpLy+0GXwy82LJOu
         /Ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=an/kmNk4qMONIrRVe+Mx9r+MV+a9pMY1qBQReu+NGEo=;
        b=MRVP/TAzkVlslt6D5gTTXkN2QqYLFIw18Mg5AMN4EAxbdLB48DCE49FLPkyQgxecGY
         EjkAxDryR7BbukNkG1j0a+jszrU2/FczERHFmHRKbkC6+bZkr1Q/BPe0jEBczqq70jZO
         C2Od0TkQIWNpv/4gWD/OoxkZ3eeOv7SUeMqx8vgabEthN2c5tto3/bEfwxA54Xsfy0ZF
         qXkHbHiUmJsBCvns+pYMjZVW/T7CFOtFcY04q/y/1IKkg1R7c1GLFSdfHdsHDUGHPYOz
         BKjZgOmKF3FqXKINYvug7YVdxj59ZA7JY8T/YT/m8zhg+D6ZYALqdGIWSeW7rPGnI4Zk
         6BSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f14si237991lfv.2.2021.05.21.03.41.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfJhp006803
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcG032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 11/22] non-root-initramfs: Update ivshmem-demo
Date: Fri, 21 May 2021 12:37:23 +0200
Message-Id: <e3dbf527a1592a17c3b139b0b8b3623b6392894b.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Use latest version from Jailhouse which contains a mem region mapping
size fix and support for less than 3 peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../non-root-initramfs/non-root-initramfs_2021.02.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
index 48f2886..de8c296 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
@@ -15,15 +15,15 @@ DESCRIPTION = "Linux initramfs for Jailhouse non-root cells"
 
 SRC_URI = " \
     https://buildroot.org/downloads/buildroot-${PV}.tar.bz2 \
-    https://raw.githubusercontent.com/siemens/jailhouse/${SRC_REV_IVSHMEM_DEMO}/tools/ivshmem-demo.c;name=ivshmem-demo \
+    https://raw.githubusercontent.com/siemens/jailhouse/${SRC_REV_IVSHMEM_DEMO}/tools/demos/ivshmem-demo.c;name=ivshmem-demo \
     file://debian/ \
     file://${DISTRO_ARCH}-config \
     file://build-ivshmem-demo.sh \
     file://overlay/"
 SRC_URI[sha256sum] = "2d86279c26a2745b044e0b1cfa9bee17bd3b211e889f9a493defeed0ffaad588"
 
-SRC_REV_IVSHMEM_DEMO = "87cc49f944ed756e930b70991726ca5595a30717"
-SRC_URI[ivshmem-demo.sha256sum] = "e7cc426bb009c3c7d99c042ae45760494d8454647fbb042359655ea37ad1dcfc"
+SRC_REV_IVSHMEM_DEMO = "9325b765d1ef16af3ad6e84f6dee872cd9e553c9"
+SRC_URI[ivshmem-demo.sha256sum] = "7053e9f6c05e3c73b2b095f02c55b1c1d8a7f9760c9bd0b006c09d53a2acc024"
 
 S = "${WORKDIR}/buildroot-${PV}"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e3dbf527a1592a17c3b139b0b8b3623b6392894b.1621593454.git.jan.kiszka%40siemens.com.
