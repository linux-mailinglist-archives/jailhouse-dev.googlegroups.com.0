Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOHD66BQMGQERF3CJBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C8364CDD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:10:17 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id c9-20020a0565122389b02901abc58ed2e8sf6620234lfv.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866617; cv=pass;
        d=google.com; s=arc-20160816;
        b=R9XyXkAOU2AE9Y680lsb3QOxxaaIArZ7fbVNXRXNrJyavSd6hy9dYztfwWtpWKh3vb
         0T+LUw3zL5J7j2N3VulfIw4QrJzmG0cCh1T78OfjgQNj4qCp3uWg0Qc+tcBi8s1mkkTL
         moPtwOCMs2j5ABqzNB0EtpGrCG/W7uVIxs/2LfafIeaALT/7q6EnePZG8OSrkTtZeOCg
         v/qysL2t3PNyTR2z/neoQS6Vxe997n7O1AH3UNDO72fzsYJgs2InLb+EdWGumbCZSWgV
         g9xssp662IIBbMjRpoRSFciVFQSU/U85yZ3+QvqgDr/XvhHPRkcEb66kDlbasTIjxPNx
         ASZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=tTVmX7RQLCDx7HCErfNiGsWAYLRwjNYLSwZwi2ngYUU=;
        b=vmNaZmIbBqEHrabj0FfIls750LQJQDPFnqIXAKp81eQ7vicula6YkyXa1uxVD3SAha
         sUOZg/Jc+Kgi3hYdy+V+f6cCOtKzpo5ResmZkwUoigNobz+b8YsgheXL2aRGU9OxFCB0
         SRjHc26xZJw7smaRFJDwvEFJAgxM1+MTKm1iWG552JrrTPk7qFFQV3Vij+DEqVnw3brs
         jX0cAwgp63BwzY8YE/tRZ6Twox9veIuTwDuAgRS6LCJIy6Y1Af3KmNCi71yCh1mW/c/f
         EpHZ15xVIZ0xcomMhZQpPUpGqSFaMAfeHVpEp0hXjRw0R4+HwfjRGW1xlRz9IGx+G3qa
         y9nQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tTVmX7RQLCDx7HCErfNiGsWAYLRwjNYLSwZwi2ngYUU=;
        b=NNp8F8StsWNIZQgknYMX6+tMSTzmokxVNmuUqiNqGHuF4pKNrhJswAZUkxgiuJmBIb
         4bDDFP+3jH91A5O1HL2h2mrxjJ/yNrjWM/zsyqpviQJdy0zoLst0wBUAeUPm16tRGWvg
         u+7FWnDe92OvuhstOxl5egJxJAzmEjcKxn/0BuctwG8StMpCp3bmHownS7IVexwhAFew
         z8fo8PpwZCRWfEbmI1ullC3ajh9UJml7tjszNDLdXXq6EyokY0MZFRtSLfrGs2jy/rVT
         Bym1J92ktBARd3hYW3ujlhQvxdisbDenDRJruI4QsR3RjYg8Z5HPhKLtvBT1CEdbTmfF
         nV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tTVmX7RQLCDx7HCErfNiGsWAYLRwjNYLSwZwi2ngYUU=;
        b=SxYS1I9yXU2OKT0xs3vwBl34Rlnb44Xod+Jfq5U2SRC1C0gYsr8NXyAeK9Vhr7my7v
         FiQr3oHNahEaOK2ryLZkayl9jWF4cXAmtbt5UqnBcHif4bHlMUrU0ylWCy0pLGHgzXd6
         wBnB8i9lpsdR3JzMJIaWNXbgLyYxiYDPP1xHS9FUKu3Tv0uScjGlMZqQ10tE5wGVnFXW
         UtXxxnZIC/pNhrDErrrOTZCes+O4pzJ8rSm5IVbT0omes632OmYtF0JtovpAz5P/WJ8i
         BYeWi63fkBK/rMzqo+QK8uU0edwFZRi3bQoRpGUdEVKt7h4OzBK6xq9YiymuupUoaLX9
         2IKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jwu8dA1AT7Q63/IacvhfFmagstS6vwJk2JvGlpBjmo/MPgBBQ
	j/JEcE37Ra9YnjwJ+nZCJVw=
X-Google-Smtp-Source: ABdhPJzhfFAfM4uEqo/wyWxDoX9MLFBwWZS8HUzYZ1lpaZnEvxflytUqm7bQCGpEoSAA6iRgzqkxaQ==
X-Received: by 2002:a2e:a78b:: with SMTP id c11mr13384911ljf.6.1618866616583;
        Mon, 19 Apr 2021 14:10:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc23:: with SMTP id b35ls4631978ljf.7.gmail; Mon, 19 Apr
 2021 14:10:15 -0700 (PDT)
X-Received: by 2002:a2e:9f09:: with SMTP id u9mr9133048ljk.388.1618866615314;
        Mon, 19 Apr 2021 14:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866615; cv=none;
        d=google.com; s=arc-20160816;
        b=xFkAK8YrHWofVVNl70kapuH8CQcS9X79xJ/G3LjP2xno1AqJK0i/F0PcfOGkcUa4+S
         CxEruZecuRL1m87amqhKtIP4ruTolKCOlxVNkYrAEUGQBJ12lhrknlOhyKEQL1CDDmh5
         VpAZjFujbgiwKYZ2tY/eVTGdEVjdr24E/FwMFmbNhcoBRAIpU80TKvwLiU/7fwy/R5BT
         Vh6XEBhXSM7Y1jVCs2hF/2oSdOSagemTUGeJHJV7qjFhW2ytjw0tXmbFB+rqWKUZ7sQx
         66hZV6eH3pcnLDKgdhlZfD3ZjEvGUpN9ERFsByelgbzT4xts4c4KkBiZgiharBZS7iWH
         KKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=an/kmNk4qMONIrRVe+Mx9r+MV+a9pMY1qBQReu+NGEo=;
        b=d51GHsPanLNUnDblIR3AAhIZjNQSqlw75z6A9NFZe35nV1qoz2s4Nugg6N9vWlcCrn
         fUcC2Xxdi1Ovs7QRvTAOVPwqQSmSR2tVykcv58dYPA8swvGgq8JkR3FfCD0L16axRua1
         L6LaTZpzQTYGqAtTgRu0V1Gb+GGi2vspqNnoWS/oCsgq7Imr2u2GjqAi6G0oAm4a8XZh
         KPk3rkTuB++yTrRX22Cpvp8AQaEXBi77ok72Q3IFgUgz/9UYCIfJHdL3qYhOaZI9tedB
         Inngt81LNkV13VPUscEqPXzZ1FjcaBQM4WRgewfKu397jbyvsbWLfPEg/6YyyEBPz5kh
         G7Fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b12si566148lfv.7.2021.04.19.14.10.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JLAEHR026899
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:10:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpe015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:32 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 11/20] non-root-initramfs: Update ivshmem-demo
Date: Mon, 19 Apr 2021 23:06:20 +0200
Message-Id: <40e1e43d243264517e850deb0d72a6d6bc2155b9.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/40e1e43d243264517e850deb0d72a6d6bc2155b9.1618866389.git.jan.kiszka%40siemens.com.
